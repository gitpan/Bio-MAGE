# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ImageAcquisition.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..50\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::ImageAcquisition;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssay::PhysicalBioAssay;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::BioAssay::Image;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $imageacquisition;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $imageacquisition = Bio::MAGE::BioAssay::ImageAcquisition->new();
}
result($imageacquisition->isa('Bio::MAGE::BioAssay::ImageAcquisition'));

# test the package class method
result($imageacquisition->package() eq q[BioAssay]);

# test the class_name class method
result($imageacquisition->class_name() eq q[Bio::MAGE::BioAssay::ImageAcquisition]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $imageacquisition = Bio::MAGE::BioAssay::ImageAcquisition->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($imageacquisition->getIdentifier() == 1);
$imageacquisition->setIdentifier(1);
result ($imageacquisition->getIdentifier() == 1);

# testing attribute name
result ($imageacquisition->getName() == 2);
$imageacquisition->setName(2);
result ($imageacquisition->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::ImageAcquisition->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $imageacquisition = Bio::MAGE::BioAssay::ImageAcquisition->new(images => [Bio::MAGE::BioAssay::Image->new()],
physicalBioAssay => Bio::MAGE::BioAssay::PhysicalBioAssay->new(),
target => Bio::MAGE::BioAssay::PhysicalBioAssay->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association images
my $images_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $images_assn = Bio::MAGE::BioAssay::Image->new();
}
result (UNIVERSAL::isa($imageacquisition->getImages->[0],q[Bio::MAGE::BioAssay::Image]));
result ($imageacquisition->setImages([$images_assn]));
result (UNIVERSAL::isa($imageacquisition->getImages,'ARRAY')
 and scalar @{$imageacquisition->getImages()} == 1
 and $imageacquisition->getImages->[0] == $images_assn);
$imageacquisition->addImages($images_assn);
result (UNIVERSAL::isa($imageacquisition->getImages,'ARRAY')
 and scalar @{$imageacquisition->getImages()} == 2
 and $imageacquisition->getImages->[0] == $images_assn
 and $imageacquisition->getImages->[1] == $images_assn);


# test the meta-data for the assoication
($assn) = $assns{images};
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
result (UNIVERSAL::isa($imageacquisition->getPhysicalBioAssay,q[Bio::MAGE::BioAssay::PhysicalBioAssay]));
result ($imageacquisition->setPhysicalBioAssay($physicalbioassay_assn) == $physicalbioassay_assn);
result ($imageacquisition->getPhysicalBioAssay() == $physicalbioassay_assn);



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
# testing association target
my $target_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $target_assn = Bio::MAGE::BioAssay::PhysicalBioAssay->new();
}
result (UNIVERSAL::isa($imageacquisition->getTarget,q[Bio::MAGE::BioAssay::PhysicalBioAssay]));
result ($imageacquisition->setTarget($target_assn) == $target_assn);
result ($imageacquisition->getTarget() == $target_assn);



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
# testing association protocolApplications
my $protocolapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplications_assn = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result (UNIVERSAL::isa($imageacquisition->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($imageacquisition->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($imageacquisition->getProtocolApplications,'ARRAY')
 and scalar @{$imageacquisition->getProtocolApplications()} == 1
 and $imageacquisition->getProtocolApplications->[0] == $protocolapplications_assn);
$imageacquisition->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($imageacquisition->getProtocolApplications,'ARRAY')
 and scalar @{$imageacquisition->getProtocolApplications()} == 2
 and $imageacquisition->getProtocolApplications->[0] == $protocolapplications_assn
 and $imageacquisition->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($imageacquisition->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($imageacquisition->setSecurity($security_assn) == $security_assn);
result ($imageacquisition->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($imageacquisition->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($imageacquisition->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($imageacquisition->getAuditTrail,'ARRAY')
 and scalar @{$imageacquisition->getAuditTrail()} == 1
 and $imageacquisition->getAuditTrail->[0] == $audittrail_assn);
$imageacquisition->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($imageacquisition->getAuditTrail,'ARRAY')
 and scalar @{$imageacquisition->getAuditTrail()} == 2
 and $imageacquisition->getAuditTrail->[0] == $audittrail_assn
 and $imageacquisition->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($imageacquisition->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($imageacquisition->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($imageacquisition->getDescriptions,'ARRAY')
 and scalar @{$imageacquisition->getDescriptions()} == 1
 and $imageacquisition->getDescriptions->[0] == $descriptions_assn);
$imageacquisition->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($imageacquisition->getDescriptions,'ARRAY')
 and scalar @{$imageacquisition->getDescriptions()} == 2
 and $imageacquisition->getDescriptions->[0] == $descriptions_assn
 and $imageacquisition->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($imageacquisition->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($imageacquisition->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($imageacquisition->getPropertySets,'ARRAY')
 and scalar @{$imageacquisition->getPropertySets()} == 1
 and $imageacquisition->getPropertySets->[0] == $propertysets_assn);
$imageacquisition->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($imageacquisition->getPropertySets,'ARRAY')
 and scalar @{$imageacquisition->getPropertySets()} == 2
 and $imageacquisition->getPropertySets->[0] == $propertysets_assn
 and $imageacquisition->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssay::BioAssayTreatment
result ($imageacquisition->isa(q[Bio::MAGE::BioAssay::BioAssayTreatment]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($imageacquisition->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($imageacquisition->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($imageacquisition->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($imageacquisition->isa(q[Bio::MAGE::Extendable]));

