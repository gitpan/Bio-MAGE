# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Error.t'

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
use Bio::MAGE::QuantitationType::Error;
use Bio::MAGE::QuantitationType::ConfidenceIndicator;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::QuantitationType::QuantitationType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $error;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $error = Bio::MAGE::QuantitationType::Error->new();
}
result($error->isa('Bio::MAGE::QuantitationType::Error'));

# test the package class method
result($error->package() eq q[QuantitationType]);

# test the class_name class method
result($error->class_name() eq q[Bio::MAGE::QuantitationType::Error]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $error = Bio::MAGE::QuantitationType::Error->new(isBackground => 1,
identifier => 2,
name => 3);
}
# testing attribute isBackground
result ($error->getIsBackground() == 1);
$error->setIsBackground(1);
result ($error->getIsBackground() == 1);

# testing attribute identifier
result ($error->getIdentifier() == 2);
$error->setIdentifier(2);
result ($error->getIdentifier() == 2);

# testing attribute name
result ($error->getName() == 3);
$error->setName(3);
result ($error->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::QuantitationType::Error->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $error = Bio::MAGE::QuantitationType::Error->new(targetQuantitationType => Bio::MAGE::QuantitationType::QuantitationType->new(),
channel => Bio::MAGE::BioAssay::Channel->new(),
quantitationTypeMaps => [Bio::MAGE::BioAssayData::QuantitationTypeMap->new()],
dataType => Bio::MAGE::Description::OntologyEntry->new(),
scale => Bio::MAGE::Description::OntologyEntry->new(),
confidenceIndicators => [Bio::MAGE::QuantitationType::ConfidenceIndicator->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association targetQuantitationType
my $targetquantitationtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $targetquantitationtype_assn = Bio::MAGE::QuantitationType::QuantitationType->new();
}
result (UNIVERSAL::isa($error->getTargetQuantitationType,q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($error->setTargetQuantitationType($targetquantitationtype_assn) == $targetquantitationtype_assn);
result ($error->getTargetQuantitationType() == $targetquantitationtype_assn);



# test the meta-data for the assoication
($assn) = $assns{targetQuantitationType};
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
result (UNIVERSAL::isa($error->getChannel,q[Bio::MAGE::BioAssay::Channel]));
result ($error->setChannel($channel_assn) == $channel_assn);
result ($error->getChannel() == $channel_assn);



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
result (UNIVERSAL::isa($error->getQuantitationTypeMaps->[0],q[Bio::MAGE::BioAssayData::QuantitationTypeMap]));
result ($error->setQuantitationTypeMaps([$quantitationtypemaps_assn]));
result (UNIVERSAL::isa($error->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$error->getQuantitationTypeMaps()} == 1
 and $error->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn);
$error->addQuantitationTypeMaps($quantitationtypemaps_assn);
result (UNIVERSAL::isa($error->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$error->getQuantitationTypeMaps()} == 2
 and $error->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn
 and $error->getQuantitationTypeMaps->[1] == $quantitationtypemaps_assn);


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
result (UNIVERSAL::isa($error->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($error->setDataType($datatype_assn) == $datatype_assn);
result ($error->getDataType() == $datatype_assn);



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
result (UNIVERSAL::isa($error->getScale,q[Bio::MAGE::Description::OntologyEntry]));
result ($error->setScale($scale_assn) == $scale_assn);
result ($error->getScale() == $scale_assn);



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
result (UNIVERSAL::isa($error->getConfidenceIndicators->[0],q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));
result ($error->setConfidenceIndicators([$confidenceindicators_assn]));
result (UNIVERSAL::isa($error->getConfidenceIndicators,'ARRAY')
 and scalar @{$error->getConfidenceIndicators()} == 1
 and $error->getConfidenceIndicators->[0] == $confidenceindicators_assn);
$error->addConfidenceIndicators($confidenceindicators_assn);
result (UNIVERSAL::isa($error->getConfidenceIndicators,'ARRAY')
 and scalar @{$error->getConfidenceIndicators()} == 2
 and $error->getConfidenceIndicators->[0] == $confidenceindicators_assn
 and $error->getConfidenceIndicators->[1] == $confidenceindicators_assn);


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
result (UNIVERSAL::isa($error->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($error->setSecurity($security_assn) == $security_assn);
result ($error->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($error->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($error->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($error->getAuditTrail,'ARRAY')
 and scalar @{$error->getAuditTrail()} == 1
 and $error->getAuditTrail->[0] == $audittrail_assn);
$error->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($error->getAuditTrail,'ARRAY')
 and scalar @{$error->getAuditTrail()} == 2
 and $error->getAuditTrail->[0] == $audittrail_assn
 and $error->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($error->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($error->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($error->getDescriptions,'ARRAY')
 and scalar @{$error->getDescriptions()} == 1
 and $error->getDescriptions->[0] == $descriptions_assn);
$error->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($error->getDescriptions,'ARRAY')
 and scalar @{$error->getDescriptions()} == 2
 and $error->getDescriptions->[0] == $descriptions_assn
 and $error->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($error->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($error->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($error->getPropertySets,'ARRAY')
 and scalar @{$error->getPropertySets()} == 1
 and $error->getPropertySets->[0] == $propertysets_assn);
$error->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($error->getPropertySets,'ARRAY')
 and scalar @{$error->getPropertySets()} == 2
 and $error->getPropertySets->[0] == $propertysets_assn
 and $error->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::QuantitationType::ConfidenceIndicator
result ($error->isa(q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));

# testing superclass Bio::MAGE::QuantitationType::StandardQuantitationType
result ($error->isa(q[Bio::MAGE::QuantitationType::StandardQuantitationType]));

# testing superclass Bio::MAGE::QuantitationType::QuantitationType
result ($error->isa(q[Bio::MAGE::QuantitationType::QuantitationType]));

# testing superclass Bio::MAGE::Identifiable
result ($error->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($error->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($error->isa(q[Bio::MAGE::Extendable]));

