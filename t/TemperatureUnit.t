# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl TemperatureUnit.t'

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
use Bio::MAGE::Measurement::TemperatureUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $temperatureunit;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $temperatureunit = Bio::MAGE::Measurement::TemperatureUnit->new();
}
result($temperatureunit->isa('Bio::MAGE::Measurement::TemperatureUnit'));

# test the package class method
result($temperatureunit->package() eq q[Measurement]);

# test the class_name class method
result($temperatureunit->class_name() eq q[Bio::MAGE::Measurement::TemperatureUnit]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $temperatureunit = Bio::MAGE::Measurement::TemperatureUnit->new(unitNameCV => 1,
unitName => 2);
}
# testing attribute unitNameCV
result ($temperatureunit->getUnitNameCV() == 1);
$temperatureunit->setUnitNameCV(1);
result ($temperatureunit->getUnitNameCV() == 1);

# testing attribute unitName
result ($temperatureunit->getUnitName() == 2);
$temperatureunit->setUnitName(2);
result ($temperatureunit->getUnitName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Measurement::TemperatureUnit->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $temperatureunit = Bio::MAGE::Measurement::TemperatureUnit->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($temperatureunit->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($temperatureunit->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($temperatureunit->getPropertySets,'ARRAY')
 and scalar @{$temperatureunit->getPropertySets()} == 1
 and $temperatureunit->getPropertySets->[0] == $propertysets_assn);
$temperatureunit->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($temperatureunit->getPropertySets,'ARRAY')
 and scalar @{$temperatureunit->getPropertySets()} == 2
 and $temperatureunit->getPropertySets->[0] == $propertysets_assn
 and $temperatureunit->getPropertySets->[1] == $propertysets_assn);


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
result ($temperatureunit->isa(q[Bio::MAGE::Measurement::Unit]));

# testing superclass Bio::MAGE::Extendable
result ($temperatureunit->isa(q[Bio::MAGE::Extendable]));

