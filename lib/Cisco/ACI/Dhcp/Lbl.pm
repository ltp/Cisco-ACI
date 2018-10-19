package Cisco::ACI::Dhcp::Lbl;

use Moose;

extends 'Cisco::ACI::Dhcp::ALbl';

has 'name' => ( is => 'rw', isa => 'Str' );

1;

__END__
