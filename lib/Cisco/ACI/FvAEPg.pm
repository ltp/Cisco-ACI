package Cisco::ACI::FvAEPg;

use Moose;
use Cisco::ACI::FvCEp;

extends 'Cisco::ACI::FvCEPg';

has 'fwdCtrl'			=> ( is => 'rw',, isa => 'Str' );
has 'isAttrBasedEPg'		=> ( is => 'rw',, isa => 'Str' );
has 'isSharedSrvMsiteEPg'	=> ( is => 'rw',, isa => 'Str' );
has 'monPolDn'			=> ( is => 'rw',, isa => 'Str' );
has 'pcEnfPref'			=> ( is => 'rw',, isa => 'Str' );

has '__aci'     => (is => 'rw');

sub eps {
        my $self = shift;

        return map { 
                Cisco::ACI::FvCEp->new( $_->{ fvCEp }->{ attributes } ) 
        }
        @{ $self->__aci->__jp->decode(
                $self->__aci->__request(
                        $self->__aci->__get_uri(
                                '/api/mo/'. $self->dn .'.json?query-target=children&target-subtree-class=fvCEp'
                        )
                )->content
        )->{ imdata } }
}

1;
