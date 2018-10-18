package Cisco::ACI::Naming::NamedObject;

use Moose;
use Moose::Util::TypeConstraints;

subtype 'Cisco::ACI::Type::Bool'
        => as 'Bool';

coerce 'Cisco::ACI::Type::Bool'
        => from 'Str'
        => via { $_ eq 'yes' ? 1 : 0 };


has 'name'	=> (is => 'rw', isa => 'Str');
has 'nameAlias'	=> (is => 'rw', isa => 'Str');

1;

__END__
