package Cisco::ACI::Pol::Dom;

use Moose;

extends 'Cisco::ACI::Naming::NamedObject';

has 'ownerKey'	=> ( is => 'rw', isa => 'Str' );
has 'ownerTag'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
