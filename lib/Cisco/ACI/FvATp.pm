package Cisco::ACI::FvATp;

use Moose;

extends 'Cisco::ACI::FvNwEp';

has 'encap'	=> ( is => 'rw', isa => 'Str' );
has 'ip'	=> ( is => 'rw', isa => 'Str' );
has 'lcC'	=> ( is => 'rw', isa => 'Str' );
has 'mac'	=> ( is => 'rw', isa => 'Str' );
has 'uuid'	=> ( is => 'rw', isa => 'Str' );

1;
