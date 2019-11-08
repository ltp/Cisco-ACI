package Cisco::ACI::Stats::Curr::L2EgrBytes;

use Moose;

extends 'Cisco::ACI::Stats::Curr';

has 'index'		=> (is => 'rw', isa => 'Int');
has 'multicastAvg'	=> (is => 'rw', isa => 'Int');
has 'multicastBase'	=> (is => 'rw', isa => 'Int');
has 'multicastCum'	=> (is => 'rw', isa => 'Int');
has 'multicastLast'	=> (is => 'rw', isa => 'Int');
has 'multicastMax'	=> (is => 'rw', isa => 'Int');
has 'multicastMin'	=> (is => 'rw', isa => 'Int');
has 'multicastPer'	=> (is => 'rw', isa => 'Int');
has 'multicastRate'	=> (is => 'rw', isa => 'Int');
has 'multicastSpct'	=> (is => 'rw', isa => 'Int');
has 'multicastThr'	=> (is => 'rw', isa => 'Int');
has 'multicastTr'	=> (is => 'rw', isa => 'Int');
has 'multicastTrBase'	=> (is => 'rw', isa => 'Int');
has 'unicastAvg'	=> (is => 'rw', isa => 'Int');
has 'unicastBase'	=> (is => 'rw', isa => 'Int');
has 'unicastCum'	=> (is => 'rw', isa => 'Int');
has 'unicastLast'	=> (is => 'rw', isa => 'Int');
has 'unicastMax'	=> (is => 'rw', isa => 'Int');
has 'unicastMin'	=> (is => 'rw', isa => 'Int');
has 'unicastPer'	=> (is => 'rw', isa => 'Int');
has 'unicastRate'	=> (is => 'rw', isa => 'Int');
has 'unicastSpct'	=> (is => 'rw', isa => 'Int');
has 'unicastThr'	=> (is => 'rw', isa => 'Int');
has 'unicastTr'		=> (is => 'rw', isa => 'Int');
has 'unicastTrBase'	=> (is => 'rw', isa => 'Int');

1;
