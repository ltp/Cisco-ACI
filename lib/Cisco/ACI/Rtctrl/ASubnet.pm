package Cisco::ACI::Rtctrl::ASubnet;

use Moose;

extends 'Cisco::ACI::Rtctrl::ASubnet';

has 'ip' => ( is => 'rw', isa => 'Str' );

1;

