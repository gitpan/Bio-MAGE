# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SequencePosition.t'

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
use Bio::MAGE::BioSequence::SequencePosition;
use Bio::MAGE::DesignElement::CompositePosition;
use Bio::MAGE::DesignElement::ReporterPosition;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $sequenceposition;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sequenceposition = Bio::MAGE::BioSequence::SequencePosition->new();
}
result($sequenceposition->isa('Bio::MAGE::BioSequence::SequencePosition'));

# test the package class method
result($sequenceposition->package() eq q[BioSequence]);

# test the class_name class method
result($sequenceposition->class_name() eq q[Bio::MAGE::BioSequence::SequencePosition]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sequenceposition = Bio::MAGE::BioSequence::SequencePosition->new(end => 1,
start => 2);
}
# testing attribute end
result ($sequenceposition->getEnd() == 1);
$sequenceposition->setEnd(1);
result ($sequenceposition->getEnd() == 1);

# testing attribute start
result ($sequenceposition->getStart() == 2);
$sequenceposition->setStart(2);
result ($sequenceposition->getStart() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioSequence::SequencePosition->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sequenceposition = Bio::MAGE::BioSequence::SequencePosition->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($sequenceposition->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($sequenceposition->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($sequenceposition->getPropertySets,'ARRAY')
 and scalar @{$sequenceposition->getPropertySets()} == 1
 and $sequenceposition->getPropertySets->[0] == $propertysets_assn);
$sequenceposition->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($sequenceposition->getPropertySets,'ARRAY')
 and scalar @{$sequenceposition->getPropertySets()} == 2
 and $sequenceposition->getPropertySets->[0] == $propertysets_assn
 and $sequenceposition->getPropertySets->[1] == $propertysets_assn);


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
  my $compositeposition = Bio::MAGE::DesignElement::CompositePosition->new();

  # testing subclass CompositePosition
  result ($compositeposition->isa(q[Bio::MAGE::DesignElement::CompositePosition]));

  # create a subclass
  my $reporterposition = Bio::MAGE::DesignElement::ReporterPosition->new();

  # testing subclass ReporterPosition
  result ($reporterposition->isa(q[Bio::MAGE::DesignElement::ReporterPosition]));

}
# testing superclass Bio::MAGE::Extendable
result ($sequenceposition->isa(q[Bio::MAGE::Extendable]));

