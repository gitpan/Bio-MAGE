# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ArrayDesign.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..60\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::ArrayDesign::ArrayDesign;
use Bio::MAGE::ArrayDesign::FeatureGroup;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::ArrayDesign::CompositeGroup;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::ArrayDesign::PhysicalArrayDesign;
use Bio::MAGE::ArrayDesign::ReporterGroup;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $arraydesign;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraydesign = Bio::MAGE::ArrayDesign::ArrayDesign->new();
}
result($arraydesign->isa('Bio::MAGE::ArrayDesign::ArrayDesign'));

# test the package class method
result($arraydesign->package() eq q[ArrayDesign]);

# test the class_name class method
result($arraydesign->class_name() eq q[Bio::MAGE::ArrayDesign::ArrayDesign]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraydesign = Bio::MAGE::ArrayDesign::ArrayDesign->new(numberOfFeatures => 1,
version => 2,
identifier => 3,
name => 4);
}
# testing attribute numberOfFeatures
result ($arraydesign->getNumberOfFeatures() == 1);
$arraydesign->setNumberOfFeatures(1);
result ($arraydesign->getNumberOfFeatures() == 1);

# testing attribute version
result ($arraydesign->getVersion() == 2);
$arraydesign->setVersion(2);
result ($arraydesign->getVersion() == 2);

# testing attribute identifier
result ($arraydesign->getIdentifier() == 3);
$arraydesign->setIdentifier(3);
result ($arraydesign->getIdentifier() == 3);

