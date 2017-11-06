package Cisco::ACI::Eqpt::Cont;

use Moose;

extends 'Cisco::ACI::Eqpt::Item';

has 'descr' => ( is => 'rw', isa => 'Str' );

1;

__END__
