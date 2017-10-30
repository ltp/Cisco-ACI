package Cisco::ACI::Eqptcapacity::L3Usage;

use Moose;

has 'cnt'		=> (is => 'rw', isa => 'Int');
has 'lastCollOffset'	=> (is => 'rw', isa => 'Int');
has 'localEpAvg'	=> (is => 'rw', isa => 'Int');
has 'localEpBase'	=> (is => 'rw', isa => 'Int');
has 'localEpCum'	=> (is => 'rw', isa => 'Int');
has 'localEpLast'	=> (is => 'rw', isa => 'Int');
has 'localEpMax'	=> (is => 'rw', isa => 'Int');
has 'localEpMin'	=> (is => 'rw', isa => 'Int');
has 'localEpPer'	=> (is => 'rw', isa => 'Int');
has 'localEpRate'	=> (is => 'rw', isa => 'Num');
has 'localEpSpct'	=> (is => 'rw', isa => 'Int');
has 'localEpThr'	=> (is => 'rw');
has 'localEpTr'		=> (is => 'rw', isa => 'Int');
has 'localEpTrBase'	=> (is => 'rw', isa => 'Int');
has 'modTs'		=> (is => 'rw', isa => 'Str');
has 'status'		=> (is => 'rw', isa => 'Str');
has 'v4LocalEpAvg'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpBase'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpCum'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpLast'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpMax'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpMin'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpPer'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpRate'	=> (is => 'rw', isa => 'Num');
has 'v4LocalEpSpct'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpThr'	=> (is => 'rw');
has 'v4LocalEpTr'	=> (is => 'rw', isa => 'Int');
has 'v4LocalEpTrBase'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpAvg'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpBase'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpCum'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpLast'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpMax'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpMin'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpPer'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpRate'	=> (is => 'rw', isa => 'Num');
has 'v6LocalEpSpct'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpThr'	=> (is => 'rw');
has 'v6LocalEpTr'	=> (is => 'rw', isa => 'Int');
has 'v6LocalEpTrBase'	=> (is => 'rw', isa => 'Int');

1;

__END__
