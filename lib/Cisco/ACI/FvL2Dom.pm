package Cisco::ACI::FvL2Dom;

use Moose;

extends 'Cisco::ACI::FvDom';

has 'bcastP'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
