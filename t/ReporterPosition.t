# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ReporterPosition.t'

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
use Bio::MAGE::DesignElement::ReporterPosition;
use Bio::MAGE::DesignElement::MismatchInformation;
use Bio::MAGE::DesignElement::Reporter;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $reporterposition;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporterposition = Bio::MAGE::DesignElement::ReporterPosition->new();
}
result($reporterposition->isa('Bio::MAGE::DesignElement::ReporterPosition'));

# test the package class method
result($reporterposition->package() eq q[DesignElement]);

# test the class_name class method
result($reporterposition->class_name() eq q[Bio::MAGE::DesignElement::ReporterPosition]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporterposition = Bio::MAGE::DesignElement::ReporterPosition->new(start => 1,
end => 2);
}
# testing attribute start
result ($reporterposition->getStart() == 1);
$reporterposition->setStart(1);
result ($reporterposition->getStart() == 1);

# testing attribute end
result ($reporterposition->getEnd() == 2);
$reporterposition->setEnd(2);
result ($reporterposition->getEnd() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::ReporterPosition->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporterposition = Bio::MAGE::DesignElement::ReporterPosition->new(reporter => Bio::MAGE::DesignElement::Reporter->new(),
mismatchInformation => [Bio::MAGE::DesignElement::MismatchInformation->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association reporter
my $reporter_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporter_assn = Bio::MAGE::DesignElement::Reporter->new();
}
result (UNIVERSAL::isa($reporterposition->getReporter,q[Bio::MAGE::DesignElement::Reporter]));
result ($reporterposition->setReporter($reporter_assn) == $reporter_assn);
result ($reporterposition->getReporter() == $reporter_assn);



# test the meta-data for the assoication
($assn) = $assns{reporter};
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
result (UNIVERSAL::isa($reporterposition->getMismatchInformation->[0],q[Bio::MAGE::DesignElement::MismatchInformation]));
result ($reporterposition->setMismatchInformation([$mismatchinformation_assn]));
result (UNIVERSAL::isa($reporterposition->getMismatchInformation,'ARRAY')
 and scalar @{$reporterposition->getMismatchInformation()} == 1
 and $reporterposition->getMismatchInformation->[0] == $mismatchinformation_assn);
$reporterposition->addMismatchInformation($mismatchinformation_assn);
result (UNIVERSAL::isa($reporterposition->getMismatchInformation,'ARRAY')
 and scalar @{$reporterposition->getMismatchInformation()} == 2
 and $reporterposition->getMismatchInformation->[0] == $mismatchinformation_assn
 and $reporterposition->getMismatchInformation->[1] == $mismatchinformation_assn);


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
result (UNIVERSAL::isa($reporterposition->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($reporterposition->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($reporterposition->getPropertySets,'ARRAY')
 and scalar @{$reporterposition->getPropertySets()} == 1
 and $reporterposition->getPropertySets->[0] == $propertysets_assn);
$reporterposition->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($reporterposition->getPropertySets,'ARRAY')
 and scalar @{$reporterposition->getPropertySets()} == 2
 and $reporterposition->getPropertySets->[0] == $propertysets_assn
 and $reporterposition->getPropertySets->[1] == $propertysets_assn);


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
result ($reporterposition->isa(q[Bio::MAGE::BioSequence::SequencePosition]));

# testing superclass Bio::MAGE::Extendable
result ($reporterposition->isa(q[Bio::MAGE::Extendable]));

