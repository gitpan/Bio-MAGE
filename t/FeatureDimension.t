# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureDimension.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..36\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::FeatureDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $featuredimension;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuredimension = Bio::MAGE::BioAssayData::FeatureDimension->new();
}
result($featuredimension->isa('Bio::MAGE::BioAssayData::FeatureDimension'));

# test the package class method
result($featuredimension->package() eq q[BioAssayData]);

# test the class_name class method
result($featuredimension->class_name() eq q[Bio::MAGE::BioAssayData::FeatureDimension]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuredimension = Bio::MAGE::BioAssayData::FeatureDimension->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($featuredimension->getIdentifier() == 1);
$featuredimension->setIdentifier(1);
result ($featuredimension->getIdentifier() == 1);

# testing attribute name
result ($featuredimension->getName() == 2);
$featuredimension->setName(2);
result ($featuredimension->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::FeatureDimension->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featuredimension = Bio::MAGE::BioAssayData::FeatureDimension->new(containedFeatures => [Bio::MAGE::DesignElement::Feature->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association containedFeatures
my $containedfeatures_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $containedfeatures_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($featuredimension->getContainedFeatures->[0],q[Bio::MAGE::DesignElement::Feature]));
result ($featuredimension->setContainedFeatures([$containedfeatures_assn]));
result (UNIVERSAL::isa($featuredimension->getContainedFeatures,'ARRAY')
 and scalar @{$featuredimension->getContainedFeatures()} == 1
 and $featuredimension->getContainedFeatures->[0] == $containedfeatures_assn);
$featuredimension->addContainedFeatures($containedfeatures_assn);
result (UNIVERSAL::isa($featuredimension->getContainedFeatures,'ARRAY')
 and scalar @{$featuredimension->getContainedFeatures()} == 2
 and $featuredimension->getContainedFeatures->[0] == $containedfeatures_assn
 and $featuredimension->getContainedFeatures->[1] == $containedfeatures_assn);


# test the meta-data for the assoication
($assn) = $assns{containedFeatures};
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
result (UNIVERSAL::isa($featuredimension->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($featuredimension->setSecurity($security_assn) == $security_assn);
result ($featuredimension->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($featuredimension->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($featuredimension->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($featuredimension->getAuditTrail,'ARRAY')
 and scalar @{$featuredimension->getAuditTrail()} == 1
 and $featuredimension->getAuditTrail->[0] == $audittrail_assn);
$featuredimension->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($featuredimension->getAuditTrail,'ARRAY')
 and scalar @{$featuredimension->getAuditTrail()} == 2
 and $featuredimension->getAuditTrail->[0] == $audittrail_assn
 and $featuredimension->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($featuredimension->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($featuredimension->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($featuredimension->getDescriptions,'ARRAY')
 and scalar @{$featuredimension->getDescriptions()} == 1
 and $featuredimension->getDescriptions->[0] == $descriptions_assn);
$featuredimension->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($featuredimension->getDescriptions,'ARRAY')
 and scalar @{$featuredimension->getDescriptions()} == 2
 and $featuredimension->getDescriptions->[0] == $descriptions_assn
 and $featuredimension->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($featuredimension->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($featuredimension->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($featuredimension->getPropertySets,'ARRAY')
 and scalar @{$featuredimension->getPropertySets()} == 1
 and $featuredimension->getPropertySets->[0] == $propertysets_assn);
$featuredimension->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($featuredimension->getPropertySets,'ARRAY')
 and scalar @{$featuredimension->getPropertySets()} == 2
 and $featuredimension->getPropertySets->[0] == $propertysets_assn
 and $featuredimension->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssayData::DesignElementDimension
result ($featuredimension->isa(q[Bio::MAGE::BioAssayData::DesignElementDimension]));

# testing superclass Bio::MAGE::Identifiable
result ($featuredimension->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($featuredimension->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($featuredimension->isa(q[Bio::MAGE::Extendable]));

