# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ConcentrationUnit.t'

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
use Bio::MAGE::Measurement::ConcentrationUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $concentrationunit;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $concentrationunit = Bio::MAGE::Measurement::ConcentrationUnit->new();
}
result($concentrationunit->isa('Bio::MAGE::Measurement::ConcentrationUnit'));

# test the package class method
result($concentrationunit->package() eq q[Measurement]);

# test the class_name class method
result($concentrationunit->class_name() eq q[Bio::MAGE::Measurement::ConcentrationUnit]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $concentrationunit = Bio::MAGE::Measurement::ConcentrationUnit->new(unitNameCV => 1,
unitName => 2);
}
# testing attribute unitNameCV
result ($concentrationunit->getUnitNameCV() == 1);
$concentrationunit->setUnitNameCV(1);
result ($concentrationunit->getUnitNameCV() == 1);

# testing attribute unitName
result ($concentrationunit->getUnitName() == 2);
$concentrationunit->setUnitName(2);
result ($concentrationunit->getUnitName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Measurement::ConcentrationUnit->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $concentrationunit = Bio::MAGE::Measurement::ConcentrationUnit->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($concentrationunit->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($concentrationunit->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($concentrationunit->getPropertySets,'ARRAY')
 and scalar @{$concentrationunit->getPropertySets()} == 1
 and $concentrationunit->getPropertySets->[0] == $propertysets_assn);
$concentrationunit->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($concentrationunit->getPropertySets,'ARRAY')
 and scalar @{$concentrationunit->getPropertySets()} == 2
 and $concentrationunit->getPropertySets->[0] == $propertysets_assn
 and $concentrationunit->getPropertySets->[1] == $propertysets_assn);


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
result ($concentrationunit->isa(q[Bio::MAGE::Measurement::Unit]));

# testing superclass Bio::MAGE::Extendable
result ($concentrationunit->isa(q[Bio::MAGE::Extendable]));

