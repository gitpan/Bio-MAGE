# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ZoneGroup.t'

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
use Bio::MAGE::ArrayDesign::ZoneGroup;
use Bio::MAGE::ArrayDesign::Zone;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::NameValueType;
use Bio::MAGE::ArrayDesign::ZoneLayout;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $zonegroup;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonegroup = Bio::MAGE::ArrayDesign::ZoneGroup->new();
}
result($zonegroup->isa('Bio::MAGE::ArrayDesign::ZoneGroup'));

# test the package class method
result($zonegroup->package() eq q[ArrayDesign]);

# test the class_name class method
result($zonegroup->class_name() eq q[Bio::MAGE::ArrayDesign::ZoneGroup]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonegroup = Bio::MAGE::ArrayDesign::ZoneGroup->new(zonesPerY => 1,
zonesPerX => 2,
spacingsBetweenZonesX => 3,
spacingsBetweenZonesY => 4);
}
# testing attribute zonesPerY
result ($zonegroup->getZonesPerY() == 1);
$zonegroup->setZonesPerY(1);
result ($zonegroup->getZonesPerY() == 1);

# testing attribute zonesPerX
result ($zonegroup->getZonesPerX() == 2);
$zonegroup->setZonesPerX(2);
result ($zonegroup->getZonesPerX() == 2);

# testing attribute spacingsBetweenZonesX
result ($zonegroup->getSpacingsBetweenZonesX() == 3);
$zonegroup->setSpacingsBetweenZonesX(3);
result ($zonegroup->getSpacingsBetweenZonesX() == 3);

# testing attribute spacingsBetweenZonesY
result ($zonegroup->getSpacingsBetweenZonesY() == 4);
$zonegroup->setSpacingsBetweenZonesY(4);
result ($zonegroup->getSpacingsBetweenZonesY() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::ZoneGroup->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonegroup = Bio::MAGE::ArrayDesign::ZoneGroup->new(zoneLayout => Bio::MAGE::ArrayDesign::ZoneLayout->new(),
distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
zoneLocations => [Bio::MAGE::ArrayDesign::Zone->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association zoneLayout
my $zonelayout_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonelayout_assn = Bio::MAGE::ArrayDesign::ZoneLayout->new();
}
result (UNIVERSAL::isa($zonegroup->getZoneLayout,q[Bio::MAGE::ArrayDesign::ZoneLayout]));
result ($zonegroup->setZoneLayout($zonelayout_assn) == $zonelayout_assn);
result ($zonegroup->getZoneLayout() == $zonelayout_assn);



# test the meta-data for the assoication
($assn) = $assns{zoneLayout};
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
# testing association distanceUnit
my $distanceunit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit_assn = Bio::MAGE::Measurement::DistanceUnit->new();
}
result (UNIVERSAL::isa($zonegroup->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($zonegroup->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($zonegroup->getDistanceUnit() == $distanceunit_assn);



# test the meta-data for the assoication
($assn) = $assns{distanceUnit};
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
# testing association zoneLocations
my $zonelocations_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zonelocations_assn = Bio::MAGE::ArrayDesign::Zone->new();
}
result (UNIVERSAL::isa($zonegroup->getZoneLocations->[0],q[Bio::MAGE::ArrayDesign::Zone]));
result ($zonegroup->setZoneLocations([$zonelocations_assn]));
result (UNIVERSAL::isa($zonegroup->getZoneLocations,'ARRAY')
 and scalar @{$zonegroup->getZoneLocations()} == 1
 and $zonegroup->getZoneLocations->[0] == $zonelocations_assn);
$zonegroup->addZoneLocations($zonelocations_assn);
result (UNIVERSAL::isa($zonegroup->getZoneLocations,'ARRAY')
 and scalar @{$zonegroup->getZoneLocations()} == 2
 and $zonegroup->getZoneLocations->[0] == $zonelocations_assn
 and $zonegroup->getZoneLocations->[1] == $zonelocations_assn);


# test the meta-data for the assoication
($assn) = $assns{zoneLocations};
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
result (UNIVERSAL::isa($zonegroup->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($zonegroup->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($zonegroup->getPropertySets,'ARRAY')
 and scalar @{$zonegroup->getPropertySets()} == 1
 and $zonegroup->getPropertySets->[0] == $propertysets_assn);
$zonegroup->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($zonegroup->getPropertySets,'ARRAY')
 and scalar @{$zonegroup->getPropertySets()} == 2
 and $zonegroup->getPropertySets->[0] == $propertysets_assn
 and $zonegroup->getPropertySets->[1] == $propertysets_assn);


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
result ($zonegroup->isa(q[Bio::MAGE::Extendable]));

