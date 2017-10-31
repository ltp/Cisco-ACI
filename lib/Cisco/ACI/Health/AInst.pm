package Cisco::ACI::Health::AInst;

use Moose;

has 'chng'	=> (is => 'rw', isa => 'Int');
has 'cur'	=> (is => 'rw', isa => 'Int');
has 'maxSev'	=> (is => 'rw', isa => 'Str');
has 'prev'	=> (is => 'rw', isa => 'Int');
has 'twScore'	=> (is => 'rw', isa => 'Int');

1;

__END__
