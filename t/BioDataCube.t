# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioDataCube.t'

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
use Bio::MAGE::BioAssayData::BioDataCube;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biodatacube;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatacube = Bio::MAGE::BioAssayData::BioDataCube->new();
}
result($biodatacube->isa('Bio::MAGE::BioAssayData::BioDataCube'));

# test the package class method
result($biodatacube->package() eq q[BioAssayData]);

# test the class_name class method
result($biodatacube->class_name() eq q[Bio::MAGE::BioAssayData::BioDataCube]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatacube = Bio::MAGE::BioAssayData::BioDataCube->new(cube => 1,
order => 2);
}
# testing attribute cube
result ($biodatacube->getCube() == 1);
$biodatacube->setCube(1);
result ($biodatacube->getCube() == 1);

# testing attribute order
result ($biodatacube->getOrder() == 2);
$biodatacube->setOrder(2);
result ($biodatacube->getOrder() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioDataCube->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatacube = Bio::MAGE::BioAssayData::BioDataCube->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($biodatacube->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biodatacube->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biodatacube->getPropertySets,'ARRAY')
 and scalar @{$biodatacube->getPropertySets()} == 1
 and $biodatacube->getPropertySets->[0] == $propertysets_assn);
$biodatacube->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biodatacube->getPropertySets,'ARRAY')
 and scalar @{$biodatacube->getPropertySets()} == 2
 and $biodatacube->getPropertySets->[0] == $propertysets_assn
 and $biodatacube->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssayData::BioDataValues
result ($biodatacube->isa(q[Bio::MAGE::BioAssayData::BioDataValues]));

# testing superclass Bio::MAGE::Extendable
result ($biodatacube->isa(q[Bio::MAGE::Extendable]));

