# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ZoneLayout.t'

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
use Bio::MAGE::ArrayDesign::ZoneLayout;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $zonelayout;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonelayout = Bio::MAGE::ArrayDesign::ZoneLayout->new();
}
result($zonelayout->isa('Bio::MAGE::ArrayDesign::ZoneLayout'));

# test the package class method
result($zonelayout->package() eq q[ArrayDesign]);

# test the class_name class method
result($zonelayout->class_name() eq q[Bio::MAGE::ArrayDesign::ZoneLayout]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonelayout = Bio::MAGE::ArrayDesign::ZoneLayout->new(numFeaturesPerRow => 1,
spacingBetweenRows => 2,
numFeaturesPerCol => 3,
spacingBetweenCols => 4);
}
# testing attribute numFeaturesPerRow
result ($zonelayout->getNumFeaturesPerRow() == 1);
$zonelayout->setNumFeaturesPerRow(1);
result ($zonelayout->getNumFeaturesPerRow() == 1);

# testing attribute spacingBetweenRows
result ($zonelayout->getSpacingBetweenRows() == 2);
$zonelayout->setSpacingBetweenRows(2);
result ($zonelayout->getSpacingBetweenRows() == 2);

# testing attribute numFeaturesPerCol
result ($zonelayout->getNumFeaturesPerCol() == 3);
$zonelayout->setNumFeaturesPerCol(3);
result ($zonelayout->getNumFeaturesPerCol() == 3);

# testing attribute spacingBetweenCols
result ($zonelayout->getSpacingBetweenCols() == 4);
$zonelayout->setSpacingBetweenCols(4);
result ($zonelayout->getSpacingBetweenCols() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::ZoneLayout->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonelayout = Bio::MAGE::ArrayDesign::ZoneLayout->new(distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association distanceUnit
my $distanceunit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit_assn = Bio::MAGE::Measurement::DistanceUnit->new();
}
result (UNIVERSAL::isa($zonelayout->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($zonelayout->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($zonelayout->getDistanceUnit() == $distanceunit_assn);



# test the meta-data for the assoication
($assn) = $assns{distanceUnit};
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
result (UNIVERSAL::isa($zonelayout->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($zonelayout->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($zonelayout->getPropertySets,'ARRAY')
 and scalar @{$zonelayout->getPropertySets()} == 1
 and $zonelayout->getPropertySets->[0] == $propertysets_assn);
$zonelayout->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($zonelayout->getPropertySets,'ARRAY')
 and scalar @{$zonelayout->getPropertySets()} == 2
 and $zonelayout->getPropertySets->[0] == $propertysets_assn
 and $zonelayout->getPropertySets->[1] == $propertysets_assn);


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
result ($zonelayout->isa(q[Bio::MAGE::Extendable]));

