# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Measurement.t'

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
use Bio::MAGE::Measurement::Measurement;
use Bio::MAGE::Measurement::Unit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $measurement;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measurement = Bio::MAGE::Measurement::Measurement->new();
}
result($measurement->isa('Bio::MAGE::Measurement::Measurement'));

# test the package class method
result($measurement->package() eq q[Measurement]);

# test the class_name class method
result($measurement->class_name() eq q[Bio::MAGE::Measurement::Measurement]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measurement = Bio::MAGE::Measurement::Measurement->new(otherKind => 1,
value => 2,
type => 3,
kindCV => 4);
}
# testing attribute otherKind
result ($measurement->getOtherKind() == 1);
$measurement->setOtherKind(1);
result ($measurement->getOtherKind() == 1);

# testing attribute value
result ($measurement->getValue() == 2);
$measurement->setValue(2);
result ($measurement->getValue() == 2);

# testing attribute type
result ($measurement->getType() == 3);
$measurement->setType(3);
result ($measurement->getType() == 3);

# testing attribute kindCV
result ($measurement->getKindCV() == 4);
$measurement->setKindCV(4);
result ($measurement->getKindCV() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Measurement::Measurement->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measurement = Bio::MAGE::Measurement::Measurement->new(unit => Bio::MAGE::Measurement::Unit->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association unit
my $unit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $unit_assn = Bio::MAGE::Measurement::Unit->new();
}
result (UNIVERSAL::isa($measurement->getUnit,q[Bio::MAGE::Measurement::Unit]));
result ($measurement->setUnit($unit_assn) == $unit_assn);
result ($measurement->getUnit() == $unit_assn);



# test the meta-data for the assoication
($assn) = $assns{unit};
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
result (UNIVERSAL::isa($measurement->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($measurement->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($measurement->getPropertySets,'ARRAY')
 and scalar @{$measurement->getPropertySets()} == 1
 and $measurement->getPropertySets->[0] == $propertysets_assn);
$measurement->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($measurement->getPropertySets,'ARRAY')
 and scalar @{$measurement->getPropertySets()} == 2
 and $measurement->getPropertySets->[0] == $propertysets_assn
 and $measurement->getPropertySets->[1] == $propertysets_assn);


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
result ($measurement->isa(q[Bio::MAGE::Extendable]));

