# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Array.t'

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
use Bio::MAGE::Array::Array;
use Bio::MAGE::Array::ArrayManufactureDeviation;
use Bio::MAGE::ArrayDesign::ArrayDesign;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Array::ArrayManufacture;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Array::ArrayGroup;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $array;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $array = Bio::MAGE::Array::Array->new();
}
result($array->isa('Bio::MAGE::Array::Array'));

# test the package class method
result($array->package() eq q[Array]);

# test the class_name class method
result($array->class_name() eq q[Bio::MAGE::Array::Array]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $array = Bio::MAGE::Array::Array->new(arrayXOrigin => 1,
arrayYOrigin => 2,
arrayIdentifier => 3,
originRelativeTo => 4,
identifier => 5,
name => 6);
}
# testing attribute arrayXOrigin
result ($array->getArrayXOrigin() == 1);
$array->setArrayXOrigin(1);
result ($array->getArrayXOrigin() == 1);

# testing attribute arrayYOrigin
result ($array->getArrayYOrigin() == 2);
$array->setArrayYOrigin(2);
result ($array->getArrayYOrigin() == 2);

# testing attribute arrayIdentifier
result ($array->getArrayIdentifier() == 3);
$array->setArrayIdentifier(3);
result ($array->getArrayIdentifier() == 3);

# testing attribute originRelativeTo
result ($array->getOriginRelativeTo() == 4);
$array->setOriginRelativeTo(4);
result ($array->getOriginRelativeTo() == 4);

# testing attribute identifier
result ($array->getIdentifier() == 5);
$array->setIdentifier(5);
result ($array->getIdentifier() == 5);

# testing attribute name
result ($array->getName() == 6);
$array->setName(6);
result ($array->getName() == 6);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::Array->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $array = Bio::MAGE::Array::Array->new(arrayGroup => Bio::MAGE::Array::ArrayGroup->new(),
arrayDesign => Bio::MAGE::ArrayDesign::ArrayDesign->new(),
information => Bio::MAGE::Array::ArrayManufacture->new(),
arrayManufactureDeviations => [Bio::MAGE::Array::ArrayManufactureDeviation->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association arrayGroup
my $arraygroup_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraygroup_assn = Bio::MAGE::Array::ArrayGroup->new();
}
result (UNIVERSAL::isa($array->getArrayGroup,q[Bio::MAGE::Array::ArrayGroup]));
result ($array->setArrayGroup($arraygroup_assn) == $arraygroup_assn);
result ($array->getArrayGroup() == $arraygroup_assn);



# test the meta-data for the assoication
($assn) = $assns{arrayGroup};
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
# testing association arrayDesign
my $arraydesign_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraydesign_assn = Bio::MAGE::ArrayDesign::ArrayDesign->new();
}
result (UNIVERSAL::isa($array->getArrayDesign,q[Bio::MAGE::ArrayDesign::ArrayDesign]));
result ($array->setArrayDesign($arraydesign_assn) == $arraydesign_assn);
result ($array->getArrayDesign() == $arraydesign_assn);



# test the meta-data for the assoication
($assn) = $assns{arrayDesign};
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
# testing association information
my $information_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $information_assn = Bio::MAGE::Array::ArrayManufacture->new();
}
result (UNIVERSAL::isa($array->getInformation,q[Bio::MAGE::Array::ArrayManufacture]));
result ($array->setInformation($information_assn) == $information_assn);
result ($array->getInformation() == $information_assn);



# test the meta-data for the assoication
($assn) = $assns{information};
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
# testing association arrayManufactureDeviations
my $arraymanufacturedeviations_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraymanufacturedeviations_assn = Bio::MAGE::Array::ArrayManufactureDeviation->new();
}
result (UNIVERSAL::isa($array->getArrayManufactureDeviations->[0],q[Bio::MAGE::Array::ArrayManufactureDeviation]));
result ($array->setArrayManufactureDeviations([$arraymanufacturedeviations_assn]));
result (UNIVERSAL::isa($array->getArrayManufactureDeviations,'ARRAY')
 and scalar @{$array->getArrayManufactureDeviations()} == 1
 and $array->getArrayManufactureDeviations->[0] == $arraymanufacturedeviations_assn);
$array->addArrayManufactureDeviations($arraymanufacturedeviations_assn);
result (UNIVERSAL::isa($array->getArrayManufactureDeviations,'ARRAY')
 and scalar @{$array->getArrayManufactureDeviations()} == 2
 and $array->getArrayManufactureDeviations->[0] == $arraymanufacturedeviations_assn
 and $array->getArrayManufactureDeviations->[1] == $arraymanufacturedeviations_assn);


# test the meta-data for the assoication
($assn) = $assns{arrayManufactureDeviations};
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
result (UNIVERSAL::isa($array->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($array->setSecurity($security_assn) == $security_assn);
result ($array->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($array->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($array->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($array->getAuditTrail,'ARRAY')
 and scalar @{$array->getAuditTrail()} == 1
 and $array->getAuditTrail->[0] == $audittrail_assn);
$array->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($array->getAuditTrail,'ARRAY')
 and scalar @{$array->getAuditTrail()} == 2
 and $array->getAuditTrail->[0] == $audittrail_assn
 and $array->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($array->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($array->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($array->getDescriptions,'ARRAY')
 and scalar @{$array->getDescriptions()} == 1
 and $array->getDescriptions->[0] == $descriptions_assn);
$array->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($array->getDescriptions,'ARRAY')
 and scalar @{$array->getDescriptions()} == 2
 and $array->getDescriptions->[0] == $descriptions_assn
 and $array->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($array->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($array->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($array->getPropertySets,'ARRAY')
 and scalar @{$array->getPropertySets()} == 1
 and $array->getPropertySets->[0] == $propertysets_assn);
$array->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($array->getPropertySets,'ARRAY')
 and scalar @{$array->getPropertySets()} == 2
 and $array->getPropertySets->[0] == $propertysets_assn
 and $array->getPropertySets->[1] == $propertysets_assn);


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
result ($array->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($array->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($array->isa(q[Bio::MAGE::Extendable]));

