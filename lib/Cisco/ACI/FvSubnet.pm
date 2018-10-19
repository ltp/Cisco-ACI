package Cisco::ACI::FvSubnet;

use Moose;

extends 'Cisco::ACI::Rtctrl::ASubnet';

has 'ctrl'	=> ( is => 'rw', isa => 'Str' );
has 'monPolDn'	=> ( is => 'rw', isa => 'Str' );
has 'preferred'	=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'scope'	=> ( is => 'rw', isa => 'Str' );
has 'virtual'	=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );

1;

__END__
