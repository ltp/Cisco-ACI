package Cisco::ACI::Naming::NamedIdentifiedObject;

use Moose;

extends 'Cisco::ACI::Naming::NamedObject';

has 'id'	=> ( is => 'rw', isa => 'Str' );

1;
