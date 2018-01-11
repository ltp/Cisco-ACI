package Cisco::ACI::Pol::Comp;

use Moose;

extends 'Cisco::ACI::Pol::Obj';

has 'desc' => ( is => 'rw', isa => 'Str' );

1;
