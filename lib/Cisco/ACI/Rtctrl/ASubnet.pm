package Cisco::ACI::Rtctrl::ASubnet;

use Moose;

extends 'Cisco::ACI::Fabric::L3ProtoComp';

has 'ip' => ( is => 'rw', isa => 'Str' );

1;

