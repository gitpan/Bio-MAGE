# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Identifiable.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..58\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;
use Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster;
use Bio::MAGE::BioSequence::BioSequence;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::BioAssayData::BioAssayData;
use Bio::MAGE::BioAssayData::BioAssayDimension;
use Bio::MAGE::Experiment::Experiment;
use Bio::MAGE::BioAssayData::DesignElementDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioMaterial::Compound;
use Bio::MAGE::Array::ArrayGroup;
use Bio::MAGE::QuantitationType::QuantitationType;
use Bio::MAGE::ArrayDesign::Zone;
use Bio::MAGE::Array::Array;
use Bio::MAGE::BioAssay::Image;
use Bio::MAGE::Protocol::Parameterizable;
use Bio::MAGE::BioAssayData::QuantitationTypeDimension;
use Bio::MAGE::ArrayDesign::DesignElementGroup;
use Bio::MAGE::BioMaterial::BioMaterial;
use Bio::MAGE::AuditAndSecurity::SecurityGroup;
use Bio::MAGE::Description::Database;
use Bio::MAGE::Experiment::FactorValue;
use Bio::MAGE::ArrayDesign::ArrayDesign;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::Array::ArrayManufacture;
use Bio::MAGE::BioEvent::BioEvent;
use Bio::MAGE::Protocol::Parameter;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::DesignElement::DesignElement;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Experiment::ExperimentalFactor;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $identifiable;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $identifiable = Bio::MAGE::Identifiable->new();
}
result($identifiable->isa('Bio::MAGE::Identifiable'));

# test the package class method
result($identifiable->package() eq q[MAGE]);

