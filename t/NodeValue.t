# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl NodeValue.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..26\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::HigherLevelAnalysis::NodeValue;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $nodevalue;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodevalue = Bio::MAGE::HigherLevelAnalysis::NodeValue->new();
}
result($nodevalue->isa('Bio::MAGE::HigherLevelAnalysis::NodeValue'));

# test the package class method
result($nodevalue->package() eq q[HigherLevelAnalysis]);

# test the class_name class method
result($nodevalue->class_name() eq q[Bio::MAGE::HigherLevelAnalysis::NodeValue]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodevalue = Bio::MAGE::HigherLevelAnalysis::NodeValue->new(value => 1,
name => 2);
}
# testing attribute value
result ($nodevalue->getValue() == 1);
$nodevalue->setValue(1);
result ($nodevalue->getValue() == 1);

# testing attribute name
result ($nodevalue->getName() == 2);
$nodevalue->setName(2);
result ($nodevalue->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::HigherLevelAnalysis::NodeValue->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodevalue = Bio::MAGE::HigherLevelAnalysis::NodeValue->new(dataType => Bio::MAGE::Description::OntologyEntry->new(),
scale => Bio::MAGE::Description::OntologyEntry->new(),
type => Bio::MAGE::Description::OntologyEntry->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association dataType
my $datatype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $datatype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($nodevalue->getDataType,q[Bio::MAGE::Description::OntologyEntry]));
result ($nodevalue->setDataType($datatype_assn) == $datatype_assn);
result ($nodevalue->getDataType() == $datatype_assn);



# test the meta-data for the assoication
($assn) = $assns{dataType};
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
# testing association scale
my $scale_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $scale_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($nodevalue->getScale,q[Bio::MAGE::Description::OntologyEntry]));
result ($nodevalue->setScale($scale_assn) == $scale_assn);
result ($nodevalue->getScale() == $scale_assn);



# test the meta-data for the assoication
($assn) = $assns{scale};
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
# testing association type
my $type_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $type_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($nodevalue->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($nodevalue->setType($type_assn) == $type_assn);
result ($nodevalue->getType() == $type_assn);



# test the meta-data for the assoication
($assn) = $assns{type};
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
result (UNIVERSAL::isa($nodevalue->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($nodevalue->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($nodevalue->getPropertySets,'ARRAY')
 and scalar @{$nodevalue->getPropertySets()} == 1
 and $nodevalue->getPropertySets->[0] == $propertysets_assn);
$nodevalue->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($nodevalue->getPropertySets,'ARRAY')
 and scalar @{$nodevalue->getPropertySets()} == 2
 and $nodevalue->getPropertySets->[0] == $propertysets_assn
 and $nodevalue->getPropertySets->[1] == $propertysets_assn);


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
result ($nodevalue->isa(q[Bio::MAGE::Extendable]));

