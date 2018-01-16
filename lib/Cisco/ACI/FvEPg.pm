package Cisco::ACI::FvEPg;

use Moose;

extends 'Cisco::ACI::FvATg';

has 'floodOnEncap'	=> ( is => 'rw', isa => 'Str' );
has 'matchT'		=> ( is => 'rw', isa => 'Str' );
has 'prefGrMemb'	=> ( is => 'rw', isa => 'Str' );
has 'triggetSt'		=> ( is => 'rw', isa => 'Str' );
has 'txId'		=> ( is => 'rw', isa => 'Str' );

1;

__END__
