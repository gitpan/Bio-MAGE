# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl MeasuredBioAssay.t'

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
use Bio::MAGE::BioAssay::MeasuredBioAssay;
use Bio::MAGE::BioAssayData::MeasuredBioAssayData;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Experiment::FactorValue;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::BioAssay::FeatureExtraction;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $measuredbioassay;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassay = Bio::MAGE::BioAssay::MeasuredBioAssay->new();
}
result($measuredbioassay->isa('Bio::MAGE::BioAssay::MeasuredBioAssay'));

# test the package class method
result($measuredbioassay->package() eq q[BioAssay]);

# test the class_name class method
result($measuredbioassay->class_name() eq q[Bio::MAGE::BioAssay::MeasuredBioAssay]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassay = Bio::MAGE::BioAssay::MeasuredBioAssay->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($measuredbioassay->getIdentifier() == 1);
$measuredbioassay->setIdentifier(1);
result ($measuredbioassay->getIdentifier() == 1);

# testing attribute name
result ($measuredbioassay->getName() == 2);
$measuredbioassay->setName(2);
result ($measuredbioassay->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::MeasuredBioAssay->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassay = Bio::MAGE::BioAssay::MeasuredBioAssay->new(featureExtraction => Bio::MAGE::BioAssay::FeatureExtraction->new(),
measuredBioAssayData => [Bio::MAGE::BioAssayData::MeasuredBioAssayData->new()],
channels => [Bio::MAGE::BioAssay::Channel->new()],
bioAssayFactorValues => [Bio::MAGE::Experiment::FactorValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association featureExtraction
my $featureextraction_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureextraction_assn = Bio::MAGE::BioAssay::FeatureExtraction->new();
}
result (UNIVERSAL::isa($measuredbioassay->getFeatureExtraction,q[Bio::MAGE::BioAssay::FeatureExtraction]));
result ($measuredbioassay->setFeatureExtraction($featureextraction_assn) == $featureextraction_assn);
result ($measuredbioassay->getFeatureExtraction() == $featureextraction_assn);



# test the meta-data for the assoication
($assn) = $assns{featureExtraction};
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
# testing association measuredBioAssayData
my $measuredbioassaydata_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassaydata_assn = Bio::MAGE::BioAssayData::MeasuredBioAssayData->new();
}
result (UNIVERSAL::isa($measuredbioassay->getMeasuredBioAssayData->[0],q[Bio::MAGE::BioAssayData::MeasuredBioAssayData]));
result ($measuredbioassay->setMeasuredBioAssayData([$measuredbioassaydata_assn]));
result (UNIVERSAL::isa($measuredbioassay->getMeasuredBioAssayData,'ARRAY')
 and scalar @{$measuredbioassay->getMeasuredBioAssayData()} == 1
 and $measuredbioassay->getMeasuredBioAssayData->[0] == $measuredbioassaydata_assn);
$measuredbioassay->addMeasuredBioAssayData($measuredbioassaydata_assn);
result (UNIVERSAL::isa($measuredbioassay->getMeasuredBioAssayData,'ARRAY')
 and scalar @{$measuredbioassay->getMeasuredBioAssayData()} == 2
 and $measuredbioassay->getMeasuredBioAssayData->[0] == $measuredbioassaydata_assn
 and $measuredbioassay->getMeasuredBioAssayData->[1] == $measuredbioassaydata_assn);


# test the meta-data for the assoication
($assn) = $assns{measuredBioAssayData};
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
result (UNIVERSAL::isa($measuredbioassay->getChannels->[0],q[Bio::MAGE::BioAssay::Channel]));
result ($measuredbioassay->setChannels([$channels_assn]));
result (UNIVERSAL::isa($measuredbioassay->getChannels,'ARRAY')
 and scalar @{$measuredbioassay->getChannels()} == 1
 and $measuredbioassay->getChannels->[0] == $channels_assn);
$measuredbioassay->addChannels($channels_assn);
result (UNIVERSAL::isa($measuredbioassay->getChannels,'ARRAY')
 and scalar @{$measuredbioassay->getChannels()} == 2
 and $measuredbioassay->getChannels->[0] == $channels_assn
 and $measuredbioassay->getChannels->[1] == $channels_assn);


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
result (UNIVERSAL::isa($measuredbioassay->getBioAssayFactorValues->[0],q[Bio::MAGE::Experiment::FactorValue]));
result ($measuredbioassay->setBioAssayFactorValues([$bioassayfactorvalues_assn]));
result (UNIVERSAL::isa($measuredbioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$measuredbioassay->getBioAssayFactorValues()} == 1
 and $measuredbioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn);
$measuredbioassay->addBioAssayFactorValues($bioassayfactorvalues_assn);
result (UNIVERSAL::isa($measuredbioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$measuredbioassay->getBioAssayFactorValues()} == 2
 and $measuredbioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn
 and $measuredbioassay->getBioAssayFactorValues->[1] == $bioassayfactorvalues_assn);


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
result (UNIVERSAL::isa($measuredbioassay->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($measuredbioassay->setSecurity($security_assn) == $security_assn);
result ($measuredbioassay->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($measuredbioassay->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($measuredbioassay->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($measuredbioassay->getAuditTrail,'ARRAY')
 and scalar @{$measuredbioassay->getAuditTrail()} == 1
 and $measuredbioassay->getAuditTrail->[0] == $audittrail_assn);
$measuredbioassay->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($measuredbioassay->getAuditTrail,'ARRAY')
 and scalar @{$measuredbioassay->getAuditTrail()} == 2
 and $measuredbioassay->getAuditTrail->[0] == $audittrail_assn
 and $measuredbioassay->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($measuredbioassay->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($measuredbioassay->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($measuredbioassay->getDescriptions,'ARRAY')
 and scalar @{$measuredbioassay->getDescriptions()} == 1
 and $measuredbioassay->getDescriptions->[0] == $descriptions_assn);
$measuredbioassay->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($measuredbioassay->getDescriptions,'ARRAY')
 and scalar @{$measuredbioassay->getDescriptions()} == 2
 and $measuredbioassay->getDescriptions->[0] == $descriptions_assn
 and $measuredbioassay->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($measuredbioassay->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($measuredbioassay->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($measuredbioassay->getPropertySets,'ARRAY')
 and scalar @{$measuredbioassay->getPropertySets()} == 1
 and $measuredbioassay->getPropertySets->[0] == $propertysets_assn);
$measuredbioassay->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($measuredbioassay->getPropertySets,'ARRAY')
 and scalar @{$measuredbioassay->getPropertySets()} == 2
 and $measuredbioassay->getPropertySets->[0] == $propertysets_assn
 and $measuredbioassay->getPropertySets->[1] == $propertysets_assn);


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
result ($measuredbioassay->isa(q[Bio::MAGE::BioAssay::BioAssay]));

# testing superclass Bio::MAGE::Identifiable
result ($measuredbioassay->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($measuredbioassay->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($measuredbioassay->isa(q[Bio::MAGE::Extendable]));

