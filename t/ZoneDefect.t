# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ZoneDefect.t'

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

BEGIN { $| = 1; print "1..30\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Array::ZoneDefect;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::Array::PositionDelta;
use Bio::MAGE::NameValueType;
use Bio::MAGE::ArrayDesign::Zone;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $zonedefect;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonedefect = Bio::MAGE::Array::ZoneDefect->new();
}
result($zonedefect->isa('Bio::MAGE::Array::ZoneDefect'));

# test the package class method
result($zonedefect->package() eq q[Array]);

# test the class_name class method
result($zonedefect->class_name() eq q[Bio::MAGE::Array::ZoneDefect]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::ZoneDefect->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonedefect = Bio::MAGE::Array::ZoneDefect->new(positionDelta => Bio::MAGE::Array::PositionDelta->new(),
defectType => Bio::MAGE::Description::OntologyEntry->new(),
zone => Bio::MAGE::ArrayDesign::Zone->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association positionDelta
my $positiondelta_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $positiondelta_assn = Bio::MAGE::Array::PositionDelta->new();
}
result (UNIVERSAL::isa($zonedefect->getPositionDelta,q[Bio::MAGE::Array::PositionDelta]));
result ($zonedefect->setPositionDelta($positiondelta_assn) == $positiondelta_assn);
result ($zonedefect->getPositionDelta() == $positiondelta_assn);



# test the meta-data for the assoication
($assn) = $assns{positionDelta};
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
# testing association defectType
my $defecttype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $defecttype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($zonedefect->getDefectType,q[Bio::MAGE::Description::OntologyEntry]));
result ($zonedefect->setDefectType($defecttype_assn) == $defecttype_assn);
result ($zonedefect->getDefectType() == $defecttype_assn);



# test the meta-data for the assoication
($assn) = $assns{defectType};
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
# testing association zone
my $zone_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zone_assn = Bio::MAGE::ArrayDesign::Zone->new();
}
result (UNIVERSAL::isa($zonedefect->getZone,q[Bio::MAGE::ArrayDesign::Zone]));
result ($zonedefect->setZone($zone_assn) == $zone_assn);
result ($zonedefect->getZone() == $zone_assn);



# test the meta-data for the assoication
($assn) = $assns{zone};
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
result (UNIVERSAL::isa($zonedefect->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($zonedefect->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($zonedefect->getPropertySets,'ARRAY')
 and scalar @{$zonedefect->getPropertySets()} == 1
 and $zonedefect->getPropertySets->[0] == $propertysets_assn);
$zonedefect->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($zonedefect->getPropertySets,'ARRAY')
 and scalar @{$zonedefect->getPropertySets()} == 2
 and $zonedefect->getPropertySets->[0] == $propertysets_assn
 and $zonedefect->getPropertySets->[1] == $propertysets_assn);


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
result ($zonedefect->isa(q[Bio::MAGE::Extendable]));

