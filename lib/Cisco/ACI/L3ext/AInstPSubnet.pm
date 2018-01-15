package Cisco::ACI::L3ext::AInstPSubnet;

use Moose;

extends 'Cisco::ACI::Extnw::AInstPSubnet';

has 'aggregate' => ( is => 'rw', isa => 'Str' );
has 'scope'	=> ( is => 'rw', isa => 'Str' );

1;
