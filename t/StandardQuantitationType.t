# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl StandardQuantitationType.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..61\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::QuantitationType::StandardQuantitationType;
use Bio::MAGE::QuantitationType::PresentAbsent;
use Bio::MAGE::QuantitationType::ConfidenceIndicator;
use Bio::MAGE::QuantitationType::Failed;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::QuantitationType::MeasuredSignal;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::QuantitationType::DerivedSignal;
use Bio::MAGE::QuantitationType::Ratio;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $standardquantitationtype;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $standardquantitationtype = Bio::MAGE::QuantitationType::StandardQuantitationType->new();
}
result($standardquantitationtype->isa('Bio::MAGE::QuantitationType::StandardQuantitationType'));

# test the package class method
result($standardquantitationtype->package() eq q[QuantitationType]);

# test the class_name class method
result($standardquantitationtype->class_name() eq q[Bio::MAGE::QuantitationType::StandardQuantitationType]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $standardquantitationtype = Bio::MAGE::QuantitationType::StandardQuantitationType->new(isBackground => 1,
identifier => 2,
name => 3);
}
# testing attribute isBackground
result ($standardquantitationtype->getIsBackground() == 1);
$standardquantitationtype->setIsBackground(1);
result ($standardquantitationtype->getIsBackground() == 1);

# testing attribute identifier
result ($standardquantitationtype->getIdentifier() == 2);
$standardquantitationtype->setIdentifier(2);
result ($standardquantitationtype->getIdentifier() == 2);

