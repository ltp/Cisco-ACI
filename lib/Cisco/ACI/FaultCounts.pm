package Cisco::ACI::FaultCounts;

use Moose;

has 'childAction'		=> (is => 'rw', isa => 'Str');
has 'crit'			=> (is => 'rw', isa => 'Str');
has 'critAcked'			=> (is => 'rw', isa => 'Str');
has 'critAckedandDelegated'	=> (is => 'rw', isa => 'Str');
has 'critDelegated'		=> (is => 'rw', isa => 'Str');
has 'dn'			=> (is => 'rw', isa => 'Str');
has 'maj'			=> (is => 'rw', isa => 'Str');
has 'majAcked'			=> (is => 'rw', isa => 'Str');
has 'majAckedandDelegated'	=> (is => 'rw', isa => 'Str');
has 'majDelegated'		=> (is => 'rw', isa => 'Str');
has 'minor'			=> (is => 'rw', isa => 'Str');
has 'minorAcked'		=> (is => 'rw', isa => 'Str');
has 'minorAckedandDelegated'	=> (is => 'rw', isa => 'Str');
has 'minorDelegated'		=> (is => 'rw', isa => 'Str');
has 'status'			=> (is => 'rw', isa => 'Str');
has 'warn'			=> (is => 'rw', isa => 'Str');
has 'warnAcked'			=> (is => 'rw', isa => 'Str');
has 'warnAckedandDelegated'	=> (is => 'rw', isa => 'Str');
has 'warnDelegated'		=> (is => 'rw', isa => 'Str');

1;

__END__

"childAction": "",
"crit": "0",
"critAcked": "0",
"critAckedandDelegated": "0",
"critDelegated": "0",
"dn": "topology/pod-1/node-201/sys/ch/fltCnts",
"maj": "0",
"majAcked": "0",
"majAckedandDelegated": "0",
"majDelegated": "0",
"minor": "0",
"minorAcked": "0",
"minorAckedandDelegated": "0",
"minorDelegated": "0",
"status": "",
"warn": "0",
"warnAcked": "0",
"warnAckedandDelegated": "0",
"warnDelegated": "0"
