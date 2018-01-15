package Cisco::ACI::Tenant;

use Moose;
use Cisco::ACI::L3ext::Out;

extends 'Cisco::ACI::Pol::Dom';

has 'descr'	=> ( is => 'rw', isa => 'Str' );
has 'uid'	=> ( is => 'rw', isa => 'Str' );
has 'dn'	=> ( is => 'rw', isa => 'Str' );
has '__aci'	=> ( is => 'rw' );

sub health {
        my $self = shift;

        return Cisco::ACI::Health::Inst->new( 
                $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( 
                                        '/api/mo/'. $self->dn .'/health.json'
                                )
                        )->content
                )->{ imdata }->[0]->{ healthInst }->{ attributes }
        )
}


sub fault_counts {
        my $self = shift;

        return Cisco::ACI::FaultCounts->new( 
                $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( 
                                        '/api/mo/'. $self->dn .'/fltCnts.json'
                                )
                        )->content
                )->{ imdata }->[0]->{ faultCountsWithDetails }->{ attributes }
        )
}

sub L3Out {
	my ( $self, $l3out ) = @_;

	confess 'L3out identifier not provided' unless $l3out;

	my $args = $self->__aci->__jp->decode(
			$self->__aci->__request(
				$self->__aci->__get_uri( '/api/mo/'. $self->dn .'/out-'. $l3out .'.json'	)
			)->content
		)->{ imdata }->[0]->{ l3extOut }->{ attributes };

	confess "L3Out $l3out not defined." unless defined $args->{ dn };
	$args->{ __aci } = $self;

	return Cisco::ACI::L3ext::Out->new( $args )
}

1;

__END__

$aci->tenant( 'Deakin-Production' )->L3Out( 'WF-WAN-L3-OUT' )->