# testing attribute name
result ($standardquantitationtype->getName() == 3);
$standardquantitationtype->setName(3);
result ($standardquantitationtype->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::QuantitationType::StandardQuantitationType->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $standardquantitationtype = Bio::MAGE::QuantitationType::StandardQuantitationType->new(channel => Bio::MAGE::BioAssay::Channel->new(),
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
result (UNIVERSAL::isa($standardquantitationtype->getChannel,q[Bio::MAGE::BioAssay::Channel]));
result ($standardquantitationtype->setChannel($channel_assn) == $channel_assn);
result ($standardquantitationtype->getChannel() == $channel_assn);



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
result (UNIVERSAL::isa($standardquantitationtype->getQuantitationTypeMaps->[0],q[Bio::MAGE::BioAssayData::QuantitationTypeMap]));
result ($standardquantitationtype->setQuantitationTypeMaps([$quantitationtypemaps_assn]));
result (UNIVERSAL::isa($standardquantitationtype->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$standardquantitationtype->getQuantitationTypeMaps()} == 1
 and $standardquantitationtype->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn);
$standardquantitationtype->addQuantitationTypeMaps($quantitationtypemaps_assn);
result (UNIVERSAL::isa($standardquantitationtype->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$standardquantitationtype->getQuantitationTypeMaps()} == 2
 and $standardquantitationtype->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn
 and $standardquantitationtype->getQuantitationTypeMaps->[1] == $quantitationtypemaps_assn);


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
result (UNIVERSAL::isa($standardquantitationtype->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($standardquantitationtype->setDataType($datatype_assn) == $datatype_assn);
result ($standardquantitationtype->getDataType() == $datatype_assn);



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
result (UNIVERSAL::isa($standardquantitationtype->getScale,q[Bio::MAGE::Description::OntologyEntry]));
result ($standardquantitationtype->setScale($scale_assn) == $scale_assn);
result ($standardquantitationtype->getScale() == $scale_assn);



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
result (UNIVERSAL::isa($standardquantitationtype->getConfidenceIndicators->[0],q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));
result ($standardquantitationtype->setConfidenceIndicators([$confidenceindicators_assn]));
result (UNIVERSAL::isa($standardquantitationtype->getConfidenceIndicators,'ARRAY')
 and scalar @{$standardquantitationtype->getConfidenceIndicators()} == 1
 and $standardquantitationtype->getConfidenceIndicators->[0] == $confidenceindicators_assn);
$standardquantitationtype->addConfidenceIndicators($confidenceindicators_assn);
result (UNIVERSAL::isa($standardquantitationtype->getConfidenceIndicators,'ARRAY')
 and scalar @{$standardquantitationtype->getConfidenceIndicators()} == 2
 and $standardquantitationtype->getConfidenceIndicators->[0] == $confidenceindicators_assn
 and $standardquantitationtype->getConfidenceIndicators->[1] == $confidenceindicators_assn);


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
result (UNIVERSAL::isa($standardquantitationtype->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($standardquantitationtype->setSecurity($security_assn) == $security_assn);
result ($standardquantitationtype->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($standardquantitationtype->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($standardquantitationtype->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($standardquantitationtype->getAuditTrail,'ARRAY')
 and scalar @{$standardquantitationtype->getAuditTrail()} == 1
 and $standardquantitationtype->getAuditTrail->[0] == $audittrail_assn);
$standardquantitationtype->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($standardquantitationtype->getAuditTrail,'ARRAY')
 and scalar @{$standardquantitationtype->getAuditTrail()} == 2
 and $standardquantitationtype->getAuditTrail->[0] == $audittrail_assn
 and $standardquantitationtype->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($standardquantitationtype->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($standardquantitationtype->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($standardquantitationtype->getDescriptions,'ARRAY')
 and scalar @{$standardquantitationtype->getDescriptions()} == 1
 and $standardquantitationtype->getDescriptions->[0] == $descriptions_assn);
$standardquantitationtype->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($standardquantitationtype->getDescriptions,'ARRAY')
 and scalar @{$standardquantitationtype->getDescriptions()} == 2
 and $standardquantitationtype->getDescriptions->[0] == $descriptions_assn
 and $standardquantitationtype->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($standardquantitationtype->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($standardquantitationtype->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($standardquantitationtype->getPropertySets,'ARRAY')
 and scalar @{$standardquantitationtype->getPropertySets()} == 1
 and $standardquantitationtype->getPropertySets->[0] == $propertysets_assn);
$standardquantitationtype->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($standardquantitationtype->getPropertySets,'ARRAY')
 and scalar @{$standardquantitationtype->getPropertySets()} == 2
 and $standardquantitationtype->getPropertySets->[0] == $propertysets_assn
 and $standardquantitationtype->getPropertySets->[1] == $propertysets_assn);


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
  my $failed = Bio::MAGE::QuantitationType::Failed->new();

  # testing subclass Failed
  result ($failed->isa(q[Bio::MAGE::QuantitationType::Failed]));

  # create a subclass
  my $measuredsignal = Bio::MAGE::QuantitationType::MeasuredSignal->new();

  # testing subclass MeasuredSignal
  result ($measuredsignal->isa(q[Bio::MAGE::QuantitationType::MeasuredSignal]));

  # create a subclass
  my $ratio = Bio::MAGE::QuantitationType::Ratio->new();

  # testing subclass Ratio
  result ($ratio->isa(q[Bio::MAGE::QuantitationType::Ratio]));

  # create a subclass
  my $presentabsent = Bio::MAGE::QuantitationType::PresentAbsent->new();

  # testing subclass PresentAbsent
  result ($presentabsent->isa(q[Bio::MAGE::QuantitationType::PresentAbsent]));

  # create a subclass
  my $derivedsignal = Bio::MAGE::QuantitationType::DerivedSignal->new();

  # testing subclass DerivedSignal
  result ($derivedsignal->isa(q[Bio::MAGE::QuantitationType::DerivedSignal]));

  # create a subclass
  my $confidenceindicator = Bio::MAGE::QuantitationType::ConfidenceIndicator->new();

  # testing subclass ConfidenceIndicator
  result ($confidenceindicator->isa(q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));

}
# testing superclass Bio::MAGE::QuantitationType::QuantitationType
result ($standardquantitationtype->isa(q[Bio::MAGE::QuantitationType::QuantitationType]));

# testing superclass Bio::MAGE::Identifiable
result ($standardquantitationtype->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($standardquantitationtype->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($standardquantitationtype->isa(q[Bio::MAGE::Extendable]));

