# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Unit.t'

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

BEGIN { $| = 1; print "1..21\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Measurement::Unit;
use Bio::MAGE::Measurement::TemperatureUnit;
use Bio::MAGE::Measurement::ConcentrationUnit;
use Bio::MAGE::Measurement::VolumeUnit;
use Bio::MAGE::Measurement::MassUnit;
use Bio::MAGE::Measurement::TimeUnit;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::Measurement::QuantityUnit;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $unit;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $unit = Bio::MAGE::Measurement::Unit->new();
}
result($unit->isa('Bio::MAGE::Measurement::Unit'));

# test the package class method
result($unit->package() eq q[Measurement]);

# test the class_name class method
result($unit->class_name() eq q[Bio::MAGE::Measurement::Unit]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $unit = Bio::MAGE::Measurement::Unit->new(unitName => 1);
}
# testing attribute unitName
result ($unit->getUnitName() == 1);
$unit->setUnitName(1);
result ($unit->getUnitName() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Measurement::Unit->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $unit = Bio::MAGE::Measurement::Unit->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($unit->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($unit->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($unit->getPropertySets,'ARRAY')
 and scalar @{$unit->getPropertySets()} == 1
 and $unit->getPropertySets->[0] == $propertysets_assn);
$unit->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($unit->getPropertySets,'ARRAY')
 and scalar @{$unit->getPropertySets()} == 2
 and $unit->getPropertySets->[0] == $propertysets_assn
 and $unit->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $temperatureunit = Bio::MAGE::Measurement::TemperatureUnit->new();

  # testing subclass TemperatureUnit
  result ($temperatureunit->isa(q[Bio::MAGE::Measurement::TemperatureUnit]));

  # create a subclass
  my $distanceunit = Bio::MAGE::Measurement::DistanceUnit->new();

  # testing subclass DistanceUnit
  result ($distanceunit->isa(q[Bio::MAGE::Measurement::DistanceUnit]));

  # create a subclass
  my $quantityunit = Bio::MAGE::Measurement::QuantityUnit->new();

  # testing subclass QuantityUnit
  result ($quantityunit->isa(q[Bio::MAGE::Measurement::QuantityUnit]));

  # create a subclass
  my $massunit = Bio::MAGE::Measurement::MassUnit->new();

  # testing subclass MassUnit
  result ($massunit->isa(q[Bio::MAGE::Measurement::MassUnit]));

  # create a subclass
  my $concentrationunit = Bio::MAGE::Measurement::ConcentrationUnit->new();

  # testing subclass ConcentrationUnit
  result ($concentrationunit->isa(q[Bio::MAGE::Measurement::ConcentrationUnit]));

  # create a subclass
  my $timeunit = Bio::MAGE::Measurement::TimeUnit->new();

  # testing subclass TimeUnit
  result ($timeunit->isa(q[Bio::MAGE::Measurement::TimeUnit]));

  # create a subclass
  my $volumeunit = Bio::MAGE::Measurement::VolumeUnit->new();

  # testing subclass VolumeUnit
  result ($volumeunit->isa(q[Bio::MAGE::Measurement::VolumeUnit]));

}
# testing superclass Bio::MAGE::Extendable
result ($unit->isa(q[Bio::MAGE::Extendable]));

