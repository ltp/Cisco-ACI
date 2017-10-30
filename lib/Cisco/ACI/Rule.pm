package Cisco::ACI::Rule;

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;

has 'constraint'	=> (is => 'rw', isa => 'Int');
has 'desc'		=> (is => 'rw', isa => 'Str');
has 'type'		=> (is => 'rw', isa => 'Str');
has 'scope'		=> (is => 'rw', isa => enum([qw[node policy-domain fabric]]));

1;

__END__
