# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Parameter.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..38\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::Parameter;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::Measurement::Measurement;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $parameter;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameter = Bio::MAGE::Protocol::Parameter->new();
}
result($parameter->isa('Bio::MAGE::Protocol::Parameter'));

# test the package class method
result($parameter->package() eq q[Protocol]);

# test the class_name class method
result($parameter->class_name() eq q[Bio::MAGE::Protocol::Parameter]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameter = Bio::MAGE::Protocol::Parameter->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($parameter->getIdentifier() == 1);
$parameter->setIdentifier(1);
result ($parameter->getIdentifier() == 1);

# testing attribute name
result ($parameter->getName() == 2);
$parameter->setName(2);
result ($parameter->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::Parameter->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameter = Bio::MAGE::Protocol::Parameter->new(dataType => Bio::MAGE::Description::OntologyEntry->new(),
defaultValue => Bio::MAGE::Measurement::Measurement->new(),
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
result (UNIVERSAL::isa($parameter->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($parameter->setDataType($datatype_assn) == $datatype_assn);
result ($parameter->getDataType() == $datatype_assn);



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
# testing association defaultValue
my $defaultvalue_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $defaultvalue_assn = Bio::MAGE::Measurement::Measurement->new();
}
result (UNIVERSAL::isa($parameter->getDefaultValue,q[Bio::MAGE::Measurement::Measurement]));
result ($parameter->setDefaultValue($defaultvalue_assn) == $defaultvalue_assn);
result ($parameter->getDefaultValue() == $defaultvalue_assn);



# test the meta-data for the assoication
($assn) = $assns{defaultValue};
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
result (UNIVERSAL::isa($parameter->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($parameter->setSecurity($security_assn) == $security_assn);
result ($parameter->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($parameter->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($parameter->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($parameter->getAuditTrail,'ARRAY')
 and scalar @{$parameter->getAuditTrail()} == 1
 and $parameter->getAuditTrail->[0] == $audittrail_assn);
$parameter->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($parameter->getAuditTrail,'ARRAY')
 and scalar @{$parameter->getAuditTrail()} == 2
 and $parameter->getAuditTrail->[0] == $audittrail_assn
 and $parameter->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($parameter->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($parameter->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($parameter->getDescriptions,'ARRAY')
 and scalar @{$parameter->getDescriptions()} == 1
 and $parameter->getDescriptions->[0] == $descriptions_assn);
$parameter->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($parameter->getDescriptions,'ARRAY')
 and scalar @{$parameter->getDescriptions()} == 2
 and $parameter->getDescriptions->[0] == $descriptions_assn
 and $parameter->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($parameter->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($parameter->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($parameter->getPropertySets,'ARRAY')
 and scalar @{$parameter->getPropertySets()} == 1
 and $parameter->getPropertySets->[0] == $propertysets_assn);
$parameter->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($parameter->getPropertySets,'ARRAY')
 and scalar @{$parameter->getPropertySets()} == 2
 and $parameter->getPropertySets->[0] == $propertysets_assn
 and $parameter->getPropertySets->[1] == $propertysets_assn);


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
result ($parameter->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($parameter->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($parameter->isa(q[Bio::MAGE::Extendable]));

