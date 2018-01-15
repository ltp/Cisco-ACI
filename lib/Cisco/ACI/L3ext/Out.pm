package Cisco::ACI::L3ext::Out;

use Moose;

extends 'Cisco::ACI::FvNp';

has 'enforceRtCtrl'	=> ( is => 'rw', isa => 'Str' );
has 'name'		=> ( is => 'rw', isa => 'Str' );

1;

__END__
