package Cisco::ACI::L3ext::InstP;

use Moose;
use Cisco::ACI::L3ext::Subnet;

extends 'Cisco::ACI::Extnw::EPg';

has 'mcast'	=> ( is => 'rw', isa => 'Str' );
has 'name'	=> ( is => 'rw', isa => 'Str' );
has 'dn'	=> ( is => 'rw', isa => 'Str' );
has '__aci'	=> ( is => 'rw' );

sub l3extSubnets {
	my $self = shift;

        my @l3extSubnets = map {
		my $s = $_->{ l3extSubnet }->{ attributes };
		$s->{ __aci } = $self->__aci;
		$s = Cisco::ACI::L3ext::Subnet->new( $s );
		$s
	} @{ $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( '/api/mo/'. $self->dn 
					.'.json?query-target=subtree&target-subtree-class=l3extSubnet'
				)
                        )->content
		)->{ imdata }
	};

	return @l3extSubnets	
}

sub l3extSubnet {
        my ( $self, $l3extSubnet ) = @_; 

        confess 'L3extSubnet identifier not provided' unless $l3extSubnet;

        my $args = $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( '/api/mo/'. $self->dn .'/extsubnet-['. $l3extSubnet .'].json' )
                        )->content
                )->{ imdata }->[0]->{ l3extSubnet }->{ attributes };

        confess "L3extSubnet $l3extSubnet not defined." unless defined $args->{ dn };
        $args->{ __aci } = $self->__aci;

        return Cisco::ACI::L3ext::Subnet->new( $args )
}

sub add_l3extSubnet {
        my ( $self, $l3extSubnet ) = @_; 

        confess 'L3extSubnet identifier not provided' unless $l3extSubnet;

	my $data = '{
			"l3extSubnet": {
				"attributes": {
					"dn": "'.$self->dn.'/extsubnet-['.$l3extSubnet.']",
					"ip": "'.$l3extSubnet.'",
					"aggregate": "",
					"rn": "extsubnet-['.$l3extSubnet.']",
					"status": "created"
				},
				"children": []
			}
		}';
	
        my $res = $self->__aci->__jp->decode(
                        $self->__aci->__request(
                                $self->__aci->__get_uri( '/api/mo/'. $self->dn .'/extsubnet-['. $l3extSubnet .'].json' ),
				$data
                        )->content 
		);

	return $res
}

1;

__END__
