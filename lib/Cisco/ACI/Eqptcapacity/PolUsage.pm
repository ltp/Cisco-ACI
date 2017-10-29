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
