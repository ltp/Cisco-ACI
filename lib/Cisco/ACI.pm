package Cisco::ACI;

use strict;
use warnings;

use Carp;
use JSON;
use HTTP::Request;
use LWP;
use XML::Simple;
use Cisco::ACI::Rule;
use Cisco::ACI::FvcapRule;
use Cisco::ACI::Leaf;
use Cisco::ACI::Spine;
use Cisco::ACI::FaultCounts;
use Cisco::ACI::Stats::Curr::OverallHealth;

our $VERSION = '0.01';
our @LOGIN_ATTR = qw(
buildTime
creationTime
firstLoginTime
firstName
guiIdleTimeoutSeconds
lastName
maximumLifetimeSeconds
node
refreshTimeoutSeconds
remoteUser
restTimeoutSeconds
sessionId
siteFingerprint
token
unixUserId
userName
version
);

our %OBJ_MAPPING = (
	tenant		=> 'fvTenant',
	contract	=> 'fvBrCP',
	service_graph	=> 'vnsGraphInst',
	concrete_devices=> 'vnsCDev',
	bd		=> 'fvBD',
	epg		=> 'fvAEPg',
	vrf		=> 'fvCtx',
	ep		=> 'fvCEp'
);

{
	for my $obj ( keys %OBJ_MAPPING ) {
		no strict 'refs';

		*{ __PACKAGE__ . "::$obj\_constraint" } = sub {
			my $self = shift;
			return $self->__get_constraint( $OBJ_MAPPING{ $obj } )
		}
	}
}

sub new {
	my ( $class, %args ) = @_;

	my $self = bless {}, $class;

	$self->__init( %args );

	return $self
}

sub login {
	my $self = shift;

	my $json = { aaaUser => { attributes => { name => $self->{ username }, pwd => $self->{ password } } } };

	my $r = $self->__request( $self->__get_login_uri, to_json( $json ) );

	return $self->{ error } if $self->{ error };

	$r = from_json( $r->content );

	if ( defined $r->{ imdata } ) {
		for my $a ( @LOGIN_ATTR ) {
			$self->{ $a } = $r->{ imdata }->[0]->{ aaaLogin }->{ attributes }->{ $a }
		}
	}

	#use Data::Dumper;
	#print Dumper( $self );
	return $self
}

sub refresh {}

sub __init {
	my ( $self, %args ) = @_;

	defined $args{ username }
		? $self->{ username } = $args{ username }
		: die 'No username parameter provided to constructor.' ;

	defined $args{ password } 
		? $self->{ password } = $args{ password }
		: die 'No password parameter provided to constructor.' ;

	defined $args{ server }
		? $self->{ server } = $args{ server }
		: die 'No server parameter provided to constructor.' ;

	$self->{ port } = defined $args{ port }
		? $args{ port } 
		: 443;

	$self->{ proto }= defined $args{ port }
		? $args{ port }
		: 'https';

	$self->{ __ua } = LWP::UserAgent->new;
	$self->{ __ua }->ssl_opts( verify_hostname => 0 );
	$self->{ __ua }->ssl_opts( SSL_verify_mode => 0 );
	$self->{ __ua }->cookie_jar( {} );

	$self->{ __xp } = XML::Simple->new;

	$self->{ __jp } = JSON->new;
}

# Tenant count
# https://aci-apic-fs1.its.deakin.edu.au/api/class/fvTenant.json?rsp-subtree-include=count
# Endpoint Group count
# https://aci-apic-fs1.its.deakin.edu.au/api/class/fvAEPg.json?rsp-subtree-include=count
# Endpoint Count
# https://aci-apic-fs1.its.deakin.edu.au/api/class/fvCEp.json?rsp-subtree-include=count
# L3 Context count
# https://aci-apic-fs1.its.deakin.edu.au/api/class/fvCtx.json?rsp-subtree-include=count
# BD count
# https://aci-apic-fs1.its.deakin.edu.au/api/class/fvBD.json?rsp-subtree-include=count
sub __tenant_constraint {
	my $self = shift;

	return $self->__get_constraint( 'fvTenant' )
}

sub __get_constraint {
	my ( $self, $class ) = @_;

	return $self->{ __jp }->decode(
		$self->__request(
			$self->__get_uri( "/api/mo/uni/fabric/compcat-default/fvsw-default/capabilities/fvcaprule-$class-scope-policy-domain-type-limit.json" )
		)->content
	)->{ imdata }->[0]->{ fvcapRule }->{ attributes }->{ constraint }
}

sub vrf_count {
	my $self = shift;

	return $self->__get_count( 'fvCtx' )
}

sub bd_count {
	my $self = shift;

	return $self->__get_count( 'fvBD' )
}

sub tenant_count {
	my $self = shift;

	return $self->__get_count( 'fvTenant' )
}

sub epg_count {
	my $self = shift;

	return $self->__get_count( 'fvAEPg' )
}

sub ep_count {
	my $self = shift;

	return $self->__get_count( 'fvCEp' )
}

sub cdev_count {
	my $self = shift;
	# Concrete devices
	return $self->__get_count( 'vnsCDev' )
}

sub get_capability_rules {
	my $self = shift;

	return map { Cisco::ACI::FvcapRule->new( $_->{ fvcapRule }->{ attributes } ) } 
	@{ $self->{ __jp }->decode(
		$self->__request(
			$self->__get_uri( '/api/mo/uni/fabric/compcat-default/fvsw-default/capabilities.json?query-target=children&target-subtree-class=fvcapRule' )
		)->content
	)->{ imdata } }
}

