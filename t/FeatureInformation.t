# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureInformation.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..19\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::FeatureInformation;
use Bio::MAGE::DesignElement::MismatchInformation;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $featureinformation;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureinformation = Bio::MAGE::DesignElement::FeatureInformation->new();
}
result($featureinformation->isa('Bio::MAGE::DesignElement::FeatureInformation'));

# test the package class method
result($featureinformation->package() eq q[DesignElement]);

# test the class_name class method
result($featureinformation->class_name() eq q[Bio::MAGE::DesignElement::FeatureInformation]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::FeatureInformation->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureinformation = Bio::MAGE::DesignElement::FeatureInformation->new(feature => Bio::MAGE::DesignElement::Feature->new(),
mismatchInformation => [Bio::MAGE::DesignElement::MismatchInformation->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association feature
my $feature_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $feature_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($featureinformation->getFeature,q[Bio::MAGE::DesignElement::Feature]));
result ($featureinformation->setFeature($feature_assn) == $feature_assn);
result ($featureinformation->getFeature() == $feature_assn);



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
# testing association mismatchInformation
my $mismatchinformation_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $mismatchinformation_assn = Bio::MAGE::DesignElement::MismatchInformation->new();
}
result (UNIVERSAL::isa($featureinformation->getMismatchInformation->[0],q[Bio::MAGE::DesignElement::MismatchInformation]));
result ($featureinformation->setMismatchInformation([$mismatchinformation_assn]));
result (UNIVERSAL::isa($featureinformation->getMismatchInformation,'ARRAY')
 and scalar @{$featureinformation->getMismatchInformation()} == 1
 and $featureinformation->getMismatchInformation->[0] == $mismatchinformation_assn);
$featureinformation->addMismatchInformation($mismatchinformation_assn);
result (UNIVERSAL::isa($featureinformation->getMismatchInformation,'ARRAY')
 and scalar @{$featureinformation->getMismatchInformation()} == 2
 and $featureinformation->getMismatchInformation->[0] == $mismatchinformation_assn
 and $featureinformation->getMismatchInformation->[1] == $mismatchinformation_assn);


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
result (UNIVERSAL::isa($featureinformation->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($featureinformation->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($featureinformation->getPropertySets,'ARRAY')
 and scalar @{$featureinformation->getPropertySets()} == 1
 and $featureinformation->getPropertySets->[0] == $propertysets_assn);
$featureinformation->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($featureinformation->getPropertySets,'ARRAY')
 and scalar @{$featureinformation->getPropertySets()} == 2
 and $featureinformation->getPropertySets->[0] == $propertysets_assn
 and $featureinformation->getPropertySets->[1] == $propertysets_assn);


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
result ($featureinformation->isa(q[Bio::MAGE::Extendable]));

