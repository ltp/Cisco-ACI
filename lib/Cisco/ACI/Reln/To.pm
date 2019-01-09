package Cisco::ACI::Reln::To;

use Moose;

extends 'Cisco::ACI::Reln::Inst';

has 'forceResolve'	=> ( is => 'rw', isa => 'Str' );
has 'rType'		=> ( is => 'rw', isa => 'Str' );
has 'state'		=> ( is => 'rw', isa => 'Str' );
has 'stateQual'		=> ( is => 'rw', isa => 'Str' );
has 'tType'		=> ( is => 'rw', isa => 'Str' );

1;

__END__
