package Cisco::ACI::FvRsBd;

use Moose;

extends 'Cisco::ACI::FvAToBD';

has 'tnFvBDName'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
