# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Hybridization.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..50\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::Hybridization;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssay::PhysicalBioAssay;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::Array::Array;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioMaterial::BioMaterialMeasurement;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $hybridization;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hybridization = Bio::MAGE::BioAssay::Hybridization->new();
}
result($hybridization->isa('Bio::MAGE::BioAssay::Hybridization'));

# test the package class method
result($hybridization->package() eq q[BioAssay]);

# test the class_name class method
result($hybridization->class_name() eq q[Bio::MAGE::BioAssay::Hybridization]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hybridization = Bio::MAGE::BioAssay::Hybridization->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($hybridization->getIdentifier() == 1);
$hybridization->setIdentifier(1);
result ($hybridization->getIdentifier() == 1);

# testing attribute name
result ($hybridization->getName() == 2);
$hybridization->setName(2);
result ($hybridization->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::Hybridization->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hybridization = Bio::MAGE::BioAssay::Hybridization->new(array => Bio::MAGE::Array::Array->new(),
sourceBioMaterialMeasurements => [Bio::MAGE::BioMaterial::BioMaterialMeasurement->new()],
physicalBioAssayTarget => Bio::MAGE::BioAssay::PhysicalBioAssay->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association array
my $array_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $array_assn = Bio::MAGE::Array::Array->new();
}
result (UNIVERSAL::isa($hybridization->getArray,q[Bio::MAGE::Array::Array]));
result ($hybridization->setArray($array_assn) == $array_assn);
result ($hybridization->getArray() == $array_assn);



# test the meta-data for the assoication
($assn) = $assns{array};
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
# testing association sourceBioMaterialMeasurements
my $sourcebiomaterialmeasurements_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sourcebiomaterialmeasurements_assn = Bio::MAGE::BioMaterial::BioMaterialMeasurement->new();
}
result (UNIVERSAL::isa($hybridization->getSourceBioMaterialMeasurements->[0],q[Bio::MAGE::BioMaterial::BioMaterialMeasurement]));
result ($hybridization->setSourceBioMaterialMeasurements([$sourcebiomaterialmeasurements_assn]));
result (UNIVERSAL::isa($hybridization->getSourceBioMaterialMeasurements,'ARRAY')
 and scalar @{$hybridization->getSourceBioMaterialMeasurements()} == 1
 and $hybridization->getSourceBioMaterialMeasurements->[0] == $sourcebiomaterialmeasurements_assn);
$hybridization->addSourceBioMaterialMeasurements($sourcebiomaterialmeasurements_assn);
result (UNIVERSAL::isa($hybridization->getSourceBioMaterialMeasurements,'ARRAY')
 and scalar @{$hybridization->getSourceBioMaterialMeasurements()} == 2
 and $hybridization->getSourceBioMaterialMeasurements->[0] == $sourcebiomaterialmeasurements_assn
 and $hybridization->getSourceBioMaterialMeasurements->[1] == $sourcebiomaterialmeasurements_assn);


# test the meta-data for the assoication
($assn) = $assns{sourceBioMaterialMeasurements};
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
# testing association physicalBioAssayTarget
my $physicalbioassaytarget_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalbioassaytarget_assn = Bio::MAGE::BioAssay::PhysicalBioAssay->new();
}
result (UNIVERSAL::isa($hybridization->getPhysicalBioAssayTarget,q[Bio::MAGE::BioAssay::PhysicalBioAssay]));
result ($hybridization->setPhysicalBioAssayTarget($physicalbioassaytarget_assn) == $physicalbioassaytarget_assn);
result ($hybridization->getPhysicalBioAssayTarget() == $physicalbioassaytarget_assn);



# test the meta-data for the assoication
($assn) = $assns{physicalBioAssayTarget};
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
result (UNIVERSAL::isa($hybridization->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($hybridization->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($hybridization->getProtocolApplications,'ARRAY')
 and scalar @{$hybridization->getProtocolApplications()} == 1
 and $hybridization->getProtocolApplications->[0] == $protocolapplications_assn);
$hybridization->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($hybridization->getProtocolApplications,'ARRAY')
 and scalar @{$hybridization->getProtocolApplications()} == 2
 and $hybridization->getProtocolApplications->[0] == $protocolapplications_assn
 and $hybridization->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($hybridization->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($hybridization->setSecurity($security_assn) == $security_assn);
result ($hybridization->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($hybridization->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($hybridization->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($hybridization->getAuditTrail,'ARRAY')
 and scalar @{$hybridization->getAuditTrail()} == 1
 and $hybridization->getAuditTrail->[0] == $audittrail_assn);
$hybridization->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($hybridization->getAuditTrail,'ARRAY')
 and scalar @{$hybridization->getAuditTrail()} == 2
 and $hybridization->getAuditTrail->[0] == $audittrail_assn
 and $hybridization->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($hybridization->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($hybridization->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($hybridization->getDescriptions,'ARRAY')
 and scalar @{$hybridization->getDescriptions()} == 1
 and $hybridization->getDescriptions->[0] == $descriptions_assn);
$hybridization->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($hybridization->getDescriptions,'ARRAY')
 and scalar @{$hybridization->getDescriptions()} == 2
 and $hybridization->getDescriptions->[0] == $descriptions_assn
 and $hybridization->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($hybridization->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($hybridization->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($hybridization->getPropertySets,'ARRAY')
 and scalar @{$hybridization->getPropertySets()} == 1
 and $hybridization->getPropertySets->[0] == $propertysets_assn);
$hybridization->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($hybridization->getPropertySets,'ARRAY')
 and scalar @{$hybridization->getPropertySets()} == 2
 and $hybridization->getPropertySets->[0] == $propertysets_assn
 and $hybridization->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssay::BioAssayCreation
result ($hybridization->isa(q[Bio::MAGE::BioAssay::BioAssayCreation]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($hybridization->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($hybridization->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($hybridization->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($hybridization->isa(q[Bio::MAGE::Extendable]));

