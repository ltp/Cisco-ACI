package Cisco::ACI::L3ext::Out;

use Moose;

extends 'Cisco::ACI::Extnw::Out';

has 'enforceRtctrl'	=> ( is => 'rw', isa => 'Str' );
has 'name'		=> ( is => 'rw', isa => 'Str' );

1;

__END__
