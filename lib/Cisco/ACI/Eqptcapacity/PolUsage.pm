package Cisco::ACI::Eqptcapacity::PolUsage;

use Moose;

has 'cnt'		=> (is => 'rw', isa => 'Int');
has 'lastCollOffset'	=> (is => 'rw', isa => 'Int');
has 'modTs'		=> (is => 'rw', isa => 'Str');
has 'polUsageAvg'	=> (is => 'rw', isa => 'Int');
has 'polUsageBase'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapAvg'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapBase'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapCum'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapLast'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapMax'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapMin'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapPer'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapRate'	=> (is => 'rw', isa => 'Num');
has 'polUsageCapSpct'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapThr'	=> (is => 'rw');
has 'polUsageCapTr'	=> (is => 'rw', isa => 'Int');
has 'polUsageCapTrBase'	=> (is => 'rw', isa => 'Int');
has 'polUsageCum'	=> (is => 'rw', isa => 'Int');
has 'polUsageLast'	=> (is => 'rw', isa => 'Int');
has 'polUsageMax'	=> (is => 'rw', isa => 'Int');
has 'polUsageMin'	=> (is => 'rw', isa => 'Int');
has 'polUsagePer'	=> (is => 'rw', isa => 'Int');
has 'polUsageRate'	=> (is => 'rw', isa => 'Num');
has 'polUsageSpct'	=> (is => 'rw', isa => 'Int');
has 'polUsageThr'	=> (is => 'rw');
has 'polUsageTr'	=> (is => 'rw', isa => 'Int');
has 'polUsageTrBase'	=> (is => 'rw', isa => 'Int');
has 'status'		=> (is => 'rw', isa => 'Str');

1;

__END__

"childAction": "",
"cnt": "9",
"lastCollOffset": "90",
"modTs": "never",
"polUsageAvg": "0",
"polUsageBase": "0",
"polUsageCapAvg": "0",
"polUsageCapBase": "0",
"polUsageCapCum": "41984",
"polUsageCapLast": "0",
"polUsageCapMax": "0",
"polUsageCapMin": "0",
"polUsageCapPer": "0",
"polUsageCapRate": "0.000000",
"polUsageCapSpct": "0",
"polUsageCapThr": "",
"polUsageCapTr": "0",
"polUsageCapTrBase": "0",
"polUsageCum": "93",
"polUsageLast": "0",
"polUsageMax": "0",
"polUsageMin": "0",
"polUsagePer": "0",
"polUsageRate": "0.000000",
"polUsageSpct": "0",
"polUsageThr": "",
"polUsageTr": "0",
"polUsageTrBase": "0",
"repIntvEnd": "2017-10-30T08:31:19.926+11:00",
"repIntvStart": "2017-10-30T08:29:49.896+11:00",
"rn": "CDeqptcapacityPolUsage5min",
"status": ""
