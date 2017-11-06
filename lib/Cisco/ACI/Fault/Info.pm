package Cisco::ACI::Fault::Info;

use Moose;

extends 'Cisco::ACI::Condition::Info';

has 'ack'		=> ( is => 'rw', isa => 'Str' );
has 'cause'		=> ( is => 'rw', isa => 'Str' );
has 'changeSet'		=> ( is => 'rw', isa => 'Str' );
has 'code'		=> ( is => 'rw', isa => 'Str' );
has 'descr'		=> ( is => 'rw', isa => 'Str' );
has 'domain'		=> ( is => 'rw', isa => 'Str' );
has 'highestSeverity'	=> ( is => 'rw', isa => 'Str' );
has 'lastTransition'	=> ( is => 'rw', isa => 'Str' );
has 'lc'		=> ( is => 'rw', isa => 'Str' );
has 'occur'		=> ( is => 'rw', isa => 'Str' );
has 'origSeverity'	=> ( is => 'rw', isa => 'Str' );
has 'prevSeverity'	=> ( is => 'rw', isa => 'Str' );
has 'rule'		=> ( is => 'rw', isa => 'Str' );
has 'subject'		=> ( is => 'rw', isa => 'Str' );
has 'type'		=> ( is => 'rw', isa => 'Str' );

1;

__END__
