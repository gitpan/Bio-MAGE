# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DerivedBioAssayData.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..56\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::DerivedBioAssayData;
use Bio::MAGE::BioAssayData::Transformation;
use Bio::MAGE::BioAssayData::BioAssayDimension;
use Bio::MAGE::BioAssayData::DesignElementDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssayData::QuantitationTypeDimension;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssayData::BioDataValues;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $derivedbioassaydata;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassaydata = Bio::MAGE::BioAssayData::DerivedBioAssayData->new();
}
result($derivedbioassaydata->isa('Bio::MAGE::BioAssayData::DerivedBioAssayData'));

# test the package class method
result($derivedbioassaydata->package() eq q[BioAssayData]);

# test the class_name class method
result($derivedbioassaydata->class_name() eq q[Bio::MAGE::BioAssayData::DerivedBioAssayData]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassaydata = Bio::MAGE::BioAssayData::DerivedBioAssayData->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($derivedbioassaydata->getIdentifier() == 1);
$derivedbioassaydata->setIdentifier(1);
result ($derivedbioassaydata->getIdentifier() == 1);

# testing attribute name
result ($derivedbioassaydata->getName() == 2);
$derivedbioassaydata->setName(2);
result ($derivedbioassaydata->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::DerivedBioAssayData->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassaydata = Bio::MAGE::BioAssayData::DerivedBioAssayData->new(producerTransformation => Bio::MAGE::BioAssayData::Transformation->new(),
bioAssayDimension => Bio::MAGE::BioAssayData::BioAssayDimension->new(),
designElementDimension => Bio::MAGE::BioAssayData::DesignElementDimension->new(),
quantitationTypeDimension => Bio::MAGE::BioAssayData::QuantitationTypeDimension->new(),
summaryStatistics => [Bio::MAGE::NameValueType->new()],
bioDataValues => Bio::MAGE::BioAssayData::BioDataValues->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association producerTransformation
my $producertransformation_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $producertransformation_assn = Bio::MAGE::BioAssayData::Transformation->new();
}
result (UNIVERSAL::isa($derivedbioassaydata->getProducerTransformation,q[Bio::MAGE::BioAssayData::Transformation]));
result ($derivedbioassaydata->setProducerTransformation($producertransformation_assn) == $producertransformation_assn);
result ($derivedbioassaydata->getProducerTransformation() == $producertransformation_assn);



# test the meta-data for the assoication
($assn) = $assns{producerTransformation};
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
# testing association bioAssayDimension
my $bioassaydimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydimension_assn = Bio::MAGE::BioAssayData::BioAssayDimension->new();
}
result (UNIVERSAL::isa($derivedbioassaydata->getBioAssayDimension,q[Bio::MAGE::BioAssayData::BioAssayDimension]));
result ($derivedbioassaydata->setBioAssayDimension($bioassaydimension_assn) == $bioassaydimension_assn);
result ($derivedbioassaydata->getBioAssayDimension() == $bioassaydimension_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssayDimension};
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
# testing association designElementDimension
my $designelementdimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementdimension_assn = Bio::MAGE::BioAssayData::DesignElementDimension->new();
}
result (UNIVERSAL::isa($derivedbioassaydata->getDesignElementDimension,q[Bio::MAGE::BioAssayData::DesignElementDimension]));
result ($derivedbioassaydata->setDesignElementDimension($designelementdimension_assn) == $designelementdimension_assn);
result ($derivedbioassaydata->getDesignElementDimension() == $designelementdimension_assn);



# test the meta-data for the assoication
($assn) = $assns{designElementDimension};
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
# testing association quantitationTypeDimension
my $quantitationtypedimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypedimension_assn = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new();
}
result (UNIVERSAL::isa($derivedbioassaydata->getQuantitationTypeDimension,q[Bio::MAGE::BioAssayData::QuantitationTypeDimension]));
result ($derivedbioassaydata->setQuantitationTypeDimension($quantitationtypedimension_assn) == $quantitationtypedimension_assn);
result ($derivedbioassaydata->getQuantitationTypeDimension() == $quantitationtypedimension_assn);



