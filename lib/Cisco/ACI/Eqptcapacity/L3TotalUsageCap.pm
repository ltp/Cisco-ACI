package Cisco::ACI::Eqptcapacity::L3TotalUsageCap;

use Moose;

has 'cnt'               => (is => 'rw', isa => 'Int');
has 'lastCollOffset'    => (is => 'rw', isa => 'Int');
has 'modTs'             => (is => 'rw', isa => 'Str');
has 'status'            => (is => 'rw', isa => 'Str');
has 'repIntvEnd'	=> (is => 'rw', isa => 'Str');
has 'repIntvStart'	=> (is => 'rw', isa => 'Str');
has 'v4TotalEpCapAvg'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpCapLast'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpCapMax'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpCapMin'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpCapSpct'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpCapThr'	=> (is => 'rw');
has 'v4TotalEpCapTr'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpCapTrBase'=> (is => 'rw', isa => 'Int');
has 'v4TotalEpCapTtl'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapAvg'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapLast'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapMax'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapMin'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapSpct'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapThr'	=> (is => 'rw');
has 'v6TotalEpCapTr'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapTrBase'=> (is => 'rw', isa => 'Int');
has 'v6TotalEpCapTtl'	=> (is => 'rw', isa => 'Int');

1;

__END__
