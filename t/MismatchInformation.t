# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl MismatchInformation.t'

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
use Bio::MAGE::DesignElement::MismatchInformation;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $mismatchinformation;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $mismatchinformation = Bio::MAGE::DesignElement::MismatchInformation->new();
}
result($mismatchinformation->isa('Bio::MAGE::DesignElement::MismatchInformation'));

# test the package class method
result($mismatchinformation->package() eq q[DesignElement]);

# test the class_name class method
result($mismatchinformation->class_name() eq q[Bio::MAGE::DesignElement::MismatchInformation]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $mismatchinformation = Bio::MAGE::DesignElement::MismatchInformation->new(replacedLength => 1,
startCoord => 2,
newSequence => 3);
}
# testing attribute replacedLength
result ($mismatchinformation->getReplacedLength() == 1);
$mismatchinformation->setReplacedLength(1);
result ($mismatchinformation->getReplacedLength() == 1);

# testing attribute startCoord
result ($mismatchinformation->getStartCoord() == 2);
$mismatchinformation->setStartCoord(2);
result ($mismatchinformation->getStartCoord() == 2);

# testing attribute newSequence
result ($mismatchinformation->getNewSequence() == 3);
$mismatchinformation->setNewSequence(3);
result ($mismatchinformation->getNewSequence() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::MismatchInformation->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $mismatchinformation = Bio::MAGE::DesignElement::MismatchInformation->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($mismatchinformation->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($mismatchinformation->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($mismatchinformation->getPropertySets,'ARRAY')
 and scalar @{$mismatchinformation->getPropertySets()} == 1
 and $mismatchinformation->getPropertySets->[0] == $propertysets_assn);
$mismatchinformation->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($mismatchinformation->getPropertySets,'ARRAY')
 and scalar @{$mismatchinformation->getPropertySets()} == 2
 and $mismatchinformation->getPropertySets->[0] == $propertysets_assn
 and $mismatchinformation->getPropertySets->[1] == $propertysets_assn);


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
result ($mismatchinformation->isa(q[Bio::MAGE::Extendable]));

