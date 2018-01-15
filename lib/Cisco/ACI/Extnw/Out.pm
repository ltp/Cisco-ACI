package Cisco::ACI::Extnw::Out;

use Moose;

extends 'Cisco::ACI::FvNp';

has 'targetDscp'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
