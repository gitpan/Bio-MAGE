# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureExtraction.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..44\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::FeatureExtraction;
use Bio::MAGE::BioAssay::MeasuredBioAssay;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssay::PhysicalBioAssay;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $featureextraction;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureextraction = Bio::MAGE::BioAssay::FeatureExtraction->new();
}
result($featureextraction->isa('Bio::MAGE::BioAssay::FeatureExtraction'));

# test the package class method
result($featureextraction->package() eq q[BioAssay]);

# test the class_name class method
result($featureextraction->class_name() eq q[Bio::MAGE::BioAssay::FeatureExtraction]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureextraction = Bio::MAGE::BioAssay::FeatureExtraction->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($featureextraction->getIdentifier() == 1);
$featureextraction->setIdentifier(1);
result ($featureextraction->getIdentifier() == 1);

# testing attribute name
result ($featureextraction->getName() == 2);
$featureextraction->setName(2);
result ($featureextraction->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::FeatureExtraction->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureextraction = Bio::MAGE::BioAssay::FeatureExtraction->new(physicalBioAssaySource => Bio::MAGE::BioAssay::PhysicalBioAssay->new(),
measuredBioAssayTarget => Bio::MAGE::BioAssay::MeasuredBioAssay->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association physicalBioAssaySource
my $physicalbioassaysource_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalbioassaysource_assn = Bio::MAGE::BioAssay::PhysicalBioAssay->new();
}
result (UNIVERSAL::isa($featureextraction->getPhysicalBioAssaySource,q[Bio::MAGE::BioAssay::PhysicalBioAssay]));
result ($featureextraction->setPhysicalBioAssaySource($physicalbioassaysource_assn) == $physicalbioassaysource_assn);
result ($featureextraction->getPhysicalBioAssaySource() == $physicalbioassaysource_assn);



# test the meta-data for the assoication
($assn) = $assns{physicalBioAssaySource};
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
# testing association measuredBioAssayTarget
my $measuredbioassaytarget_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassaytarget_assn = Bio::MAGE::BioAssay::MeasuredBioAssay->new();
}
result (UNIVERSAL::isa($featureextraction->getMeasuredBioAssayTarget,q[Bio::MAGE::BioAssay::MeasuredBioAssay]));
result ($featureextraction->setMeasuredBioAssayTarget($measuredbioassaytarget_assn) == $measuredbioassaytarget_assn);
result ($featureextraction->getMeasuredBioAssayTarget() == $measuredbioassaytarget_assn);



# test the meta-data for the assoication
($assn) = $assns{measuredBioAssayTarget};
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
result (UNIVERSAL::isa($featureextraction->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($featureextraction->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($featureextraction->getProtocolApplications,'ARRAY')
 and scalar @{$featureextraction->getProtocolApplications()} == 1
 and $featureextraction->getProtocolApplications->[0] == $protocolapplications_assn);
$featureextraction->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($featureextraction->getProtocolApplications,'ARRAY')
 and scalar @{$featureextraction->getProtocolApplications()} == 2
 and $featureextraction->getProtocolApplications->[0] == $protocolapplications_assn
 and $featureextraction->getProtocolApplications->[1] == $protocolapplications_assn);


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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($featureextraction->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($featureextraction->setSecurity($security_assn) == $security_assn);
result ($featureextraction->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($featureextraction->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($featureextraction->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($featureextraction->getAuditTrail,'ARRAY')
 and scalar @{$featureextraction->getAuditTrail()} == 1
 and $featureextraction->getAuditTrail->[0] == $audittrail_assn);
$featureextraction->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($featureextraction->getAuditTrail,'ARRAY')
 and scalar @{$featureextraction->getAuditTrail()} == 2
 and $featureextraction->getAuditTrail->[0] == $audittrail_assn
 and $featureextraction->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($featureextraction->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($featureextraction->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($featureextraction->getDescriptions,'ARRAY')
 and scalar @{$featureextraction->getDescriptions()} == 1
 and $featureextraction->getDescriptions->[0] == $descriptions_assn);
$featureextraction->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($featureextraction->getDescriptions,'ARRAY')
 and scalar @{$featureextraction->getDescriptions()} == 2
 and $featureextraction->getDescriptions->[0] == $descriptions_assn
 and $featureextraction->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($featureextraction->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($featureextraction->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($featureextraction->getPropertySets,'ARRAY')
 and scalar @{$featureextraction->getPropertySets()} == 1
 and $featureextraction->getPropertySets->[0] == $propertysets_assn);
$featureextraction->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($featureextraction->getPropertySets,'ARRAY')
 and scalar @{$featureextraction->getPropertySets()} == 2
 and $featureextraction->getPropertySets->[0] == $propertysets_assn
 and $featureextraction->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($featureextraction->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($featureextraction->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($featureextraction->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($featureextraction->isa(q[Bio::MAGE::Extendable]));

