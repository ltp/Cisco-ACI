package Cisco::ACI::FvRsCons;

use Moose;

extends 'Cisco::ACI::FvEPgToCollection';

has 'deplInfo'          => ( is => 'rw', isa => 'Str' );
has 'monPolDn'          => ( is => 'rw', isa => 'Str' );
has 'prio'              => ( is => 'rw', isa => 'Str' );
has 'tCl'               => ( is => 'rw', isa => 'Str' );
has 'tnVzBrCPName'      => ( is => 'rw', isa => 'Str' );

1;

__END__
