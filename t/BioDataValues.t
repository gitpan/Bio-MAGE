# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioDataValues.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..12\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::BioDataValues;
use Bio::MAGE::BioAssayData::BioDataTuples;
use Bio::MAGE::BioAssayData::BioDataCube;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biodatavalues;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatavalues = Bio::MAGE::BioAssayData::BioDataValues->new();
}
result($biodatavalues->isa('Bio::MAGE::BioAssayData::BioDataValues'));

# test the package class method
result($biodatavalues->package() eq q[BioAssayData]);

# test the class_name class method
result($biodatavalues->class_name() eq q[Bio::MAGE::BioAssayData::BioDataValues]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioDataValues->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatavalues = Bio::MAGE::BioAssayData::BioDataValues->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($biodatavalues->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biodatavalues->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biodatavalues->getPropertySets,'ARRAY')
 and scalar @{$biodatavalues->getPropertySets()} == 1
 and $biodatavalues->getPropertySets->[0] == $propertysets_assn);
$biodatavalues->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biodatavalues->getPropertySets,'ARRAY')
 and scalar @{$biodatavalues->getPropertySets()} == 2
 and $biodatavalues->getPropertySets->[0] == $propertysets_assn
 and $biodatavalues->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $biodatatuples = Bio::MAGE::BioAssayData::BioDataTuples->new();

  # testing subclass BioDataTuples
  result ($biodatatuples->isa(q[Bio::MAGE::BioAssayData::BioDataTuples]));

  # create a subclass
  my $biodatacube = Bio::MAGE::BioAssayData::BioDataCube->new();

  # testing subclass BioDataCube
  result ($biodatacube->isa(q[Bio::MAGE::BioAssayData::BioDataCube]));

}
# testing superclass Bio::MAGE::Extendable
result ($biodatavalues->isa(q[Bio::MAGE::Extendable]));

