# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FactorValue.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..42\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Experiment::FactorValue;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::Measurement::Measurement;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Experiment::ExperimentalFactor;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $factorvalue;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $factorvalue = Bio::MAGE::Experiment::FactorValue->new();
}
result($factorvalue->isa('Bio::MAGE::Experiment::FactorValue'));

# test the package class method
result($factorvalue->package() eq q[Experiment]);

# test the class_name class method
result($factorvalue->class_name() eq q[Bio::MAGE::Experiment::FactorValue]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $factorvalue = Bio::MAGE::Experiment::FactorValue->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($factorvalue->getIdentifier() == 1);
$factorvalue->setIdentifier(1);
result ($factorvalue->getIdentifier() == 1);

# testing attribute name
result ($factorvalue->getName() == 2);
$factorvalue->setName(2);
result ($factorvalue->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Experiment::FactorValue->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $factorvalue = Bio::MAGE::Experiment::FactorValue->new(experimentalFactor => Bio::MAGE::Experiment::ExperimentalFactor->new(),
value => Bio::MAGE::Description::OntologyEntry->new(),
measurement => Bio::MAGE::Measurement::Measurement->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association experimentalFactor
my $experimentalfactor_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentalfactor_assn = Bio::MAGE::Experiment::ExperimentalFactor->new();
}
result (UNIVERSAL::isa($factorvalue->getExperimentalFactor,q[Bio::MAGE::Experiment::ExperimentalFactor]));
result ($factorvalue->setExperimentalFactor($experimentalfactor_assn) == $experimentalfactor_assn);
result ($factorvalue->getExperimentalFactor() == $experimentalfactor_assn);



# test the meta-data for the assoication
($assn) = $assns{experimentalFactor};
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
# testing association value
my $value_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $value_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($factorvalue->getValue,q[Bio::MAGE::Description::OntologyEntry]));
result ($factorvalue->setValue($value_assn) == $value_assn);
result ($factorvalue->getValue() == $value_assn);



# test the meta-data for the assoication
($assn) = $assns{value};
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
# testing association measurement
my $measurement_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measurement_assn = Bio::MAGE::Measurement::Measurement->new();
}
result (UNIVERSAL::isa($factorvalue->getMeasurement,q[Bio::MAGE::Measurement::Measurement]));
result ($factorvalue->setMeasurement($measurement_assn) == $measurement_assn);
result ($factorvalue->getMeasurement() == $measurement_assn);



# test the meta-data for the assoication
($assn) = $assns{measurement};
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
result (UNIVERSAL::isa($factorvalue->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($factorvalue->setSecurity($security_assn) == $security_assn);
result ($factorvalue->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($factorvalue->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($factorvalue->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($factorvalue->getAuditTrail,'ARRAY')
 and scalar @{$factorvalue->getAuditTrail()} == 1
 and $factorvalue->getAuditTrail->[0] == $audittrail_assn);
$factorvalue->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($factorvalue->getAuditTrail,'ARRAY')
 and scalar @{$factorvalue->getAuditTrail()} == 2
 and $factorvalue->getAuditTrail->[0] == $audittrail_assn
 and $factorvalue->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($factorvalue->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($factorvalue->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($factorvalue->getDescriptions,'ARRAY')
 and scalar @{$factorvalue->getDescriptions()} == 1
 and $factorvalue->getDescriptions->[0] == $descriptions_assn);
$factorvalue->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($factorvalue->getDescriptions,'ARRAY')
 and scalar @{$factorvalue->getDescriptions()} == 2
 and $factorvalue->getDescriptions->[0] == $descriptions_assn
 and $factorvalue->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($factorvalue->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($factorvalue->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($factorvalue->getPropertySets,'ARRAY')
 and scalar @{$factorvalue->getPropertySets()} == 1
 and $factorvalue->getPropertySets->[0] == $propertysets_assn);
$factorvalue->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($factorvalue->getPropertySets,'ARRAY')
 and scalar @{$factorvalue->getPropertySets()} == 2
 and $factorvalue->getPropertySets->[0] == $propertysets_assn
 and $factorvalue->getPropertySets->[1] == $propertysets_assn);


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
result ($factorvalue->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($factorvalue->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($factorvalue->isa(q[Bio::MAGE::Extendable]));

