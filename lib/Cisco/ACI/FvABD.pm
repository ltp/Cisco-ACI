package Cisco::ACI::FvABD;

use Moose;

extends 'Cisco::ACI::FvL2Dom';

has 'OptimizeWanBandwidth'	=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'arpFlood'			=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'bcastP'			=> ( is => 'rw', isa => 'Str' );
has 'configIssues'		=> ( is => 'rw', isa => 'Str' );
has 'descr'			=> ( is => 'rw', isa => 'Str' );
has 'dn'			=> ( is => 'rw', isa => 'Str' );
has 'epClear'			=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'epMoveDetectMode'		=> ( is => 'rw', isa => 'Str' );
has 'intersiteBumTrafficAllow'	=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'intersiteL2Stretch'	=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'ipLearning'		=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'limitIpLearnToSubnets'	=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'llAddr'			=> ( is => 'rw', isa => 'Str' );
has 'mac'			=> ( is => 'rw', isa => 'Str' );
has 'mcastAllow'		=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'mtu'			=> ( is => 'rw', isa => 'Str' );
has 'multiDstPktAct'		=> ( is => 'rw', isa => 'Str' );
has 'name'			=> ( is => 'rw', isa => 'Str' );
has 'nameAlias'			=> ( is => 'rw', isa => 'Str' );
has 'ownerKey'			=> ( is => 'rw', isa => 'Str' );
has 'ownerTag'			=> ( is => 'rw', isa => 'Str' );
has 'pcTag'			=> ( is => 'rw', isa => 'Num' );
has 'rn'			=> ( is => 'rw', isa => 'Str' );
has 'scope'			=> ( is => 'rw', isa => 'Num' );
has 'seg'			=> ( is => 'rw', isa => 'Num' );
has 'status'			=> ( is => 'rw', isa => 'Str' );
has 'unicastRoute'		=> ( is => 'rw', isa => 'Cisco::ACI::Type::Bool', coerce => 1 );
has 'unkMacUcastAct'		=> ( is => 'rw', isa => 'Str' );
has 'unkMcastAct'		=> ( is => 'rw', isa => 'Str' );
has 'vmac'			=> ( is => 'rw', isa => 'Str' );

1;

__END__
