# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureLocation.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..14\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::FeatureLocation;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $featurelocation;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurelocation = Bio::MAGE::DesignElement::FeatureLocation->new();
}
result($featurelocation->isa('Bio::MAGE::DesignElement::FeatureLocation'));

# test the package class method
result($featurelocation->package() eq q[DesignElement]);

# test the class_name class method
result($featurelocation->class_name() eq q[Bio::MAGE::DesignElement::FeatureLocation]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurelocation = Bio::MAGE::DesignElement::FeatureLocation->new(row => 1,
column => 2);
}
# testing attribute row
result ($featurelocation->getRow() == 1);
$featurelocation->setRow(1);
result ($featurelocation->getRow() == 1);

# testing attribute column
result ($featurelocation->getColumn() == 2);
$featurelocation->setColumn(2);
result ($featurelocation->getColumn() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::FeatureLocation->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurelocation = Bio::MAGE::DesignElement::FeatureLocation->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($featurelocation->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($featurelocation->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($featurelocation->getPropertySets,'ARRAY')
 and scalar @{$featurelocation->getPropertySets()} == 1
 and $featurelocation->getPropertySets->[0] == $propertysets_assn);
$featurelocation->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($featurelocation->getPropertySets,'ARRAY')
 and scalar @{$featurelocation->getPropertySets()} == 2
 and $featurelocation->getPropertySets->[0] == $propertysets_assn
 and $featurelocation->getPropertySets->[1] == $propertysets_assn);


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
result ($featurelocation->isa(q[Bio::MAGE::Extendable]));

