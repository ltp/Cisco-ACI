package Cisco::ACI::Condition::Info;

use Moose;

has 'created'	=> ( is => 'rw', isa => 'Str' );
has 'descr'	=> ( is => 'rw', isa => 'Str' );
has 'severity'	=> ( is => 'rw', isa => 'Str' );

1;

__END__
