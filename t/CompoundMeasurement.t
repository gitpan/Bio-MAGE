# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CompoundMeasurement.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..18\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioMaterial::CompoundMeasurement;
use Bio::MAGE::Measurement::Measurement;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioMaterial::Compound;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $compoundmeasurement;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compoundmeasurement = Bio::MAGE::BioMaterial::CompoundMeasurement->new();
}
result($compoundmeasurement->isa('Bio::MAGE::BioMaterial::CompoundMeasurement'));

# test the package class method
result($compoundmeasurement->package() eq q[BioMaterial]);

# test the class_name class method
result($compoundmeasurement->class_name() eq q[Bio::MAGE::BioMaterial::CompoundMeasurement]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::CompoundMeasurement->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compoundmeasurement = Bio::MAGE::BioMaterial::CompoundMeasurement->new(measurement => Bio::MAGE::Measurement::Measurement->new(),
compound => Bio::MAGE::BioMaterial::Compound->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association measurement
my $measurement_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measurement_assn = Bio::MAGE::Measurement::Measurement->new();
}
result (UNIVERSAL::isa($compoundmeasurement->getMeasurement,q[Bio::MAGE::Measurement::Measurement]));
result ($compoundmeasurement->setMeasurement($measurement_assn) == $measurement_assn);
result ($compoundmeasurement->getMeasurement() == $measurement_assn);



# test the meta-data for the assoication
($assn) = $assns{measurement};
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
# testing association compound
my $compound_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compound_assn = Bio::MAGE::BioMaterial::Compound->new();
}
result (UNIVERSAL::isa($compoundmeasurement->getCompound,q[Bio::MAGE::BioMaterial::Compound]));
result ($compoundmeasurement->setCompound($compound_assn) == $compound_assn);
result ($compoundmeasurement->getCompound() == $compound_assn);



# test the meta-data for the assoication
($assn) = $assns{compound};
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
result (UNIVERSAL::isa($compoundmeasurement->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($compoundmeasurement->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($compoundmeasurement->getPropertySets,'ARRAY')
 and scalar @{$compoundmeasurement->getPropertySets()} == 1
 and $compoundmeasurement->getPropertySets->[0] == $propertysets_assn);
$compoundmeasurement->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($compoundmeasurement->getPropertySets,'ARRAY')
 and scalar @{$compoundmeasurement->getPropertySets()} == 2
 and $compoundmeasurement->getPropertySets->[0] == $propertysets_assn
 and $compoundmeasurement->getPropertySets->[1] == $propertysets_assn);


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
result ($compoundmeasurement->isa(q[Bio::MAGE::Extendable]));

