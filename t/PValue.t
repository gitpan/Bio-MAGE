# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl PValue.t'

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
use Bio::MAGE::QuantitationType::PValue;
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
my $pvalue;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $pvalue = Bio::MAGE::QuantitationType::PValue->new();
}
result($pvalue->isa('Bio::MAGE::QuantitationType::PValue'));

# test the package class method
result($pvalue->package() eq q[QuantitationType]);

# test the class_name class method
result($pvalue->class_name() eq q[Bio::MAGE::QuantitationType::PValue]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $pvalue = Bio::MAGE::QuantitationType::PValue->new(isBackground => 1,
identifier => 2,
name => 3);
}
# testing attribute isBackground
result ($pvalue->getIsBackground() == 1);
$pvalue->setIsBackground(1);
result ($pvalue->getIsBackground() == 1);

# testing attribute identifier
result ($pvalue->getIdentifier() == 2);
$pvalue->setIdentifier(2);
result ($pvalue->getIdentifier() == 2);

# testing attribute name
result ($pvalue->getName() == 3);
$pvalue->setName(3);
result ($pvalue->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::QuantitationType::PValue->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $pvalue = Bio::MAGE::QuantitationType::PValue->new(targetQuantitationType => Bio::MAGE::QuantitationType::QuantitationType->new(),
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
result (UNIVERSAL::isa($pvalue->getTargetQuantitationType,q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($pvalue->setTargetQuantitationType($targetquantitationtype_assn) == $targetquantitationtype_assn);
result ($pvalue->getTargetQuantitationType() == $targetquantitationtype_assn);



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
result (UNIVERSAL::isa($pvalue->getChannel,q[Bio::MAGE::BioAssay::Channel]));
result ($pvalue->setChannel($channel_assn) == $channel_assn);
result ($pvalue->getChannel() == $channel_assn);



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
result (UNIVERSAL::isa($pvalue->getQuantitationTypeMaps->[0],q[Bio::MAGE::BioAssayData::QuantitationTypeMap]));
result ($pvalue->setQuantitationTypeMaps([$quantitationtypemaps_assn]));
result (UNIVERSAL::isa($pvalue->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$pvalue->getQuantitationTypeMaps()} == 1
 and $pvalue->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn);
$pvalue->addQuantitationTypeMaps($quantitationtypemaps_assn);
result (UNIVERSAL::isa($pvalue->getQuantitationTypeMaps,'ARRAY')
 and scalar @{$pvalue->getQuantitationTypeMaps()} == 2
 and $pvalue->getQuantitationTypeMaps->[0] == $quantitationtypemaps_assn
 and $pvalue->getQuantitationTypeMaps->[1] == $quantitationtypemaps_assn);


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
result (UNIVERSAL::isa($pvalue->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($pvalue->setDataType($datatype_assn) == $datatype_assn);
result ($pvalue->getDataType() == $datatype_assn);



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
result (UNIVERSAL::isa($pvalue->getScale,q[Bio::MAGE::Description::OntologyEntry]));
result ($pvalue->setScale($scale_assn) == $scale_assn);
result ($pvalue->getScale() == $scale_assn);



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
result (UNIVERSAL::isa($pvalue->getConfidenceIndicators->[0],q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));
result ($pvalue->setConfidenceIndicators([$confidenceindicators_assn]));
result (UNIVERSAL::isa($pvalue->getConfidenceIndicators,'ARRAY')
 and scalar @{$pvalue->getConfidenceIndicators()} == 1
 and $pvalue->getConfidenceIndicators->[0] == $confidenceindicators_assn);
$pvalue->addConfidenceIndicators($confidenceindicators_assn);
result (UNIVERSAL::isa($pvalue->getConfidenceIndicators,'ARRAY')
 and scalar @{$pvalue->getConfidenceIndicators()} == 2
 and $pvalue->getConfidenceIndicators->[0] == $confidenceindicators_assn
 and $pvalue->getConfidenceIndicators->[1] == $confidenceindicators_assn);


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
result (UNIVERSAL::isa($pvalue->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($pvalue->setSecurity($security_assn) == $security_assn);
result ($pvalue->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($pvalue->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($pvalue->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($pvalue->getAuditTrail,'ARRAY')
 and scalar @{$pvalue->getAuditTrail()} == 1
 and $pvalue->getAuditTrail->[0] == $audittrail_assn);
$pvalue->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($pvalue->getAuditTrail,'ARRAY')
 and scalar @{$pvalue->getAuditTrail()} == 2
 and $pvalue->getAuditTrail->[0] == $audittrail_assn
 and $pvalue->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($pvalue->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($pvalue->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($pvalue->getDescriptions,'ARRAY')
 and scalar @{$pvalue->getDescriptions()} == 1
 and $pvalue->getDescriptions->[0] == $descriptions_assn);
$pvalue->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($pvalue->getDescriptions,'ARRAY')
 and scalar @{$pvalue->getDescriptions()} == 2
 and $pvalue->getDescriptions->[0] == $descriptions_assn
 and $pvalue->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($pvalue->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($pvalue->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($pvalue->getPropertySets,'ARRAY')
 and scalar @{$pvalue->getPropertySets()} == 1
 and $pvalue->getPropertySets->[0] == $propertysets_assn);
$pvalue->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($pvalue->getPropertySets,'ARRAY')
 and scalar @{$pvalue->getPropertySets()} == 2
 and $pvalue->getPropertySets->[0] == $propertysets_assn
 and $pvalue->getPropertySets->[1] == $propertysets_assn);


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
result ($pvalue->isa(q[Bio::MAGE::QuantitationType::ConfidenceIndicator]));

# testing superclass Bio::MAGE::QuantitationType::StandardQuantitationType
result ($pvalue->isa(q[Bio::MAGE::QuantitationType::StandardQuantitationType]));

# testing superclass Bio::MAGE::QuantitationType::QuantitationType
result ($pvalue->isa(q[Bio::MAGE::QuantitationType::QuantitationType]));

# testing superclass Bio::MAGE::Identifiable
result ($pvalue->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($pvalue->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($pvalue->isa(q[Bio::MAGE::Extendable]));

