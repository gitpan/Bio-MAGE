# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ArrayGroup.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..64\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Array::ArrayGroup;
use Bio::MAGE::Array::Array;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Array::Fiducial;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $arraygroup;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraygroup = Bio::MAGE::Array::ArrayGroup->new();
}
result($arraygroup->isa('Bio::MAGE::Array::ArrayGroup'));

# test the package class method
result($arraygroup->package() eq q[Array]);

# test the class_name class method
result($arraygroup->class_name() eq q[Bio::MAGE::Array::ArrayGroup]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraygroup = Bio::MAGE::Array::ArrayGroup->new(width => 1,
numArrays => 2,
arraySpacingY => 3,
length => 4,
orientationMarkPosition => 5,
arraySpacingX => 6,
barcode => 7,
orientationMark => 8,
identifier => 9,
name => 10);
}
# testing attribute width
result ($arraygroup->getWidth() == 1);
$arraygroup->setWidth(1);
result ($arraygroup->getWidth() == 1);

# testing attribute numArrays
result ($arraygroup->getNumArrays() == 2);
$arraygroup->setNumArrays(2);
result ($arraygroup->getNumArrays() == 2);

# testing attribute arraySpacingY
result ($arraygroup->getArraySpacingY() == 3);
$arraygroup->setArraySpacingY(3);
result ($arraygroup->getArraySpacingY() == 3);

# testing attribute length
result ($arraygroup->getLength() == 4);
$arraygroup->setLength(4);
result ($arraygroup->getLength() == 4);

# testing attribute orientationMarkPosition
result ($arraygroup->getOrientationMarkPosition() == 5);
$arraygroup->setOrientationMarkPosition(5);
result ($arraygroup->getOrientationMarkPosition() == 5);

# testing attribute arraySpacingX
result ($arraygroup->getArraySpacingX() == 6);
$arraygroup->setArraySpacingX(6);
result ($arraygroup->getArraySpacingX() == 6);

# testing attribute barcode
result ($arraygroup->getBarcode() == 7);
$arraygroup->setBarcode(7);
result ($arraygroup->getBarcode() == 7);

# testing attribute orientationMark
result ($arraygroup->getOrientationMark() == 8);
$arraygroup->setOrientationMark(8);
result ($arraygroup->getOrientationMark() == 8);

# testing attribute identifier
result ($arraygroup->getIdentifier() == 9);
$arraygroup->setIdentifier(9);
result ($arraygroup->getIdentifier() == 9);

# testing attribute name
result ($arraygroup->getName() == 10);
$arraygroup->setName(10);
result ($arraygroup->getName() == 10);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::ArrayGroup->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraygroup = Bio::MAGE::Array::ArrayGroup->new(arrays => [Bio::MAGE::Array::Array->new()],
distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
substrateType => Bio::MAGE::Description::OntologyEntry->new(),
fiducials => [Bio::MAGE::Array::Fiducial->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association arrays
my $arrays_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arrays_assn = Bio::MAGE::Array::Array->new();
}
result (UNIVERSAL::isa($arraygroup->getArrays->[0],q[Bio::MAGE::Array::Array]));
result ($arraygroup->setArrays([$arrays_assn]));
result (UNIVERSAL::isa($arraygroup->getArrays,'ARRAY')
 and scalar @{$arraygroup->getArrays()} == 1
 and $arraygroup->getArrays->[0] == $arrays_assn);
$arraygroup->addArrays($arrays_assn);
result (UNIVERSAL::isa($arraygroup->getArrays,'ARRAY')
 and scalar @{$arraygroup->getArrays()} == 2
 and $arraygroup->getArrays->[0] == $arrays_assn
 and $arraygroup->getArrays->[1] == $arrays_assn);


# test the meta-data for the assoication
($assn) = $assns{arrays};
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
# testing association distanceUnit
my $distanceunit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit_assn = Bio::MAGE::Measurement::DistanceUnit->new();
}
result (UNIVERSAL::isa($arraygroup->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($arraygroup->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($arraygroup->getDistanceUnit() == $distanceunit_assn);



# test the meta-data for the assoication
($assn) = $assns{distanceUnit};
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
# testing association substrateType
my $substratetype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $substratetype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($arraygroup->getSubstrateType,q[Bio::MAGE::Description::OntologyEntry]));
result ($arraygroup->setSubstrateType($substratetype_assn) == $substratetype_assn);
result ($arraygroup->getSubstrateType() == $substratetype_assn);



# test the meta-data for the assoication
($assn) = $assns{substrateType};
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
# testing association fiducials
my $fiducials_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $fiducials_assn = Bio::MAGE::Array::Fiducial->new();
}
result (UNIVERSAL::isa($arraygroup->getFiducials->[0],q[Bio::MAGE::Array::Fiducial]));
result ($arraygroup->setFiducials([$fiducials_assn]));
result (UNIVERSAL::isa($arraygroup->getFiducials,'ARRAY')
 and scalar @{$arraygroup->getFiducials()} == 1
 and $arraygroup->getFiducials->[0] == $fiducials_assn);
$arraygroup->addFiducials($fiducials_assn);
result (UNIVERSAL::isa($arraygroup->getFiducials,'ARRAY')
 and scalar @{$arraygroup->getFiducials()} == 2
 and $arraygroup->getFiducials->[0] == $fiducials_assn
 and $arraygroup->getFiducials->[1] == $fiducials_assn);


# test the meta-data for the assoication
($assn) = $assns{fiducials};
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
result (UNIVERSAL::isa($arraygroup->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($arraygroup->setSecurity($security_assn) == $security_assn);
result ($arraygroup->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($arraygroup->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($arraygroup->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($arraygroup->getAuditTrail,'ARRAY')
 and scalar @{$arraygroup->getAuditTrail()} == 1
 and $arraygroup->getAuditTrail->[0] == $audittrail_assn);
$arraygroup->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($arraygroup->getAuditTrail,'ARRAY')
 and scalar @{$arraygroup->getAuditTrail()} == 2
 and $arraygroup->getAuditTrail->[0] == $audittrail_assn
 and $arraygroup->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($arraygroup->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($arraygroup->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($arraygroup->getDescriptions,'ARRAY')
 and scalar @{$arraygroup->getDescriptions()} == 1
 and $arraygroup->getDescriptions->[0] == $descriptions_assn);
$arraygroup->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($arraygroup->getDescriptions,'ARRAY')
 and scalar @{$arraygroup->getDescriptions()} == 2
 and $arraygroup->getDescriptions->[0] == $descriptions_assn
 and $arraygroup->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($arraygroup->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($arraygroup->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($arraygroup->getPropertySets,'ARRAY')
 and scalar @{$arraygroup->getPropertySets()} == 1
 and $arraygroup->getPropertySets->[0] == $propertysets_assn);
$arraygroup->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($arraygroup->getPropertySets,'ARRAY')
 and scalar @{$arraygroup->getPropertySets()} == 2
 and $arraygroup->getPropertySets->[0] == $propertysets_assn
 and $arraygroup->getPropertySets->[1] == $propertysets_assn);


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
result ($arraygroup->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($arraygroup->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($arraygroup->isa(q[Bio::MAGE::Extendable]));

