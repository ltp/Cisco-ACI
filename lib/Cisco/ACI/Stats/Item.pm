package Cisco::ACI::Stats::Item;

use Moose;

has 'cnt'		=> (is => 'rw', isa => 'Int');
has 'lastCollOffset'	=> (is => 'rw', isa => 'Int');
has 'repIntvEnd'	=> (is => 'rw', isa => 'Str');
has 'repIntvStart'	=> (is => 'rw', isa => 'Str');

1;

__END__
our @ATTR

sub new {
	my ( $class, %args ) = @_;

	my $self = bless {}, $class;

	return $self
}

1;

