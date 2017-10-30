package Cisco::ACI::Rule;

use Moose;

has 'constraint'	=> (is => 'rw', isa => 'Int');
has 'descr'		=> (is => 'rw', isa => 'Str');

1;

__END__
