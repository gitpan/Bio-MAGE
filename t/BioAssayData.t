# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayData.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..53\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::BioAssayData;
use Bio::MAGE::BioAssayData::DerivedBioAssayData;
use Bio::MAGE::BioAssayData::MeasuredBioAssayData;
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
my $bioassaydata;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydata = Bio::MAGE::BioAssayData::BioAssayData->new();
}
result($bioassaydata->isa('Bio::MAGE::BioAssayData::BioAssayData'));

# test the package class method
result($bioassaydata->package() eq q[BioAssayData]);

# test the class_name class method
result($bioassaydata->class_name() eq q[Bio::MAGE::BioAssayData::BioAssayData]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydata = Bio::MAGE::BioAssayData::BioAssayData->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($bioassaydata->getIdentifier() == 1);
$bioassaydata->setIdentifier(1);
result ($bioassaydata->getIdentifier() == 1);

# testing attribute name
result ($bioassaydata->getName() == 2);
$bioassaydata->setName(2);
result ($bioassaydata->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioAssayData->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydata = Bio::MAGE::BioAssayData::BioAssayData->new(designElementDimension => Bio::MAGE::BioAssayData::DesignElementDimension->new(),
bioAssayDimension => Bio::MAGE::BioAssayData::BioAssayDimension->new(),
bioDataValues => Bio::MAGE::BioAssayData::BioDataValues->new(),
quantitationTypeDimension => Bio::MAGE::BioAssayData::QuantitationTypeDimension->new(),
summaryStatistics => [Bio::MAGE::NameValueType->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association designElementDimension
my $designelementdimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementdimension_assn = Bio::MAGE::BioAssayData::DesignElementDimension->new();
}
result (UNIVERSAL::isa($bioassaydata->getDesignElementDimension,q[Bio::MAGE::BioAssayData::DesignElementDimension]));
result ($bioassaydata->setDesignElementDimension($designelementdimension_assn) == $designelementdimension_assn);
result ($bioassaydata->getDesignElementDimension() == $designelementdimension_assn);



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
# testing association bioAssayDimension
my $bioassaydimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydimension_assn = Bio::MAGE::BioAssayData::BioAssayDimension->new();
}
result (UNIVERSAL::isa($bioassaydata->getBioAssayDimension,q[Bio::MAGE::BioAssayData::BioAssayDimension]));
result ($bioassaydata->setBioAssayDimension($bioassaydimension_assn) == $bioassaydimension_assn);
result ($bioassaydata->getBioAssayDimension() == $bioassaydimension_assn);



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
# testing association bioDataValues
my $biodatavalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatavalues_assn = Bio::MAGE::BioAssayData::BioDataValues->new();
}
result (UNIVERSAL::isa($bioassaydata->getBioDataValues,q[Bio::MAGE::BioAssayData::BioDataValues]));
result ($bioassaydata->setBioDataValues($biodatavalues_assn) == $biodatavalues_assn);
result ($bioassaydata->getBioDataValues() == $biodatavalues_assn);



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
# testing association quantitationTypeDimension
my $quantitationtypedimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypedimension_assn = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new();
}
result (UNIVERSAL::isa($bioassaydata->getQuantitationTypeDimension,q[Bio::MAGE::BioAssayData::QuantitationTypeDimension]));
result ($bioassaydata->setQuantitationTypeDimension($quantitationtypedimension_assn) == $quantitationtypedimension_assn);
result ($bioassaydata->getQuantitationTypeDimension() == $quantitationtypedimension_assn);



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
result (UNIVERSAL::isa($bioassaydata->getSummaryStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaydata->setSummaryStatistics([$summarystatistics_assn]));
result (UNIVERSAL::isa($bioassaydata->getSummaryStatistics,'ARRAY')
 and scalar @{$bioassaydata->getSummaryStatistics()} == 1
 and $bioassaydata->getSummaryStatistics->[0] == $summarystatistics_assn);
$bioassaydata->addSummaryStatistics($summarystatistics_assn);
result (UNIVERSAL::isa($bioassaydata->getSummaryStatistics,'ARRAY')
 and scalar @{$bioassaydata->getSummaryStatistics()} == 2
 and $bioassaydata->getSummaryStatistics->[0] == $summarystatistics_assn
 and $bioassaydata->getSummaryStatistics->[1] == $summarystatistics_assn);


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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($bioassaydata->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($bioassaydata->setSecurity($security_assn) == $security_assn);
result ($bioassaydata->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($bioassaydata->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($bioassaydata->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($bioassaydata->getAuditTrail,'ARRAY')
 and scalar @{$bioassaydata->getAuditTrail()} == 1
 and $bioassaydata->getAuditTrail->[0] == $audittrail_assn);
$bioassaydata->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($bioassaydata->getAuditTrail,'ARRAY')
 and scalar @{$bioassaydata->getAuditTrail()} == 2
 and $bioassaydata->getAuditTrail->[0] == $audittrail_assn
 and $bioassaydata->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($bioassaydata->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($bioassaydata->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($bioassaydata->getDescriptions,'ARRAY')
 and scalar @{$bioassaydata->getDescriptions()} == 1
 and $bioassaydata->getDescriptions->[0] == $descriptions_assn);
$bioassaydata->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($bioassaydata->getDescriptions,'ARRAY')
 and scalar @{$bioassaydata->getDescriptions()} == 2
 and $bioassaydata->getDescriptions->[0] == $descriptions_assn
 and $bioassaydata->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($bioassaydata->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaydata->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaydata->getPropertySets,'ARRAY')
 and scalar @{$bioassaydata->getPropertySets()} == 1
 and $bioassaydata->getPropertySets->[0] == $propertysets_assn);
$bioassaydata->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaydata->getPropertySets,'ARRAY')
 and scalar @{$bioassaydata->getPropertySets()} == 2
 and $bioassaydata->getPropertySets->[0] == $propertysets_assn
 and $bioassaydata->getPropertySets->[1] == $propertysets_assn);


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
  my $measuredbioassaydata = Bio::MAGE::BioAssayData::MeasuredBioAssayData->new();

  # testing subclass MeasuredBioAssayData
  result ($measuredbioassaydata->isa(q[Bio::MAGE::BioAssayData::MeasuredBioAssayData]));

  # create a subclass
  my $derivedbioassaydata = Bio::MAGE::BioAssayData::DerivedBioAssayData->new();

  # testing subclass DerivedBioAssayData
  result ($derivedbioassaydata->isa(q[Bio::MAGE::BioAssayData::DerivedBioAssayData]));

}
# testing superclass Bio::MAGE::Identifiable
result ($bioassaydata->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($bioassaydata->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($bioassaydata->isa(q[Bio::MAGE::Extendable]));

