# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl PhysicalArrayDesign.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..69\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::ArrayDesign::PhysicalArrayDesign;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::ArrayDesign::FeatureGroup;
use Bio::MAGE::ArrayDesign::ZoneGroup;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::ArrayDesign::CompositeGroup;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::ArrayDesign::ReporterGroup;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $physicalarraydesign;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalarraydesign = Bio::MAGE::ArrayDesign::PhysicalArrayDesign->new();
}
result($physicalarraydesign->isa('Bio::MAGE::ArrayDesign::PhysicalArrayDesign'));

# test the package class method
result($physicalarraydesign->package() eq q[ArrayDesign]);

# test the class_name class method
result($physicalarraydesign->class_name() eq q[Bio::MAGE::ArrayDesign::PhysicalArrayDesign]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalarraydesign = Bio::MAGE::ArrayDesign::PhysicalArrayDesign->new(version => 1,
numberOfFeatures => 2,
identifier => 3,
name => 4);
}
# testing attribute version
result ($physicalarraydesign->getVersion() == 1);
$physicalarraydesign->setVersion(1);
result ($physicalarraydesign->getVersion() == 1);

# testing attribute numberOfFeatures
result ($physicalarraydesign->getNumberOfFeatures() == 2);
$physicalarraydesign->setNumberOfFeatures(2);
result ($physicalarraydesign->getNumberOfFeatures() == 2);

# testing attribute identifier
result ($physicalarraydesign->getIdentifier() == 3);
$physicalarraydesign->setIdentifier(3);
result ($physicalarraydesign->getIdentifier() == 3);

# testing attribute name
result ($physicalarraydesign->getName() == 4);
$physicalarraydesign->setName(4);
result ($physicalarraydesign->getName() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::PhysicalArrayDesign->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalarraydesign = Bio::MAGE::ArrayDesign::PhysicalArrayDesign->new(zoneGroups => [Bio::MAGE::ArrayDesign::ZoneGroup->new()],
surfaceType => Bio::MAGE::Description::OntologyEntry->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
compositeGroups => [Bio::MAGE::ArrayDesign::CompositeGroup->new()],
designProviders => [Bio::MAGE::AuditAndSecurity::Contact->new()],
reporterGroups => [Bio::MAGE::ArrayDesign::ReporterGroup->new()],
featureGroups => [Bio::MAGE::ArrayDesign::FeatureGroup->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association zoneGroups
my $zonegroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonegroups_assn = Bio::MAGE::ArrayDesign::ZoneGroup->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getZoneGroups->[0],q[Bio::MAGE::ArrayDesign::ZoneGroup]));
result ($physicalarraydesign->setZoneGroups([$zonegroups_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getZoneGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getZoneGroups()} == 1
 and $physicalarraydesign->getZoneGroups->[0] == $zonegroups_assn);
$physicalarraydesign->addZoneGroups($zonegroups_assn);
result (UNIVERSAL::isa($physicalarraydesign->getZoneGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getZoneGroups()} == 2
 and $physicalarraydesign->getZoneGroups->[0] == $zonegroups_assn
 and $physicalarraydesign->getZoneGroups->[1] == $zonegroups_assn);


# test the meta-data for the assoication
($assn) = $assns{zoneGroups};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association surfaceType
my $surfacetype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $surfacetype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getSurfaceType,q[Bio::MAGE::Description::OntologyEntry]));
result ($physicalarraydesign->setSurfaceType($surfacetype_assn) == $surfacetype_assn);
result ($physicalarraydesign->getSurfaceType() == $surfacetype_assn);



# test the meta-data for the assoication
($assn) = $assns{surfaceType};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association protocolApplications
my $protocolapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplications_assn = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($physicalarraydesign->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getProtocolApplications,'ARRAY')
 and scalar @{$physicalarraydesign->getProtocolApplications()} == 1
 and $physicalarraydesign->getProtocolApplications->[0] == $protocolapplications_assn);
$physicalarraydesign->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($physicalarraydesign->getProtocolApplications,'ARRAY')
 and scalar @{$physicalarraydesign->getProtocolApplications()} == 2
 and $physicalarraydesign->getProtocolApplications->[0] == $protocolapplications_assn
 and $physicalarraydesign->getProtocolApplications->[1] == $protocolapplications_assn);


