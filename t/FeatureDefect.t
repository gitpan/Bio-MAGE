# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureDefect.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..22\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Array::FeatureDefect;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::Array::PositionDelta;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $featuredefect;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuredefect = Bio::MAGE::Array::FeatureDefect->new();
}
result($featuredefect->isa('Bio::MAGE::Array::FeatureDefect'));

# test the package class method
result($featuredefect->package() eq q[Array]);

# test the class_name class method
result($featuredefect->class_name() eq q[Bio::MAGE::Array::FeatureDefect]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::FeatureDefect->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuredefect = Bio::MAGE::Array::FeatureDefect->new(feature => Bio::MAGE::DesignElement::Feature->new(),
positionDelta => Bio::MAGE::Array::PositionDelta->new(),
defectType => Bio::MAGE::Description::OntologyEntry->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association feature
my $feature_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $feature_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($featuredefect->getFeature,q[Bio::MAGE::DesignElement::Feature]));
result ($featuredefect->setFeature($feature_assn) == $feature_assn);
result ($featuredefect->getFeature() == $feature_assn);



# test the meta-data for the assoication
($assn) = $assns{feature};
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
# testing association positionDelta
my $positiondelta_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $positiondelta_assn = Bio::MAGE::Array::PositionDelta->new();
}
result (UNIVERSAL::isa($featuredefect->getPositionDelta,q[Bio::MAGE::Array::PositionDelta]));
result ($featuredefect->setPositionDelta($positiondelta_assn) == $positiondelta_assn);
result ($featuredefect->getPositionDelta() == $positiondelta_assn);



# test the meta-data for the assoication
($assn) = $assns{positionDelta};
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
# testing association defectType
my $defecttype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $defecttype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($featuredefect->getDefectType,q[Bio::MAGE::Description::OntologyEntry]));
result ($featuredefect->setDefectType($defecttype_assn) == $defecttype_assn);
result ($featuredefect->getDefectType() == $defecttype_assn);



# test the meta-data for the assoication
($assn) = $assns{defectType};
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
result (UNIVERSAL::isa($featuredefect->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($featuredefect->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($featuredefect->getPropertySets,'ARRAY')
 and scalar @{$featuredefect->getPropertySets()} == 1
 and $featuredefect->getPropertySets->[0] == $propertysets_assn);
$featuredefect->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($featuredefect->getPropertySets,'ARRAY')
 and scalar @{$featuredefect->getPropertySets()} == 2
 and $featuredefect->getPropertySets->[0] == $propertysets_assn
 and $featuredefect->getPropertySets->[1] == $propertysets_assn);


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
result ($featuredefect->isa(q[Bio::MAGE::Extendable]));

