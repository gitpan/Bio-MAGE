# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioMaterial.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..52\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioMaterial::BioMaterial;
use Bio::MAGE::BioMaterial::LabeledExtract;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::BioMaterial::BioSource;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioMaterial::Treatment;
use Bio::MAGE::BioMaterial::BioSample;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biomaterial;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterial = Bio::MAGE::BioMaterial::BioMaterial->new();
}
result($biomaterial->isa('Bio::MAGE::BioMaterial::BioMaterial'));

# test the package class method
result($biomaterial->package() eq q[BioMaterial]);

# test the class_name class method
result($biomaterial->class_name() eq q[Bio::MAGE::BioMaterial::BioMaterial]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterial = Bio::MAGE::BioMaterial::BioMaterial->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($biomaterial->getIdentifier() == 1);
$biomaterial->setIdentifier(1);
result ($biomaterial->getIdentifier() == 1);

# testing attribute name
result ($biomaterial->getName() == 2);
$biomaterial->setName(2);
result ($biomaterial->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::BioMaterial->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterial = Bio::MAGE::BioMaterial::BioMaterial->new(characteristics => [Bio::MAGE::Description::OntologyEntry->new()],
treatments => [Bio::MAGE::BioMaterial::Treatment->new()],
qualityControlStatistics => [Bio::MAGE::NameValueType->new()],
materialType => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association characteristics
my $characteristics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $characteristics_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biomaterial->getCharacteristics->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($biomaterial->setCharacteristics([$characteristics_assn]));
result (UNIVERSAL::isa($biomaterial->getCharacteristics,'ARRAY')
 and scalar @{$biomaterial->getCharacteristics()} == 1
 and $biomaterial->getCharacteristics->[0] == $characteristics_assn);
$biomaterial->addCharacteristics($characteristics_assn);
result (UNIVERSAL::isa($biomaterial->getCharacteristics,'ARRAY')
 and scalar @{$biomaterial->getCharacteristics()} == 2
 and $biomaterial->getCharacteristics->[0] == $characteristics_assn
 and $biomaterial->getCharacteristics->[1] == $characteristics_assn);


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
# testing association treatments
my $treatments_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $treatments_assn = Bio::MAGE::BioMaterial::Treatment->new();
}
result (UNIVERSAL::isa($biomaterial->getTreatments->[0],q[Bio::MAGE::BioMaterial::Treatment]));
result ($biomaterial->setTreatments([$treatments_assn]));
result (UNIVERSAL::isa($biomaterial->getTreatments,'ARRAY')
 and scalar @{$biomaterial->getTreatments()} == 1
 and $biomaterial->getTreatments->[0] == $treatments_assn);
$biomaterial->addTreatments($treatments_assn);
result (UNIVERSAL::isa($biomaterial->getTreatments,'ARRAY')
 and scalar @{$biomaterial->getTreatments()} == 2
 and $biomaterial->getTreatments->[0] == $treatments_assn
 and $biomaterial->getTreatments->[1] == $treatments_assn);


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
# testing association qualityControlStatistics
my $qualitycontrolstatistics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $qualitycontrolstatistics_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($biomaterial->getQualityControlStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($biomaterial->setQualityControlStatistics([$qualitycontrolstatistics_assn]));
result (UNIVERSAL::isa($biomaterial->getQualityControlStatistics,'ARRAY')
 and scalar @{$biomaterial->getQualityControlStatistics()} == 1
 and $biomaterial->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn);
$biomaterial->addQualityControlStatistics($qualitycontrolstatistics_assn);
result (UNIVERSAL::isa($biomaterial->getQualityControlStatistics,'ARRAY')
 and scalar @{$biomaterial->getQualityControlStatistics()} == 2
 and $biomaterial->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn
 and $biomaterial->getQualityControlStatistics->[1] == $qualitycontrolstatistics_assn);


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
# testing association materialType
my $materialtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $materialtype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biomaterial->getMaterialType,q[Bio::MAGE::Description::OntologyEntry]));
result ($biomaterial->setMaterialType($materialtype_assn) == $materialtype_assn);
result ($biomaterial->getMaterialType() == $materialtype_assn);



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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($biomaterial->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($biomaterial->setSecurity($security_assn) == $security_assn);
result ($biomaterial->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($biomaterial->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($biomaterial->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($biomaterial->getAuditTrail,'ARRAY')
 and scalar @{$biomaterial->getAuditTrail()} == 1
 and $biomaterial->getAuditTrail->[0] == $audittrail_assn);
$biomaterial->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($biomaterial->getAuditTrail,'ARRAY')
 and scalar @{$biomaterial->getAuditTrail()} == 2
 and $biomaterial->getAuditTrail->[0] == $audittrail_assn
 and $biomaterial->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($biomaterial->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($biomaterial->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($biomaterial->getDescriptions,'ARRAY')
 and scalar @{$biomaterial->getDescriptions()} == 1
 and $biomaterial->getDescriptions->[0] == $descriptions_assn);
$biomaterial->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($biomaterial->getDescriptions,'ARRAY')
 and scalar @{$biomaterial->getDescriptions()} == 2
 and $biomaterial->getDescriptions->[0] == $descriptions_assn
 and $biomaterial->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($biomaterial->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biomaterial->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biomaterial->getPropertySets,'ARRAY')
 and scalar @{$biomaterial->getPropertySets()} == 1
 and $biomaterial->getPropertySets->[0] == $propertysets_assn);
$biomaterial->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biomaterial->getPropertySets,'ARRAY')
 and scalar @{$biomaterial->getPropertySets()} == 2
 and $biomaterial->getPropertySets->[0] == $propertysets_assn
 and $biomaterial->getPropertySets->[1] == $propertysets_assn);


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
  my $labeledextract = Bio::MAGE::BioMaterial::LabeledExtract->new();

  # testing subclass LabeledExtract
  result ($labeledextract->isa(q[Bio::MAGE::BioMaterial::LabeledExtract]));

  # create a subclass
  my $biosource = Bio::MAGE::BioMaterial::BioSource->new();

  # testing subclass BioSource
  result ($biosource->isa(q[Bio::MAGE::BioMaterial::BioSource]));

  # create a subclass
  my $biosample = Bio::MAGE::BioMaterial::BioSample->new();

  # testing subclass BioSample
  result ($biosample->isa(q[Bio::MAGE::BioMaterial::BioSample]));

}
# testing superclass Bio::MAGE::Identifiable
result ($biomaterial->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($biomaterial->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($biomaterial->isa(q[Bio::MAGE::Extendable]));

