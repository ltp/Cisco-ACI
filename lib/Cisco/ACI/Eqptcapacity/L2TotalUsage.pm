package Cisco::ACI::Eqptcapacity::L2TotalUsage;

use Moose;

has 'cnt'			=> (is => 'rw', isa => 'Int');
has 'dn'			=> (is => 'rw', isa => 'Str');
has 'lastCollOffset'		=> (is => 'rw', isa => 'Int');
has 'modTs'			=> (is => 'rw', isa => 'Str');
has 'repIntvEnd'		=> (is => 'rw', isa => 'Str');
has 'repIntvStart'		=> (is => 'rw', isa => 'Str');
has 'status'			=> (is => 'rw', isa => 'Str');
has 'totalEpAvg'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapAvg'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapLast'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapMax'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapMin'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapSpct'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapThr'		=> (is => 'rw');
has 'totalEpCapTr'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapTrBase'		=> (is => 'rw', isa => 'Int');
has 'totalEpCapTtl'		=> (is => 'rw', isa => 'Int');
has 'totalEpLast'		=> (is => 'rw', isa => 'Int');
has 'totalEpMax'		=> (is => 'rw', isa => 'Int');
has 'totalEpMin'		=> (is => 'rw', isa => 'Int');
has 'totalEpSpct'		=> (is => 'rw', isa => 'Int');
has 'totalEpThr'		=> (is => 'rw');
has 'totalEpTr'			=> (is => 'rw', isa => 'Int');
has 'totalEpTrBase'		=> (is => 'rw', isa => 'Int');
has 'totalEpTtl'		=> (is => 'rw', isa => 'Int');
has 'totalNormalizedAvg'	=> (is => 'rw', isa => 'Int');
has 'totalNormalizedLast'	=> (is => 'rw', isa => 'Int');
has 'totalNormalizedMax'	=> (is => 'rw', isa => 'Int');
has 'totalNormalizedMin'	=> (is => 'rw', isa => 'Int');
has 'totalNormalizedSpct'	=> (is => 'rw', isa => 'Int');
has 'totalNormalizedThr'	=> (is => 'rw');
has 'totalNormalizedTr'		=> (is => 'rw', isa => 'Int');
has 'totalNormalizedTrBase'	=> (is => 'rw', isa => 'Int');
has 'totalNormalizedTtl'	=> (is => 'rw', isa => 'Int');

1;

__END__
