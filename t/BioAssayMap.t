# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayMap.t'

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
use Bio::MAGE::BioAssayData::BioAssayMap;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::BioAssay::DerivedBioAssay;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassaymap;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymap = Bio::MAGE::BioAssayData::BioAssayMap->new();
}
result($bioassaymap->isa('Bio::MAGE::BioAssayData::BioAssayMap'));

# test the package class method
result($bioassaymap->package() eq q[BioAssayData]);

# test the class_name class method
result($bioassaymap->class_name() eq q[Bio::MAGE::BioAssayData::BioAssayMap]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymap = Bio::MAGE::BioAssayData::BioAssayMap->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($bioassaymap->getIdentifier() == 1);
$bioassaymap->setIdentifier(1);
result ($bioassaymap->getIdentifier() == 1);

# testing attribute name
result ($bioassaymap->getName() == 2);
$bioassaymap->setName(2);
result ($bioassaymap->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioAssayMap->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymap = Bio::MAGE::BioAssayData::BioAssayMap->new(sourceBioAssays => [Bio::MAGE::BioAssay::BioAssay->new()],
bioAssayMapTarget => Bio::MAGE::BioAssay::DerivedBioAssay->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association sourceBioAssays
my $sourcebioassays_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sourcebioassays_assn = Bio::MAGE::BioAssay::BioAssay->new();
}
result (UNIVERSAL::isa($bioassaymap->getSourceBioAssays->[0],q[Bio::MAGE::BioAssay::BioAssay]));
result ($bioassaymap->setSourceBioAssays([$sourcebioassays_assn]));
result (UNIVERSAL::isa($bioassaymap->getSourceBioAssays,'ARRAY')
 and scalar @{$bioassaymap->getSourceBioAssays()} == 1
 and $bioassaymap->getSourceBioAssays->[0] == $sourcebioassays_assn);
$bioassaymap->addSourceBioAssays($sourcebioassays_assn);
result (UNIVERSAL::isa($bioassaymap->getSourceBioAssays,'ARRAY')
 and scalar @{$bioassaymap->getSourceBioAssays()} == 2
 and $bioassaymap->getSourceBioAssays->[0] == $sourcebioassays_assn
 and $bioassaymap->getSourceBioAssays->[1] == $sourcebioassays_assn);


# test the meta-data for the assoication
($assn) = $assns{sourceBioAssays};
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
# testing association bioAssayMapTarget
my $bioassaymaptarget_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymaptarget_assn = Bio::MAGE::BioAssay::DerivedBioAssay->new();
}
result (UNIVERSAL::isa($bioassaymap->getBioAssayMapTarget,q[Bio::MAGE::BioAssay::DerivedBioAssay]));
result ($bioassaymap->setBioAssayMapTarget($bioassaymaptarget_assn) == $bioassaymaptarget_assn);
result ($bioassaymap->getBioAssayMapTarget() == $bioassaymaptarget_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssayMapTarget};
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
result (UNIVERSAL::isa($bioassaymap->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($bioassaymap->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($bioassaymap->getProtocolApplications,'ARRAY')
 and scalar @{$bioassaymap->getProtocolApplications()} == 1
 and $bioassaymap->getProtocolApplications->[0] == $protocolapplications_assn);
$bioassaymap->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($bioassaymap->getProtocolApplications,'ARRAY')
 and scalar @{$bioassaymap->getProtocolApplications()} == 2
 and $bioassaymap->getProtocolApplications->[0] == $protocolapplications_assn
 and $bioassaymap->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($bioassaymap->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($bioassaymap->setSecurity($security_assn) == $security_assn);
result ($bioassaymap->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($bioassaymap->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($bioassaymap->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($bioassaymap->getAuditTrail,'ARRAY')
 and scalar @{$bioassaymap->getAuditTrail()} == 1
 and $bioassaymap->getAuditTrail->[0] == $audittrail_assn);
$bioassaymap->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($bioassaymap->getAuditTrail,'ARRAY')
 and scalar @{$bioassaymap->getAuditTrail()} == 2
 and $bioassaymap->getAuditTrail->[0] == $audittrail_assn
 and $bioassaymap->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($bioassaymap->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($bioassaymap->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($bioassaymap->getDescriptions,'ARRAY')
 and scalar @{$bioassaymap->getDescriptions()} == 1
 and $bioassaymap->getDescriptions->[0] == $descriptions_assn);
$bioassaymap->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($bioassaymap->getDescriptions,'ARRAY')
 and scalar @{$bioassaymap->getDescriptions()} == 2
 and $bioassaymap->getDescriptions->[0] == $descriptions_assn
 and $bioassaymap->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($bioassaymap->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaymap->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaymap->getPropertySets,'ARRAY')
 and scalar @{$bioassaymap->getPropertySets()} == 1
 and $bioassaymap->getPropertySets->[0] == $propertysets_assn);
$bioassaymap->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaymap->getPropertySets,'ARRAY')
 and scalar @{$bioassaymap->getPropertySets()} == 2
 and $bioassaymap->getPropertySets->[0] == $propertysets_assn
 and $bioassaymap->getPropertySets->[1] == $propertysets_assn);


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
result ($bioassaymap->isa(q[Bio::MAGE::BioEvent::Map]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($bioassaymap->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($bioassaymap->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($bioassaymap->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($bioassaymap->isa(q[Bio::MAGE::Extendable]));

