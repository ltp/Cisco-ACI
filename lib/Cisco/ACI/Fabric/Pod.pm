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

1;

__END__
