# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureGroup.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..63\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::ArrayDesign::FeatureGroup;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $featuregroup;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuregroup = Bio::MAGE::ArrayDesign::FeatureGroup->new();
}
result($featuregroup->isa('Bio::MAGE::ArrayDesign::FeatureGroup'));

# test the package class method
result($featuregroup->package() eq q[ArrayDesign]);

# test the class_name class method
result($featuregroup->class_name() eq q[Bio::MAGE::ArrayDesign::FeatureGroup]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuregroup = Bio::MAGE::ArrayDesign::FeatureGroup->new(featureLength => 1,
featureWidth => 2,
featureHeight => 3,
identifier => 4,
name => 5);
}
# testing attribute featureLength
result ($featuregroup->getFeatureLength() == 1);
$featuregroup->setFeatureLength(1);
result ($featuregroup->getFeatureLength() == 1);

# testing attribute featureWidth
result ($featuregroup->getFeatureWidth() == 2);
$featuregroup->setFeatureWidth(2);
result ($featuregroup->getFeatureWidth() == 2);

# testing attribute featureHeight
result ($featuregroup->getFeatureHeight() == 3);
$featuregroup->setFeatureHeight(3);
result ($featuregroup->getFeatureHeight() == 3);

# testing attribute identifier
result ($featuregroup->getIdentifier() == 4);
$featuregroup->setIdentifier(4);
result ($featuregroup->getIdentifier() == 4);

# testing attribute name
result ($featuregroup->getName() == 5);
$featuregroup->setName(5);
result ($featuregroup->getName() == 5);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::FeatureGroup->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuregroup = Bio::MAGE::ArrayDesign::FeatureGroup->new(featureShape => Bio::MAGE::Description::OntologyEntry->new(),
features => [Bio::MAGE::DesignElement::Feature->new()],
distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
technologyType => Bio::MAGE::Description::OntologyEntry->new(),
species => Bio::MAGE::Description::OntologyEntry->new(),
types => [Bio::MAGE::Description::OntologyEntry->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association featureShape
my $featureshape_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureshape_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($featuregroup->getFeatureShape,q[Bio::MAGE::Description::OntologyEntry]));
result ($featuregroup->setFeatureShape($featureshape_assn) == $featureshape_assn);
result ($featuregroup->getFeatureShape() == $featureshape_assn);



# test the meta-data for the assoication
($assn) = $assns{featureShape};
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
# testing association features
my $features_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $features_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($featuregroup->getFeatures->[0],q[Bio::MAGE::DesignElement::Feature]));
result ($featuregroup->setFeatures([$features_assn]));
result (UNIVERSAL::isa($featuregroup->getFeatures,'ARRAY')
 and scalar @{$featuregroup->getFeatures()} == 1
 and $featuregroup->getFeatures->[0] == $features_assn);
$featuregroup->addFeatures($features_assn);
result (UNIVERSAL::isa($featuregroup->getFeatures,'ARRAY')
 and scalar @{$featuregroup->getFeatures()} == 2
 and $featuregroup->getFeatures->[0] == $features_assn
 and $featuregroup->getFeatures->[1] == $features_assn);


# test the meta-data for the assoication
($assn) = $assns{features};
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
result (UNIVERSAL::isa($featuregroup->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($featuregroup->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($featuregroup->getDistanceUnit() == $distanceunit_assn);



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
# testing association technologyType
my $technologytype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $technologytype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($featuregroup->getTechnologyType,q[Bio::MAGE::Description::OntologyEntry]));
result ($featuregroup->setTechnologyType($technologytype_assn) == $technologytype_assn);
result ($featuregroup->getTechnologyType() == $technologytype_assn);



# test the meta-data for the assoication
($assn) = $assns{technologyType};
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
# testing association species
my $species_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $species_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($featuregroup->getSpecies,q[Bio::MAGE::Description::OntologyEntry]));
result ($featuregroup->setSpecies($species_assn) == $species_assn);
result ($featuregroup->getSpecies() == $species_assn);



# test the meta-data for the assoication
($assn) = $assns{species};
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
# testing association types
my $types_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $types_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($featuregroup->getTypes->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($featuregroup->setTypes([$types_assn]));
result (UNIVERSAL::isa($featuregroup->getTypes,'ARRAY')
 and scalar @{$featuregroup->getTypes()} == 1
 and $featuregroup->getTypes->[0] == $types_assn);
$featuregroup->addTypes($types_assn);
result (UNIVERSAL::isa($featuregroup->getTypes,'ARRAY')
 and scalar @{$featuregroup->getTypes()} == 2
 and $featuregroup->getTypes->[0] == $types_assn
 and $featuregroup->getTypes->[1] == $types_assn);


# test the meta-data for the assoication
($assn) = $assns{types};
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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($featuregroup->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($featuregroup->setSecurity($security_assn) == $security_assn);
result ($featuregroup->getSecurity() == $security_assn);



# test the meta-data for the assoication
($assn) = $assns{security};
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
# testing association auditTrail
my $audittrail_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audittrail_assn = Bio::MAGE::AuditAndSecurity::Audit->new();
}
result (UNIVERSAL::isa($featuregroup->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($featuregroup->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($featuregroup->getAuditTrail,'ARRAY')
 and scalar @{$featuregroup->getAuditTrail()} == 1
 and $featuregroup->getAuditTrail->[0] == $audittrail_assn);
$featuregroup->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($featuregroup->getAuditTrail,'ARRAY')
 and scalar @{$featuregroup->getAuditTrail()} == 2
 and $featuregroup->getAuditTrail->[0] == $audittrail_assn
 and $featuregroup->getAuditTrail->[1] == $audittrail_assn);


# test the meta-data for the assoication
($assn) = $assns{auditTrail};
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
# testing association descriptions
my $descriptions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $descriptions_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($featuregroup->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($featuregroup->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($featuregroup->getDescriptions,'ARRAY')
 and scalar @{$featuregroup->getDescriptions()} == 1
 and $featuregroup->getDescriptions->[0] == $descriptions_assn);
$featuregroup->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($featuregroup->getDescriptions,'ARRAY')
 and scalar @{$featuregroup->getDescriptions()} == 2
 and $featuregroup->getDescriptions->[0] == $descriptions_assn
 and $featuregroup->getDescriptions->[1] == $descriptions_assn);


# test the meta-data for the assoication
($assn) = $assns{descriptions};
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
result (UNIVERSAL::isa($featuregroup->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($featuregroup->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($featuregroup->getPropertySets,'ARRAY')
 and scalar @{$featuregroup->getPropertySets()} == 1
 and $featuregroup->getPropertySets->[0] == $propertysets_assn);
$featuregroup->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($featuregroup->getPropertySets,'ARRAY')
 and scalar @{$featuregroup->getPropertySets()} == 2
 and $featuregroup->getPropertySets->[0] == $propertysets_assn
 and $featuregroup->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::ArrayDesign::DesignElementGroup
result ($featuregroup->isa(q[Bio::MAGE::ArrayDesign::DesignElementGroup]));

# testing superclass Bio::MAGE::Identifiable
result ($featuregroup->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($featuregroup->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($featuregroup->isa(q[Bio::MAGE::Extendable]));

