package Cisco::ACI::Eqptcapacity::L2Usage;

use Moose;

extends 'Cisco::ACI::Stats::Item';

 has 'localEpAvg'	=> (is => 'rw', isa => 'Int');
 has 'localEpBase'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapAvg'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapBase'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapCum'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapLast'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapMax'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapMin'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapPer'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapRate'	=> (is => 'rw');
 has 'localEpCapSpct'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapThr'	=> (is => 'rw');
 has 'localEpCapTr'	=> (is => 'rw', isa => 'Int');
 has 'localEpCapTrBase' => (is => 'rw', isa => 'Int');
 has 'localEpCum'	=> (is => 'rw', isa => 'Int');
 has 'localEpLast'	=> (is => 'rw', isa => 'Int');
 has 'localEpMax'	=> (is => 'rw', isa => 'Int');
 has 'localEpMin'	=> (is => 'rw', isa => 'Int');
 has 'localEpPer'	=> (is => 'rw', isa => 'Int');
 has 'localEpRate'	=> (is => 'rw');
 has 'localEpSpct'	=> (is => 'rw', isa => 'Int');
 has 'localEpThr'	=> (is => 'rw');
 has 'localEpTr'	=> (is => 'rw', isa => 'Int');
 has 'localEpTrBase'	=> (is => 'rw', isa => 'Int');
 has 'modTs'		=> (is => 'rw', isa => 'Str');
 has 'normalizedAvg'	=> (is => 'rw', isa => 'Int');
 has 'normalizedLast'	=> (is => 'rw', isa => 'Int');
 has 'normalizedMax'	=> (is => 'rw', isa => 'Int');
 has 'normalizedMin'	=> (is => 'rw', isa => 'Int');
 has 'normalizedSpct'	=> (is => 'rw', isa => 'Int');
 has 'normalizedThr'	=> (is => 'rw');
 has 'normalizedTr'	=> (is => 'rw', isa => 'Int');
 has 'normalizedTrBase' => (is => 'rw', isa => 'Int');
 has 'normalizedTtl'	=> (is => 'rw', isa => 'Int');
 has 'rn'		=> (is => 'rw', isa => 'Str');
 has 'status'		=> (is => 'rw', isa => 'Str');

1;
