# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl LabeledExtract.t'

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
use Bio::MAGE::BioMaterial::LabeledExtract;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioMaterial::Compound;
use Bio::MAGE::BioMaterial::Treatment;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $labeledextract;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $labeledextract = Bio::MAGE::BioMaterial::LabeledExtract->new();
}
result($labeledextract->isa('Bio::MAGE::BioMaterial::LabeledExtract'));

# test the package class method
result($labeledextract->package() eq q[BioMaterial]);

# test the class_name class method
result($labeledextract->class_name() eq q[Bio::MAGE::BioMaterial::LabeledExtract]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $labeledextract = Bio::MAGE::BioMaterial::LabeledExtract->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($labeledextract->getIdentifier() == 1);
$labeledextract->setIdentifier(1);
result ($labeledextract->getIdentifier() == 1);

# testing attribute name
result ($labeledextract->getName() == 2);
$labeledextract->setName(2);
result ($labeledextract->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::LabeledExtract->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $labeledextract = Bio::MAGE::BioMaterial::LabeledExtract->new(labels => [Bio::MAGE::BioMaterial::Compound->new()],
treatments => [Bio::MAGE::BioMaterial::Treatment->new()],
materialType => Bio::MAGE::Description::OntologyEntry->new(),
characteristics => [Bio::MAGE::Description::OntologyEntry->new()],
qualityControlStatistics => [Bio::MAGE::NameValueType->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association labels
my $labels_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $labels_assn = Bio::MAGE::BioMaterial::Compound->new();
}
result (UNIVERSAL::isa($labeledextract->getLabels->[0],q[Bio::MAGE::BioMaterial::Compound]));
result ($labeledextract->setLabels([$labels_assn]));
result (UNIVERSAL::isa($labeledextract->getLabels,'ARRAY')
 and scalar @{$labeledextract->getLabels()} == 1
 and $labeledextract->getLabels->[0] == $labels_assn);
$labeledextract->addLabels($labels_assn);
result (UNIVERSAL::isa($labeledextract->getLabels,'ARRAY')
 and scalar @{$labeledextract->getLabels()} == 2
 and $labeledextract->getLabels->[0] == $labels_assn
 and $labeledextract->getLabels->[1] == $labels_assn);


# test the meta-data for the assoication
($assn) = $assns{labels};
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
result (UNIVERSAL::isa($labeledextract->getTreatments->[0],q[Bio::MAGE::BioMaterial::Treatment]));
result ($labeledextract->setTreatments([$treatments_assn]));
result (UNIVERSAL::isa($labeledextract->getTreatments,'ARRAY')
 and scalar @{$labeledextract->getTreatments()} == 1
 and $labeledextract->getTreatments->[0] == $treatments_assn);
$labeledextract->addTreatments($treatments_assn);
result (UNIVERSAL::isa($labeledextract->getTreatments,'ARRAY')
 and scalar @{$labeledextract->getTreatments()} == 2
 and $labeledextract->getTreatments->[0] == $treatments_assn
 and $labeledextract->getTreatments->[1] == $treatments_assn);


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
result (UNIVERSAL::isa($labeledextract->getMaterialType,q[Bio::MAGE::Description::OntologyEntry]));
result ($labeledextract->setMaterialType($materialtype_assn) == $materialtype_assn);
result ($labeledextract->getMaterialType() == $materialtype_assn);



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
result (UNIVERSAL::isa($labeledextract->getCharacteristics->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($labeledextract->setCharacteristics([$characteristics_assn]));
result (UNIVERSAL::isa($labeledextract->getCharacteristics,'ARRAY')
 and scalar @{$labeledextract->getCharacteristics()} == 1
 and $labeledextract->getCharacteristics->[0] == $characteristics_assn);
$labeledextract->addCharacteristics($characteristics_assn);
result (UNIVERSAL::isa($labeledextract->getCharacteristics,'ARRAY')
 and scalar @{$labeledextract->getCharacteristics()} == 2
 and $labeledextract->getCharacteristics->[0] == $characteristics_assn
 and $labeledextract->getCharacteristics->[1] == $characteristics_assn);


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
result (UNIVERSAL::isa($labeledextract->getQualityControlStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($labeledextract->setQualityControlStatistics([$qualitycontrolstatistics_assn]));
result (UNIVERSAL::isa($labeledextract->getQualityControlStatistics,'ARRAY')
 and scalar @{$labeledextract->getQualityControlStatistics()} == 1
 and $labeledextract->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn);
$labeledextract->addQualityControlStatistics($qualitycontrolstatistics_assn);
result (UNIVERSAL::isa($labeledextract->getQualityControlStatistics,'ARRAY')
 and scalar @{$labeledextract->getQualityControlStatistics()} == 2
 and $labeledextract->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn
 and $labeledextract->getQualityControlStatistics->[1] == $qualitycontrolstatistics_assn);


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
result (UNIVERSAL::isa($labeledextract->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($labeledextract->setSecurity($security_assn) == $security_assn);
result ($labeledextract->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($labeledextract->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($labeledextract->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($labeledextract->getAuditTrail,'ARRAY')
 and scalar @{$labeledextract->getAuditTrail()} == 1
 and $labeledextract->getAuditTrail->[0] == $audittrail_assn);
$labeledextract->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($labeledextract->getAuditTrail,'ARRAY')
 and scalar @{$labeledextract->getAuditTrail()} == 2
 and $labeledextract->getAuditTrail->[0] == $audittrail_assn
 and $labeledextract->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($labeledextract->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($labeledextract->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($labeledextract->getDescriptions,'ARRAY')
 and scalar @{$labeledextract->getDescriptions()} == 1
 and $labeledextract->getDescriptions->[0] == $descriptions_assn);
$labeledextract->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($labeledextract->getDescriptions,'ARRAY')
 and scalar @{$labeledextract->getDescriptions()} == 2
 and $labeledextract->getDescriptions->[0] == $descriptions_assn
 and $labeledextract->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($labeledextract->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($labeledextract->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($labeledextract->getPropertySets,'ARRAY')
 and scalar @{$labeledextract->getPropertySets()} == 1
 and $labeledextract->getPropertySets->[0] == $propertysets_assn);
$labeledextract->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($labeledextract->getPropertySets,'ARRAY')
 and scalar @{$labeledextract->getPropertySets()} == 2
 and $labeledextract->getPropertySets->[0] == $propertysets_assn
 and $labeledextract->getPropertySets->[1] == $propertysets_assn);


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
result ($labeledextract->isa(q[Bio::MAGE::BioMaterial::BioMaterial]));

# testing superclass Bio::MAGE::Identifiable
result ($labeledextract->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($labeledextract->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($labeledextract->isa(q[Bio::MAGE::Extendable]));

