package Cisco::ACI::FvRsDomAtt;

use Moose;

extends 'Cisco::ACI::Reln::To';

has 'classPref'			=> ( is => 'rw', isa => 'Str' );
has 'configIssues'		=> ( is => 'rw', isa => 'Str' );
has 'delimiter'			=> ( is => 'rw', isa => 'Str' );
has 'encap'			=> ( is => 'rw', isa => 'Str' );
has 'encapMode'			=> ( is => 'rw', isa => 'Str' );
has 'epgCos'			=> ( is => 'rw', isa => 'Str' );
has 'epgCosPref'		=> ( is => 'rw', isa => 'Str' );
has 'instrImedcy'		=> ( is => 'rw', isa => 'Str' );
has 'mode'			=> ( is => 'rw', isa => 'Str' );
has 'monPolDn'			=> ( is => 'rw', isa => 'Str' );
has 'netflowDir'		=> ( is => 'rw', isa => 'Str' );
has 'netflowPref'		=> ( is => 'rw', isa => 'Str' );
has 'primaryEncap'		=> ( is => 'rw', isa => 'Str' );
has 'primaryEncapInner'		=> ( is => 'rw', isa => 'Str' );
has 'rsImedcy'			=> ( is => 'rw', isa => 'Str' );
has 'secondaryEncapInner'	=> ( is => 'rw', isa => 'Str' );
has 'switchingMode'		=> ( is => 'rw', isa => 'Str' );
has 'triggerSt'			=> ( is => 'rw', isa => 'Str' );
has 'txId'			=> ( is => 'rw', isa => 'Str' );

1;

__END__