sub service_graphs_count {
	my $self = shift;

	return $self->__get_count( 'vnsGraphInst' )
}

sub __get_count {
	my ( $self, $class ) = @_;

	return $self->{ __jp }->decode(
		$self->__request(
			$self->__get_uri( "/api/class/$class.json?rsp-subtree-include=count" )
		)->content
	)->{ imdata }->[0]->{ moCount }->{ attributes }->{ count }
}

sub tenant {
	my ( $self, $tenant ) = @_;
}

sub spines {
	my $self = shift;

	return map {
		Cisco::ACI::Spine->new( $_->{ fabricNode }->{ attributes } )
	} @{ $self->{ __jp }->decode( 
		$self->__request( 
			$self->__get_uri( '/api/class/fabricNode.json?query-target-filter=eq(fabricNode.role,"spine")' ) 
		)->content
	)->{ imdata } }
}

sub spine {
	my ( $self, $spine ) = @_;

	confess "Spine identifier not provided" unless $spine;

	my $args = $self->{ __jp }->decode( 
			$self->__request( 
				$self->__get_uri( "/api/class/fabricNode.json?query-target-filter=and(eq(fabricNode.role,\"spine\"),eq(fabricNode.id,\"$spine\"))"
				)
			)->content
		)->{ imdata }->[0]->{ fabricNode }->{ attributes };
	$args->{ __aci } = $self;
	return Cisco::ACI::Spine->new( $args );


	return Cisco::ACI::Spine->new(
		$self->{ __jp }->decode( 
			$self->__request( 
				$self->__get_uri( '/api/class/fabricNode.json?query-target-filter=and(eq(fabricNode.role,"spine"),eq(fabricNode.id,"201"))'
				)
			)->content
		)->{ imdata }->[0]->{ fabricNode }->{ attributes }, $self
	)
}

sub leafs {
	my $self = shift;

	return map {
		Cisco::ACI::Leaf->new( $_->{ fabricNode }->{ attributes } )
	}
	# We need to pass our $self (the Cisco::ACI object) as the __aci attribute
	# to our Leaf objects so that they can execute methods on "themselves"
	# using the connection, parser, and methods of the Cisco::ACI instance.
	# Hence the ugly line below.
	map {
		$_->{ fabricNode }->{ attributes }->{__aci } = $self; $_;
	} 
	@{ $self->{ __jp }->decode( 
		$self->__request( 
			$self->__get_uri( '/api/class/fabricNode.json?query-target-filter=eq(fabricNode.role,"leaf")' ) 
		)->content
	)->{ imdata } }
}

sub leaf {
	my ( $self, $leaf ) = @_;

	confess "Leaf identifier not provided" unless $leaf;

	my $args = $self->{ __jp }->decode( 
			$self->__request( 
				$self->__get_uri( "/api/class/fabricNode.json?query-target-filter=and(eq(fabricNode.role,\"leaf\"),eq(fabricNode.id,\"$leaf\"))"
				)
			)->content
		)->{ imdata }->[0]->{ fabricNode }->{ attributes };
	$args->{ __aci } = $self;

	return Cisco::ACI::Leaf->new( $args )
}

sub overallHealth5min {
	my $self = shift;

	my $r = $self->{ __jp }->decode( 
		$self->__request( 
			$self->__get_uri( '/api/node/mo/topology/HDfabricOverallHealth5min-0.json' ) 
		)->content
	)->{ imdata }->[0];

	#print "r = $r->{ fabricOverallHealthHist5min }->{ attributes }->{ healthAvg }\n";

	my $h = Cisco::ACI::Stats::Curr::OverallHealth->new(
			healthAvg => $r->{ fabricOverallHealthHist5min }->{ attributes }->{ healthAvg }
	);	

	return $h
}

sub __request {
	my ( $self, $uri, $data ) = @_;
	my $r;

	if ( $data ) {
		$r = HTTP::Request->new( POST => $uri );
		$r->content( $data );
	}
	else {
		$r = HTTP::Request->new( GET => $uri );
	}

	my $s = $self->{ __ua }->request( $r );
	$self->{ error } = "Login failure: $!" unless $s->is_success;

	return $s
}

sub __get_uri {
	my ( $self, $uri ) = @_;

	return ( $self->{ proto }
		. '://'
		. $self->{ server }
		. ':'
		. $self->{ port }
		. $uri
		)
}

sub __get_login_uri {
	my $self = shift;

	return $self->__get_uri( '/api/mo/aaaLogin.json' )
}

sub __get_fltCnts_uri {
	my $self = shift;

	return $self->__get_uri( '/api/node/mo/fltCnts.json' )
}

1;

__END__

=head1 NAME

Cisco::ACI - The great new Cisco::ACI!

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Cisco::ACI;

    my $foo = Cisco::ACI->new();
    ...

=head1 METHODS

=head2 new ( %ARGS )

=head1 AUTHOR

Luke Poskitt, C<< <ltp at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-cisco-aci at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Cisco-ACI>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Cisco::ACI

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Cisco-ACI>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Cisco-ACI>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Cisco-ACI>

=item * Search CPAN

L<http://search.cpan.org/dist/Cisco-ACI/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2017 Luke Poskitt.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut
