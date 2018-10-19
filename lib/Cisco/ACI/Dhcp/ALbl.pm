package Cisco::ACI::Dhcp::ALbl;

use Moose;

extends 'Cisco::ACI::Pol::Lbl';

has 'owner' => ( is => 'rw', isa => 'Str' );

1;

__END__
