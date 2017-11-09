## NAME

Cisco::ACI - Perl interface to the Cisco APIC API.

## SYNOPSIS

This module provides a Perl interface to Cisco APIC API.

```perl
    use Cisco::ACI;

    my $aci = Cisco::ACI->new(
			username=> $username,
			password=> $password,
			server	=> $server
    );

    # Required!
    $aci->login;

    # Get the leaf nodes of the pod as an array of
    # Cisco::ACI::FabricNode objects.
    my @leafs = $aci->get_leafs;

    # Same but for spines (both leaf and spine nodes
    # are Cisco::ACI::FabricNode objects).
    my @spines = $aci->get_spines;

    # Or, get a leaf by ID - still returns a 
    # Cisco::ACI::FabricNode object.
    my $leaf = $aci->(101);

    # Do some interesting stuff with it.
    # Like, get the 5min measurements of policy CAM (TCAM) usage
    # as a Cisco::ACI::Eqptcapacity::PolUsage object.
    my $pol_usage = $leaf->PolUsage( '5min' );

    # So now we can calculate the policy CAM utilisation
    my $pol_utilisation = ( $pol_usage->polUsageCum 
				/ $pol_usage->polUsageCapCum ) * 100;

    # Or get the number of faults present
    my $faults = $leaf->fault_counts;

     printf( 'Node %s has %d Minor, %d Major, %d Warning, and %d Critical faults\n',
		$leaf->name,
		$faults->minor,
		$faults->maj,
		$faults->warn,
		$faults->crit );
    
    # And much more... 
```

## METHODS

### new ( %ARGS )

Constructor.  Creates a new Cisco::ACI object.  This method accepts three mandatory
and two optional named parameters:

- __username__

    The username with which to connect to the Cisco APIC API.

- __password__

    The password with which to connect to the Cisco APIC API.

- __server__

    The resolvable hostname of the Cisco ACI APIC to connect to.

- __port__

    The TCP port on which to connect to the Cisco ACI APIC, if not specified
    this parameter will default to a value of 443, which is probably what you want.

- __proto__

    The protocol to use when connecting to the Cisco ACI APIC, if not specified
    this parameter will default to a value of 'https', which is probably what you want.

### bd\_constraint ()

Returns the maximum configurable number Bridge Domains (fvBD) in the fabric.

### bd\_count ()

Returns the number of configured Bridge Domains (fvBD) in the fabric.

### cluster\_appliances ()

