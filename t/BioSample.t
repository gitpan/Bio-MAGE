# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioSample.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..54\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioMaterial::BioSample;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioMaterial::Treatment;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biosample;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosample = Bio::MAGE::BioMaterial::BioSample->new();
}
result($biosample->isa('Bio::MAGE::BioMaterial::BioSample'));

# test the package class method
result($biosample->package() eq q[BioMaterial]);

# test the class_name class method
result($biosample->class_name() eq q[Bio::MAGE::BioMaterial::BioSample]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosample = Bio::MAGE::BioMaterial::BioSample->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($biosample->getIdentifier() == 1);
$biosample->setIdentifier(1);
result ($biosample->getIdentifier() == 1);

# testing attribute name
result ($biosample->getName() == 2);
$biosample->setName(2);
result ($biosample->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::BioSample->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosample = Bio::MAGE::BioMaterial::BioSample->new(type => Bio::MAGE::Description::OntologyEntry->new(),
treatments => [Bio::MAGE::BioMaterial::Treatment->new()],
materialType => Bio::MAGE::Description::OntologyEntry->new(),
characteristics => [Bio::MAGE::Description::OntologyEntry->new()],
qualityControlStatistics => [Bio::MAGE::NameValueType->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association type
my $type_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $type_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biosample->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($biosample->setType($type_assn) == $type_assn);
result ($biosample->getType() == $type_assn);



# test the meta-data for the assoication
($assn) = $assns{type};
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
# testing association treatments
my $treatments_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $treatments_assn = Bio::MAGE::BioMaterial::Treatment->new();
}
result (UNIVERSAL::isa($biosample->getTreatments->[0],q[Bio::MAGE::BioMaterial::Treatment]));
result ($biosample->setTreatments([$treatments_assn]));
result (UNIVERSAL::isa($biosample->getTreatments,'ARRAY')
 and scalar @{$biosample->getTreatments()} == 1
 and $biosample->getTreatments->[0] == $treatments_assn);
$biosample->addTreatments($treatments_assn);
result (UNIVERSAL::isa($biosample->getTreatments,'ARRAY')
 and scalar @{$biosample->getTreatments()} == 2
 and $biosample->getTreatments->[0] == $treatments_assn
 and $biosample->getTreatments->[1] == $treatments_assn);


# test the meta-data for the assoication
($assn) = $assns{treatments};
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
# testing association materialType
my $materialtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $materialtype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biosample->getMaterialType,q[Bio::MAGE::Description::OntologyEntry]));
result ($biosample->setMaterialType($materialtype_assn) == $materialtype_assn);
result ($biosample->getMaterialType() == $materialtype_assn);



# test the meta-data for the assoication
($assn) = $assns{materialType};
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
# testing association characteristics
my $characteristics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $characteristics_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biosample->getCharacteristics->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($biosample->setCharacteristics([$characteristics_assn]));
result (UNIVERSAL::isa($biosample->getCharacteristics,'ARRAY')
 and scalar @{$biosample->getCharacteristics()} == 1
 and $biosample->getCharacteristics->[0] == $characteristics_assn);
$biosample->addCharacteristics($characteristics_assn);
result (UNIVERSAL::isa($biosample->getCharacteristics,'ARRAY')
 and scalar @{$biosample->getCharacteristics()} == 2
 and $biosample->getCharacteristics->[0] == $characteristics_assn
 and $biosample->getCharacteristics->[1] == $characteristics_assn);


# test the meta-data for the assoication
($assn) = $assns{characteristics};
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
# testing association qualityControlStatistics
my $qualitycontrolstatistics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $qualitycontrolstatistics_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($biosample->getQualityControlStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($biosample->setQualityControlStatistics([$qualitycontrolstatistics_assn]));
result (UNIVERSAL::isa($biosample->getQualityControlStatistics,'ARRAY')
 and scalar @{$biosample->getQualityControlStatistics()} == 1
 and $biosample->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn);
$biosample->addQualityControlStatistics($qualitycontrolstatistics_assn);
result (UNIVERSAL::isa($biosample->getQualityControlStatistics,'ARRAY')
 and scalar @{$biosample->getQualityControlStatistics()} == 2
 and $biosample->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn
 and $biosample->getQualityControlStatistics->[1] == $qualitycontrolstatistics_assn);


# test the meta-data for the assoication
($assn) = $assns{qualityControlStatistics};
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
result (UNIVERSAL::isa($biosample->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($biosample->setSecurity($security_assn) == $security_assn);
result ($biosample->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($biosample->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($biosample->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($biosample->getAuditTrail,'ARRAY')
 and scalar @{$biosample->getAuditTrail()} == 1
 and $biosample->getAuditTrail->[0] == $audittrail_assn);
$biosample->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($biosample->getAuditTrail,'ARRAY')
 and scalar @{$biosample->getAuditTrail()} == 2
 and $biosample->getAuditTrail->[0] == $audittrail_assn
 and $biosample->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($biosample->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($biosample->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($biosample->getDescriptions,'ARRAY')
 and scalar @{$biosample->getDescriptions()} == 1
 and $biosample->getDescriptions->[0] == $descriptions_assn);
$biosample->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($biosample->getDescriptions,'ARRAY')
 and scalar @{$biosample->getDescriptions()} == 2
 and $biosample->getDescriptions->[0] == $descriptions_assn
 and $biosample->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($biosample->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biosample->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biosample->getPropertySets,'ARRAY')
 and scalar @{$biosample->getPropertySets()} == 1
 and $biosample->getPropertySets->[0] == $propertysets_assn);
$biosample->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biosample->getPropertySets,'ARRAY')
 and scalar @{$biosample->getPropertySets()} == 2
 and $biosample->getPropertySets->[0] == $propertysets_assn
 and $biosample->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioMaterial::BioMaterial
result ($biosample->isa(q[Bio::MAGE::BioMaterial::BioMaterial]));

# testing superclass Bio::MAGE::Identifiable
result ($biosample->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($biosample->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($biosample->isa(q[Bio::MAGE::Extendable]));

