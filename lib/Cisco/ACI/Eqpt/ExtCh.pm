package Cisco::ACI::Eqpt::ExtCh;

use Moose;

extends 'Cisco::ACI::Eqpt::Cont';

has 'controlFPortSDPTimeout'	=> ( is => 'rw', isa => 'Str' );
has 'dn'			=> ( is => 'rw', isa => 'Str' );
has 'extChSt'			=> ( is => 'rw', isa => 'Str' );
has 'macAddr'			=> ( is => 'rw', isa => 'Str' );
has 'mfgTm'			=> ( is => 'rw', isa => 'Str' );
has 'model'			=> ( is => 'rw', isa => 'Str' );
has 'monPolDn'			=> ( is => 'rw', isa => 'Str' );
has 'numMacs'			=> ( is => 'rw', isa => 'Str' );
has 'numUplinkP'		=> ( is => 'rw', isa => 'Str' );
has 'partNum'			=> ( is => 'rw', isa => 'Str' );
has 'rev'			=> ( is => 'rw', isa => 'Str' );
has 'ser'			=> ( is => 'rw', isa => 'Str' );
has 'vendor'			=> ( is => 'rw', isa => 'Str' );
has '__aci'			=> ( is => 'rw' );

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
                )->{ imdata }->[0]->{ faultCounts }->{ attributes }
        )
}

1;

__END__
