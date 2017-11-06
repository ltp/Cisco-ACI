package Cisco::ACI::Eqpt::ExtCh;

use Moose;

extends 'Cisco::ACI::Eqpt::Cont';

has 'controlFPortSDPTimeout'	=> ( is => 'rw', isa => 'Str' );
has 'extChSt'			=> ( is => 'rw', isa => 'Str' );
has 'macAddr'			=> ( is => 'rw', isa => 'Str' );
has 'mfgTm'			=> ( is => 'rw', isa => 'Str' );
has 'model'			=> ( is => 'rw', isa => 'Str' );
has 'monPolDn'			=> ( is => 'rw', isa => 'Str' );
has 'numMacs'			=> ( is => 'rw', isa => 'Str' );
has 'numUplinkP'		=> ( is => 'rw', isa => 'Str' );
has 'partNum'			=> ( is => 'rw', isa => 'Str' );
has 'rev'			=> ( is => 'rw', isa => 'Str' );
has 'ser'			=> ( is => 'rw', isa => 'Str' );
has 'vendor'			=> ( is => 'rw', isa => 'Str' );
has '__aci'			=> ( is => 'rw' );

1;

__END__
