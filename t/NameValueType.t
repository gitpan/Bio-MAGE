# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl NameValueType.t'

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
use Bio::MAGE::NameValueType;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $namevaluetype;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $namevaluetype = Bio::MAGE::NameValueType->new();
}
result($namevaluetype->isa('Bio::MAGE::NameValueType'));

# test the package class method
result($namevaluetype->package() eq q[MAGE]);

# test the class_name class method
result($namevaluetype->class_name() eq q[Bio::MAGE::NameValueType]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $namevaluetype = Bio::MAGE::NameValueType->new(value => 1,
name => 2,
type => 3);
}
# testing attribute value
result ($namevaluetype->getValue() == 1);
$namevaluetype->setValue(1);
result ($namevaluetype->getValue() == 1);

# testing attribute name
result ($namevaluetype->getName() == 2);
$namevaluetype->setName(2);
result ($namevaluetype->getName() == 2);

# testing attribute type
result ($namevaluetype->getType() == 3);
$namevaluetype->setType(3);
result ($namevaluetype->getType() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::NameValueType->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $namevaluetype = Bio::MAGE::NameValueType->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($namevaluetype->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($namevaluetype->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($namevaluetype->getPropertySets,'ARRAY')
 and scalar @{$namevaluetype->getPropertySets()} == 1
 and $namevaluetype->getPropertySets->[0] == $propertysets_assn);
$namevaluetype->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($namevaluetype->getPropertySets,'ARRAY')
 and scalar @{$namevaluetype->getPropertySets()} == 2
 and $namevaluetype->getPropertySets->[0] == $propertysets_assn
 and $namevaluetype->getPropertySets->[1] == $propertysets_assn);


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
