# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl QuantitationTypeMap.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..46\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::QuantitationType::QuantitationType;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $quantitationtypemap;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypemap = Bio::MAGE::BioAssayData::QuantitationTypeMap->new();
}
result($quantitationtypemap->isa('Bio::MAGE::BioAssayData::QuantitationTypeMap'));

# test the package class method
result($quantitationtypemap->package() eq q[BioAssayData]);

# test the class_name class method
result($quantitationtypemap->class_name() eq q[Bio::MAGE::BioAssayData::QuantitationTypeMap]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypemap = Bio::MAGE::BioAssayData::QuantitationTypeMap->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($quantitationtypemap->getIdentifier() == 1);
$quantitationtypemap->setIdentifier(1);
result ($quantitationtypemap->getIdentifier() == 1);

# testing attribute name
result ($quantitationtypemap->getName() == 2);
$quantitationtypemap->setName(2);
result ($quantitationtypemap->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::QuantitationTypeMap->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypemap = Bio::MAGE::BioAssayData::QuantitationTypeMap->new(sourcesQuantitationType => [Bio::MAGE::QuantitationType::QuantitationType->new()],
targetQuantitationType => Bio::MAGE::QuantitationType::QuantitationType->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association sourcesQuantitationType
my $sourcesquantitationtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sourcesquantitationtype_assn = Bio::MAGE::QuantitationType::QuantitationType->new();
}
result (UNIVERSAL::isa($quantitationtypemap->getSourcesQuantitationType->[0],q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($quantitationtypemap->setSourcesQuantitationType([$sourcesquantitationtype_assn]));
result (UNIVERSAL::isa($quantitationtypemap->getSourcesQuantitationType,'ARRAY')
 and scalar @{$quantitationtypemap->getSourcesQuantitationType()} == 1
 and $quantitationtypemap->getSourcesQuantitationType->[0] == $sourcesquantitationtype_assn);
$quantitationtypemap->addSourcesQuantitationType($sourcesquantitationtype_assn);
result (UNIVERSAL::isa($quantitationtypemap->getSourcesQuantitationType,'ARRAY')
 and scalar @{$quantitationtypemap->getSourcesQuantitationType()} == 2
 and $quantitationtypemap->getSourcesQuantitationType->[0] == $sourcesquantitationtype_assn
 and $quantitationtypemap->getSourcesQuantitationType->[1] == $sourcesquantitationtype_assn);


# test the meta-data for the assoication
($assn) = $assns{sourcesQuantitationType};
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
# testing association targetQuantitationType
my $targetquantitationtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $targetquantitationtype_assn = Bio::MAGE::QuantitationType::QuantitationType->new();
}
result (UNIVERSAL::isa($quantitationtypemap->getTargetQuantitationType,q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($quantitationtypemap->setTargetQuantitationType($targetquantitationtype_assn) == $targetquantitationtype_assn);
result ($quantitationtypemap->getTargetQuantitationType() == $targetquantitationtype_assn);



# test the meta-data for the assoication
($assn) = $assns{targetQuantitationType};
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
result (UNIVERSAL::isa($quantitationtypemap->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($quantitationtypemap->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($quantitationtypemap->getProtocolApplications,'ARRAY')
 and scalar @{$quantitationtypemap->getProtocolApplications()} == 1
 and $quantitationtypemap->getProtocolApplications->[0] == $protocolapplications_assn);
$quantitationtypemap->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($quantitationtypemap->getProtocolApplications,'ARRAY')
 and scalar @{$quantitationtypemap->getProtocolApplications()} == 2
 and $quantitationtypemap->getProtocolApplications->[0] == $protocolapplications_assn
 and $quantitationtypemap->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($quantitationtypemap->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($quantitationtypemap->setSecurity($security_assn) == $security_assn);
result ($quantitationtypemap->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($quantitationtypemap->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($quantitationtypemap->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($quantitationtypemap->getAuditTrail,'ARRAY')
 and scalar @{$quantitationtypemap->getAuditTrail()} == 1
 and $quantitationtypemap->getAuditTrail->[0] == $audittrail_assn);
$quantitationtypemap->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($quantitationtypemap->getAuditTrail,'ARRAY')
 and scalar @{$quantitationtypemap->getAuditTrail()} == 2
 and $quantitationtypemap->getAuditTrail->[0] == $audittrail_assn
 and $quantitationtypemap->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($quantitationtypemap->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($quantitationtypemap->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($quantitationtypemap->getDescriptions,'ARRAY')
 and scalar @{$quantitationtypemap->getDescriptions()} == 1
 and $quantitationtypemap->getDescriptions->[0] == $descriptions_assn);
$quantitationtypemap->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($quantitationtypemap->getDescriptions,'ARRAY')
 and scalar @{$quantitationtypemap->getDescriptions()} == 2
 and $quantitationtypemap->getDescriptions->[0] == $descriptions_assn
 and $quantitationtypemap->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($quantitationtypemap->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($quantitationtypemap->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($quantitationtypemap->getPropertySets,'ARRAY')
 and scalar @{$quantitationtypemap->getPropertySets()} == 1
 and $quantitationtypemap->getPropertySets->[0] == $propertysets_assn);
$quantitationtypemap->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($quantitationtypemap->getPropertySets,'ARRAY')
 and scalar @{$quantitationtypemap->getPropertySets()} == 2
 and $quantitationtypemap->getPropertySets->[0] == $propertysets_assn
 and $quantitationtypemap->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioEvent::Map
result ($quantitationtypemap->isa(q[Bio::MAGE::BioEvent::Map]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($quantitationtypemap->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($quantitationtypemap->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($quantitationtypemap->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($quantitationtypemap->isa(q[Bio::MAGE::Extendable]));

