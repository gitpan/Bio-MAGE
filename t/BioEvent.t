# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioEvent.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..41\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioEvent::BioEvent;
use Bio::MAGE::BioAssay::BioAssayTreatment;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::BioEvent::Map;
use Bio::MAGE::BioAssayData::Transformation;
use Bio::MAGE::BioAssay::BioAssayCreation;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssay::FeatureExtraction;
use Bio::MAGE::BioMaterial::Treatment;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioevent;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioevent = Bio::MAGE::BioEvent::BioEvent->new();
}
result($bioevent->isa('Bio::MAGE::BioEvent::BioEvent'));

# test the package class method
result($bioevent->package() eq q[BioEvent]);

# test the class_name class method
result($bioevent->class_name() eq q[Bio::MAGE::BioEvent::BioEvent]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioevent = Bio::MAGE::BioEvent::BioEvent->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($bioevent->getIdentifier() == 1);
$bioevent->setIdentifier(1);
result ($bioevent->getIdentifier() == 1);

# testing attribute name
result ($bioevent->getName() == 2);
$bioevent->setName(2);
result ($bioevent->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioEvent::BioEvent->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioevent = Bio::MAGE::BioEvent::BioEvent->new(protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association protocolApplications
my $protocolapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplications_assn = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result (UNIVERSAL::isa($bioevent->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($bioevent->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($bioevent->getProtocolApplications,'ARRAY')
 and scalar @{$bioevent->getProtocolApplications()} == 1
 and $bioevent->getProtocolApplications->[0] == $protocolapplications_assn);
$bioevent->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($bioevent->getProtocolApplications,'ARRAY')
 and scalar @{$bioevent->getProtocolApplications()} == 2
 and $bioevent->getProtocolApplications->[0] == $protocolapplications_assn
 and $bioevent->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($bioevent->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($bioevent->setSecurity($security_assn) == $security_assn);
result ($bioevent->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($bioevent->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($bioevent->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($bioevent->getAuditTrail,'ARRAY')
 and scalar @{$bioevent->getAuditTrail()} == 1
 and $bioevent->getAuditTrail->[0] == $audittrail_assn);
$bioevent->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($bioevent->getAuditTrail,'ARRAY')
 and scalar @{$bioevent->getAuditTrail()} == 2
 and $bioevent->getAuditTrail->[0] == $audittrail_assn
 and $bioevent->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($bioevent->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($bioevent->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($bioevent->getDescriptions,'ARRAY')
 and scalar @{$bioevent->getDescriptions()} == 1
 and $bioevent->getDescriptions->[0] == $descriptions_assn);
$bioevent->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($bioevent->getDescriptions,'ARRAY')
 and scalar @{$bioevent->getDescriptions()} == 2
 and $bioevent->getDescriptions->[0] == $descriptions_assn
 and $bioevent->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($bioevent->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioevent->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioevent->getPropertySets,'ARRAY')
 and scalar @{$bioevent->getPropertySets()} == 1
 and $bioevent->getPropertySets->[0] == $propertysets_assn);
$bioevent->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioevent->getPropertySets,'ARRAY')
 and scalar @{$bioevent->getPropertySets()} == 2
 and $bioevent->getPropertySets->[0] == $propertysets_assn
 and $bioevent->getPropertySets->[1] == $propertysets_assn);


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
  my $bioassaycreation = Bio::MAGE::BioAssay::BioAssayCreation->new();

  # testing subclass BioAssayCreation
  result ($bioassaycreation->isa(q[Bio::MAGE::BioAssay::BioAssayCreation]));

  # create a subclass
  my $transformation = Bio::MAGE::BioAssayData::Transformation->new();

  # testing subclass Transformation
  result ($transformation->isa(q[Bio::MAGE::BioAssayData::Transformation]));

  # create a subclass
  my $map = Bio::MAGE::BioEvent::Map->new();

  # testing subclass Map
  result ($map->isa(q[Bio::MAGE::BioEvent::Map]));

  # create a subclass
  my $featureextraction = Bio::MAGE::BioAssay::FeatureExtraction->new();

  # testing subclass FeatureExtraction
  result ($featureextraction->isa(q[Bio::MAGE::BioAssay::FeatureExtraction]));

  # create a subclass
  my $treatment = Bio::MAGE::BioMaterial::Treatment->new();

  # testing subclass Treatment
  result ($treatment->isa(q[Bio::MAGE::BioMaterial::Treatment]));

  # create a subclass
  my $bioassaytreatment = Bio::MAGE::BioAssay::BioAssayTreatment->new();

  # testing subclass BioAssayTreatment
  result ($bioassaytreatment->isa(q[Bio::MAGE::BioAssay::BioAssayTreatment]));

}
# testing superclass Bio::MAGE::Identifiable
result ($bioevent->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($bioevent->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($bioevent->isa(q[Bio::MAGE::Extendable]));