# test the class_name class method
result($identifiable->class_name() eq q[Bio::MAGE::Identifiable]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $identifiable = Bio::MAGE::Identifiable->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($identifiable->getIdentifier() == 1);
$identifiable->setIdentifier(1);
result ($identifiable->getIdentifier() == 1);

# testing attribute name
result ($identifiable->getName() == 2);
$identifiable->setName(2);
result ($identifiable->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Identifiable->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $identifiable = Bio::MAGE::Identifiable->new(security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($identifiable->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($identifiable->setSecurity($security_assn) == $security_assn);
result ($identifiable->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($identifiable->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($identifiable->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($identifiable->getAuditTrail,'ARRAY')
 and scalar @{$identifiable->getAuditTrail()} == 1
 and $identifiable->getAuditTrail->[0] == $audittrail_assn);
$identifiable->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($identifiable->getAuditTrail,'ARRAY')
 and scalar @{$identifiable->getAuditTrail()} == 2
 and $identifiable->getAuditTrail->[0] == $audittrail_assn
 and $identifiable->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($identifiable->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($identifiable->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($identifiable->getDescriptions,'ARRAY')
 and scalar @{$identifiable->getDescriptions()} == 1
 and $identifiable->getDescriptions->[0] == $descriptions_assn);
$identifiable->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($identifiable->getDescriptions,'ARRAY')
 and scalar @{$identifiable->getDescriptions()} == 2
 and $identifiable->getDescriptions->[0] == $descriptions_assn
 and $identifiable->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($identifiable->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($identifiable->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($identifiable->getPropertySets,'ARRAY')
 and scalar @{$identifiable->getPropertySets()} == 1
 and $identifiable->getPropertySets->[0] == $propertysets_assn);
$identifiable->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($identifiable->getPropertySets,'ARRAY')
 and scalar @{$identifiable->getPropertySets()} == 2
 and $identifiable->getPropertySets->[0] == $propertysets_assn
 and $identifiable->getPropertySets->[1] == $propertysets_assn);


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
  my $compound = Bio::MAGE::BioMaterial::Compound->new();

  # testing subclass Compound
  result ($compound->isa(q[Bio::MAGE::BioMaterial::Compound]));

  # create a subclass
  my $bioevent = Bio::MAGE::BioEvent::BioEvent->new();

  # testing subclass BioEvent
  result ($bioevent->isa(q[Bio::MAGE::BioEvent::BioEvent]));

  # create a subclass
  my $designelementgroup = Bio::MAGE::ArrayDesign::DesignElementGroup->new();

  # testing subclass DesignElementGroup
  result ($designelementgroup->isa(q[Bio::MAGE::ArrayDesign::DesignElementGroup]));

  # create a subclass
  my $quantitationtype = Bio::MAGE::QuantitationType::QuantitationType->new();

  # testing subclass QuantitationType
  result ($quantitationtype->isa(q[Bio::MAGE::QuantitationType::QuantitationType]));

  # create a subclass
  my $zone = Bio::MAGE::ArrayDesign::Zone->new();

  # testing subclass Zone
  result ($zone->isa(q[Bio::MAGE::ArrayDesign::Zone]));

  # create a subclass
  my $bioassaydimension = Bio::MAGE::BioAssayData::BioAssayDimension->new();

  # testing subclass BioAssayDimension
  result ($bioassaydimension->isa(q[Bio::MAGE::BioAssayData::BioAssayDimension]));

  # create a subclass
  my $quantitationtypedimension = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new();

  # testing subclass QuantitationTypeDimension
  result ($quantitationtypedimension->isa(q[Bio::MAGE::BioAssayData::QuantitationTypeDimension]));

  # create a subclass
  my $arraydesign = Bio::MAGE::ArrayDesign::ArrayDesign->new();

  # testing subclass ArrayDesign
  result ($arraydesign->isa(q[Bio::MAGE::ArrayDesign::ArrayDesign]));

  # create a subclass
  my $contact = Bio::MAGE::AuditAndSecurity::Contact->new();

  # testing subclass Contact
  result ($contact->isa(q[Bio::MAGE::AuditAndSecurity::Contact]));

  # create a subclass
  my $factorvalue = Bio::MAGE::Experiment::FactorValue->new();

  # testing subclass FactorValue
  result ($factorvalue->isa(q[Bio::MAGE::Experiment::FactorValue]));

  # create a subclass
  my $bioassaydata = Bio::MAGE::BioAssayData::BioAssayData->new();

  # testing subclass BioAssayData
  result ($bioassaydata->isa(q[Bio::MAGE::BioAssayData::BioAssayData]));

  # create a subclass
  my $arraymanufacture = Bio::MAGE::Array::ArrayManufacture->new();

  # testing subclass ArrayManufacture
  result ($arraymanufacture->isa(q[Bio::MAGE::Array::ArrayManufacture]));

  # create a subclass
  my $designelement = Bio::MAGE::DesignElement::DesignElement->new();

  # testing subclass DesignElement
  result ($designelement->isa(q[Bio::MAGE::DesignElement::DesignElement]));

  # create a subclass
  my $designelementdimension = Bio::MAGE::BioAssayData::DesignElementDimension->new();

  # testing subclass DesignElementDimension
  result ($designelementdimension->isa(q[Bio::MAGE::BioAssayData::DesignElementDimension]));

  # create a subclass
  my $database = Bio::MAGE::Description::Database->new();

  # testing subclass Database
  result ($database->isa(q[Bio::MAGE::Description::Database]));

  # create a subclass
  my $experiment = Bio::MAGE::Experiment::Experiment->new();

  # testing subclass Experiment
  result ($experiment->isa(q[Bio::MAGE::Experiment::Experiment]));

  # create a subclass
  my $arraygroup = Bio::MAGE::Array::ArrayGroup->new();

  # testing subclass ArrayGroup
  result ($arraygroup->isa(q[Bio::MAGE::Array::ArrayGroup]));

  # create a subclass
  my $security = Bio::MAGE::AuditAndSecurity::Security->new();

  # testing subclass Security
  result ($security->isa(q[Bio::MAGE::AuditAndSecurity::Security]));

  # create a subclass
  my $channel = Bio::MAGE::BioAssay::Channel->new();

  # testing subclass Channel
  result ($channel->isa(q[Bio::MAGE::BioAssay::Channel]));

  # create a subclass
  my $parameterizable = Bio::MAGE::Protocol::Parameterizable->new();

  # testing subclass Parameterizable
  result ($parameterizable->isa(q[Bio::MAGE::Protocol::Parameterizable]));

  # create a subclass
  my $securitygroup = Bio::MAGE::AuditAndSecurity::SecurityGroup->new();

  # testing subclass SecurityGroup
  result ($securitygroup->isa(q[Bio::MAGE::AuditAndSecurity::SecurityGroup]));

  # create a subclass
  my $array = Bio::MAGE::Array::Array->new();

  # testing subclass Array
  result ($array->isa(q[Bio::MAGE::Array::Array]));

  # create a subclass
  my $image = Bio::MAGE::BioAssay::Image->new();

  # testing subclass Image
  result ($image->isa(q[Bio::MAGE::BioAssay::Image]));

  # create a subclass
  my $parameter = Bio::MAGE::Protocol::Parameter->new();

  # testing subclass Parameter
  result ($parameter->isa(q[Bio::MAGE::Protocol::Parameter]));

  # create a subclass
  my $bioassay = Bio::MAGE::BioAssay::BioAssay->new();

  # testing subclass BioAssay
  result ($bioassay->isa(q[Bio::MAGE::BioAssay::BioAssay]));

  # create a subclass
  my $bioassaydatacluster = Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster->new();

  # testing subclass BioAssayDataCluster
  result ($bioassaydatacluster->isa(q[Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster]));

  # create a subclass
  my $experimentalfactor = Bio::MAGE::Experiment::ExperimentalFactor->new();

  # testing subclass ExperimentalFactor
  result ($experimentalfactor->isa(q[Bio::MAGE::Experiment::ExperimentalFactor]));

  # create a subclass
  my $biosequence = Bio::MAGE::BioSequence::BioSequence->new();

  # testing subclass BioSequence
  result ($biosequence->isa(q[Bio::MAGE::BioSequence::BioSequence]));

  # create a subclass
  my $biomaterial = Bio::MAGE::BioMaterial::BioMaterial->new();

  # testing subclass BioMaterial
  result ($biomaterial->isa(q[Bio::MAGE::BioMaterial::BioMaterial]));

}
# testing superclass Bio::MAGE::Describable
result ($identifiable->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($identifiable->isa(q[Bio::MAGE::Extendable]));

