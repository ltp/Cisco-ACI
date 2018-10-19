package Cisco::ACI::Pol::Lbl;

use Moose;

extends 'Cisco::ACI::Pol::ConsElem';

has 'tag' => ( is => 'rw', isa => 'Str' );

1;

__END__
