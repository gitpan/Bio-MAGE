# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioSource.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..55\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioMaterial::BioSource;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::BioMaterial::Treatment;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biosource;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosource = Bio::MAGE::BioMaterial::BioSource->new();
}
result($biosource->isa('Bio::MAGE::BioMaterial::BioSource'));

# test the package class method
result($biosource->package() eq q[BioMaterial]);

# test the class_name class method
result($biosource->class_name() eq q[Bio::MAGE::BioMaterial::BioSource]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosource = Bio::MAGE::BioMaterial::BioSource->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($biosource->getIdentifier() == 1);
$biosource->setIdentifier(1);
result ($biosource->getIdentifier() == 1);

# testing attribute name
result ($biosource->getName() == 2);
$biosource->setName(2);
result ($biosource->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::BioSource->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosource = Bio::MAGE::BioMaterial::BioSource->new(sourceContact => [Bio::MAGE::AuditAndSecurity::Contact->new()],
treatments => [Bio::MAGE::BioMaterial::Treatment->new()],
materialType => Bio::MAGE::Description::OntologyEntry->new(),
characteristics => [Bio::MAGE::Description::OntologyEntry->new()],
qualityControlStatistics => [Bio::MAGE::NameValueType->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association sourceContact
my $sourcecontact_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sourcecontact_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($biosource->getSourceContact->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($biosource->setSourceContact([$sourcecontact_assn]));
result (UNIVERSAL::isa($biosource->getSourceContact,'ARRAY')
 and scalar @{$biosource->getSourceContact()} == 1
 and $biosource->getSourceContact->[0] == $sourcecontact_assn);
$biosource->addSourceContact($sourcecontact_assn);
result (UNIVERSAL::isa($biosource->getSourceContact,'ARRAY')
 and scalar @{$biosource->getSourceContact()} == 2
 and $biosource->getSourceContact->[0] == $sourcecontact_assn
 and $biosource->getSourceContact->[1] == $sourcecontact_assn);


# test the meta-data for the assoication
($assn) = $assns{sourceContact};
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
result (UNIVERSAL::isa($biosource->getTreatments->[0],q[Bio::MAGE::BioMaterial::Treatment]));
result ($biosource->setTreatments([$treatments_assn]));
result (UNIVERSAL::isa($biosource->getTreatments,'ARRAY')
 and scalar @{$biosource->getTreatments()} == 1
 and $biosource->getTreatments->[0] == $treatments_assn);
$biosource->addTreatments($treatments_assn);
result (UNIVERSAL::isa($biosource->getTreatments,'ARRAY')
 and scalar @{$biosource->getTreatments()} == 2
 and $biosource->getTreatments->[0] == $treatments_assn
 and $biosource->getTreatments->[1] == $treatments_assn);


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
result (UNIVERSAL::isa($biosource->getMaterialType,q[Bio::MAGE::Description::OntologyEntry]));
result ($biosource->setMaterialType($materialtype_assn) == $materialtype_assn);
result ($biosource->getMaterialType() == $materialtype_assn);



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
result (UNIVERSAL::isa($biosource->getCharacteristics->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($biosource->setCharacteristics([$characteristics_assn]));
result (UNIVERSAL::isa($biosource->getCharacteristics,'ARRAY')
 and scalar @{$biosource->getCharacteristics()} == 1
 and $biosource->getCharacteristics->[0] == $characteristics_assn);
$biosource->addCharacteristics($characteristics_assn);
result (UNIVERSAL::isa($biosource->getCharacteristics,'ARRAY')
 and scalar @{$biosource->getCharacteristics()} == 2
 and $biosource->getCharacteristics->[0] == $characteristics_assn
 and $biosource->getCharacteristics->[1] == $characteristics_assn);


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
result (UNIVERSAL::isa($biosource->getQualityControlStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($biosource->setQualityControlStatistics([$qualitycontrolstatistics_assn]));
result (UNIVERSAL::isa($biosource->getQualityControlStatistics,'ARRAY')
 and scalar @{$biosource->getQualityControlStatistics()} == 1
 and $biosource->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn);
$biosource->addQualityControlStatistics($qualitycontrolstatistics_assn);
result (UNIVERSAL::isa($biosource->getQualityControlStatistics,'ARRAY')
 and scalar @{$biosource->getQualityControlStatistics()} == 2
 and $biosource->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn
 and $biosource->getQualityControlStatistics->[1] == $qualitycontrolstatistics_assn);


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
result (UNIVERSAL::isa($biosource->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($biosource->setSecurity($security_assn) == $security_assn);
result ($biosource->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($biosource->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($biosource->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($biosource->getAuditTrail,'ARRAY')
 and scalar @{$biosource->getAuditTrail()} == 1
 and $biosource->getAuditTrail->[0] == $audittrail_assn);
$biosource->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($biosource->getAuditTrail,'ARRAY')
 and scalar @{$biosource->getAuditTrail()} == 2
 and $biosource->getAuditTrail->[0] == $audittrail_assn
 and $biosource->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($biosource->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($biosource->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($biosource->getDescriptions,'ARRAY')
 and scalar @{$biosource->getDescriptions()} == 1
 and $biosource->getDescriptions->[0] == $descriptions_assn);
$biosource->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($biosource->getDescriptions,'ARRAY')
 and scalar @{$biosource->getDescriptions()} == 2
 and $biosource->getDescriptions->[0] == $descriptions_assn
 and $biosource->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($biosource->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biosource->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biosource->getPropertySets,'ARRAY')
 and scalar @{$biosource->getPropertySets()} == 1
 and $biosource->getPropertySets->[0] == $propertysets_assn);
$biosource->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biosource->getPropertySets,'ARRAY')
 and scalar @{$biosource->getPropertySets()} == 2
 and $biosource->getPropertySets->[0] == $propertysets_assn
 and $biosource->getPropertySets->[1] == $propertysets_assn);


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
result ($biosource->isa(q[Bio::MAGE::BioMaterial::BioMaterial]));

# testing superclass Bio::MAGE::Identifiable
result ($biosource->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($biosource->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($biosource->isa(q[Bio::MAGE::Extendable]));

