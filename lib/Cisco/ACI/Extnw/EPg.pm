package Cisco::ACI::Extnw::EPg;

use Moose;

extends 'Cisco::ACI::FvEPg';

has 'targetDscp'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
