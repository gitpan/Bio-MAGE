# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl QuantitationType.t'

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
use Bio::MAGE::QuantitationType::QuantitationType;
use Bio::MAGE::QuantitationType::SpecializedQuantitationType;
use Bio::MAGE::QuantitationType::ConfidenceIndicator;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::QuantitationType::StandardQuantitationType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $quantitationtype;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtype = Bio::MAGE::QuantitationType::QuantitationType->new();
}
result($quantitationtype->isa('Bio::MAGE::QuantitationType::QuantitationType'));

# test the package class method
result($quantitationtype->package() eq q[QuantitationType]);

# test the class_name class method
result($quantitationtype->class_name() eq q[Bio::MAGE::QuantitationType::QuantitationType]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtype = Bio::MAGE::QuantitationType::QuantitationType->new(isBackground => 1,
identifier => 2,
name => 3);
}
# testing attribute isBackground
result ($quantitationtype->getIsBackground() == 1);
$quantitationtype->setIsBackground(1);
result ($quantitationtype->getIsBackground() == 1);

# testing attribute identifier
result ($quantitationtype->getIdentifier() == 2);
$quantitationtype->setIdentifier(2);
result ($quantitationtype->getIdentifier() == 2);

# testing attribute name
result ($quantitationtype->getName() == 3);
$quantitationtype->setName(3);
result ($quantitationtype->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::QuantitationType::QuantitationType->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtype = Bio::MAGE::QuantitationType::QuantitationType->new(dataType => Bio::MAGE::Description::OntologyEntry->new(),
scale => Bio::MAGE::Description::OntologyEntry->new(),
channel => Bio::MAGE::BioAssay::Channel->new(),
confidenceIndicators => [Bio::MAGE::QuantitationType::ConfidenceIndicator->new()],
quantitationTypeMaps => [Bio::MAGE::BioAssayData::QuantitationTypeMap->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association dataType
my $datatype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $datatype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($quantitationtype->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($quantitationtype->setDataType($datatype_assn) == $datatype_assn);
result ($quantitationtype->getDataType() == $datatype_assn);



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
result (UNIVERSAL::isa($quantitationtype->getScale,q[Bio::MAGE::Description::OntologyEntry]));
result ($quantitationtype->setScale($scale_assn) == $scale_assn);
result ($quantitationtype->getScale() == $scale_assn);



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
# testing association channel
my $channel_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channel_assn = Bio::MAGE::BioAssay::Channel->new();
}
result (UNIVERSAL::isa($quantitationtype->getChannel,q[Bio::MAGE::BioAssay::Channel]));
result ($quantitationtype->setChannel($channel_assn) == $channel_assn);
result ($quantitationtype->getChannel() == $channel_assn);



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
# testing association confidenceIndicators
my $confidenceindicators_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $confidenceindicators_assn = Bio::MAGE::QuantitationType::ConfidenceIndicator->new();
}
result (UNIVERSAL::isa($quantitationtype->getConfidenceIndicators->[0],q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));
result ($quantitationtype->setConfidenceIndicators([$confidenceindicators_assn]));
result (UNIVERSAL::isa($quantitationtype->getConfidenceIndicators,'ARRAY')
 and scalar @{$quantitationtype->getConfidenceIndicators()} == 1
 and $quantitationtype->getConfidenceIndicators->[0] == $confidenceindicators_assn);
$quantitationtype->addConfidenceIndicators($confidenceindicators_assn);
result (UNIVERSAL::isa($quantitationtype->getConfidenceIndicators,'ARRAY')
 and scalar @{$quantitationtype->getConfidenceIndicators()} == 2
 and $quantitationtype->getConfidenceIndicators->[0] == $confidenceindicators_assn
 and $quantitationtype->getConfidenceIndicators->[1] == $confidenceindicators_assn);


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
# testing association quantitationTypeMaps
my $quantitationtypemaps_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypemaps_assn = Bio::MAGE::BioAssayData::QuantitationTypeMap->new();
}
result (UNIVERSAL::isa($quantitationtype->getQuantitationTypeMaps->[0],q[Bio::MAGE::BioAssayData::QuantitationTypeMap]));
result ($quantitationtype->setQuantitationTypeMaps([$quantitationtypemaps_assn]));
result (UNIVERSAL::isa($quantitationtype->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$quantitationtype->getQuantitationTypeMaps()} == 1
 and $quantitationtype->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn);
$quantitationtype->addQuantitationTypeMaps($quantitationtypemaps_assn);
result (UNIVERSAL::isa($quantitationtype->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$quantitationtype->getQuantitationTypeMaps()} == 2
 and $quantitationtype->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn
 and $quantitationtype->getQuantitationTypeMaps->[1] == $quantitationtypemaps_assn);


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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($quantitationtype->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($quantitationtype->setSecurity($security_assn) == $security_assn);
result ($quantitationtype->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($quantitationtype->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($quantitationtype->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($quantitationtype->getAuditTrail,'ARRAY')
 and scalar @{$quantitationtype->getAuditTrail()} == 1
 and $quantitationtype->getAuditTrail->[0] == $audittrail_assn);
$quantitationtype->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($quantitationtype->getAuditTrail,'ARRAY')
 and scalar @{$quantitationtype->getAuditTrail()} == 2
 and $quantitationtype->getAuditTrail->[0] == $audittrail_assn
 and $quantitationtype->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($quantitationtype->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($quantitationtype->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($quantitationtype->getDescriptions,'ARRAY')
 and scalar @{$quantitationtype->getDescriptions()} == 1
 and $quantitationtype->getDescriptions->[0] == $descriptions_assn);
$quantitationtype->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($quantitationtype->getDescriptions,'ARRAY')
 and scalar @{$quantitationtype->getDescriptions()} == 2
 and $quantitationtype->getDescriptions->[0] == $descriptions_assn
 and $quantitationtype->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($quantitationtype->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($quantitationtype->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($quantitationtype->getPropertySets,'ARRAY')
 and scalar @{$quantitationtype->getPropertySets()} == 1
 and $quantitationtype->getPropertySets->[0] == $propertysets_assn);
$quantitationtype->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($quantitationtype->getPropertySets,'ARRAY')
 and scalar @{$quantitationtype->getPropertySets()} == 2
 and $quantitationtype->getPropertySets->[0] == $propertysets_assn
 and $quantitationtype->getPropertySets->[1] == $propertysets_assn);


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
  my $specializedquantitationtype = Bio::MAGE::QuantitationType::SpecializedQuantitationType->new();

  # testing subclass SpecializedQuantitationType
  result ($specializedquantitationtype->isa(q[Bio::MAGE::QuantitationType::SpecializedQuantitationType]));

  # create a subclass
  my $standardquantitationtype = Bio::MAGE::QuantitationType::StandardQuantitationType->new();

  # testing subclass StandardQuantitationType
  result ($standardquantitationtype->isa(q[Bio::MAGE::QuantitationType::StandardQuantitationType]));

}
# testing superclass Bio::MAGE::Identifiable
result ($quantitationtype->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($quantitationtype->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($quantitationtype->isa(q[Bio::MAGE::Extendable]));

