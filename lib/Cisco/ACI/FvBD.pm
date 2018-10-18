package Cisco::ACI::FvBD;

use Moose;

extends 'Cisco::ACI::FvABDPol';

has 'name'	=> ( is => 'rw', isa => 'Str' );
has 'type'	=> ( is => 'rw', isa => 'Str' );
has '__aci'	=> ( is => 'rw' );

sub subnets {
	my $self = shift;

	#/api/node/mo/uni/tn-Deakin-Production/BD-VLAN-822-BD.xml?query-target=children
	# target-subtree-class=fvSubnet
}

1;

__END__
