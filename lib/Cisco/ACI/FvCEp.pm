package Cisco::ACI::FvCEp;

use Moose;

extends 'Cisco::ACI::FvEp';

has 'contName'	=> ( is => 'rw', isa => 'Str' );
has 'idepdn'	=> ( is => 'rw', isa => 'Str' );
has 'mcastAddr'	=> ( is => 'rw', isa => 'Str' );
has 'monPolDn'	=> ( is => 'rw', isa => 'Str' );
has 'name'	=> ( is => 'rw', isa => 'Str' );

1;
