package Cisco::ACI::Fabric::Link;

use Moose;

has 'lcOwn' => ( is => 'rw', isa => 'Str' );
has 'linkState' => ( is => 'rw', isa => 'Str' );
has 'n1' => ( is => 'rw', isa => 'Int' );
has 'n2' => ( is => 'rw', isa => 'Int' );
has 'p1' => ( is => 'rw', isa => 'Int' );
has 'p2' => ( is => 'rw', isa => 'Int' );
has 'r1' => ( is => 'rw', isa => 'Str' );
has 'r2' => ( is => 'rw', isa => 'Str' );
has 's1' => ( is => 'rw', isa => 'Int' );
has 's2' => ( is => 'rw', isa => 'Int' );
has 'status' => ( is => 'rw', isa => 'Str' );
has 'wiringIssues' => ( is => 'rw', isa => 'Str' );

1;

__END__
