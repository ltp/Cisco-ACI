package Cisco::ACI::Pol::NToRef;

use Moose;

extends 'Cisco::ACI::Reln::To';

has 'tContextDn'	=> ( is => 'rw', isa => 'Str' );
has 'tRn'		=> ( is => 'rw', isa => 'Str' );
has 'tType'		=> ( is => 'rw', isa => 'Str' );

1;

__END__
