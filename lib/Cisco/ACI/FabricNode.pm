package Cisco::ACI::FabricNode;

use Moose;

#sub BUILDARGS {
#	my ( $self, $class, $args, $__aci ) = @_;
#
#	$args->{ __aci => $__aci };
#
#	return $class->$self( $args )
#}


has 'adSt'		=> (is => 'rw', isa => 'Str');
has 'childAction'	=> (is => 'rw', isa => 'Str');
has 'delayedHeartbeat'	=> (is => 'rw', isa => 'Str');
has 'dn'		=> (is => 'rw', isa => 'Str');
has 'extMngdBy'		=> (is => 'rw', isa => 'Str');
has 'fabricSt'		=> (is => 'rw', isa => 'Str');
has 'id'		=> (is => 'rw', isa => 'Int');
has 'lcOwn'		=> (is => 'rw', isa => 'Str');
has 'modTs'		=> (is => 'rw', isa => 'Str');
has 'model'		=> (is => 'rw', isa => 'Str');
has 'monPolDn'		=> (is => 'rw', isa => 'Str');
has 'name'		=> (is => 'rw', isa => 'Str');
has 'nameAlias'		=> (is => 'rw', isa => 'Str');
has 'role'		=> (is => 'rw', isa => 'Str');
has 'serial'		=> (is => 'rw', isa => 'Str');
has 'status'		=> (is => 'rw', isa => 'Str');
has 'uid'		=> (is => 'rw', isa => 'Str');
has 'vendor'		=> (is => 'rw', isa => 'Str');
has 'version'		=> (is => 'rw', isa => 'Str');
has '__aci'		=> (is => 'rw');

sub fault_counts {
	my $self = shift;

	return Cisco::ACI::FaultCounts->new( 
		$self->__aci->{ __jp }->decode(
			$self->__aci->__request(
				$self->__aci->__get_uri( 
					'/api/mo/topology/pod-1/node-'. $self->id .'/sys/ch/fltCnts.json'
				)
			)->content
		)->{ imdata }->[0]->{ faultCounts }->{ attributes }
	)
}

1;

__END__
"adSt": "on",
"childAction": "",
"delayedHeartbeat": "no",
"dn": "topology/pod-1/node-201",
"extMngdBy": "",
"fabricSt": "active",
"id": "201",
"lcOwn": "local",
"modTs": "2017-09-06T04:31:09.799+11:00",
"model": "N9K-C9336PQ",
"monPolDn": "uni/fabric/monfab-default",
"name": "aci-spine-fs1",
"nameAlias": "",
"role": "spine",
"serial": "FDO21141NQY",
"status": "",
"uid": "0",
"vendor": "Cisco Systems, Inc",
"version": ""
