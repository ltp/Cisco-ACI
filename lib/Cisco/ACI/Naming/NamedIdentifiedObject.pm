package Cisco::ACI::NamedIdentifiedObject;

use Moose;

extends 'Cisco::ACI::NamedObject';

has 'id'	=> ( is => 'rw', isa => 'Str' );

1;
