# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Zone.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..46\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::ArrayDesign::Zone;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $zone;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zone = Bio::MAGE::ArrayDesign::Zone->new();
}
result($zone->isa('Bio::MAGE::ArrayDesign::Zone'));

# test the package class method
result($zone->package() eq q[ArrayDesign]);

# test the class_name class method
result($zone->class_name() eq q[Bio::MAGE::ArrayDesign::Zone]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zone = Bio::MAGE::ArrayDesign::Zone->new(lowerRightY => 1,
lowerRightX => 2,
upperLeftX => 3,
upperLeftY => 4,
row => 5,
column => 6,
identifier => 7,
name => 8);
}
# testing attribute lowerRightY
result ($zone->getLowerRightY() == 1);
$zone->setLowerRightY(1);
result ($zone->getLowerRightY() == 1);

# testing attribute lowerRightX
result ($zone->getLowerRightX() == 2);
$zone->setLowerRightX(2);
result ($zone->getLowerRightX() == 2);

# testing attribute upperLeftX
result ($zone->getUpperLeftX() == 3);
$zone->setUpperLeftX(3);
result ($zone->getUpperLeftX() == 3);

# testing attribute upperLeftY
result ($zone->getUpperLeftY() == 4);
$zone->setUpperLeftY(4);
result ($zone->getUpperLeftY() == 4);

# testing attribute row
result ($zone->getRow() == 5);
$zone->setRow(5);
result ($zone->getRow() == 5);

# testing attribute column
result ($zone->getColumn() == 6);
$zone->setColumn(6);
result ($zone->getColumn() == 6);

# testing attribute identifier
result ($zone->getIdentifier() == 7);
$zone->setIdentifier(7);
result ($zone->getIdentifier() == 7);

# testing attribute name
result ($zone->getName() == 8);
$zone->setName(8);
result ($zone->getName() == 8);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::Zone->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zone = Bio::MAGE::ArrayDesign::Zone->new(distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association distanceUnit
my $distanceunit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit_assn = Bio::MAGE::Measurement::DistanceUnit->new();
}
result (UNIVERSAL::isa($zone->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($zone->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($zone->getDistanceUnit() == $distanceunit_assn);



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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($zone->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($zone->setSecurity($security_assn) == $security_assn);
result ($zone->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($zone->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($zone->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($zone->getAuditTrail,'ARRAY')
 and scalar @{$zone->getAuditTrail()} == 1
 and $zone->getAuditTrail->[0] == $audittrail_assn);
$zone->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($zone->getAuditTrail,'ARRAY')
 and scalar @{$zone->getAuditTrail()} == 2
 and $zone->getAuditTrail->[0] == $audittrail_assn
 and $zone->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($zone->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($zone->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($zone->getDescriptions,'ARRAY')
 and scalar @{$zone->getDescriptions()} == 1
 and $zone->getDescriptions->[0] == $descriptions_assn);
$zone->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($zone->getDescriptions,'ARRAY')
 and scalar @{$zone->getDescriptions()} == 2
 and $zone->getDescriptions->[0] == $descriptions_assn
 and $zone->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($zone->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($zone->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($zone->getPropertySets,'ARRAY')
 and scalar @{$zone->getPropertySets()} == 1
 and $zone->getPropertySets->[0] == $propertysets_assn);
$zone->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($zone->getPropertySets,'ARRAY')
 and scalar @{$zone->getPropertySets()} == 2
 and $zone->getPropertySets->[0] == $propertysets_assn
 and $zone->getPropertySets->[1] == $propertysets_assn);


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
result ($zone->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($zone->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($zone->isa(q[Bio::MAGE::Extendable]));

