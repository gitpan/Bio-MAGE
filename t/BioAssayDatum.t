# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayDatum.t'

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

BEGIN { $| = 1; print "1..32\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::BioAssayDatum;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::QuantitationType::QuantitationType;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::DesignElement;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassaydatum;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatum = Bio::MAGE::BioAssayData::BioAssayDatum->new();
}
result($bioassaydatum->isa('Bio::MAGE::BioAssayData::BioAssayDatum'));

# test the package class method
result($bioassaydatum->package() eq q[BioAssayData]);

# test the class_name class method
result($bioassaydatum->class_name() eq q[Bio::MAGE::BioAssayData::BioAssayDatum]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatum = Bio::MAGE::BioAssayData::BioAssayDatum->new(value => 1);
}
# testing attribute value
result ($bioassaydatum->getValue() == 1);
$bioassaydatum->setValue(1);
result ($bioassaydatum->getValue() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioAssayDatum->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatum = Bio::MAGE::BioAssayData::BioAssayDatum->new(quantitationType => Bio::MAGE::QuantitationType::QuantitationType->new(),
bioAssay => Bio::MAGE::BioAssay::BioAssay->new(),
designElement => Bio::MAGE::DesignElement::DesignElement->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association quantitationType
my $quantitationtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtype_assn = Bio::MAGE::QuantitationType::QuantitationType->new();
}
result (UNIVERSAL::isa($bioassaydatum->getQuantitationType,q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($bioassaydatum->setQuantitationType($quantitationtype_assn) == $quantitationtype_assn);
result ($bioassaydatum->getQuantitationType() == $quantitationtype_assn);



# test the meta-data for the assoication
($assn) = $assns{quantitationType};
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
# testing association bioAssay
my $bioassay_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassay_assn = Bio::MAGE::BioAssay::BioAssay->new();
}
result (UNIVERSAL::isa($bioassaydatum->getBioAssay,q[Bio::MAGE::BioAssay::BioAssay]));
result ($bioassaydatum->setBioAssay($bioassay_assn) == $bioassay_assn);
result ($bioassaydatum->getBioAssay() == $bioassay_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssay};
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
# testing association designElement
my $designelement_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelement_assn = Bio::MAGE::DesignElement::DesignElement->new();
}
result (UNIVERSAL::isa($bioassaydatum->getDesignElement,q[Bio::MAGE::DesignElement::DesignElement]));
result ($bioassaydatum->setDesignElement($designelement_assn) == $designelement_assn);
result ($bioassaydatum->getDesignElement() == $designelement_assn);



# test the meta-data for the assoication
($assn) = $assns{designElement};
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
result (UNIVERSAL::isa($bioassaydatum->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaydatum->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaydatum->getPropertySets,'ARRAY')
 and scalar @{$bioassaydatum->getPropertySets()} == 1
 and $bioassaydatum->getPropertySets->[0] == $propertysets_assn);
$bioassaydatum->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaydatum->getPropertySets,'ARRAY')
 and scalar @{$bioassaydatum->getPropertySets()} == 2
 and $bioassaydatum->getPropertySets->[0] == $propertysets_assn
 and $bioassaydatum->getPropertySets->[1] == $propertysets_assn);


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
result ($bioassaydatum->isa(q[Bio::MAGE::Extendable]));

