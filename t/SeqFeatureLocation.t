# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SeqFeatureLocation.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..21\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioSequence::SeqFeatureLocation;
use Bio::MAGE::BioSequence::SeqFeatureLocation;
use Bio::MAGE::BioSequence::SequencePosition;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $seqfeaturelocation;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $seqfeaturelocation = Bio::MAGE::BioSequence::SeqFeatureLocation->new();
}
result($seqfeaturelocation->isa('Bio::MAGE::BioSequence::SeqFeatureLocation'));

# test the package class method
result($seqfeaturelocation->package() eq q[BioSequence]);

# test the class_name class method
result($seqfeaturelocation->class_name() eq q[Bio::MAGE::BioSequence::SeqFeatureLocation]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $seqfeaturelocation = Bio::MAGE::BioSequence::SeqFeatureLocation->new(strandType => 1);
}
# testing attribute strandType
result ($seqfeaturelocation->getStrandType() == 1);
$seqfeaturelocation->setStrandType(1);
result ($seqfeaturelocation->getStrandType() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioSequence::SeqFeatureLocation->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $seqfeaturelocation = Bio::MAGE::BioSequence::SeqFeatureLocation->new(coordinate => Bio::MAGE::BioSequence::SequencePosition->new(),
subregions => [Bio::MAGE::BioSequence::SeqFeatureLocation->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association coordinate
my $coordinate_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $coordinate_assn = Bio::MAGE::BioSequence::SequencePosition->new();
}
result (UNIVERSAL::isa($seqfeaturelocation->getCoordinate,q[Bio::MAGE::BioSequence::SequencePosition]));
result ($seqfeaturelocation->setCoordinate($coordinate_assn) == $coordinate_assn);
result ($seqfeaturelocation->getCoordinate() == $coordinate_assn);



# test the meta-data for the assoication
($assn) = $assns{coordinate};
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
# testing association subregions
my $subregions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $subregions_assn = Bio::MAGE::BioSequence::SeqFeatureLocation->new();
}
result (UNIVERSAL::isa($seqfeaturelocation->getSubregions->[0],q[Bio::MAGE::BioSequence::SeqFeatureLocation]));
result ($seqfeaturelocation->setSubregions([$subregions_assn]));
result (UNIVERSAL::isa($seqfeaturelocation->getSubregions,'ARRAY')
 and scalar @{$seqfeaturelocation->getSubregions()} == 1
 and $seqfeaturelocation->getSubregions->[0] == $subregions_assn);
$seqfeaturelocation->addSubregions($subregions_assn);
result (UNIVERSAL::isa($seqfeaturelocation->getSubregions,'ARRAY')
 and scalar @{$seqfeaturelocation->getSubregions()} == 2
 and $seqfeaturelocation->getSubregions->[0] == $subregions_assn
 and $seqfeaturelocation->getSubregions->[1] == $subregions_assn);


# test the meta-data for the assoication
($assn) = $assns{subregions};
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
result (UNIVERSAL::isa($seqfeaturelocation->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($seqfeaturelocation->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($seqfeaturelocation->getPropertySets,'ARRAY')
 and scalar @{$seqfeaturelocation->getPropertySets()} == 1
 and $seqfeaturelocation->getPropertySets->[0] == $propertysets_assn);
$seqfeaturelocation->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($seqfeaturelocation->getPropertySets,'ARRAY')
 and scalar @{$seqfeaturelocation->getPropertySets()} == 2
 and $seqfeaturelocation->getPropertySets->[0] == $propertysets_assn
 and $seqfeaturelocation->getPropertySets->[1] == $propertysets_assn);


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
result ($seqfeaturelocation->isa(q[Bio::MAGE::Extendable]));

