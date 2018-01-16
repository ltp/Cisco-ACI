package Cisco::ACI::L3ext::Subnet;

use Moose;

extends 'Cisco::ACI::L3ext::AInstPSubnet';

has '__aci'	=> ( is => 'rw' );

1;

__END__
