package Cisco::ACI::FvAEPg;

use Moose;
use Cisco::ACI::FvCEp;
use Cisco::ACI::FvRsBd;
use Cisco::ACI::FvRsCons;
use Cisco::ACI::FvRsProv;
use Cisco::ACI::FvRsDomAtt;

extends 'Cisco::ACI::FvCEPg';

has 'fwdCtrl'			=> ( is => 'rw', isa => 'Str' );
has 'isAttrBasedEPg'		=> ( is => 'rw', isa => 'Str' );
has 'isSharedSrvMsiteEPg'	=> ( is => 'rw', isa => 'Str' );
has 'monPolDn'			=> ( is => 'rw', isa => 'Str' );
has 'pcEnfPref'			=> ( is => 'rw', isa => 'Str' );
has '__aci'			=> ( is => 'rw' );

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

sub bd {
	my $self = shift;

	return Cisco::ACI::FvRsBd->new(
		$self->__aci->__jp->decode(
			$self->__aci->__request(
				$self->__aci->__get_uri(
					'/api/mo/'. $self->dn .'/rsbd.json'
				)
			)->content
		)->{ imdata }->[0]->{ fvRsBd }->{ attributes }
	)
}

sub domains {
        my $self = shift;

        return map { 
                Cisco::ACI::FvRsDomAtt->new( $_->{ fvRsDomAtt }->{ attributes } ) 
        }
        @{ $self->__aci->__jp->decode(
                $self->__aci->__request(
                        $self->__aci->__get_uri(
                                '/api/mo/'. $self->dn .'.json?query-target=children&target-subtree-class=fvRsDomAtt'
                        )
                )->content
        )->{ imdata } }
}

sub consumed_contracts {
        my $self = shift;

        return map { 
                Cisco::ACI::FvRsCons->new( $_->{ fvRsCons }->{ attributes } ) 
        }
        @{ $self->__aci->__jp->decode(
                $self->__aci->__request(
                        $self->__aci->__get_uri(
                                '/api/mo/'. $self->dn .'.json?query-target=children&target-subtree-class=fvRsCons'
                        )
                )->content
        )->{ imdata } }
}

sub provided_contracts {
        my $self = shift;

        return map { 
                Cisco::ACI::FvRsProv->new( $_->{ fvRsProv }->{ attributes } ) 
        }
        @{ $self->__aci->__jp->decode(
                $self->__aci->__request(
                        $self->__aci->__get_uri(
                                '/api/mo/'. $self->dn .'.json?query-target=children&target-subtree-class=fvRsProv'
                        )
                )->content
        )->{ imdata } }
}
1;

__END__
