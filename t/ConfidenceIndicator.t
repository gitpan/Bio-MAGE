# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ConfidenceIndicator.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..63\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::QuantitationType::ConfidenceIndicator;
use Bio::MAGE::QuantitationType::ConfidenceIndicator;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::QuantitationType::PValue;
use Bio::MAGE::QuantitationType::Error;
use Bio::MAGE::Description::Description;
use Bio::MAGE::QuantitationType::QuantitationType;
use Bio::MAGE::QuantitationType::ExpectedValue;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $confidenceindicator;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $confidenceindicator = Bio::MAGE::QuantitationType::ConfidenceIndicator->new();
}
result($confidenceindicator->isa('Bio::MAGE::QuantitationType::ConfidenceIndicator'));

# test the package class method
result($confidenceindicator->package() eq q[QuantitationType]);

# test the class_name class method
result($confidenceindicator->class_name() eq q[Bio::MAGE::QuantitationType::ConfidenceIndicator]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $confidenceindicator = Bio::MAGE::QuantitationType::ConfidenceIndicator->new(isBackground => 1,
identifier => 2,
name => 3);
}
# testing attribute isBackground
result ($confidenceindicator->getIsBackground() == 1);
$confidenceindicator->setIsBackground(1);
result ($confidenceindicator->getIsBackground() == 1);

# testing attribute identifier
result ($confidenceindicator->getIdentifier() == 2);
$confidenceindicator->setIdentifier(2);
result ($confidenceindicator->getIdentifier() == 2);

# testing attribute name
result ($confidenceindicator->getName() == 3);
$confidenceindicator->setName(3);
result ($confidenceindicator->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::QuantitationType::ConfidenceIndicator->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $confidenceindicator = Bio::MAGE::QuantitationType::ConfidenceIndicator->new(targetQuantitationType => Bio::MAGE::QuantitationType::QuantitationType->new(),
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
result (UNIVERSAL::isa($confidenceindicator->getTargetQuantitationType,q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($confidenceindicator->setTargetQuantitationType($targetquantitationtype_assn) == $targetquantitationtype_assn);
result ($confidenceindicator->getTargetQuantitationType() == $targetquantitationtype_assn);



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
result (UNIVERSAL::isa($confidenceindicator->getChannel,q[Bio::MAGE::BioAssay::Channel]));
result ($confidenceindicator->setChannel($channel_assn) == $channel_assn);
result ($confidenceindicator->getChannel() == $channel_assn);



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
result (UNIVERSAL::isa($confidenceindicator->getQuantitationTypeMaps->[0],q[Bio::MAGE::BioAssayData::QuantitationTypeMap]));
result ($confidenceindicator->setQuantitationTypeMaps([$quantitationtypemaps_assn]));
result (UNIVERSAL::isa($confidenceindicator->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$confidenceindicator->getQuantitationTypeMaps()} == 1
 and $confidenceindicator->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn);
$confidenceindicator->addQuantitationTypeMaps($quantitationtypemaps_assn);
result (UNIVERSAL::isa($confidenceindicator->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$confidenceindicator->getQuantitationTypeMaps()} == 2
 and $confidenceindicator->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn
 and $confidenceindicator->getQuantitationTypeMaps->[1] == $quantitationtypemaps_assn);


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
result (UNIVERSAL::isa($confidenceindicator->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($confidenceindicator->setDataType($datatype_assn) == $datatype_assn);
result ($confidenceindicator->getDataType() == $datatype_assn);



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
result (UNIVERSAL::isa($confidenceindicator->getScale,q[Bio::MAGE::Description::OntologyEntry]));
result ($confidenceindicator->setScale($scale_assn) == $scale_assn);
result ($confidenceindicator->getScale() == $scale_assn);



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
result (UNIVERSAL::isa($confidenceindicator->getConfidenceIndicators->[0],q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));
result ($confidenceindicator->setConfidenceIndicators([$confidenceindicators_assn]));
result (UNIVERSAL::isa($confidenceindicator->getConfidenceIndicators,'ARRAY')
 and scalar @{$confidenceindicator->getConfidenceIndicators()} == 1
 and $confidenceindicator->getConfidenceIndicators->[0] == $confidenceindicators_assn);
$confidenceindicator->addConfidenceIndicators($confidenceindicators_assn);
result (UNIVERSAL::isa($confidenceindicator->getConfidenceIndicators,'ARRAY')
 and scalar @{$confidenceindicator->getConfidenceIndicators()} == 2
 and $confidenceindicator->getConfidenceIndicators->[0] == $confidenceindicators_assn
 and $confidenceindicator->getConfidenceIndicators->[1] == $confidenceindicators_assn);


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
result (UNIVERSAL::isa($confidenceindicator->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($confidenceindicator->setSecurity($security_assn) == $security_assn);
result ($confidenceindicator->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($confidenceindicator->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($confidenceindicator->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($confidenceindicator->getAuditTrail,'ARRAY')
 and scalar @{$confidenceindicator->getAuditTrail()} == 1
 and $confidenceindicator->getAuditTrail->[0] == $audittrail_assn);
$confidenceindicator->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($confidenceindicator->getAuditTrail,'ARRAY')
 and scalar @{$confidenceindicator->getAuditTrail()} == 2
 and $confidenceindicator->getAuditTrail->[0] == $audittrail_assn
 and $confidenceindicator->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($confidenceindicator->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($confidenceindicator->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($confidenceindicator->getDescriptions,'ARRAY')
 and scalar @{$confidenceindicator->getDescriptions()} == 1
 and $confidenceindicator->getDescriptions->[0] == $descriptions_assn);
$confidenceindicator->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($confidenceindicator->getDescriptions,'ARRAY')
 and scalar @{$confidenceindicator->getDescriptions()} == 2
 and $confidenceindicator->getDescriptions->[0] == $descriptions_assn
 and $confidenceindicator->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($confidenceindicator->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($confidenceindicator->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($confidenceindicator->getPropertySets,'ARRAY')
 and scalar @{$confidenceindicator->getPropertySets()} == 1
 and $confidenceindicator->getPropertySets->[0] == $propertysets_assn);
$confidenceindicator->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($confidenceindicator->getPropertySets,'ARRAY')
 and scalar @{$confidenceindicator->getPropertySets()} == 2
 and $confidenceindicator->getPropertySets->[0] == $propertysets_assn
 and $confidenceindicator->getPropertySets->[1] == $propertysets_assn);


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
  my $expectedvalue = Bio::MAGE::QuantitationType::ExpectedValue->new();

  # testing subclass ExpectedValue
  result ($expectedvalue->isa(q[Bio::MAGE::QuantitationType::ExpectedValue]));

  # create a subclass
  my $pvalue = Bio::MAGE::QuantitationType::PValue->new();

  # testing subclass PValue
  result ($pvalue->isa(q[Bio::MAGE::QuantitationType::PValue]));

  # create a subclass
  my $error = Bio::MAGE::QuantitationType::Error->new();

  # testing subclass Error
  result ($error->isa(q[Bio::MAGE::QuantitationType::Error]));

}
# testing superclass Bio::MAGE::QuantitationType::StandardQuantitationType
result ($confidenceindicator->isa(q[Bio::MAGE::QuantitationType::StandardQuantitationType]));

# testing superclass Bio::MAGE::QuantitationType::QuantitationType
result ($confidenceindicator->isa(q[Bio::MAGE::QuantitationType::QuantitationType]));

# testing superclass Bio::MAGE::Identifiable
result ($confidenceindicator->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($confidenceindicator->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($confidenceindicator->isa(q[Bio::MAGE::Extendable]));

