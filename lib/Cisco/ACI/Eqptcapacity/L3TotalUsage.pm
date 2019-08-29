package Cisco::ACI::Eqptcapacity::L3TotalUsage;

use Moose;

has 'cnt'		=> (is => 'rw', isa => 'Int');
has 'lastCollOffset'	=> (is => 'rw', isa => 'Int');
has 'modTs'		=> (is => 'rw', isa => 'Str');
has 'repIntvEnd'	=> (is => 'rw', isa => 'Int');
has 'repIntvStart'	=> (is => 'rw', isa => 'Str');
has 'status'		=> (is => 'rw', isa => 'Str');
has 'v4TotalEpAvg'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpLast'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpMax'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpMin'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpSpct'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpThr'	=> (is => 'rw');
has 'v4TotalEpTr'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpTrBase'	=> (is => 'rw', isa => 'Int');
has 'v4TotalEpTtl'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpAvg'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpLast'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpMax'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpMin'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpSpct'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpThr'	=> (is => 'rw');
has 'v6TotalEpTr'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpTrBase'	=> (is => 'rw', isa => 'Int');
has 'v6TotalEpTtl'	=> (is => 'rw', isa => 'Int');

1;

__END__
