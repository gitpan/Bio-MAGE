# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Map.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..39\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioEvent::Map;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssayData::BioAssayMap;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::BioAssayData::DesignElementMap;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $map;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $map = Bio::MAGE::BioEvent::Map->new();
}
result($map->isa('Bio::MAGE::BioEvent::Map'));

# test the package class method
result($map->package() eq q[BioEvent]);

# test the class_name class method
result($map->class_name() eq q[Bio::MAGE::BioEvent::Map]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $map = Bio::MAGE::BioEvent::Map->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($map->getIdentifier() == 1);
$map->setIdentifier(1);
result ($map->getIdentifier() == 1);

# testing attribute name
result ($map->getName() == 2);
$map->setName(2);
result ($map->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioEvent::Map->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $map = Bio::MAGE::BioEvent::Map->new(protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
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
result (UNIVERSAL::isa($map->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($map->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($map->getProtocolApplications,'ARRAY')
 and scalar @{$map->getProtocolApplications()} == 1
 and $map->getProtocolApplications->[0] == $protocolapplications_assn);
$map->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($map->getProtocolApplications,'ARRAY')
 and scalar @{$map->getProtocolApplications()} == 2
 and $map->getProtocolApplications->[0] == $protocolapplications_assn
 and $map->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($map->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($map->setSecurity($security_assn) == $security_assn);
result ($map->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($map->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($map->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($map->getAuditTrail,'ARRAY')
 and scalar @{$map->getAuditTrail()} == 1
 and $map->getAuditTrail->[0] == $audittrail_assn);
$map->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($map->getAuditTrail,'ARRAY')
 and scalar @{$map->getAuditTrail()} == 2
 and $map->getAuditTrail->[0] == $audittrail_assn
 and $map->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($map->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($map->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($map->getDescriptions,'ARRAY')
 and scalar @{$map->getDescriptions()} == 1
 and $map->getDescriptions->[0] == $descriptions_assn);
$map->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($map->getDescriptions,'ARRAY')
 and scalar @{$map->getDescriptions()} == 2
 and $map->getDescriptions->[0] == $descriptions_assn
 and $map->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($map->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($map->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($map->getPropertySets,'ARRAY')
 and scalar @{$map->getPropertySets()} == 1
 and $map->getPropertySets->[0] == $propertysets_assn);
$map->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($map->getPropertySets,'ARRAY')
 and scalar @{$map->getPropertySets()} == 2
 and $map->getPropertySets->[0] == $propertysets_assn
 and $map->getPropertySets->[1] == $propertysets_assn);


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
  my $bioassaymap = Bio::MAGE::BioAssayData::BioAssayMap->new();

  # testing subclass BioAssayMap
  result ($bioassaymap->isa(q[Bio::MAGE::BioAssayData::BioAssayMap]));

  # create a subclass
  my $quantitationtypemap = Bio::MAGE::BioAssayData::QuantitationTypeMap->new();

  # testing subclass QuantitationTypeMap
  result ($quantitationtypemap->isa(q[Bio::MAGE::BioAssayData::QuantitationTypeMap]));

  # create a subclass
  my $designelementmap = Bio::MAGE::BioAssayData::DesignElementMap->new();

  # testing subclass DesignElementMap
  result ($designelementmap->isa(q[Bio::MAGE::BioAssayData::DesignElementMap]));

}
# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($map->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($map->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($map->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($map->isa(q[Bio::MAGE::Extendable]));

