package Cisco::ACI::Naming::NamedObject;

use Moose;

has 'name'	=> (is => 'rw', isa => 'Str');
has 'nameAlias'	=> (is => 'rw', isa => 'Str');

1;

__END__
