# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl PhysicalBioAssay.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..55\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::PhysicalBioAssay;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssay::BioAssayTreatment;
use Bio::MAGE::BioAssay::Image;
use Bio::MAGE::Experiment::FactorValue;
use Bio::MAGE::BioAssay::BioAssayCreation;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $physicalbioassay;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalbioassay = Bio::MAGE::BioAssay::PhysicalBioAssay->new();
}
result($physicalbioassay->isa('Bio::MAGE::BioAssay::PhysicalBioAssay'));

# test the package class method
result($physicalbioassay->package() eq q[BioAssay]);

# test the class_name class method
result($physicalbioassay->class_name() eq q[Bio::MAGE::BioAssay::PhysicalBioAssay]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalbioassay = Bio::MAGE::BioAssay::PhysicalBioAssay->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($physicalbioassay->getIdentifier() == 1);
$physicalbioassay->setIdentifier(1);
result ($physicalbioassay->getIdentifier() == 1);

# testing attribute name
result ($physicalbioassay->getName() == 2);
$physicalbioassay->setName(2);
result ($physicalbioassay->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::PhysicalBioAssay->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalbioassay = Bio::MAGE::BioAssay::PhysicalBioAssay->new(bioAssayTreatments => [Bio::MAGE::BioAssay::BioAssayTreatment->new()],
bioAssayCreation => Bio::MAGE::BioAssay::BioAssayCreation->new(),
physicalBioAssayData => [Bio::MAGE::BioAssay::Image->new()],
channels => [Bio::MAGE::BioAssay::Channel->new()],
bioAssayFactorValues => [Bio::MAGE::Experiment::FactorValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association bioAssayTreatments
my $bioassaytreatments_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaytreatments_assn = Bio::MAGE::BioAssay::BioAssayTreatment->new();
}
result (UNIVERSAL::isa($physicalbioassay->getBioAssayTreatments->[0],q[Bio::MAGE::BioAssay::BioAssayTreatment]));
result ($physicalbioassay->setBioAssayTreatments([$bioassaytreatments_assn]));
result (UNIVERSAL::isa($physicalbioassay->getBioAssayTreatments,'ARRAY')
 and scalar @{$physicalbioassay->getBioAssayTreatments()} == 1
 and $physicalbioassay->getBioAssayTreatments->[0] == $bioassaytreatments_assn);
$physicalbioassay->addBioAssayTreatments($bioassaytreatments_assn);
result (UNIVERSAL::isa($physicalbioassay->getBioAssayTreatments,'ARRAY')
 and scalar @{$physicalbioassay->getBioAssayTreatments()} == 2
 and $physicalbioassay->getBioAssayTreatments->[0] == $bioassaytreatments_assn
 and $physicalbioassay->getBioAssayTreatments->[1] == $bioassaytreatments_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssayTreatments};
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
# testing association bioAssayCreation
my $bioassaycreation_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaycreation_assn = Bio::MAGE::BioAssay::BioAssayCreation->new();
}
result (UNIVERSAL::isa($physicalbioassay->getBioAssayCreation,q[Bio::MAGE::BioAssay::BioAssayCreation]));
result ($physicalbioassay->setBioAssayCreation($bioassaycreation_assn) == $bioassaycreation_assn);
result ($physicalbioassay->getBioAssayCreation() == $bioassaycreation_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssayCreation};
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
# testing association physicalBioAssayData
my $physicalbioassaydata_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalbioassaydata_assn = Bio::MAGE::BioAssay::Image->new();
}
result (UNIVERSAL::isa($physicalbioassay->getPhysicalBioAssayData->[0],q[Bio::MAGE::BioAssay::Image]));
result ($physicalbioassay->setPhysicalBioAssayData([$physicalbioassaydata_assn]));
result (UNIVERSAL::isa($physicalbioassay->getPhysicalBioAssayData,'ARRAY')
 and scalar @{$physicalbioassay->getPhysicalBioAssayData()} == 1
 and $physicalbioassay->getPhysicalBioAssayData->[0] == $physicalbioassaydata_assn);
$physicalbioassay->addPhysicalBioAssayData($physicalbioassaydata_assn);
result (UNIVERSAL::isa($physicalbioassay->getPhysicalBioAssayData,'ARRAY')
 and scalar @{$physicalbioassay->getPhysicalBioAssayData()} == 2
 and $physicalbioassay->getPhysicalBioAssayData->[0] == $physicalbioassaydata_assn
 and $physicalbioassay->getPhysicalBioAssayData->[1] == $physicalbioassaydata_assn);


# test the meta-data for the assoication
($assn) = $assns{physicalBioAssayData};
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
# testing association channels
my $channels_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channels_assn = Bio::MAGE::BioAssay::Channel->new();
}
result (UNIVERSAL::isa($physicalbioassay->getChannels->[0],q[Bio::MAGE::BioAssay::Channel]));
result ($physicalbioassay->setChannels([$channels_assn]));
result (UNIVERSAL::isa($physicalbioassay->getChannels,'ARRAY')
 and scalar @{$physicalbioassay->getChannels()} == 1
 and $physicalbioassay->getChannels->[0] == $channels_assn);
