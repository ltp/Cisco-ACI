package Cisco::ACI::Reln::Inst;

use Moose;

has 'tCl' ( is => 'rw', isa => 'Str' );
has 'tDn' ( is => 'rw', isa => 'Str' );

1;

__END__
