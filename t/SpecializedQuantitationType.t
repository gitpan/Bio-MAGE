# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SpecializedQuantitationType.t'

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
use Bio::MAGE::QuantitationType::SpecializedQuantitationType;
use Bio::MAGE::QuantitationType::ConfidenceIndicator;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $specializedquantitationtype;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $specializedquantitationtype = Bio::MAGE::QuantitationType::SpecializedQuantitationType->new();
}
result($specializedquantitationtype->isa('Bio::MAGE::QuantitationType::SpecializedQuantitationType'));

# test the package class method
result($specializedquantitationtype->package() eq q[QuantitationType]);

# test the class_name class method
result($specializedquantitationtype->class_name() eq q[Bio::MAGE::QuantitationType::SpecializedQuantitationType]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $specializedquantitationtype = Bio::MAGE::QuantitationType::SpecializedQuantitationType->new(isBackground => 1,
identifier => 2,
name => 3);
}
# testing attribute isBackground
result ($specializedquantitationtype->getIsBackground() == 1);
$specializedquantitationtype->setIsBackground(1);
result ($specializedquantitationtype->getIsBackground() == 1);

# testing attribute identifier
result ($specializedquantitationtype->getIdentifier() == 2);
$specializedquantitationtype->setIdentifier(2);
result ($specializedquantitationtype->getIdentifier() == 2);

# testing attribute name
result ($specializedquantitationtype->getName() == 3);
$specializedquantitationtype->setName(3);
result ($specializedquantitationtype->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::QuantitationType::SpecializedQuantitationType->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $specializedquantitationtype = Bio::MAGE::QuantitationType::SpecializedQuantitationType->new(channel => Bio::MAGE::BioAssay::Channel->new(),
quantitationTypeMaps => [Bio::MAGE::BioAssayData::QuantitationTypeMap->new()],
dataType => Bio::MAGE::Description::OntologyEntry->new(),
scale => Bio::MAGE::Description::OntologyEntry->new(),
confidenceIndicators => [Bio::MAGE::QuantitationType::ConfidenceIndicator->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association channel
my $channel_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channel_assn = Bio::MAGE::BioAssay::Channel->new();
}
result (UNIVERSAL::isa($specializedquantitationtype->getChannel,q[Bio::MAGE::BioAssay::Channel]));
result ($specializedquantitationtype->setChannel($channel_assn) == $channel_assn);
result ($specializedquantitationtype->getChannel() == $channel_assn);



# test the meta-data for the assoication
($assn) = $assns{channel};
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
# testing association quantitationTypeMaps
my $quantitationtypemaps_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypemaps_assn = Bio::MAGE::BioAssayData::QuantitationTypeMap->new();
}
result (UNIVERSAL::isa($specializedquantitationtype->getQuantitationTypeMaps->[0],q[Bio::MAGE::BioAssayData::QuantitationTypeMap]));
result ($specializedquantitationtype->setQuantitationTypeMaps([$quantitationtypemaps_assn]));
result (UNIVERSAL::isa($specializedquantitationtype->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$specializedquantitationtype->getQuantitationTypeMaps()} == 1
 and $specializedquantitationtype->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn);
$specializedquantitationtype->addQuantitationTypeMaps($quantitationtypemaps_assn);
result (UNIVERSAL::isa($specializedquantitationtype->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$specializedquantitationtype->getQuantitationTypeMaps()} == 2
 and $specializedquantitationtype->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn
 and $specializedquantitationtype->getQuantitationTypeMaps->[1] == $quantitationtypemaps_assn);


# test the meta-data for the assoication
($assn) = $assns{quantitationTypeMaps};
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
# testing association dataType
my $datatype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $datatype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($specializedquantitationtype->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($specializedquantitationtype->setDataType($datatype_assn) == $datatype_assn);
result ($specializedquantitationtype->getDataType() == $datatype_assn);



# test the meta-data for the assoication
($assn) = $assns{dataType};
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
# testing association scale
my $scale_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $scale_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($specializedquantitationtype->getScale,q[Bio::MAGE::Description::OntologyEntry]));
result ($specializedquantitationtype->setScale($scale_assn) == $scale_assn);
result ($specializedquantitationtype->getScale() == $scale_assn);



# test the meta-data for the assoication
($assn) = $assns{scale};
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
# testing association confidenceIndicators
my $confidenceindicators_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $confidenceindicators_assn = Bio::MAGE::QuantitationType::ConfidenceIndicator->new();
}
result (UNIVERSAL::isa($specializedquantitationtype->getConfidenceIndicators->[0],q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));
result ($specializedquantitationtype->setConfidenceIndicators([$confidenceindicators_assn]));
result (UNIVERSAL::isa($specializedquantitationtype->getConfidenceIndicators,'ARRAY')
 and scalar @{$specializedquantitationtype->getConfidenceIndicators()} == 1
 and $specializedquantitationtype->getConfidenceIndicators->[0] == $confidenceindicators_assn);
