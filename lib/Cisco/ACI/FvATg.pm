package Cisco::ACI::FvATg;

use Moose;

extends 'Cisco::ACI::FvComp';

has 'configIssues'	=> ( is => 'rw', isa => 'Str' );
has 'configSt'		=> ( is => 'rw', isa => 'Str' );
has 'name'		=> ( is => 'rw', isa => 'Str' );
has 'pcTag'		=> ( is => 'rw', isa => 'Str' );
has 'prio'		=> ( is => 'rw', isa => 'Str' );
has 'scope'		=> ( is => 'rw', isa => 'Str' );

1;

__END__
