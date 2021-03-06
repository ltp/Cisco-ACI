package Cisco::ACI::FvAEPg;

use Moose;
use Cisco::ACI::FvCEp;
use Cisco::ACI::FvRsBd;
use Cisco::ACI::FvRsCons;
use Cisco::ACI::FvRsProv;
use Cisco::ACI::FvRsDomAtt;
use Cisco::ACI::Stats::Curr::L2EgrBytesAg15min;
use Cisco::ACI::Stats::Curr::L2EgrPktsAg15min;
use Cisco::ACI::Stats::Curr::L2IngrBytesAg15min;
use Cisco::ACI::Stats::Curr::L2IngrPktsAg15min;

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

sub l2EgrBytesAg {
	my ( $self, $period ) = @_;

	return $self->__get_statistics( 'l2EgrBytesAg', $period )
}

sub l2IngrBytesAg {
	my ( $self, $period ) = @_;

	return $self->__get_statistics( 'l2IngrBytesAg', $period )
}

sub l2EgrPktsAg {
	my ( $self, $period ) = @_;

	return $self->__get_statistics( 'l2EgrPktsAg', $period )
}

sub l2IngrPktsAg {
	my ( $self, $period ) = @_;

	return $self->__get_statistics( 'l2IngrPktsAg', $period )
}

sub __get_statistics {
	my ( $self, $obj, $period ) = @_;

	defined $period
	and $period =~ /^((5|15)min|1(h|d|w|mo|qtr|year))$/
	or return( warn 'Specified period is invalid' );

        my $package = "Cisco::ACI::Stats::Curr::" . ucfirst( "$obj$period" );

	# Note that there is a difference between a CDl2EgrBytesAg15min object and a 
	# HDl2EgrBytesAg15min-0 object - in this method, for now, we grab the most 
	# recent interval period (note the -0.json appended) whcih requires that we 
	# access the $obj.'Hist'.$period object in the returned data and not an 
	# "$obj$period" object which would be returned by a CDl2EgrBytesAg15min object.
	return $package->new( 
                $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( 
                                        '/api/mo/'. $self->dn ."/HD$obj$period-0.json"
                                )
                        )->content
                )->{ imdata }->[0]->{ $obj.'Hist'.$period }->{ attributes }
        )
}

1;

__END__
