# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioDataTuples.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..16\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::BioDataTuples;
use Bio::MAGE::BioAssayData::BioAssayDatum;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biodatatuples;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatatuples = Bio::MAGE::BioAssayData::BioDataTuples->new();
}
result($biodatatuples->isa('Bio::MAGE::BioAssayData::BioDataTuples'));

# test the package class method
result($biodatatuples->package() eq q[BioAssayData]);

# test the class_name class method
result($biodatatuples->class_name() eq q[Bio::MAGE::BioAssayData::BioDataTuples]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioDataTuples->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatatuples = Bio::MAGE::BioAssayData::BioDataTuples->new(bioAssayTupleData => [Bio::MAGE::BioAssayData::BioAssayDatum->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association bioAssayTupleData
my $bioassaytupledata_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaytupledata_assn = Bio::MAGE::BioAssayData::BioAssayDatum->new();
}
result (UNIVERSAL::isa($biodatatuples->getBioAssayTupleData->[0],q[Bio::MAGE::BioAssayData::BioAssayDatum]));
result ($biodatatuples->setBioAssayTupleData([$bioassaytupledata_assn]));
result (UNIVERSAL::isa($biodatatuples->getBioAssayTupleData,'ARRAY')
 and scalar @{$biodatatuples->getBioAssayTupleData()} == 1
 and $biodatatuples->getBioAssayTupleData->[0] == $bioassaytupledata_assn);
$biodatatuples->addBioAssayTupleData($bioassaytupledata_assn);
result (UNIVERSAL::isa($biodatatuples->getBioAssayTupleData,'ARRAY')
 and scalar @{$biodatatuples->getBioAssayTupleData()} == 2
 and $biodatatuples->getBioAssayTupleData->[0] == $bioassaytupledata_assn
 and $biodatatuples->getBioAssayTupleData->[1] == $bioassaytupledata_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssayTupleData};
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
result (UNIVERSAL::isa($biodatatuples->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biodatatuples->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biodatatuples->getPropertySets,'ARRAY')
 and scalar @{$biodatatuples->getPropertySets()} == 1
 and $biodatatuples->getPropertySets->[0] == $propertysets_assn);
$biodatatuples->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biodatatuples->getPropertySets,'ARRAY')
 and scalar @{$biodatatuples->getPropertySets()} == 2
 and $biodatatuples->getPropertySets->[0] == $propertysets_assn
 and $biodatatuples->getPropertySets->[1] == $propertysets_assn);


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
result ($biodatatuples->isa(q[Bio::MAGE::BioAssayData::BioDataValues]));

# testing superclass Bio::MAGE::Extendable
result ($biodatatuples->isa(q[Bio::MAGE::Extendable]));

