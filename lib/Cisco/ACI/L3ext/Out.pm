package Cisco::ACI::L3ext::Out;

use Moose;
use Cisco::ACI::L3ext::InstP;

extends 'Cisco::ACI::Extnw::Out';

has 'enforceRtctrl'	=> ( is => 'rw', isa => 'Str' );
has 'name'		=> ( is => 'rw', isa => 'Str' );
has 'dn'		=> ( is => 'rw', isa => 'Str' );
has '__aci'		=> ( is => 'rw' );

sub L3ExtInstP {
	my ( $self, $l3extInstP ) = @_;

	confess 'L3ExtInstP identifier not provided' unless $l3extInstP;

	        my $args = $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( '/api/mo/'. $self->dn .'/instP-'. $l3extInstP .'.json' )
                        )->content
                )->{ imdata }->[0]->{ l3extInstP }->{ attributes };

        confess "L3ExtInstP $l3extInstP not defined." unless defined $args->{ dn };
        $args->{ __aci } = $self;

        return Cisco::ACI::L3ext::InstP->new( $args )

}

1;

__END__
