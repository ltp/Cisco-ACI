package Cisco::ACI::FvAEPg;

use Moose;

extends 'Cisco::ACI::FvCEPg';

has 'fwdCtrl'			=> ( is => 'rw',, isa => 'Str' );
has 'isAttrBasedEPg'		=> ( is => 'rw',, isa => 'Str' );
has 'isSharedSrvMsiteEPg'	=> ( is => 'rw',, isa => 'Str' );
has 'monPolDn'			=> ( is => 'rw',, isa => 'Str' );
has 'pcEnfPref'			=> ( is => 'rw',, isa => 'Str' );


1;
