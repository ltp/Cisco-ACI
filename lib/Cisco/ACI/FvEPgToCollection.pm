package Cisco::ACI::FvEPgToCollection;

use Moose;

extends 'Cisco::ACI::Pol::NToRef';

has 'ctrctUpd'		=> ( is => 'rw', isa => 'Str' );
has 'triggerSt'		=> ( is => 'rw', isa => 'Str' );
has 'updateCollection'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
