# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayTreatment.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..45\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::BioAssayTreatment;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssay::PhysicalBioAssay;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::BioAssay::ImageAcquisition;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassaytreatment;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaytreatment = Bio::MAGE::BioAssay::BioAssayTreatment->new();
}
result($bioassaytreatment->isa('Bio::MAGE::BioAssay::BioAssayTreatment'));

# test the package class method
result($bioassaytreatment->package() eq q[BioAssay]);

# test the class_name class method
result($bioassaytreatment->class_name() eq q[Bio::MAGE::BioAssay::BioAssayTreatment]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaytreatment = Bio::MAGE::BioAssay::BioAssayTreatment->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($bioassaytreatment->getIdentifier() == 1);
$bioassaytreatment->setIdentifier(1);
result ($bioassaytreatment->getIdentifier() == 1);

# testing attribute name
result ($bioassaytreatment->getName() == 2);
$bioassaytreatment->setName(2);
result ($bioassaytreatment->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::BioAssayTreatment->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaytreatment = Bio::MAGE::BioAssay::BioAssayTreatment->new(target => Bio::MAGE::BioAssay::PhysicalBioAssay->new(),
physicalBioAssay => Bio::MAGE::BioAssay::PhysicalBioAssay->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association target
my $target_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $target_assn = Bio::MAGE::BioAssay::PhysicalBioAssay->new();
}
result (UNIVERSAL::isa($bioassaytreatment->getTarget,q[Bio::MAGE::BioAssay::PhysicalBioAssay]));
result ($bioassaytreatment->setTarget($target_assn) == $target_assn);
result ($bioassaytreatment->getTarget() == $target_assn);



# test the meta-data for the assoication
($assn) = $assns{target};
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
# testing association physicalBioAssay
my $physicalbioassay_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $physicalbioassay_assn = Bio::MAGE::BioAssay::PhysicalBioAssay->new();
}
result (UNIVERSAL::isa($bioassaytreatment->getPhysicalBioAssay,q[Bio::MAGE::BioAssay::PhysicalBioAssay]));
result ($bioassaytreatment->setPhysicalBioAssay($physicalbioassay_assn) == $physicalbioassay_assn);
result ($bioassaytreatment->getPhysicalBioAssay() == $physicalbioassay_assn);



# test the meta-data for the assoication
($assn) = $assns{physicalBioAssay};
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
result (UNIVERSAL::isa($bioassaytreatment->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($bioassaytreatment->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($bioassaytreatment->getProtocolApplications,'ARRAY')
 and scalar @{$bioassaytreatment->getProtocolApplications()} == 1
 and $bioassaytreatment->getProtocolApplications->[0] == $protocolapplications_assn);
$bioassaytreatment->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($bioassaytreatment->getProtocolApplications,'ARRAY')
 and scalar @{$bioassaytreatment->getProtocolApplications()} == 2
 and $bioassaytreatment->getProtocolApplications->[0] == $protocolapplications_assn
 and $bioassaytreatment->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($bioassaytreatment->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($bioassaytreatment->setSecurity($security_assn) == $security_assn);
result ($bioassaytreatment->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($bioassaytreatment->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($bioassaytreatment->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($bioassaytreatment->getAuditTrail,'ARRAY')
 and scalar @{$bioassaytreatment->getAuditTrail()} == 1
 and $bioassaytreatment->getAuditTrail->[0] == $audittrail_assn);
$bioassaytreatment->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($bioassaytreatment->getAuditTrail,'ARRAY')
 and scalar @{$bioassaytreatment->getAuditTrail()} == 2
 and $bioassaytreatment->getAuditTrail->[0] == $audittrail_assn
 and $bioassaytreatment->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($bioassaytreatment->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($bioassaytreatment->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($bioassaytreatment->getDescriptions,'ARRAY')
 and scalar @{$bioassaytreatment->getDescriptions()} == 1
 and $bioassaytreatment->getDescriptions->[0] == $descriptions_assn);
$bioassaytreatment->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($bioassaytreatment->getDescriptions,'ARRAY')
 and scalar @{$bioassaytreatment->getDescriptions()} == 2
 and $bioassaytreatment->getDescriptions->[0] == $descriptions_assn
 and $bioassaytreatment->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($bioassaytreatment->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaytreatment->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaytreatment->getPropertySets,'ARRAY')
 and scalar @{$bioassaytreatment->getPropertySets()} == 1
 and $bioassaytreatment->getPropertySets->[0] == $propertysets_assn);
$bioassaytreatment->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaytreatment->getPropertySets,'ARRAY')
 and scalar @{$bioassaytreatment->getPropertySets()} == 2
 and $bioassaytreatment->getPropertySets->[0] == $propertysets_assn
 and $bioassaytreatment->getPropertySets->[1] == $propertysets_assn);


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
  my $imageacquisition = Bio::MAGE::BioAssay::ImageAcquisition->new();

  # testing subclass ImageAcquisition
  result ($imageacquisition->isa(q[Bio::MAGE::BioAssay::ImageAcquisition]));

}
# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($bioassaytreatment->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($bioassaytreatment->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($bioassaytreatment->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($bioassaytreatment->isa(q[Bio::MAGE::Extendable]));

