# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Feature.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..61\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::DesignElement::Position;
use Bio::MAGE::ArrayDesign::FeatureGroup;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::ArrayDesign::Zone;
use Bio::MAGE::DesignElement::FeatureLocation;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $feature;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $feature = Bio::MAGE::DesignElement::Feature->new();
}
result($feature->isa('Bio::MAGE::DesignElement::Feature'));

# test the package class method
result($feature->package() eq q[DesignElement]);

# test the class_name class method
result($feature->class_name() eq q[Bio::MAGE::DesignElement::Feature]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $feature = Bio::MAGE::DesignElement::Feature->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($feature->getIdentifier() == 1);
$feature->setIdentifier(1);
result ($feature->getIdentifier() == 1);

# testing attribute name
result ($feature->getName() == 2);
$feature->setName(2);
result ($feature->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::Feature->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $feature = Bio::MAGE::DesignElement::Feature->new(controlledFeatures => [Bio::MAGE::DesignElement::Feature->new()],
zone => Bio::MAGE::ArrayDesign::Zone->new(),
position => Bio::MAGE::DesignElement::Position->new(),
featureGroup => Bio::MAGE::ArrayDesign::FeatureGroup->new(),
featureLocation => Bio::MAGE::DesignElement::FeatureLocation->new(),
controlFeatures => [Bio::MAGE::DesignElement::Feature->new()],
controlType => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association controlledFeatures
my $controlledfeatures_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $controlledfeatures_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($feature->getControlledFeatures->[0],q[Bio::MAGE::DesignElement::Feature]));
result ($feature->setControlledFeatures([$controlledfeatures_assn]));
result (UNIVERSAL::isa($feature->getControlledFeatures,'ARRAY')
 and scalar @{$feature->getControlledFeatures()} == 1
 and $feature->getControlledFeatures->[0] == $controlledfeatures_assn);
$feature->addControlledFeatures($controlledfeatures_assn);
result (UNIVERSAL::isa($feature->getControlledFeatures,'ARRAY')
 and scalar @{$feature->getControlledFeatures()} == 2
 and $feature->getControlledFeatures->[0] == $controlledfeatures_assn
 and $feature->getControlledFeatures->[1] == $controlledfeatures_assn);


# test the meta-data for the assoication
($assn) = $assns{controlledFeatures};
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
# testing association zone
my $zone_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $zone_assn = Bio::MAGE::ArrayDesign::Zone->new();
}
result (UNIVERSAL::isa($feature->getZone,q[Bio::MAGE::ArrayDesign::Zone]));
result ($feature->setZone($zone_assn) == $zone_assn);
result ($feature->getZone() == $zone_assn);



# test the meta-data for the assoication
($assn) = $assns{zone};
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
# testing association position
my $position_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $position_assn = Bio::MAGE::DesignElement::Position->new();
}
result (UNIVERSAL::isa($feature->getPosition,q[Bio::MAGE::DesignElement::Position]));
result ($feature->setPosition($position_assn) == $position_assn);
result ($feature->getPosition() == $position_assn);



# test the meta-data for the assoication
($assn) = $assns{position};
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
# testing association featureGroup
my $featuregroup_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuregroup_assn = Bio::MAGE::ArrayDesign::FeatureGroup->new();
}
result (UNIVERSAL::isa($feature->getFeatureGroup,q[Bio::MAGE::ArrayDesign::FeatureGroup]));
result ($feature->setFeatureGroup($featuregroup_assn) == $featuregroup_assn);
result ($feature->getFeatureGroup() == $featuregroup_assn);



# test the meta-data for the assoication
($assn) = $assns{featureGroup};
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
# testing association featureLocation
my $featurelocation_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurelocation_assn = Bio::MAGE::DesignElement::FeatureLocation->new();
}
result (UNIVERSAL::isa($feature->getFeatureLocation,q[Bio::MAGE::DesignElement::FeatureLocation]));
result ($feature->setFeatureLocation($featurelocation_assn) == $featurelocation_assn);
result ($feature->getFeatureLocation() == $featurelocation_assn);



# test the meta-data for the assoication
($assn) = $assns{featureLocation};
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
# testing association controlFeatures
my $controlfeatures_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $controlfeatures_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($feature->getControlFeatures->[0],q[Bio::MAGE::DesignElement::Feature]));
result ($feature->setControlFeatures([$controlfeatures_assn]));
result (UNIVERSAL::isa($feature->getControlFeatures,'ARRAY')
 and scalar @{$feature->getControlFeatures()} == 1
 and $feature->getControlFeatures->[0] == $controlfeatures_assn);
$feature->addControlFeatures($controlfeatures_assn);
result (UNIVERSAL::isa($feature->getControlFeatures,'ARRAY')
 and scalar @{$feature->getControlFeatures()} == 2
 and $feature->getControlFeatures->[0] == $controlfeatures_assn
 and $feature->getControlFeatures->[1] == $controlfeatures_assn);


# test the meta-data for the assoication
($assn) = $assns{controlFeatures};
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
# testing association controlType
my $controltype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $controltype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($feature->getControlType,q[Bio::MAGE::Description::OntologyEntry]));
result ($feature->setControlType($controltype_assn) == $controltype_assn);
result ($feature->getControlType() == $controltype_assn);



# test the meta-data for the assoication
($assn) = $assns{controlType};
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
result (UNIVERSAL::isa($feature->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($feature->setSecurity($security_assn) == $security_assn);
result ($feature->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($feature->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($feature->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($feature->getAuditTrail,'ARRAY')
 and scalar @{$feature->getAuditTrail()} == 1
 and $feature->getAuditTrail->[0] == $audittrail_assn);
$feature->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($feature->getAuditTrail,'ARRAY')
 and scalar @{$feature->getAuditTrail()} == 2
 and $feature->getAuditTrail->[0] == $audittrail_assn
 and $feature->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($feature->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($feature->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($feature->getDescriptions,'ARRAY')
 and scalar @{$feature->getDescriptions()} == 1
 and $feature->getDescriptions->[0] == $descriptions_assn);
$feature->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($feature->getDescriptions,'ARRAY')
 and scalar @{$feature->getDescriptions()} == 2
 and $feature->getDescriptions->[0] == $descriptions_assn
 and $feature->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($feature->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($feature->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($feature->getPropertySets,'ARRAY')
 and scalar @{$feature->getPropertySets()} == 1
 and $feature->getPropertySets->[0] == $propertysets_assn);
$feature->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($feature->getPropertySets,'ARRAY')
 and scalar @{$feature->getPropertySets()} == 2
 and $feature->getPropertySets->[0] == $propertysets_assn
 and $feature->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::DesignElement::DesignElement
result ($feature->isa(q[Bio::MAGE::DesignElement::DesignElement]));

# testing superclass Bio::MAGE::Identifiable
result ($feature->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($feature->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($feature->isa(q[Bio::MAGE::Extendable]));