# test the meta-data for the assoication
($assn) = $assns{protocolApplications};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association compositeGroups
my $compositegroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositegroups_assn = Bio::MAGE::ArrayDesign::CompositeGroup->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getCompositeGroups->[0],q[Bio::MAGE::ArrayDesign::CompositeGroup]));
result ($physicalarraydesign->setCompositeGroups([$compositegroups_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getCompositeGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getCompositeGroups()} == 1
 and $physicalarraydesign->getCompositeGroups->[0] == $compositegroups_assn);
$physicalarraydesign->addCompositeGroups($compositegroups_assn);
result (UNIVERSAL::isa($physicalarraydesign->getCompositeGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getCompositeGroups()} == 2
 and $physicalarraydesign->getCompositeGroups->[0] == $compositegroups_assn
 and $physicalarraydesign->getCompositeGroups->[1] == $compositegroups_assn);


# test the meta-data for the assoication
($assn) = $assns{compositeGroups};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association designProviders
my $designproviders_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designproviders_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getDesignProviders->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($physicalarraydesign->setDesignProviders([$designproviders_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getDesignProviders,'ARRAY')
 and scalar @{$physicalarraydesign->getDesignProviders()} == 1
 and $physicalarraydesign->getDesignProviders->[0] == $designproviders_assn);
$physicalarraydesign->addDesignProviders($designproviders_assn);
result (UNIVERSAL::isa($physicalarraydesign->getDesignProviders,'ARRAY')
 and scalar @{$physicalarraydesign->getDesignProviders()} == 2
 and $physicalarraydesign->getDesignProviders->[0] == $designproviders_assn
 and $physicalarraydesign->getDesignProviders->[1] == $designproviders_assn);


# test the meta-data for the assoication
($assn) = $assns{designProviders};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association reporterGroups
my $reportergroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportergroups_assn = Bio::MAGE::ArrayDesign::ReporterGroup->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getReporterGroups->[0],q[Bio::MAGE::ArrayDesign::ReporterGroup]));
result ($physicalarraydesign->setReporterGroups([$reportergroups_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getReporterGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getReporterGroups()} == 1
 and $physicalarraydesign->getReporterGroups->[0] == $reportergroups_assn);
$physicalarraydesign->addReporterGroups($reportergroups_assn);
result (UNIVERSAL::isa($physicalarraydesign->getReporterGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getReporterGroups()} == 2
 and $physicalarraydesign->getReporterGroups->[0] == $reportergroups_assn
 and $physicalarraydesign->getReporterGroups->[1] == $reportergroups_assn);


# test the meta-data for the assoication
($assn) = $assns{reporterGroups};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association featureGroups
my $featuregroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuregroups_assn = Bio::MAGE::ArrayDesign::FeatureGroup->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getFeatureGroups->[0],q[Bio::MAGE::ArrayDesign::FeatureGroup]));
result ($physicalarraydesign->setFeatureGroups([$featuregroups_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getFeatureGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getFeatureGroups()} == 1
 and $physicalarraydesign->getFeatureGroups->[0] == $featuregroups_assn);
$physicalarraydesign->addFeatureGroups($featuregroups_assn);
result (UNIVERSAL::isa($physicalarraydesign->getFeatureGroups,'ARRAY')
 and scalar @{$physicalarraydesign->getFeatureGroups()} == 2
 and $physicalarraydesign->getFeatureGroups->[0] == $featuregroups_assn
 and $physicalarraydesign->getFeatureGroups->[1] == $featuregroups_assn);


# test the meta-data for the assoication
($assn) = $assns{featureGroups};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($physicalarraydesign->setSecurity($security_assn) == $security_assn);
result ($physicalarraydesign->getSecurity() == $security_assn);



# test the meta-data for the assoication
($assn) = $assns{security};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association auditTrail
my $audittrail_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audittrail_assn = Bio::MAGE::AuditAndSecurity::Audit->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($physicalarraydesign->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getAuditTrail,'ARRAY')
 and scalar @{$physicalarraydesign->getAuditTrail()} == 1
 and $physicalarraydesign->getAuditTrail->[0] == $audittrail_assn);
$physicalarraydesign->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($physicalarraydesign->getAuditTrail,'ARRAY')
 and scalar @{$physicalarraydesign->getAuditTrail()} == 2
 and $physicalarraydesign->getAuditTrail->[0] == $audittrail_assn
 and $physicalarraydesign->getAuditTrail->[1] == $audittrail_assn);


# test the meta-data for the assoication
($assn) = $assns{auditTrail};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association descriptions
my $descriptions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $descriptions_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($physicalarraydesign->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getDescriptions,'ARRAY')
 and scalar @{$physicalarraydesign->getDescriptions()} == 1
 and $physicalarraydesign->getDescriptions->[0] == $descriptions_assn);
$physicalarraydesign->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($physicalarraydesign->getDescriptions,'ARRAY')
 and scalar @{$physicalarraydesign->getDescriptions()} == 2
 and $physicalarraydesign->getDescriptions->[0] == $descriptions_assn
 and $physicalarraydesign->getDescriptions->[1] == $descriptions_assn);


# test the meta-data for the assoication
($assn) = $assns{descriptions};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($physicalarraydesign->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($physicalarraydesign->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($physicalarraydesign->getPropertySets,'ARRAY')
 and scalar @{$physicalarraydesign->getPropertySets()} == 1
 and $physicalarraydesign->getPropertySets->[0] == $propertysets_assn);
$physicalarraydesign->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($physicalarraydesign->getPropertySets,'ARRAY')
 and scalar @{$physicalarraydesign->getPropertySets()} == 2
 and $physicalarraydesign->getPropertySets->[0] == $propertysets_assn
 and $physicalarraydesign->getPropertySets->[1] == $propertysets_assn);


# test the meta-data for the assoication
($assn) = $assns{propertySets};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing superclass Bio::MAGE::ArrayDesign::ArrayDesign
result ($physicalarraydesign->isa(q[Bio::MAGE::ArrayDesign::ArrayDesign]));

# testing superclass Bio::MAGE::Identifiable
result ($physicalarraydesign->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($physicalarraydesign->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($physicalarraydesign->isa(q[Bio::MAGE::Extendable]));

