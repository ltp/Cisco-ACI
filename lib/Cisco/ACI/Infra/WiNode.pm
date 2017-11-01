package Cisco::ACI::Infra::WiNode;

use Moose;

extends 'Cisco::ACI::Infra::GeSnNode';

has 'adminSt'		=> (is => 'rw', isa => 'Str');
has 'failoverStatus'	=> (is => 'rw', isa => 'Str');
has 'health'		=> (is => 'rw', isa => 'Str');
has 'monPolDn'		=> (is => 'rw', isa => 'Str');
has 'mutnTs'		=> (is => 'rw', isa => 'Str');
has 'nodeName'		=> (is => 'rw', isa => 'Str');
has 'operSt'		=> (is => 'rw', isa => 'Str');
has 'targetMbSn'	=> (is => 'rw', isa => 'Str');
has 'dn'		=> (is => 'rw', isa => 'Str');

1;

__END__
