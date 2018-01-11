package Cisco::ACI::Pol::Obj;

use Moose;

extends 'Cisco::ACI::Naming::NamedObject';

has 'name' => ( is => 'rw', isa => 'Str' );

1;
