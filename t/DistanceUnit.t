# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DistanceUnit.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..15\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $distanceunit;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit = Bio::MAGE::Measurement::DistanceUnit->new();
}
result($distanceunit->isa('Bio::MAGE::Measurement::DistanceUnit'));

# test the package class method
result($distanceunit->package() eq q[Measurement]);

# test the class_name class method
result($distanceunit->class_name() eq q[Bio::MAGE::Measurement::DistanceUnit]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit = Bio::MAGE::Measurement::DistanceUnit->new(unitNameCV => 1,
unitName => 2);
}
# testing attribute unitNameCV
result ($distanceunit->getUnitNameCV() == 1);
$distanceunit->setUnitNameCV(1);
result ($distanceunit->getUnitNameCV() == 1);

# testing attribute unitName
result ($distanceunit->getUnitName() == 2);
$distanceunit->setUnitName(2);
result ($distanceunit->getUnitName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Measurement::DistanceUnit->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit = Bio::MAGE::Measurement::DistanceUnit->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($distanceunit->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($distanceunit->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($distanceunit->getPropertySets,'ARRAY')
 and scalar @{$distanceunit->getPropertySets()} == 1
 and $distanceunit->getPropertySets->[0] == $propertysets_assn);
$distanceunit->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($distanceunit->getPropertySets,'ARRAY')
 and scalar @{$distanceunit->getPropertySets()} == 2
 and $distanceunit->getPropertySets->[0] == $propertysets_assn
 and $distanceunit->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Measurement::Unit
result ($distanceunit->isa(q[Bio::MAGE::Measurement::Unit]));

# testing superclass Bio::MAGE::Extendable
result ($distanceunit->isa(q[Bio::MAGE::Extendable]));

