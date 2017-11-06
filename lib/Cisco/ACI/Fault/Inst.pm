package Cisco::ACI::Fault::Inst;

use Moose;

extends 'Cisco::ACI::Fault::Info';

has 'code'	=> ( is => 'rw', isa => 'Str' );
has 'delegated'	=> ( is => 'rw', isa => 'Str' );
1;

__END__
