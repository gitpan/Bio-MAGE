# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DerivedBioAssay.t'

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
use Bio::MAGE::BioAssay::DerivedBioAssay;
use Bio::MAGE::BioAssayData::DerivedBioAssayData;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::BioAssayData::BioAssayMap;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Experiment::FactorValue;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $derivedbioassay;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassay = Bio::MAGE::BioAssay::DerivedBioAssay->new();
}
result($derivedbioassay->isa('Bio::MAGE::BioAssay::DerivedBioAssay'));

# test the package class method
result($derivedbioassay->package() eq q[BioAssay]);

# test the class_name class method
result($derivedbioassay->class_name() eq q[Bio::MAGE::BioAssay::DerivedBioAssay]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassay = Bio::MAGE::BioAssay::DerivedBioAssay->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($derivedbioassay->getIdentifier() == 1);
$derivedbioassay->setIdentifier(1);
result ($derivedbioassay->getIdentifier() == 1);

# testing attribute name
result ($derivedbioassay->getName() == 2);
$derivedbioassay->setName(2);
result ($derivedbioassay->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::DerivedBioAssay->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassay = Bio::MAGE::BioAssay::DerivedBioAssay->new(derivedBioAssayMap => [Bio::MAGE::BioAssayData::BioAssayMap->new()],
type => Bio::MAGE::Description::OntologyEntry->new(),
derivedBioAssayData => [Bio::MAGE::BioAssayData::DerivedBioAssayData->new()],
channels => [Bio::MAGE::BioAssay::Channel->new()],
bioAssayFactorValues => [Bio::MAGE::Experiment::FactorValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association derivedBioAssayMap
my $derivedbioassaymap_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassaymap_assn = Bio::MAGE::BioAssayData::BioAssayMap->new();
}
result (UNIVERSAL::isa($derivedbioassay->getDerivedBioAssayMap->[0],q[Bio::MAGE::BioAssayData::BioAssayMap]));
result ($derivedbioassay->setDerivedBioAssayMap([$derivedbioassaymap_assn]));
result (UNIVERSAL::isa($derivedbioassay->getDerivedBioAssayMap,'ARRAY')
 and scalar @{$derivedbioassay->getDerivedBioAssayMap()} == 1
 and $derivedbioassay->getDerivedBioAssayMap->[0] == $derivedbioassaymap_assn);
$derivedbioassay->addDerivedBioAssayMap($derivedbioassaymap_assn);
result (UNIVERSAL::isa($derivedbioassay->getDerivedBioAssayMap,'ARRAY')
 and scalar @{$derivedbioassay->getDerivedBioAssayMap()} == 2
 and $derivedbioassay->getDerivedBioAssayMap->[0] == $derivedbioassaymap_assn
 and $derivedbioassay->getDerivedBioAssayMap->[1] == $derivedbioassaymap_assn);


# test the meta-data for the assoication
($assn) = $assns{derivedBioAssayMap};
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
# testing association type
my $type_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $type_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($derivedbioassay->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($derivedbioassay->setType($type_assn) == $type_assn);
result ($derivedbioassay->getType() == $type_assn);



# test the meta-data for the assoication
($assn) = $assns{type};
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
# testing association derivedBioAssayData
my $derivedbioassaydata_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassaydata_assn = Bio::MAGE::BioAssayData::DerivedBioAssayData->new();
}
result (UNIVERSAL::isa($derivedbioassay->getDerivedBioAssayData->[0],q[Bio::MAGE::BioAssayData::DerivedBioAssayData]));
result ($derivedbioassay->setDerivedBioAssayData([$derivedbioassaydata_assn]));
result (UNIVERSAL::isa($derivedbioassay->getDerivedBioAssayData,'ARRAY')
 and scalar @{$derivedbioassay->getDerivedBioAssayData()} == 1
 and $derivedbioassay->getDerivedBioAssayData->[0] == $derivedbioassaydata_assn);
$derivedbioassay->addDerivedBioAssayData($derivedbioassaydata_assn);
result (UNIVERSAL::isa($derivedbioassay->getDerivedBioAssayData,'ARRAY')
 and scalar @{$derivedbioassay->getDerivedBioAssayData()} == 2
 and $derivedbioassay->getDerivedBioAssayData->[0] == $derivedbioassaydata_assn
 and $derivedbioassay->getDerivedBioAssayData->[1] == $derivedbioassaydata_assn);


# test the meta-data for the assoication
($assn) = $assns{derivedBioAssayData};
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
result (UNIVERSAL::isa($derivedbioassay->getChannels->[0],q[Bio::MAGE::BioAssay::Channel]));
result ($derivedbioassay->setChannels([$channels_assn]));
result (UNIVERSAL::isa($derivedbioassay->getChannels,'ARRAY')
 and scalar @{$derivedbioassay->getChannels()} == 1
 and $derivedbioassay->getChannels->[0] == $channels_assn);
$derivedbioassay->addChannels($channels_assn);
result (UNIVERSAL::isa($derivedbioassay->getChannels,'ARRAY')
 and scalar @{$derivedbioassay->getChannels()} == 2
 and $derivedbioassay->getChannels->[0] == $channels_assn
 and $derivedbioassay->getChannels->[1] == $channels_assn);


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
result (UNIVERSAL::isa($derivedbioassay->getBioAssayFactorValues->[0],q[Bio::MAGE::Experiment::FactorValue]));
result ($derivedbioassay->setBioAssayFactorValues([$bioassayfactorvalues_assn]));
result (UNIVERSAL::isa($derivedbioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$derivedbioassay->getBioAssayFactorValues()} == 1
 and $derivedbioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn);
$derivedbioassay->addBioAssayFactorValues($bioassayfactorvalues_assn);
result (UNIVERSAL::isa($derivedbioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$derivedbioassay->getBioAssayFactorValues()} == 2
 and $derivedbioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn
 and $derivedbioassay->getBioAssayFactorValues->[1] == $bioassayfactorvalues_assn);


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
result (UNIVERSAL::isa($derivedbioassay->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($derivedbioassay->setSecurity($security_assn) == $security_assn);
result ($derivedbioassay->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($derivedbioassay->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($derivedbioassay->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($derivedbioassay->getAuditTrail,'ARRAY')
 and scalar @{$derivedbioassay->getAuditTrail()} == 1
 and $derivedbioassay->getAuditTrail->[0] == $audittrail_assn);
$derivedbioassay->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($derivedbioassay->getAuditTrail,'ARRAY')
 and scalar @{$derivedbioassay->getAuditTrail()} == 2
 and $derivedbioassay->getAuditTrail->[0] == $audittrail_assn
 and $derivedbioassay->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($derivedbioassay->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($derivedbioassay->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($derivedbioassay->getDescriptions,'ARRAY')
 and scalar @{$derivedbioassay->getDescriptions()} == 1
 and $derivedbioassay->getDescriptions->[0] == $descriptions_assn);
$derivedbioassay->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($derivedbioassay->getDescriptions,'ARRAY')
 and scalar @{$derivedbioassay->getDescriptions()} == 2
 and $derivedbioassay->getDescriptions->[0] == $descriptions_assn
 and $derivedbioassay->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($derivedbioassay->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($derivedbioassay->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($derivedbioassay->getPropertySets,'ARRAY')
 and scalar @{$derivedbioassay->getPropertySets()} == 1
 and $derivedbioassay->getPropertySets->[0] == $propertysets_assn);
$derivedbioassay->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($derivedbioassay->getPropertySets,'ARRAY')
 and scalar @{$derivedbioassay->getPropertySets()} == 2
 and $derivedbioassay->getPropertySets->[0] == $propertysets_assn
 and $derivedbioassay->getPropertySets->[1] == $propertysets_assn);


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
result ($derivedbioassay->isa(q[Bio::MAGE::BioAssay::BioAssay]));

# testing superclass Bio::MAGE::Identifiable
result ($derivedbioassay->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($derivedbioassay->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($derivedbioassay->isa(q[Bio::MAGE::Extendable]));

