package Cisco::ACI::FabricNode;

use Moose;
use Cisco::ACI::Eqptcapacity::L2Usage;
use Cisco::ACI::Eqptcapacity::L3Usage;
use Cisco::ACI::Eqptcapacity::L3UsageCap;
use Cisco::ACI::Eqptcapacity::McastUsage;
use Cisco::ACI::Eqptcapacity::PolUsage;
use Cisco::ACI::Eqptcapacity::VlanUsage;

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

#for my $obj ( qw( L2Usage ) ) {{
#for my $period ( qw(1min 5min) ) {
#	no strict 'refs';
#	my $module = "Cisco::ACI::Eqptcapacity::$obj";
#	eval "require $module";
#
#	*{ __PACKAGE__ . "::$obj" } = sub {
#		my ( $self, $obj, $period ) = @_;
#
#		return $module->new( 
#			$self->__aci->{ __jp }->decode(
#				$self->__aci->__request(
#					$self->__aci->__get_uri( 
#						'/api/mo/'. $self->dn ."/sys/eqptcapacity/CDeqptcapacity$obj$period.json"
#					)
#				)->content
#			)->{ imdata }->[0]->{ "eqptcapacity$obj$period" }->{ attributes }
#		)
#	}
#}
#}}

sub fault_counts {
	my $self = shift;

	return Cisco::ACI::FaultCounts->new( 
		$self->__aci->__jp->decode(
			$self->__aci->__request(
				$self->__aci->__get_uri( 
					'/api/mo/'. $self->dn .'/sys/ch/fltCnts.json'
				)
			)->content
		)->{ imdata }->[0]->{ faultCounts }->{ attributes }
	)
}

sub health {
	my $self = shift;

	return Cisco::ACI::Health::Inst->new( 
		$self->__aci->__jp->decode(
			$self->__aci->__request(
				$self->__aci->__get_uri( 
					'/api/mo/'. $self->dn .'/sys/ch/health.json'
				)
			)->content
		)->{ imdata }->[0]->{ healthInst }->{ attributes }
	)
}
# /api/class/eqptcapacityEntity.json?query-target=self&rsp-subtree-include=stats&rsp-subtree-class=eqptcapacityMcastUsage5min,eqptcapacityL3UsageCap5min,eqptcapacityL3Usage5min,eqptcapacityL2Usage5min,eqptcapacityVlanUsage5min,eqptcapacityPolUsage5min

# Get BDs for node
# https://aci-apic-fs1.its.deakin.edu.au/api/mo/topology/pod-1/node-101.json?query-target=subtree&target-subtree-class=l2BD

sub McastUsage {
	my ( $self, $period ) = @_;

	return $self->__get_eqptcapacity( 'McastUsage', $period )
}

sub L2Usage {
	my ( $self, $period ) = @_;

	return $self->__get_eqptcapacity( 'L2Usage', $period )
}

sub L2UsageCap {
	my ( $self, $period ) = @_;

	return $self->__get_eqptcapacity( 'L2UsageCap', $period )
}

sub L3Usage {
	my ( $self, $period ) = @_;

	return $self->__get_eqptcapacity( 'L3Usage', $period )
}

sub L3UsageCap {
	my ( $self, $period ) = @_;

	return $self->__get_eqptcapacity( 'L3UsageCap', $period )
}

sub PolUsage {
	my ( $self, $period ) = @_;

	return $self->__get_eqptcapacity( 'PolUsage', $period )
}

sub VlanUsage {
	my ( $self, $period ) = @_;

	return $self->__get_eqptcapacity( 'VlanUsage', $period )
}

sub EPGUsage {
	my $self = shift;

	return $self->__get_count( 'fvEpP' )
}

sub BDUsage {
	my $self = shift;

	return $self->__get_count( 'l2BD' )
}

sub VRFUsage {
	my $self = shift;

	return $self->__get_count( 'l3Dom' )
}

sub __get_count {
	my ( $self, $class ) = @_;

	return $self->__aci->__jp->decode(
		$self->__aci->__request(
			$self->__aci->__get_uri(
				'/api/mo/'. $self->dn ."/ccnt-ctxClassCnt.json?rsp-subtree-class=$class"
			)
		)->content
	)->{ imdata }->[0]->{ ctxClassCnt }->{ attributes }->{ count }
}

sub __get_eqptcapacity {
	my ( $self, $obj, $period ) = @_;

	defined $period
		and $period =~ /^((5|15)min|1(h|d|w|mo|qtr|year))$/
		or return( warn 'Specified period is invalid' );

	my $package = "Cisco::ACI::Eqptcapacity::$obj";

	return $package->new( 
		$self->__aci->__jp->decode(
			$self->__aci->__request(
				$self->__aci->__get_uri( 
					'/api/mo/'. $self->dn ."/sys/eqptcapacity/CDeqptcapacity$obj$period.json"
				)
			)->content
		)->{ imdata }->[0]->{ "eqptcapacity$obj$period" }->{ attributes }
	)
}

1;

__END__
