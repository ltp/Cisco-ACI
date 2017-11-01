package Cisco::ACI::Infra::GeSnNode;

use Moose;

extends 'Cisco::ACI::Infra::GeNode';

has 'addr'		=> (is => 'rw', isa => 'Str');
has 'apicMode'		=> (is => 'rw', isa => 'Str');
has 'chassis'		=> (is => 'rw', isa => 'Str');
has 'cntrlSbstState'	=> (is => 'rw', isa => 'Str');
has 'mbSn'		=> (is => 'rw', isa => 'Str');
has 'podId'		=> (is => 'rw', isa => 'Str');

1;

__END__
