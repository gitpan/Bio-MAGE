# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl OntologyEntry.t'

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

BEGIN { $| = 1; print "1..31\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::Description::DatabaseEntry;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $ontologyentry;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $ontologyentry = Bio::MAGE::Description::OntologyEntry->new();
}
result($ontologyentry->isa('Bio::MAGE::Description::OntologyEntry'));

# test the package class method
result($ontologyentry->package() eq q[Description]);

# test the class_name class method
result($ontologyentry->class_name() eq q[Bio::MAGE::Description::OntologyEntry]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $ontologyentry = Bio::MAGE::Description::OntologyEntry->new(value => 1,
description => 2,
category => 3);
}
# testing attribute value
result ($ontologyentry->getValue() == 1);
$ontologyentry->setValue(1);
result ($ontologyentry->getValue() == 1);

# testing attribute description
result ($ontologyentry->getDescription() == 2);
$ontologyentry->setDescription(2);
result ($ontologyentry->getDescription() == 2);

# testing attribute category
result ($ontologyentry->getCategory() == 3);
$ontologyentry->setCategory(3);
result ($ontologyentry->getCategory() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Description::OntologyEntry->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $ontologyentry = Bio::MAGE::Description::OntologyEntry->new(associations => [Bio::MAGE::Description::OntologyEntry->new()],
ontologyReference => Bio::MAGE::Description::DatabaseEntry->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association associations
my $associations_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $associations_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($ontologyentry->getAssociations->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($ontologyentry->setAssociations([$associations_assn]));
result (UNIVERSAL::isa($ontologyentry->getAssociations,'ARRAY')
 and scalar @{$ontologyentry->getAssociations()} == 1
 and $ontologyentry->getAssociations->[0] == $associations_assn);
$ontologyentry->addAssociations($associations_assn);
result (UNIVERSAL::isa($ontologyentry->getAssociations,'ARRAY')
 and scalar @{$ontologyentry->getAssociations()} == 2
 and $ontologyentry->getAssociations->[0] == $associations_assn
 and $ontologyentry->getAssociations->[1] == $associations_assn);


# test the meta-data for the assoication
($assn) = $assns{associations};
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
# testing association ontologyReference
my $ontologyreference_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $ontologyreference_assn = Bio::MAGE::Description::DatabaseEntry->new();
}
result (UNIVERSAL::isa($ontologyentry->getOntologyReference,q[Bio::MAGE::Description::DatabaseEntry]));
result ($ontologyentry->setOntologyReference($ontologyreference_assn) == $ontologyreference_assn);
result ($ontologyentry->getOntologyReference() == $ontologyreference_assn);



# test the meta-data for the assoication
($assn) = $assns{ontologyReference};
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
result (UNIVERSAL::isa($ontologyentry->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($ontologyentry->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($ontologyentry->getPropertySets,'ARRAY')
 and scalar @{$ontologyentry->getPropertySets()} == 1
 and $ontologyentry->getPropertySets->[0] == $propertysets_assn);
$ontologyentry->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($ontologyentry->getPropertySets,'ARRAY')
 and scalar @{$ontologyentry->getPropertySets()} == 2
 and $ontologyentry->getPropertySets->[0] == $propertysets_assn
 and $ontologyentry->getPropertySets->[1] == $propertysets_assn);


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
result ($ontologyentry->isa(q[Bio::MAGE::Extendable]));

