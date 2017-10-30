package Cisco::ACI::FvcapRule;

use Moose;

extends 'Cisco::ACI::Rule';

has 'faultState'	=> (is => 'rw', isa => 'Str');
has 'subj'		=> (is => 'rw', isa => 'Str');

1;

__END__
