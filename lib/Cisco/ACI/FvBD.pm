package Cisco::ACI::FvBD;

use Moose;

extends 'Cisco::ACI::FvABDPol';

has 'name'	=> ( is => 'rw', isa => 'Str' );
has 'type'	=> ( is => 'rw', isa => 'Str' );
has '__aci'	=> ( is => 'rw' );

1;

__END__
