package Cisco::ACI::Eqptcapacity::L3UsageCap;

use Moose;

has 'cnt'		=> (is => 'rw', isa => 'Int');
has 'lastCollOffset'	=> (is => 'rw', isa => 'Int');
has 'modTs'		=> (is => 'rw', isa => 'Str');
has 'status'		=> (is => 'rw', isa => 'Str');
has 'v4LocalEpCapAvg'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapBase'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapCum'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapLast'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapMax'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapMin'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapPer'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapRate'	=> (is => 'rw', isa => 'Num');
has 'v4LocalEpCapSpct'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapThr'	=> (is => 'rw');
has 'v4LocalEpCapTr'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCapTrBase'=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapAvg'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapBase'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapCum'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapLast'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapMax'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapMin'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapPer'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapRate'	=> (is => 'rw', isa => 'Num');
has 'v6LocalEpCapSpct'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapThr'	=> (is => 'rw');
has 'v6LocalEpCapTr'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCapTrBase'=> (is => 'rw', isa => 'Int');

1;

__END__
