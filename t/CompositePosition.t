# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CompositePosition.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..24\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::CompositePosition;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::DesignElement::MismatchInformation;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $compositeposition;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositeposition = Bio::MAGE::DesignElement::CompositePosition->new();
}
result($compositeposition->isa('Bio::MAGE::DesignElement::CompositePosition'));

# test the package class method
result($compositeposition->package() eq q[DesignElement]);

# test the class_name class method
result($compositeposition->class_name() eq q[Bio::MAGE::DesignElement::CompositePosition]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositeposition = Bio::MAGE::DesignElement::CompositePosition->new(start => 1,
end => 2);
}
# testing attribute start
result ($compositeposition->getStart() == 1);
$compositeposition->setStart(1);
result ($compositeposition->getStart() == 1);

# testing attribute end
result ($compositeposition->getEnd() == 2);
$compositeposition->setEnd(2);
result ($compositeposition->getEnd() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::CompositePosition->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositeposition = Bio::MAGE::DesignElement::CompositePosition->new(composite => Bio::MAGE::DesignElement::CompositeSequence->new(),
mismatchInformation => [Bio::MAGE::DesignElement::MismatchInformation->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association composite
my $composite_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $composite_assn = Bio::MAGE::DesignElement::CompositeSequence->new();
}
result (UNIVERSAL::isa($compositeposition->getComposite,q[Bio::MAGE::DesignElement::CompositeSequence]));
result ($compositeposition->setComposite($composite_assn) == $composite_assn);
result ($compositeposition->getComposite() == $composite_assn);



# test the meta-data for the assoication
($assn) = $assns{composite};
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
# testing association mismatchInformation
my $mismatchinformation_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $mismatchinformation_assn = Bio::MAGE::DesignElement::MismatchInformation->new();
}
result (UNIVERSAL::isa($compositeposition->getMismatchInformation->[0],q[Bio::MAGE::DesignElement::MismatchInformation]));
result ($compositeposition->setMismatchInformation([$mismatchinformation_assn]));
result (UNIVERSAL::isa($compositeposition->getMismatchInformation,'ARRAY')
 and scalar @{$compositeposition->getMismatchInformation()} == 1
 and $compositeposition->getMismatchInformation->[0] == $mismatchinformation_assn);
$compositeposition->addMismatchInformation($mismatchinformation_assn);
result (UNIVERSAL::isa($compositeposition->getMismatchInformation,'ARRAY')
 and scalar @{$compositeposition->getMismatchInformation()} == 2
 and $compositeposition->getMismatchInformation->[0] == $mismatchinformation_assn
 and $compositeposition->getMismatchInformation->[1] == $mismatchinformation_assn);


# test the meta-data for the assoication
($assn) = $assns{mismatchInformation};
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
result (UNIVERSAL::isa($compositeposition->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($compositeposition->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($compositeposition->getPropertySets,'ARRAY')
 and scalar @{$compositeposition->getPropertySets()} == 1
 and $compositeposition->getPropertySets->[0] == $propertysets_assn);
$compositeposition->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($compositeposition->getPropertySets,'ARRAY')
 and scalar @{$compositeposition->getPropertySets()} == 2
 and $compositeposition->getPropertySets->[0] == $propertysets_assn
 and $compositeposition->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioSequence::SequencePosition
result ($compositeposition->isa(q[Bio::MAGE::BioSequence::SequencePosition]));

# testing superclass Bio::MAGE::Extendable
result ($compositeposition->isa(q[Bio::MAGE::Extendable]));

