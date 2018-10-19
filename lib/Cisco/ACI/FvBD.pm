package Cisco::ACI::FvBD;

use Moose;
use Cisco::ACI::FvSubnet;

extends 'Cisco::ACI::FvABDPol';

has 'name'	=> ( is => 'rw', isa => 'Str' );
has 'type'	=> ( is => 'rw', isa => 'Str' );
has '__aci'	=> ( is => 'rw' );

sub subnets {
	my $self = shift;

	return map { Cisco::ACI::FvSubnet->new( $_->{ fvSubnet }->{ attributes } ) }
	@{ $self->__aci->__jp->decode(
			$self->__aci->__request(
				$self->__aci->__get_uri(
					'/api/mo/'. $self->dn . '.json?query-target=children&target-subtree-class=fvSubnet'
				)
			)->content
	)->{ imdata } }
}

1;

__END__