Returns all APICs in the cluster as an array of [Cisco::ACI::Infra::WiNode](https://metacpan.org/pod/Cisco::ACI::Infra::WiNode)
objects.  Note that APICs are also separately represented as devices of type 
[Cisco::ACI::FabricNode](https://metacpan.org/pod/Cisco::ACI::FabricNode) within the Cisco APIC MO (see method __controllers()__).

### cluster\_standby\_appliances ()

Returns all standby APICs in the cluster as an array of [Cisco::ACI::Infra::SnNode](https://metacpan.org/pod/Cisco::ACI::Infra::SnNode)
objects.

### concrete\_devices\_constraint ()

Returns the maximum configurable number concrete devices (vnsCDev) in the fabric.

### concrete\_devices\_count ()

Returns the number of configured concrete devices (vnsCDev) in the fabric.

### contract\_constraint ()

Returns the maximum configurable number contracts (vzBrCP) in the fabric.

### contract\_count ()

Returns the number of configured contracts (vzBrCP) in the fabric.

### controllers ()

Returns all APICs in the cluster as an array of [Cisco::ACI::FabricNode](https://metacpan.org/pod/Cisco::ACI::FabricNode) objects.
Note that APICs are also separately represented as devices of type [Cisco::ACI::Infra::WiNode](https://metacpan.org/pod/Cisco::ACI::Infra::WiNode) 
within the Cisco APIC MO (see method __cluster\_appliances()__).

### controller ( $ID )

Returns the APIC identified by the $ID parameter as a [Cisco::ACI::FabricNode](https://metacpan.org/pod/Cisco::ACI::FabricNode)
object.  Note that APICs are numbered sequentially starting from 1.

### ep\_constraint ()

Returns the maximum configurable number end points (fvCEp) in the fabric.

### ep\_count ()

Returns the number of configured end points (fvCEp) in the fabric.

### epg\_constraint ()

Returns the maximum configurable number end point groups (fvAEPg) in the fabric.

### epg\_count ()

Returns the number of configured end point groups (fvAEPg) in the fabric.

### fabric\_links ()

Returns all fabric links as an array of [Cisco::ACI::Fabric::Link](https://metacpan.org/pod/Cisco::ACI::Fabric::Link) objects.

### faults ()

Returns all fabric faults as an array of [Cisco::ACI::Fault::Inst](https://metacpan.org/pod/Cisco::ACI::Fault::Inst) objects.

### fexs ()

Returns all fabric extendeds (fexs) as an array of [Cisco::ACI::Eqpt::ExtCh](https://metacpan.org/pod/Cisco::ACI::Eqpt::ExtCh) 
objects.

### get\_capability\_rules ()

Returns all capacity rules as an array of [Cisco::ACI::FvcapRule](https://metacpan.org/pod/Cisco::ACI::FvcapRule) objects.

### health ()

Returns the fabric health as an array of [Cisco::ACI::Health::Inst](https://metacpan.org/pod/Cisco::ACI::Health::Inst) objects.

### leaf ( $ID )

Returns the leaf node identified the the __$ID__ parameter as a
[Cisco::ACI::FabricNode](https://metacpan.org/pod/Cisco::ACI::FabricNode) object.

### leafs ()

Returns all leaf nodes as an array of [Cisco::ACI::FabricNode](https://metacpan.org/pod/Cisco::ACI::FabricNode) objects.

### login ()

Perfoms a login to the ACI APIC API - note that merely calling the constructor
does not automatically log you into the fabric.  Rather you are required to invoke
this method to do so.

### overallHealth5min ()

Returns the overall health of the fabric for the previous fivce minute interval as
an [Cisco::ACI::Stats::Curr::OverallHealth](https://metacpan.org/pod/Cisco::ACI::Stats::Curr::OverallHealth) object.

### service\_graph\_constraint ()

Returns the maximum configurable number of service graphs (vnsGraphInst) in the fabric.

### service\_graph\_count ()

Returns the number of configured service graphs (vnsGraphInst) in the fabric.

### spine ( $ID )

Returns the spine node identified the the __$ID__ parameter as a
[Cisco::ACI::FabricNode](https://metacpan.org/pod/Cisco::ACI::FabricNode) object.

### spines ()

Returns all spine nodes as an array of [Cisco::ACI::FabricNode](https://metacpan.org/pod/Cisco::ACI::FabricNode) objects.

### tenant ( $TENANT )

Returns the tenant identified by the $TENANT parameter as a [Cisco::ACI:Tenant](https://metacpan.org/pod/Cisco::ACI:Tenant)
object.

### tenant\_constraint ()

Returns the maximum configurable number of tenant (fvTenant) in the fabric.

### tenant\_count ()

Returns the number of configured tenants (fvTenant) in the fabric.

### vrf\_constraint ()

Returns the maximum configurable number of VRFs (fvCtx) in the fabric.

### vrf\_count ()

Returns the number of configured VRFs (fvCtx) in the fabric.

## AUTHOR

Luke Poskitt, `<ltp at cpan.org>`

## BUGS

Please report any bugs or feature requests to `bug-cisco-aci at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Cisco-ACI](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Cisco-ACI).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

## SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Cisco::ACI

You can also look for information at:

- RT: CPAN's request tracker (report bugs here)

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=Cisco-ACI](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Cisco-ACI)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/Cisco-ACI](http://annocpan.org/dist/Cisco-ACI)

- CPAN Ratings

    [http://cpanratings.perl.org/d/Cisco-ACI](http://cpanratings.perl.org/d/Cisco-ACI)

- Search CPAN

    [http://search.cpan.org/dist/Cisco-ACI/](http://search.cpan.org/dist/Cisco-ACI/)

## LICENSE AND COPYRIGHT

Copyright 2017 Luke Poskitt.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

[http://www.perlfoundation.org/artistic_license_2_0](http://www.perlfoundation.org/artistic_license_2_0)

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


