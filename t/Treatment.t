# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Treatment.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..56\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioMaterial::Treatment;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::BioMaterial::CompoundMeasurement;
use Bio::MAGE::Measurement::Measurement;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioMaterial::BioMaterialMeasurement;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $treatment;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $treatment = Bio::MAGE::BioMaterial::Treatment->new();
}
result($treatment->isa('Bio::MAGE::BioMaterial::Treatment'));

# test the package class method
result($treatment->package() eq q[BioMaterial]);

# test the class_name class method
result($treatment->class_name() eq q[Bio::MAGE::BioMaterial::Treatment]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $treatment = Bio::MAGE::BioMaterial::Treatment->new(order => 1,
identifier => 2,
name => 3);
}
# testing attribute order
result ($treatment->getOrder() == 1);
$treatment->setOrder(1);
result ($treatment->getOrder() == 1);

# testing attribute identifier
result ($treatment->getIdentifier() == 2);
$treatment->setIdentifier(2);
result ($treatment->getIdentifier() == 2);

# testing attribute name
result ($treatment->getName() == 3);
$treatment->setName(3);
result ($treatment->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::Treatment->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $treatment = Bio::MAGE::BioMaterial::Treatment->new(sourceBioMaterialMeasurements => [Bio::MAGE::BioMaterial::BioMaterialMeasurement->new()],
action => Bio::MAGE::Description::OntologyEntry->new(),
actionMeasurement => Bio::MAGE::Measurement::Measurement->new(),
compoundMeasurements => [Bio::MAGE::BioMaterial::CompoundMeasurement->new()],
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association sourceBioMaterialMeasurements
my $sourcebiomaterialmeasurements_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sourcebiomaterialmeasurements_assn = Bio::MAGE::BioMaterial::BioMaterialMeasurement->new();
}
result (UNIVERSAL::isa($treatment->getSourceBioMaterialMeasurements->[0],q[Bio::MAGE::BioMaterial::BioMaterialMeasurement]));
result ($treatment->setSourceBioMaterialMeasurements([$sourcebiomaterialmeasurements_assn]));
result (UNIVERSAL::isa($treatment->getSourceBioMaterialMeasurements,'ARRAY')
 and scalar @{$treatment->getSourceBioMaterialMeasurements()} == 1
 and $treatment->getSourceBioMaterialMeasurements->[0] == $sourcebiomaterialmeasurements_assn);
$treatment->addSourceBioMaterialMeasurements($sourcebiomaterialmeasurements_assn);
result (UNIVERSAL::isa($treatment->getSourceBioMaterialMeasurements,'ARRAY')
 and scalar @{$treatment->getSourceBioMaterialMeasurements()} == 2
 and $treatment->getSourceBioMaterialMeasurements->[0] == $sourcebiomaterialmeasurements_assn
 and $treatment->getSourceBioMaterialMeasurements->[1] == $sourcebiomaterialmeasurements_assn);


# test the meta-data for the assoication
($assn) = $assns{sourceBioMaterialMeasurements};
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
# testing association action
my $action_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $action_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($treatment->getAction,q[Bio::MAGE::Description::OntologyEntry]));
result ($treatment->setAction($action_assn) == $action_assn);
result ($treatment->getAction() == $action_assn);



# test the meta-data for the assoication
($assn) = $assns{action};
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
# testing association actionMeasurement
my $actionmeasurement_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $actionmeasurement_assn = Bio::MAGE::Measurement::Measurement->new();
}
result (UNIVERSAL::isa($treatment->getActionMeasurement,q[Bio::MAGE::Measurement::Measurement]));
result ($treatment->setActionMeasurement($actionmeasurement_assn) == $actionmeasurement_assn);
result ($treatment->getActionMeasurement() == $actionmeasurement_assn);



# test the meta-data for the assoication
($assn) = $assns{actionMeasurement};
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
# testing association compoundMeasurements
my $compoundmeasurements_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compoundmeasurements_assn = Bio::MAGE::BioMaterial::CompoundMeasurement->new();
}
result (UNIVERSAL::isa($treatment->getCompoundMeasurements->[0],q[Bio::MAGE::BioMaterial::CompoundMeasurement]));
result ($treatment->setCompoundMeasurements([$compoundmeasurements_assn]));
result (UNIVERSAL::isa($treatment->getCompoundMeasurements,'ARRAY')
 and scalar @{$treatment->getCompoundMeasurements()} == 1
 and $treatment->getCompoundMeasurements->[0] == $compoundmeasurements_assn);
$treatment->addCompoundMeasurements($compoundmeasurements_assn);
result (UNIVERSAL::isa($treatment->getCompoundMeasurements,'ARRAY')
 and scalar @{$treatment->getCompoundMeasurements()} == 2
 and $treatment->getCompoundMeasurements->[0] == $compoundmeasurements_assn
 and $treatment->getCompoundMeasurements->[1] == $compoundmeasurements_assn);


# test the meta-data for the assoication
($assn) = $assns{compoundMeasurements};
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
# testing association protocolApplications
my $protocolapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplications_assn = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result (UNIVERSAL::isa($treatment->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($treatment->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($treatment->getProtocolApplications,'ARRAY')
 and scalar @{$treatment->getProtocolApplications()} == 1
 and $treatment->getProtocolApplications->[0] == $protocolapplications_assn);
$treatment->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($treatment->getProtocolApplications,'ARRAY')
 and scalar @{$treatment->getProtocolApplications()} == 2
 and $treatment->getProtocolApplications->[0] == $protocolapplications_assn
 and $treatment->getProtocolApplications->[1] == $protocolapplications_assn);


# test the meta-data for the assoication
($assn) = $assns{protocolApplications};
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
result (UNIVERSAL::isa($treatment->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($treatment->setSecurity($security_assn) == $security_assn);
result ($treatment->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($treatment->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($treatment->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($treatment->getAuditTrail,'ARRAY')
 and scalar @{$treatment->getAuditTrail()} == 1
 and $treatment->getAuditTrail->[0] == $audittrail_assn);
$treatment->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($treatment->getAuditTrail,'ARRAY')
 and scalar @{$treatment->getAuditTrail()} == 2
 and $treatment->getAuditTrail->[0] == $audittrail_assn
 and $treatment->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($treatment->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($treatment->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($treatment->getDescriptions,'ARRAY')
 and scalar @{$treatment->getDescriptions()} == 1
 and $treatment->getDescriptions->[0] == $descriptions_assn);
$treatment->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($treatment->getDescriptions,'ARRAY')
 and scalar @{$treatment->getDescriptions()} == 2
 and $treatment->getDescriptions->[0] == $descriptions_assn
 and $treatment->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($treatment->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($treatment->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($treatment->getPropertySets,'ARRAY')
 and scalar @{$treatment->getPropertySets()} == 1
 and $treatment->getPropertySets->[0] == $propertysets_assn);
$treatment->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($treatment->getPropertySets,'ARRAY')
 and scalar @{$treatment->getPropertySets()} == 2
 and $treatment->getPropertySets->[0] == $propertysets_assn
 and $treatment->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($treatment->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($treatment->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($treatment->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($treatment->isa(q[Bio::MAGE::Extendable]));

