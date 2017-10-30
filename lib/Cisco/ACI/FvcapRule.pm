package Cisco::ACI::FvcapRule;

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;

extends 'Cisco::ACI::Rule';

has 'faultState'	=> (is => 'rw', isa => 'Str');
has 'scope'             => (is => 'rw', isa => enum([qw[node policy-domain fabric]]));
has 'subj'		=> (is => 'rw', isa => 'Str');
has 'type'              => (is => 'rw', isa => 'Str');

1;

__END__