$physicalbioassay->addChannels($channels_assn);
result (UNIVERSAL::isa($physicalbioassay->getChannels,'ARRAY')
 and scalar @{$physicalbioassay->getChannels()} == 2
 and $physicalbioassay->getChannels->[0] == $channels_assn
 and $physicalbioassay->getChannels->[1] == $channels_assn);


# test the meta-data for the assoication
($assn) = $assns{channels};
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
# testing association bioAssayFactorValues
my $bioassayfactorvalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassayfactorvalues_assn = Bio::MAGE::Experiment::FactorValue->new();
}
result (UNIVERSAL::isa($physicalbioassay->getBioAssayFactorValues->[0],q[Bio::MAGE::Experiment::FactorValue]));
result ($physicalbioassay->setBioAssayFactorValues([$bioassayfactorvalues_assn]));
result (UNIVERSAL::isa($physicalbioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$physicalbioassay->getBioAssayFactorValues()} == 1
 and $physicalbioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn);
$physicalbioassay->addBioAssayFactorValues($bioassayfactorvalues_assn);
result (UNIVERSAL::isa($physicalbioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$physicalbioassay->getBioAssayFactorValues()} == 2
 and $physicalbioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn
 and $physicalbioassay->getBioAssayFactorValues->[1] == $bioassayfactorvalues_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssayFactorValues};
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
result (UNIVERSAL::isa($physicalbioassay->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($physicalbioassay->setSecurity($security_assn) == $security_assn);
result ($physicalbioassay->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($physicalbioassay->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($physicalbioassay->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($physicalbioassay->getAuditTrail,'ARRAY')
 and scalar @{$physicalbioassay->getAuditTrail()} == 1
 and $physicalbioassay->getAuditTrail->[0] == $audittrail_assn);
$physicalbioassay->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($physicalbioassay->getAuditTrail,'ARRAY')
 and scalar @{$physicalbioassay->getAuditTrail()} == 2
 and $physicalbioassay->getAuditTrail->[0] == $audittrail_assn
 and $physicalbioassay->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($physicalbioassay->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($physicalbioassay->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($physicalbioassay->getDescriptions,'ARRAY')
 and scalar @{$physicalbioassay->getDescriptions()} == 1
 and $physicalbioassay->getDescriptions->[0] == $descriptions_assn);
$physicalbioassay->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($physicalbioassay->getDescriptions,'ARRAY')
 and scalar @{$physicalbioassay->getDescriptions()} == 2
 and $physicalbioassay->getDescriptions->[0] == $descriptions_assn
 and $physicalbioassay->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($physicalbioassay->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($physicalbioassay->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($physicalbioassay->getPropertySets,'ARRAY')
 and scalar @{$physicalbioassay->getPropertySets()} == 1
 and $physicalbioassay->getPropertySets->[0] == $propertysets_assn);
$physicalbioassay->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($physicalbioassay->getPropertySets,'ARRAY')
 and scalar @{$physicalbioassay->getPropertySets()} == 2
 and $physicalbioassay->getPropertySets->[0] == $propertysets_assn
 and $physicalbioassay->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssay::BioAssay
result ($physicalbioassay->isa(q[Bio::MAGE::BioAssay::BioAssay]));

# testing superclass Bio::MAGE::Identifiable
result ($physicalbioassay->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($physicalbioassay->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($physicalbioassay->isa(q[Bio::MAGE::Extendable]));

