# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl TimeUnit.t'

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
use Bio::MAGE::Measurement::TimeUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $timeunit;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $timeunit = Bio::MAGE::Measurement::TimeUnit->new();
}
result($timeunit->isa('Bio::MAGE::Measurement::TimeUnit'));

# test the package class method
result($timeunit->package() eq q[Measurement]);

# test the class_name class method
result($timeunit->class_name() eq q[Bio::MAGE::Measurement::TimeUnit]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $timeunit = Bio::MAGE::Measurement::TimeUnit->new(unitNameCV => 1,
unitName => 2);
}
# testing attribute unitNameCV
result ($timeunit->getUnitNameCV() == 1);
$timeunit->setUnitNameCV(1);
result ($timeunit->getUnitNameCV() == 1);

# testing attribute unitName
result ($timeunit->getUnitName() == 2);
$timeunit->setUnitName(2);
result ($timeunit->getUnitName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Measurement::TimeUnit->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $timeunit = Bio::MAGE::Measurement::TimeUnit->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($timeunit->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($timeunit->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($timeunit->getPropertySets,'ARRAY')
 and scalar @{$timeunit->getPropertySets()} == 1
 and $timeunit->getPropertySets->[0] == $propertysets_assn);
$timeunit->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($timeunit->getPropertySets,'ARRAY')
 and scalar @{$timeunit->getPropertySets()} == 2
 and $timeunit->getPropertySets->[0] == $propertysets_assn
 and $timeunit->getPropertySets->[1] == $propertysets_assn);


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
result ($timeunit->isa(q[Bio::MAGE::Measurement::Unit]));

# testing superclass Bio::MAGE::Extendable
result ($timeunit->isa(q[Bio::MAGE::Extendable]));

