# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl QuantitationTypeDimension.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..35\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::QuantitationTypeDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::QuantitationType::QuantitationType;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $quantitationtypedimension;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypedimension = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new();
}
result($quantitationtypedimension->isa('Bio::MAGE::BioAssayData::QuantitationTypeDimension'));

# test the package class method
result($quantitationtypedimension->package() eq q[BioAssayData]);

# test the class_name class method
result($quantitationtypedimension->class_name() eq q[Bio::MAGE::BioAssayData::QuantitationTypeDimension]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypedimension = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($quantitationtypedimension->getIdentifier() == 1);
$quantitationtypedimension->setIdentifier(1);
result ($quantitationtypedimension->getIdentifier() == 1);

# testing attribute name
result ($quantitationtypedimension->getName() == 2);
$quantitationtypedimension->setName(2);
result ($quantitationtypedimension->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::QuantitationTypeDimension->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypedimension = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new(quantitationTypes => [Bio::MAGE::QuantitationType::QuantitationType->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association quantitationTypes
my $quantitationtypes_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypes_assn = Bio::MAGE::QuantitationType::QuantitationType->new();
}
result (UNIVERSAL::isa($quantitationtypedimension->getQuantitationTypes->[0],q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($quantitationtypedimension->setQuantitationTypes([$quantitationtypes_assn]));
result (UNIVERSAL::isa($quantitationtypedimension->getQuantitationTypes,'ARRAY')
 and scalar @{$quantitationtypedimension->getQuantitationTypes()} == 1
 and $quantitationtypedimension->getQuantitationTypes->[0] == $quantitationtypes_assn);
$quantitationtypedimension->addQuantitationTypes($quantitationtypes_assn);
result (UNIVERSAL::isa($quantitationtypedimension->getQuantitationTypes,'ARRAY')
 and scalar @{$quantitationtypedimension->getQuantitationTypes()} == 2
 and $quantitationtypedimension->getQuantitationTypes->[0] == $quantitationtypes_assn
 and $quantitationtypedimension->getQuantitationTypes->[1] == $quantitationtypes_assn);


# test the meta-data for the assoication
($assn) = $assns{quantitationTypes};
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
result (UNIVERSAL::isa($quantitationtypedimension->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($quantitationtypedimension->setSecurity($security_assn) == $security_assn);
result ($quantitationtypedimension->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($quantitationtypedimension->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($quantitationtypedimension->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($quantitationtypedimension->getAuditTrail,'ARRAY')
 and scalar @{$quantitationtypedimension->getAuditTrail()} == 1
 and $quantitationtypedimension->getAuditTrail->[0] == $audittrail_assn);
$quantitationtypedimension->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($quantitationtypedimension->getAuditTrail,'ARRAY')
 and scalar @{$quantitationtypedimension->getAuditTrail()} == 2
 and $quantitationtypedimension->getAuditTrail->[0] == $audittrail_assn
 and $quantitationtypedimension->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($quantitationtypedimension->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($quantitationtypedimension->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($quantitationtypedimension->getDescriptions,'ARRAY')
 and scalar @{$quantitationtypedimension->getDescriptions()} == 1
 and $quantitationtypedimension->getDescriptions->[0] == $descriptions_assn);
$quantitationtypedimension->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($quantitationtypedimension->getDescriptions,'ARRAY')
 and scalar @{$quantitationtypedimension->getDescriptions()} == 2
 and $quantitationtypedimension->getDescriptions->[0] == $descriptions_assn
 and $quantitationtypedimension->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($quantitationtypedimension->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($quantitationtypedimension->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($quantitationtypedimension->getPropertySets,'ARRAY')
 and scalar @{$quantitationtypedimension->getPropertySets()} == 1
 and $quantitationtypedimension->getPropertySets->[0] == $propertysets_assn);
$quantitationtypedimension->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($quantitationtypedimension->getPropertySets,'ARRAY')
 and scalar @{$quantitationtypedimension->getPropertySets()} == 2
 and $quantitationtypedimension->getPropertySets->[0] == $propertysets_assn
 and $quantitationtypedimension->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Identifiable
result ($quantitationtypedimension->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($quantitationtypedimension->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($quantitationtypedimension->isa(q[Bio::MAGE::Extendable]));

