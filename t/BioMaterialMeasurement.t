# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioMaterialMeasurement.t'

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
use Bio::MAGE::BioMaterial::BioMaterialMeasurement;
use Bio::MAGE::BioMaterial::BioMaterial;
use Bio::MAGE::Measurement::Measurement;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biomaterialmeasurement;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterialmeasurement = Bio::MAGE::BioMaterial::BioMaterialMeasurement->new();
}
result($biomaterialmeasurement->isa('Bio::MAGE::BioMaterial::BioMaterialMeasurement'));

# test the package class method
result($biomaterialmeasurement->package() eq q[BioMaterial]);

# test the class_name class method
result($biomaterialmeasurement->class_name() eq q[Bio::MAGE::BioMaterial::BioMaterialMeasurement]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::BioMaterialMeasurement->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterialmeasurement = Bio::MAGE::BioMaterial::BioMaterialMeasurement->new(measurement => Bio::MAGE::Measurement::Measurement->new(),
bioMaterial => Bio::MAGE::BioMaterial::BioMaterial->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association measurement
my $measurement_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measurement_assn = Bio::MAGE::Measurement::Measurement->new();
}
result (UNIVERSAL::isa($biomaterialmeasurement->getMeasurement,q[Bio::MAGE::Measurement::Measurement]));
result ($biomaterialmeasurement->setMeasurement($measurement_assn) == $measurement_assn);
result ($biomaterialmeasurement->getMeasurement() == $measurement_assn);



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
# testing association bioMaterial
my $biomaterial_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterial_assn = Bio::MAGE::BioMaterial::BioMaterial->new();
}
result (UNIVERSAL::isa($biomaterialmeasurement->getBioMaterial,q[Bio::MAGE::BioMaterial::BioMaterial]));
result ($biomaterialmeasurement->setBioMaterial($biomaterial_assn) == $biomaterial_assn);
result ($biomaterialmeasurement->getBioMaterial() == $biomaterial_assn);



# test the meta-data for the assoication
($assn) = $assns{bioMaterial};
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
result (UNIVERSAL::isa($biomaterialmeasurement->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biomaterialmeasurement->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biomaterialmeasurement->getPropertySets,'ARRAY')
 and scalar @{$biomaterialmeasurement->getPropertySets()} == 1
 and $biomaterialmeasurement->getPropertySets->[0] == $propertysets_assn);
$biomaterialmeasurement->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biomaterialmeasurement->getPropertySets,'ARRAY')
 and scalar @{$biomaterialmeasurement->getPropertySets()} == 2
 and $biomaterialmeasurement->getPropertySets->[0] == $propertysets_assn
 and $biomaterialmeasurement->getPropertySets->[1] == $propertysets_assn);


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
result ($biomaterialmeasurement->isa(q[Bio::MAGE::Extendable]));

