# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ManufactureLIMS.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..40\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Array::ManufactureLIMS;
use Bio::MAGE::BioMaterial::BioMaterial;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Array::ManufactureLIMSBiomaterial;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Description::DatabaseEntry;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $manufacturelims;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $manufacturelims = Bio::MAGE::Array::ManufactureLIMS->new();
}
result($manufacturelims->isa('Bio::MAGE::Array::ManufactureLIMS'));

# test the package class method
result($manufacturelims->package() eq q[Array]);

# test the class_name class method
result($manufacturelims->class_name() eq q[Bio::MAGE::Array::ManufactureLIMS]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $manufacturelims = Bio::MAGE::Array::ManufactureLIMS->new(quality => 1);
}
# testing attribute quality
result ($manufacturelims->getQuality() == 1);
$manufacturelims->setQuality(1);
result ($manufacturelims->getQuality() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::ManufactureLIMS->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $manufacturelims = Bio::MAGE::Array::ManufactureLIMS->new(feature => Bio::MAGE::DesignElement::Feature->new(),
identifierLIMS => Bio::MAGE::Description::DatabaseEntry->new(),
bioMaterial => Bio::MAGE::BioMaterial::BioMaterial->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association feature
my $feature_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $feature_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($manufacturelims->getFeature,q[Bio::MAGE::DesignElement::Feature]));
result ($manufacturelims->setFeature($feature_assn) == $feature_assn);
result ($manufacturelims->getFeature() == $feature_assn);



# test the meta-data for the assoication
($assn) = $assns{feature};
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
# testing association identifierLIMS
my $identifierlims_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $identifierlims_assn = Bio::MAGE::Description::DatabaseEntry->new();
}
result (UNIVERSAL::isa($manufacturelims->getIdentifierLIMS,q[Bio::MAGE::Description::DatabaseEntry]));
result ($manufacturelims->setIdentifierLIMS($identifierlims_assn) == $identifierlims_assn);
result ($manufacturelims->getIdentifierLIMS() == $identifierlims_assn);



# test the meta-data for the assoication
($assn) = $assns{identifierLIMS};
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
# testing association bioMaterial
my $biomaterial_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterial_assn = Bio::MAGE::BioMaterial::BioMaterial->new();
}
result (UNIVERSAL::isa($manufacturelims->getBioMaterial,q[Bio::MAGE::BioMaterial::BioMaterial]));
result ($manufacturelims->setBioMaterial($biomaterial_assn) == $biomaterial_assn);
result ($manufacturelims->getBioMaterial() == $biomaterial_assn);



# test the meta-data for the assoication
($assn) = $assns{bioMaterial};
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
result (UNIVERSAL::isa($manufacturelims->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($manufacturelims->setSecurity($security_assn) == $security_assn);
result ($manufacturelims->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($manufacturelims->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($manufacturelims->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($manufacturelims->getAuditTrail,'ARRAY')
 and scalar @{$manufacturelims->getAuditTrail()} == 1
 and $manufacturelims->getAuditTrail->[0] == $audittrail_assn);
$manufacturelims->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($manufacturelims->getAuditTrail,'ARRAY')
 and scalar @{$manufacturelims->getAuditTrail()} == 2
 and $manufacturelims->getAuditTrail->[0] == $audittrail_assn
 and $manufacturelims->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($manufacturelims->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($manufacturelims->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($manufacturelims->getDescriptions,'ARRAY')
 and scalar @{$manufacturelims->getDescriptions()} == 1
 and $manufacturelims->getDescriptions->[0] == $descriptions_assn);
$manufacturelims->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($manufacturelims->getDescriptions,'ARRAY')
 and scalar @{$manufacturelims->getDescriptions()} == 2
 and $manufacturelims->getDescriptions->[0] == $descriptions_assn
 and $manufacturelims->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($manufacturelims->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($manufacturelims->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($manufacturelims->getPropertySets,'ARRAY')
 and scalar @{$manufacturelims->getPropertySets()} == 1
 and $manufacturelims->getPropertySets->[0] == $propertysets_assn);
$manufacturelims->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($manufacturelims->getPropertySets,'ARRAY')
 and scalar @{$manufacturelims->getPropertySets()} == 2
 and $manufacturelims->getPropertySets->[0] == $propertysets_assn
 and $manufacturelims->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $manufacturelimsbiomaterial = Bio::MAGE::Array::ManufactureLIMSBiomaterial->new();

  # testing subclass ManufactureLIMSBiomaterial
  result ($manufacturelimsbiomaterial->isa(q[Bio::MAGE::Array::ManufactureLIMSBiomaterial]));

}
# testing superclass Bio::MAGE::Describable
result ($manufacturelims->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($manufacturelims->isa(q[Bio::MAGE::Extendable]));

