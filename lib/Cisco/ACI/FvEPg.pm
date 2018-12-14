package Cisco::ACI::FvEPg;

use Moose;

extends 'Cisco::ACI::FvATg';

has 'dn'		=> ( is => 'rw', isa => 'Str' );
has 'floodOnEncap'	=> ( is => 'rw', isa => 'Str' );
has 'matchT'		=> ( is => 'rw', isa => 'Str' );
has 'prefGrMemb'	=> ( is => 'rw', isa => 'Str' );
has 'triggerSt'		=> ( is => 'rw', isa => 'Str' );
has 'txId'		=> ( is => 'rw', isa => 'Str' );
#has '__aci'		=> ( is => 'rw' );

1;

__END__
