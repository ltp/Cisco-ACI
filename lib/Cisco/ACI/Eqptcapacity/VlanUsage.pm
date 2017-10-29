package Cisco::ACI::Eqptcapacity::VlanUsage;

use Moose;

has 'cnt'		=> (is => 'rw', isa => 'Int');
has 'lastCollOffset'	=> (is => 'rw', isa => 'Int');
has 'modTs'		=> (is => 'rw', isa => 'Str');
has 'status'		=> (is => 'rw', isa => 'Str');
has 'totalAvg'		=> (is => 'rw', isa => 'Int');
has 'totalBase'		=> (is => 'rw', isa => 'Int');
has 'totalCapAvg'	=> (is => 'rw', isa => 'Int');
has 'totalCapBase'	=> (is => 'rw', isa => 'Int');
has 'totalCapCum'	=> (is => 'rw', isa => 'Int');
has 'totalCapLast'	=> (is => 'rw', isa => 'Int');
has 'totalCapMax'	=> (is => 'rw', isa => 'Int');
has 'totalCapMin'	=> (is => 'rw', isa => 'Int');
has 'totalCapPer'	=> (is => 'rw', isa => 'Int');
has 'totalCapRate'	=> (is => 'rw', isa => 'Num');
has 'totalCapSpct'	=> (is => 'rw', isa => 'Int');
has 'totalCapThr'	=> (is => 'rw');
has 'totalCapTr'	=> (is => 'rw', isa => 'Int');
has 'totalCapTrBase'	=> (is => 'rw', isa => 'Int');
has 'totalCum'		=> (is => 'rw', isa => 'Int');
has 'totalLast'		=> (is => 'rw', isa => 'Int');
has 'totalMax'		=> (is => 'rw', isa => 'Int');
has 'totalMin'		=> (is => 'rw', isa => 'Int');
has 'totalPer'		=> (is => 'rw', isa => 'Int');
has 'totalRate'		=> (is => 'rw', isa => 'Num');
has 'totalSpct'		=> (is => 'rw', isa => 'Int');
has 'totalThr'		=> (is => 'rw');
has 'totalTr'		=> (is => 'rw', isa => 'Int');
has 'totalTrBase'	=> (is => 'rw', isa => 'Int');

1;

__END__
