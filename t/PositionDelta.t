# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl PositionDelta.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..18\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Array::PositionDelta;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $positiondelta;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $positiondelta = Bio::MAGE::Array::PositionDelta->new();
}
result($positiondelta->isa('Bio::MAGE::Array::PositionDelta'));

# test the package class method
result($positiondelta->package() eq q[Array]);

# test the class_name class method
result($positiondelta->class_name() eq q[Bio::MAGE::Array::PositionDelta]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $positiondelta = Bio::MAGE::Array::PositionDelta->new(deltaX => 1,
deltaY => 2);
}
# testing attribute deltaX
result ($positiondelta->getDeltaX() == 1);
$positiondelta->setDeltaX(1);
result ($positiondelta->getDeltaX() == 1);

# testing attribute deltaY
result ($positiondelta->getDeltaY() == 2);
$positiondelta->setDeltaY(2);
result ($positiondelta->getDeltaY() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::PositionDelta->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $positiondelta = Bio::MAGE::Array::PositionDelta->new(distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association distanceUnit
my $distanceunit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit_assn = Bio::MAGE::Measurement::DistanceUnit->new();
}
result (UNIVERSAL::isa($positiondelta->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($positiondelta->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($positiondelta->getDistanceUnit() == $distanceunit_assn);



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
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($positiondelta->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($positiondelta->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($positiondelta->getPropertySets,'ARRAY')
 and scalar @{$positiondelta->getPropertySets()} == 1
 and $positiondelta->getPropertySets->[0] == $propertysets_assn);
$positiondelta->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($positiondelta->getPropertySets,'ARRAY')
 and scalar @{$positiondelta->getPropertySets()} == 2
 and $positiondelta->getPropertySets->[0] == $propertysets_assn
 and $positiondelta->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Extendable
result ($positiondelta->isa(q[Bio::MAGE::Extendable]));