# testing attribute name
result ($arraydesign->getName() == 4);
$arraydesign->setName(4);
result ($arraydesign->getName() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::ArrayDesign->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraydesign = Bio::MAGE::ArrayDesign::ArrayDesign->new(reporterGroups => [Bio::MAGE::ArrayDesign::ReporterGroup->new()],
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
featureGroups => [Bio::MAGE::ArrayDesign::FeatureGroup->new()],
compositeGroups => [Bio::MAGE::ArrayDesign::CompositeGroup->new()],
designProviders => [Bio::MAGE::AuditAndSecurity::Contact->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association reporterGroups
my $reportergroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportergroups_assn = Bio::MAGE::ArrayDesign::ReporterGroup->new();
}
result (UNIVERSAL::isa($arraydesign->getReporterGroups->[0],q[Bio::MAGE::ArrayDesign::ReporterGroup]));
result ($arraydesign->setReporterGroups([$reportergroups_assn]));
result (UNIVERSAL::isa($arraydesign->getReporterGroups,'ARRAY')
 and scalar @{$arraydesign->getReporterGroups()} == 1
 and $arraydesign->getReporterGroups->[0] == $reportergroups_assn);
$arraydesign->addReporterGroups($reportergroups_assn);
result (UNIVERSAL::isa($arraydesign->getReporterGroups,'ARRAY')
 and scalar @{$arraydesign->getReporterGroups()} == 2
 and $arraydesign->getReporterGroups->[0] == $reportergroups_assn
 and $arraydesign->getReporterGroups->[1] == $reportergroups_assn);


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
# testing association protocolApplications
my $protocolapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplications_assn = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result (UNIVERSAL::isa($arraydesign->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($arraydesign->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($arraydesign->getProtocolApplications,'ARRAY')
 and scalar @{$arraydesign->getProtocolApplications()} == 1
 and $arraydesign->getProtocolApplications->[0] == $protocolapplications_assn);
$arraydesign->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($arraydesign->getProtocolApplications,'ARRAY')
 and scalar @{$arraydesign->getProtocolApplications()} == 2
 and $arraydesign->getProtocolApplications->[0] == $protocolapplications_assn
 and $arraydesign->getProtocolApplications->[1] == $protocolapplications_assn);


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
# testing association featureGroups
my $featuregroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuregroups_assn = Bio::MAGE::ArrayDesign::FeatureGroup->new();
}
result (UNIVERSAL::isa($arraydesign->getFeatureGroups->[0],q[Bio::MAGE::ArrayDesign::FeatureGroup]));
result ($arraydesign->setFeatureGroups([$featuregroups_assn]));
result (UNIVERSAL::isa($arraydesign->getFeatureGroups,'ARRAY')
 and scalar @{$arraydesign->getFeatureGroups()} == 1
 and $arraydesign->getFeatureGroups->[0] == $featuregroups_assn);
$arraydesign->addFeatureGroups($featuregroups_assn);
result (UNIVERSAL::isa($arraydesign->getFeatureGroups,'ARRAY')
 and scalar @{$arraydesign->getFeatureGroups()} == 2
 and $arraydesign->getFeatureGroups->[0] == $featuregroups_assn
 and $arraydesign->getFeatureGroups->[1] == $featuregroups_assn);


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
# testing association compositeGroups
my $compositegroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositegroups_assn = Bio::MAGE::ArrayDesign::CompositeGroup->new();
}
result (UNIVERSAL::isa($arraydesign->getCompositeGroups->[0],q[Bio::MAGE::ArrayDesign::CompositeGroup]));
result ($arraydesign->setCompositeGroups([$compositegroups_assn]));
result (UNIVERSAL::isa($arraydesign->getCompositeGroups,'ARRAY')
 and scalar @{$arraydesign->getCompositeGroups()} == 1
 and $arraydesign->getCompositeGroups->[0] == $compositegroups_assn);
$arraydesign->addCompositeGroups($compositegroups_assn);
result (UNIVERSAL::isa($arraydesign->getCompositeGroups,'ARRAY')
 and scalar @{$arraydesign->getCompositeGroups()} == 2
 and $arraydesign->getCompositeGroups->[0] == $compositegroups_assn
 and $arraydesign->getCompositeGroups->[1] == $compositegroups_assn);


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
result (UNIVERSAL::isa($arraydesign->getDesignProviders->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($arraydesign->setDesignProviders([$designproviders_assn]));
result (UNIVERSAL::isa($arraydesign->getDesignProviders,'ARRAY')
 and scalar @{$arraydesign->getDesignProviders()} == 1
 and $arraydesign->getDesignProviders->[0] == $designproviders_assn);
$arraydesign->addDesignProviders($designproviders_assn);
result (UNIVERSAL::isa($arraydesign->getDesignProviders,'ARRAY')
 and scalar @{$arraydesign->getDesignProviders()} == 2
 and $arraydesign->getDesignProviders->[0] == $designproviders_assn
 and $arraydesign->getDesignProviders->[1] == $designproviders_assn);


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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($arraydesign->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($arraydesign->setSecurity($security_assn) == $security_assn);
result ($arraydesign->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($arraydesign->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($arraydesign->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($arraydesign->getAuditTrail,'ARRAY')
 and scalar @{$arraydesign->getAuditTrail()} == 1
 and $arraydesign->getAuditTrail->[0] == $audittrail_assn);
$arraydesign->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($arraydesign->getAuditTrail,'ARRAY')
 and scalar @{$arraydesign->getAuditTrail()} == 2
 and $arraydesign->getAuditTrail->[0] == $audittrail_assn
 and $arraydesign->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($arraydesign->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($arraydesign->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($arraydesign->getDescriptions,'ARRAY')
 and scalar @{$arraydesign->getDescriptions()} == 1
 and $arraydesign->getDescriptions->[0] == $descriptions_assn);
$arraydesign->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($arraydesign->getDescriptions,'ARRAY')
 and scalar @{$arraydesign->getDescriptions()} == 2
 and $arraydesign->getDescriptions->[0] == $descriptions_assn
 and $arraydesign->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($arraydesign->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($arraydesign->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($arraydesign->getPropertySets,'ARRAY')
 and scalar @{$arraydesign->getPropertySets()} == 1
 and $arraydesign->getPropertySets->[0] == $propertysets_assn);
$arraydesign->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($arraydesign->getPropertySets,'ARRAY')
 and scalar @{$arraydesign->getPropertySets()} == 2
 and $arraydesign->getPropertySets->[0] == $propertysets_assn
 and $arraydesign->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $physicalarraydesign = Bio::MAGE::ArrayDesign::PhysicalArrayDesign->new();

  # testing subclass PhysicalArrayDesign
  result ($physicalarraydesign->isa(q[Bio::MAGE::ArrayDesign::PhysicalArrayDesign]));

}
# testing superclass Bio::MAGE::Identifiable
result ($arraydesign->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($arraydesign->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($arraydesign->isa(q[Bio::MAGE::Extendable]));

