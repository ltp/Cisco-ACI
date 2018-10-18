package Cisco::ACI::FvDom;

use Moose;

extends 'Cisco::ACI::FvDef';

has 'seg'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
