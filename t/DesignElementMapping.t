# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DesignElementMapping.t'

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
use Bio::MAGE::BioAssayData::DesignElementMapping;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssayData::DesignElementMap;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $designelementmapping;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementmapping = Bio::MAGE::BioAssayData::DesignElementMapping->new();
}
result($designelementmapping->isa('Bio::MAGE::BioAssayData::DesignElementMapping'));

# test the package class method
result($designelementmapping->package() eq q[BioAssayData]);

# test the class_name class method
result($designelementmapping->class_name() eq q[Bio::MAGE::BioAssayData::DesignElementMapping]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::DesignElementMapping->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementmapping = Bio::MAGE::BioAssayData::DesignElementMapping->new(designElementMaps => [Bio::MAGE::BioAssayData::DesignElementMap->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association designElementMaps
my $designelementmaps_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementmaps_assn = Bio::MAGE::BioAssayData::DesignElementMap->new();
}
result (UNIVERSAL::isa($designelementmapping->getDesignElementMaps->[0],q[Bio::MAGE::BioAssayData::DesignElementMap]));
result ($designelementmapping->setDesignElementMaps([$designelementmaps_assn]));
result (UNIVERSAL::isa($designelementmapping->getDesignElementMaps,'ARRAY')
 and scalar @{$designelementmapping->getDesignElementMaps()} == 1
 and $designelementmapping->getDesignElementMaps->[0] == $designelementmaps_assn);
$designelementmapping->addDesignElementMaps($designelementmaps_assn);
result (UNIVERSAL::isa($designelementmapping->getDesignElementMaps,'ARRAY')
 and scalar @{$designelementmapping->getDesignElementMaps()} == 2
 and $designelementmapping->getDesignElementMaps->[0] == $designelementmaps_assn
 and $designelementmapping->getDesignElementMaps->[1] == $designelementmaps_assn);


# test the meta-data for the assoication
($assn) = $assns{designElementMaps};
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
result (UNIVERSAL::isa($designelementmapping->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($designelementmapping->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($designelementmapping->getPropertySets,'ARRAY')
 and scalar @{$designelementmapping->getPropertySets()} == 1
 and $designelementmapping->getPropertySets->[0] == $propertysets_assn);
$designelementmapping->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($designelementmapping->getPropertySets,'ARRAY')
 and scalar @{$designelementmapping->getPropertySets()} == 2
 and $designelementmapping->getPropertySets->[0] == $propertysets_assn
 and $designelementmapping->getPropertySets->[1] == $propertysets_assn);


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
result ($designelementmapping->isa(q[Bio::MAGE::Extendable]));

