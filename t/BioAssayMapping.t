# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayMapping.t'

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
use Bio::MAGE::BioAssayData::BioAssayMapping;
use Bio::MAGE::BioAssayData::BioAssayMap;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassaymapping;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymapping = Bio::MAGE::BioAssayData::BioAssayMapping->new();
}
result($bioassaymapping->isa('Bio::MAGE::BioAssayData::BioAssayMapping'));

# test the package class method
result($bioassaymapping->package() eq q[BioAssayData]);

# test the class_name class method
result($bioassaymapping->class_name() eq q[Bio::MAGE::BioAssayData::BioAssayMapping]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioAssayMapping->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymapping = Bio::MAGE::BioAssayData::BioAssayMapping->new(bioAssayMaps => [Bio::MAGE::BioAssayData::BioAssayMap->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association bioAssayMaps
my $bioassaymaps_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymaps_assn = Bio::MAGE::BioAssayData::BioAssayMap->new();
}
result (UNIVERSAL::isa($bioassaymapping->getBioAssayMaps->[0],q[Bio::MAGE::BioAssayData::BioAssayMap]));
result ($bioassaymapping->setBioAssayMaps([$bioassaymaps_assn]));
result (UNIVERSAL::isa($bioassaymapping->getBioAssayMaps,'ARRAY')
 and scalar @{$bioassaymapping->getBioAssayMaps()} == 1
 and $bioassaymapping->getBioAssayMaps->[0] == $bioassaymaps_assn);
$bioassaymapping->addBioAssayMaps($bioassaymaps_assn);
result (UNIVERSAL::isa($bioassaymapping->getBioAssayMaps,'ARRAY')
 and scalar @{$bioassaymapping->getBioAssayMaps()} == 2
 and $bioassaymapping->getBioAssayMaps->[0] == $bioassaymaps_assn
 and $bioassaymapping->getBioAssayMaps->[1] == $bioassaymaps_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssayMaps};
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
result (UNIVERSAL::isa($bioassaymapping->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaymapping->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaymapping->getPropertySets,'ARRAY')
 and scalar @{$bioassaymapping->getPropertySets()} == 1
 and $bioassaymapping->getPropertySets->[0] == $propertysets_assn);
$bioassaymapping->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaymapping->getPropertySets,'ARRAY')
 and scalar @{$bioassaymapping->getPropertySets()} == 2
 and $bioassaymapping->getPropertySets->[0] == $propertysets_assn
 and $bioassaymapping->getPropertySets->[1] == $propertysets_assn);


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
result ($bioassaymapping->isa(q[Bio::MAGE::Extendable]));

