package Cisco::ACI::L3ext::InstP;

use Moose;

extends 'Cisco::ACI::Extnw::EPg';

has 'mcast'	=> ( is => 'rw', isa => 'Str' );
has 'name'	=> ( is => 'rw', isa => 'Str' );
has 'dn'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
