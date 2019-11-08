package Cisco::ACI::Stats::Curr::L2IngrPktsAg;

use Moose;

extends 'Cisco::ACI::Stats::Curr';

has 'multicastCum'      => (is => 'rw', isa => 'Int');
has 'multicastPer'      => (is => 'rw', isa => 'Int');
has 'multicastRate'     => (is => 'rw', isa => 'Num');
has 'multicastSpct'     => (is => 'rw', isa => 'Int');
has 'multicastThr'      => (is => 'rw', isa => 'Str');
has 'multicastTr'       => (is => 'rw', isa => 'Int');
has 'unicastCum'        => (is => 'rw', isa => 'Int');
has 'unicastPer'        => (is => 'rw', isa => 'Int');
has 'unicastRate'       => (is => 'rw', isa => 'Num');
has 'unicastSpct'       => (is => 'rw', isa => 'Int');
has 'unicastThr'        => (is => 'rw', isa => 'Str');
has 'unicastTr'         => (is => 'rw', isa => 'Int');

1;
