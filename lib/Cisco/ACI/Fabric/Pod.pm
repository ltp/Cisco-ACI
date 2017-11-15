package Cisco::ACI::Fabric::Pod;

use Moose;

has 'id'	=> ( is => 'rw', isa => 'Str' );
has 'dn'	=> ( is => 'rw', isa => 'Str' );
has 'monPolDn'	=> ( is => 'rw', isa => 'Str' );
has 'lcOwn'	=> ( is => 'rw', isa => 'Str' );
has 'extMngdBy'	=> ( is => 'rw', isa => 'Str' );
has 'modTs'	=> ( is => 'rw', isa => 'Str' );
has '__aci'	=> ( is => 'rw' );

sub fabric_links {
	my $self = shift;

	return map {
		Cisco::ACI::Fabric::Link->new( $_->{ fabricLink }->{ attributes } )
	} 
	map {
		$_->{ fabricLink }->{ attributes }->{ __aci } = $self->__aci; $_;
	}
	@{ $self->__aci->__jp->decode(
		$self->__aci->__request(
			$self->__aci->__get_uri(
				'/api/mo/'. $self->dn .'.json?query-target=subtree&target-subtree-class=fabricLink'
			)
		)->content
	)->{ imdata } }
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

sub health {
        my $self = shift;

        return Cisco::ACI::Health::Inst->new( 
                $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( 
                                        '/api/mo/'. $self->dn .'/health.json'
                                )
                        )->content
                )->{ imdata }->[0]->{ fabricHealthTotal }->{ attributes }
        )
}

1;

__END__
