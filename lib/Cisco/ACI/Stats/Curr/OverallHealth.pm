package Cisco::ACI::Stats::Curr::OverallHealth;

use Moose;

extends 'Cisco::ACI::Stats::Curr';

has 'healthAvg'		=> (is => 'rw', isa => 'String');
has 'healthLast'	=> (is => 'rw', isa => 'String');
has 'healthMax'		=> (is => 'rw', isa => 'String');
has 'healthMin'		=> (is => 'rw', isa => 'String');
has 'healthSpct'	=> (is => 'rw', isa => 'Int');
has 'healthThr'		=> (is => 'rw', isa => 'Str');
has 'healthTr'		=> (is => 'rw', isa => 'Str');
has 'healthTrBase'	=> (is => 'rw', isa => 'Str');
has 'healthTtl'		=> (is => 'rw', isa => 'Int');

1;