$specializedquantitationtype->addConfidenceIndicators($confidenceindicators_assn);
result (UNIVERSAL::isa($specializedquantitationtype->getConfidenceIndicators,'ARRAY')
 and scalar @{$specializedquantitationtype->getConfidenceIndicators()} == 2
 and $specializedquantitationtype->getConfidenceIndicators->[0] == $confidenceindicators_assn
 and $specializedquantitationtype->getConfidenceIndicators->[1] == $confidenceindicators_assn);


# test the meta-data for the assoication
($assn) = $assns{confidenceIndicators};
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
result (UNIVERSAL::isa($specializedquantitationtype->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($specializedquantitationtype->setSecurity($security_assn) == $security_assn);
result ($specializedquantitationtype->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($specializedquantitationtype->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($specializedquantitationtype->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($specializedquantitationtype->getAuditTrail,'ARRAY')
 and scalar @{$specializedquantitationtype->getAuditTrail()} == 1
 and $specializedquantitationtype->getAuditTrail->[0] == $audittrail_assn);
$specializedquantitationtype->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($specializedquantitationtype->getAuditTrail,'ARRAY')
 and scalar @{$specializedquantitationtype->getAuditTrail()} == 2
 and $specializedquantitationtype->getAuditTrail->[0] == $audittrail_assn
 and $specializedquantitationtype->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($specializedquantitationtype->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($specializedquantitationtype->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($specializedquantitationtype->getDescriptions,'ARRAY')
 and scalar @{$specializedquantitationtype->getDescriptions()} == 1
 and $specializedquantitationtype->getDescriptions->[0] == $descriptions_assn);
$specializedquantitationtype->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($specializedquantitationtype->getDescriptions,'ARRAY')
 and scalar @{$specializedquantitationtype->getDescriptions()} == 2
 and $specializedquantitationtype->getDescriptions->[0] == $descriptions_assn
 and $specializedquantitationtype->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($specializedquantitationtype->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($specializedquantitationtype->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($specializedquantitationtype->getPropertySets,'ARRAY')
 and scalar @{$specializedquantitationtype->getPropertySets()} == 1
 and $specializedquantitationtype->getPropertySets->[0] == $propertysets_assn);
$specializedquantitationtype->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($specializedquantitationtype->getPropertySets,'ARRAY')
 and scalar @{$specializedquantitationtype->getPropertySets()} == 2
 and $specializedquantitationtype->getPropertySets->[0] == $propertysets_assn
 and $specializedquantitationtype->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::QuantitationType::QuantitationType
result ($specializedquantitationtype->isa(q[Bio::MAGE::QuantitationType::QuantitationType]));

# testing superclass Bio::MAGE::Identifiable
result ($specializedquantitationtype->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($specializedquantitationtype->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($specializedquantitationtype->isa(q[Bio::MAGE::Extendable]));

