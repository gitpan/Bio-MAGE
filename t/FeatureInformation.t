# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureInformation.t'

# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2002 by:
#    * The MicroArray Gene Expression Database Society (MGED)
#    * Rosetta Inpharmatics
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..25\n"; }
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

my $end;
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
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
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
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
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
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing superclass Bio::MAGE::Extendable
result ($featureinformation->isa(q[Bio::MAGE::Extendable]));

