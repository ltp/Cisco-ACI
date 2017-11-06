package Cisco::ACI::Tenant;

use Moose;

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
1;

__END__
