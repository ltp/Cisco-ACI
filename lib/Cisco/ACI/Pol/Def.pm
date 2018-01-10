package Cisco::ACI::Pol::Def;

use Moose;

extends 'Cisco::ACI::Pol::Obj';

has 'descr'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
