package Cisco::ACI::Stats::Curr::L2EgrPkts;

use Moose;

extends 'Cisco::ACI::Stats::Curr';

has 'multicastCum'	=> (is => 'rw', isa => 'Int');
has 'multicastPer'	=> (is => 'rw', isa => 'Int');
has 'multicastRate'	=> (is => 'rw', isa => 'Int');
has 'multicastSpct'	=> (is => 'rw', isa => 'Int');
has 'multicastThr'	=> (is => 'rw', isa => 'Int');
has 'multicastTr'	=> (is => 'rw', isa => 'Int');
has 'multicastTrBase'	=> (is => 'rw', isa => 'Int');
has 'repIntvEnd'	=> (is => 'rw', isa => 'Int');
has 'repIntvStart'	=> (is => 'rw', isa => 'Int');
has 'unicastCum'	=> (is => 'rw', isa => 'Int');
has 'unicastPer'	=> (is => 'rw', isa => 'Int');
has 'unicastRate'	=> (is => 'rw', isa => 'Int');
has 'unicastSpct'	=> (is => 'rw', isa => 'Int');
has 'unicastThr'	=> (is => 'rw', isa => 'Int');
has 'unicastTr'		=> (is => 'rw', isa => 'Int');
has 'unicastTrBase'	=> (is => 'rw', isa => 'Int');

1;
