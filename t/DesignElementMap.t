# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DesignElementMap.t'

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
use Bio::MAGE::BioAssayData::DesignElementMap;
use Bio::MAGE::DesignElement::CompositeCompositeMap;
use Bio::MAGE::DesignElement::ReporterCompositeMap;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::DesignElement::FeatureReporterMap;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $designelementmap;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementmap = Bio::MAGE::BioAssayData::DesignElementMap->new();
}
result($designelementmap->isa('Bio::MAGE::BioAssayData::DesignElementMap'));

# test the package class method
result($designelementmap->package() eq q[BioAssayData]);

# test the class_name class method
result($designelementmap->class_name() eq q[Bio::MAGE::BioAssayData::DesignElementMap]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementmap = Bio::MAGE::BioAssayData::DesignElementMap->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($designelementmap->getIdentifier() == 1);
$designelementmap->setIdentifier(1);
result ($designelementmap->getIdentifier() == 1);

# testing attribute name
result ($designelementmap->getName() == 2);
$designelementmap->setName(2);
result ($designelementmap->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::DesignElementMap->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementmap = Bio::MAGE::BioAssayData::DesignElementMap->new(protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
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
result (UNIVERSAL::isa($designelementmap->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($designelementmap->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($designelementmap->getProtocolApplications,'ARRAY')
 and scalar @{$designelementmap->getProtocolApplications()} == 1
 and $designelementmap->getProtocolApplications->[0] == $protocolapplications_assn);
$designelementmap->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($designelementmap->getProtocolApplications,'ARRAY')
 and scalar @{$designelementmap->getProtocolApplications()} == 2
 and $designelementmap->getProtocolApplications->[0] == $protocolapplications_assn
 and $designelementmap->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($designelementmap->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($designelementmap->setSecurity($security_assn) == $security_assn);
result ($designelementmap->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($designelementmap->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($designelementmap->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($designelementmap->getAuditTrail,'ARRAY')
 and scalar @{$designelementmap->getAuditTrail()} == 1
 and $designelementmap->getAuditTrail->[0] == $audittrail_assn);
$designelementmap->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($designelementmap->getAuditTrail,'ARRAY')
 and scalar @{$designelementmap->getAuditTrail()} == 2
 and $designelementmap->getAuditTrail->[0] == $audittrail_assn
 and $designelementmap->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($designelementmap->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($designelementmap->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($designelementmap->getDescriptions,'ARRAY')
 and scalar @{$designelementmap->getDescriptions()} == 1
 and $designelementmap->getDescriptions->[0] == $descriptions_assn);
$designelementmap->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($designelementmap->getDescriptions,'ARRAY')
 and scalar @{$designelementmap->getDescriptions()} == 2
 and $designelementmap->getDescriptions->[0] == $descriptions_assn
 and $designelementmap->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($designelementmap->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($designelementmap->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($designelementmap->getPropertySets,'ARRAY')
 and scalar @{$designelementmap->getPropertySets()} == 1
 and $designelementmap->getPropertySets->[0] == $propertysets_assn);
$designelementmap->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($designelementmap->getPropertySets,'ARRAY')
 and scalar @{$designelementmap->getPropertySets()} == 2
 and $designelementmap->getPropertySets->[0] == $propertysets_assn
 and $designelementmap->getPropertySets->[1] == $propertysets_assn);


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
  my $compositecompositemap = Bio::MAGE::DesignElement::CompositeCompositeMap->new();

  # testing subclass CompositeCompositeMap
  result ($compositecompositemap->isa(q[Bio::MAGE::DesignElement::CompositeCompositeMap]));

  # create a subclass
  my $reportercompositemap = Bio::MAGE::DesignElement::ReporterCompositeMap->new();

  # testing subclass ReporterCompositeMap
  result ($reportercompositemap->isa(q[Bio::MAGE::DesignElement::ReporterCompositeMap]));

  # create a subclass
  my $featurereportermap = Bio::MAGE::DesignElement::FeatureReporterMap->new();

  # testing subclass FeatureReporterMap
  result ($featurereportermap->isa(q[Bio::MAGE::DesignElement::FeatureReporterMap]));

}
# testing superclass Bio::MAGE::BioEvent::Map
result ($designelementmap->isa(q[Bio::MAGE::BioEvent::Map]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($designelementmap->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($designelementmap->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($designelementmap->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($designelementmap->isa(q[Bio::MAGE::Extendable]));