# test the meta-data for the assoication
($assn) = $assns{quantitationTypeDimension};
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
# testing association summaryStatistics
my $summarystatistics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $summarystatistics_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($derivedbioassaydata->getSummaryStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($derivedbioassaydata->setSummaryStatistics([$summarystatistics_assn]));
result (UNIVERSAL::isa($derivedbioassaydata->getSummaryStatistics,'ARRAY')
 and scalar @{$derivedbioassaydata->getSummaryStatistics()} == 1
 and $derivedbioassaydata->getSummaryStatistics->[0] == $summarystatistics_assn);
$derivedbioassaydata->addSummaryStatistics($summarystatistics_assn);
result (UNIVERSAL::isa($derivedbioassaydata->getSummaryStatistics,'ARRAY')
 and scalar @{$derivedbioassaydata->getSummaryStatistics()} == 2
 and $derivedbioassaydata->getSummaryStatistics->[0] == $summarystatistics_assn
 and $derivedbioassaydata->getSummaryStatistics->[1] == $summarystatistics_assn);


# test the meta-data for the assoication
($assn) = $assns{summaryStatistics};
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
# testing association bioDataValues
my $biodatavalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatavalues_assn = Bio::MAGE::BioAssayData::BioDataValues->new();
}
result (UNIVERSAL::isa($derivedbioassaydata->getBioDataValues,q[Bio::MAGE::BioAssayData::BioDataValues]));
result ($derivedbioassaydata->setBioDataValues($biodatavalues_assn) == $biodatavalues_assn);
result ($derivedbioassaydata->getBioDataValues() == $biodatavalues_assn);



# test the meta-data for the assoication
($assn) = $assns{bioDataValues};
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
result (UNIVERSAL::isa($derivedbioassaydata->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($derivedbioassaydata->setSecurity($security_assn) == $security_assn);
result ($derivedbioassaydata->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($derivedbioassaydata->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($derivedbioassaydata->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($derivedbioassaydata->getAuditTrail,'ARRAY')
 and scalar @{$derivedbioassaydata->getAuditTrail()} == 1
 and $derivedbioassaydata->getAuditTrail->[0] == $audittrail_assn);
$derivedbioassaydata->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($derivedbioassaydata->getAuditTrail,'ARRAY')
 and scalar @{$derivedbioassaydata->getAuditTrail()} == 2
 and $derivedbioassaydata->getAuditTrail->[0] == $audittrail_assn
 and $derivedbioassaydata->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($derivedbioassaydata->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($derivedbioassaydata->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($derivedbioassaydata->getDescriptions,'ARRAY')
 and scalar @{$derivedbioassaydata->getDescriptions()} == 1
 and $derivedbioassaydata->getDescriptions->[0] == $descriptions_assn);
$derivedbioassaydata->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($derivedbioassaydata->getDescriptions,'ARRAY')
 and scalar @{$derivedbioassaydata->getDescriptions()} == 2
 and $derivedbioassaydata->getDescriptions->[0] == $descriptions_assn
 and $derivedbioassaydata->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($derivedbioassaydata->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($derivedbioassaydata->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($derivedbioassaydata->getPropertySets,'ARRAY')
 and scalar @{$derivedbioassaydata->getPropertySets()} == 1
 and $derivedbioassaydata->getPropertySets->[0] == $propertysets_assn);
$derivedbioassaydata->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($derivedbioassaydata->getPropertySets,'ARRAY')
 and scalar @{$derivedbioassaydata->getPropertySets()} == 2
 and $derivedbioassaydata->getPropertySets->[0] == $propertysets_assn
 and $derivedbioassaydata->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssayData::BioAssayData
result ($derivedbioassaydata->isa(q[Bio::MAGE::BioAssayData::BioAssayData]));

# testing superclass Bio::MAGE::Identifiable
result ($derivedbioassaydata->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($derivedbioassaydata->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($derivedbioassaydata->isa(q[Bio::MAGE::Extendable]));

