# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Position.t'

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
use Bio::MAGE::DesignElement::Position;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $position;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $position = Bio::MAGE::DesignElement::Position->new();
}
result($position->isa('Bio::MAGE::DesignElement::Position'));

# test the package class method
result($position->package() eq q[DesignElement]);

# test the class_name class method
result($position->class_name() eq q[Bio::MAGE::DesignElement::Position]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $position = Bio::MAGE::DesignElement::Position->new(y => 1,
x => 2);
}
# testing attribute y
result ($position->getY() == 1);
$position->setY(1);
result ($position->getY() == 1);

# testing attribute x
result ($position->getX() == 2);
$position->setX(2);
result ($position->getX() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::Position->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $position = Bio::MAGE::DesignElement::Position->new(distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association distanceUnit
my $distanceunit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit_assn = Bio::MAGE::Measurement::DistanceUnit->new();
}
result (UNIVERSAL::isa($position->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($position->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($position->getDistanceUnit() == $distanceunit_assn);



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
result (UNIVERSAL::isa($position->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($position->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($position->getPropertySets,'ARRAY')
 and scalar @{$position->getPropertySets()} == 1
 and $position->getPropertySets->[0] == $propertysets_assn);
$position->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($position->getPropertySets,'ARRAY')
 and scalar @{$position->getPropertySets()} == 2
 and $position->getPropertySets->[0] == $propertysets_assn
 and $position->getPropertySets->[1] == $propertysets_assn);


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
result ($position->isa(q[Bio::MAGE::Extendable]));

