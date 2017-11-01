package Cisco::ACI::Infra::GeNode;

# Generic Controller

use Moose;

extends 'Cisco::ACI::Naming::NamedObject';

has 'id' => (is => 'rw', isa => 'Int');

1;

__END__
