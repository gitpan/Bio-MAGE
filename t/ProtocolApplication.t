# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ProtocolApplication.t'

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
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::Protocol::SoftwareApplication;
use Bio::MAGE::Protocol::Protocol;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::HardwareApplication;
use Bio::MAGE::Protocol::ParameterValue;
use Bio::MAGE::AuditAndSecurity::Person;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $protocolapplication;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplication = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result($protocolapplication->isa('Bio::MAGE::Protocol::ProtocolApplication'));

# test the package class method
result($protocolapplication->package() eq q[Protocol]);

# test the class_name class method
result($protocolapplication->class_name() eq q[Bio::MAGE::Protocol::ProtocolApplication]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplication = Bio::MAGE::Protocol::ProtocolApplication->new(activityDate => 1);
}
# testing attribute activityDate
result ($protocolapplication->getActivityDate() == 1);
$protocolapplication->setActivityDate(1);
result ($protocolapplication->getActivityDate() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::ProtocolApplication->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplication = Bio::MAGE::Protocol::ProtocolApplication->new(hardwareApplications => [Bio::MAGE::Protocol::HardwareApplication->new()],
protocol => Bio::MAGE::Protocol::Protocol->new(),
softwareApplications => [Bio::MAGE::Protocol::SoftwareApplication->new()],
performers => [Bio::MAGE::AuditAndSecurity::Person->new()],
parameterValues => [Bio::MAGE::Protocol::ParameterValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association hardwareApplications
my $hardwareapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardwareapplications_assn = Bio::MAGE::Protocol::HardwareApplication->new();
}
result (UNIVERSAL::isa($protocolapplication->getHardwareApplications->[0],q[Bio::MAGE::Protocol::HardwareApplication]));
result ($protocolapplication->setHardwareApplications([$hardwareapplications_assn]));
result (UNIVERSAL::isa($protocolapplication->getHardwareApplications,'ARRAY')
 and scalar @{$protocolapplication->getHardwareApplications()} == 1
 and $protocolapplication->getHardwareApplications->[0] == $hardwareapplications_assn);
$protocolapplication->addHardwareApplications($hardwareapplications_assn);
result (UNIVERSAL::isa($protocolapplication->getHardwareApplications,'ARRAY')
 and scalar @{$protocolapplication->getHardwareApplications()} == 2
 and $protocolapplication->getHardwareApplications->[0] == $hardwareapplications_assn
 and $protocolapplication->getHardwareApplications->[1] == $hardwareapplications_assn);


# test the meta-data for the assoication
($assn) = $assns{hardwareApplications};
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
# testing association protocol
my $protocol_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocol_assn = Bio::MAGE::Protocol::Protocol->new();
}
result (UNIVERSAL::isa($protocolapplication->getProtocol,q[Bio::MAGE::Protocol::Protocol]));
result ($protocolapplication->setProtocol($protocol_assn) == $protocol_assn);
result ($protocolapplication->getProtocol() == $protocol_assn);



# test the meta-data for the assoication
($assn) = $assns{protocol};
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
# testing association softwareApplications
my $softwareapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $softwareapplications_assn = Bio::MAGE::Protocol::SoftwareApplication->new();
}
result (UNIVERSAL::isa($protocolapplication->getSoftwareApplications->[0],q[Bio::MAGE::Protocol::SoftwareApplication]));
result ($protocolapplication->setSoftwareApplications([$softwareapplications_assn]));
result (UNIVERSAL::isa($protocolapplication->getSoftwareApplications,'ARRAY')
 and scalar @{$protocolapplication->getSoftwareApplications()} == 1
 and $protocolapplication->getSoftwareApplications->[0] == $softwareapplications_assn);
$protocolapplication->addSoftwareApplications($softwareapplications_assn);
result (UNIVERSAL::isa($protocolapplication->getSoftwareApplications,'ARRAY')
 and scalar @{$protocolapplication->getSoftwareApplications()} == 2
 and $protocolapplication->getSoftwareApplications->[0] == $softwareapplications_assn
 and $protocolapplication->getSoftwareApplications->[1] == $softwareapplications_assn);


# test the meta-data for the assoication
($assn) = $assns{softwareApplications};
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
# testing association performers
my $performers_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $performers_assn = Bio::MAGE::AuditAndSecurity::Person->new();
}
result (UNIVERSAL::isa($protocolapplication->getPerformers->[0],q[Bio::MAGE::AuditAndSecurity::Person]));
result ($protocolapplication->setPerformers([$performers_assn]));
result (UNIVERSAL::isa($protocolapplication->getPerformers,'ARRAY')
 and scalar @{$protocolapplication->getPerformers()} == 1
 and $protocolapplication->getPerformers->[0] == $performers_assn);
$protocolapplication->addPerformers($performers_assn);
result (UNIVERSAL::isa($protocolapplication->getPerformers,'ARRAY')
 and scalar @{$protocolapplication->getPerformers()} == 2
 and $protocolapplication->getPerformers->[0] == $performers_assn
 and $protocolapplication->getPerformers->[1] == $performers_assn);


# test the meta-data for the assoication
($assn) = $assns{performers};
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
# testing association parameterValues
my $parametervalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parametervalues_assn = Bio::MAGE::Protocol::ParameterValue->new();
}
result (UNIVERSAL::isa($protocolapplication->getParameterValues->[0],q[Bio::MAGE::Protocol::ParameterValue]));
result ($protocolapplication->setParameterValues([$parametervalues_assn]));
result (UNIVERSAL::isa($protocolapplication->getParameterValues,'ARRAY')
 and scalar @{$protocolapplication->getParameterValues()} == 1
 and $protocolapplication->getParameterValues->[0] == $parametervalues_assn);
$protocolapplication->addParameterValues($parametervalues_assn);
result (UNIVERSAL::isa($protocolapplication->getParameterValues,'ARRAY')
 and scalar @{$protocolapplication->getParameterValues()} == 2
 and $protocolapplication->getParameterValues->[0] == $parametervalues_assn
 and $protocolapplication->getParameterValues->[1] == $parametervalues_assn);


# test the meta-data for the assoication
($assn) = $assns{parameterValues};
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
result (UNIVERSAL::isa($protocolapplication->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($protocolapplication->setSecurity($security_assn) == $security_assn);
result ($protocolapplication->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($protocolapplication->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($protocolapplication->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($protocolapplication->getAuditTrail,'ARRAY')
 and scalar @{$protocolapplication->getAuditTrail()} == 1
 and $protocolapplication->getAuditTrail->[0] == $audittrail_assn);
$protocolapplication->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($protocolapplication->getAuditTrail,'ARRAY')
 and scalar @{$protocolapplication->getAuditTrail()} == 2
 and $protocolapplication->getAuditTrail->[0] == $audittrail_assn
 and $protocolapplication->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($protocolapplication->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($protocolapplication->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($protocolapplication->getDescriptions,'ARRAY')
 and scalar @{$protocolapplication->getDescriptions()} == 1
 and $protocolapplication->getDescriptions->[0] == $descriptions_assn);
$protocolapplication->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($protocolapplication->getDescriptions,'ARRAY')
 and scalar @{$protocolapplication->getDescriptions()} == 2
 and $protocolapplication->getDescriptions->[0] == $descriptions_assn
 and $protocolapplication->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($protocolapplication->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($protocolapplication->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($protocolapplication->getPropertySets,'ARRAY')
 and scalar @{$protocolapplication->getPropertySets()} == 1
 and $protocolapplication->getPropertySets->[0] == $propertysets_assn);
$protocolapplication->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($protocolapplication->getPropertySets,'ARRAY')
 and scalar @{$protocolapplication->getPropertySets()} == 2
 and $protocolapplication->getPropertySets->[0] == $propertysets_assn
 and $protocolapplication->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Protocol::ParameterizableApplication
result ($protocolapplication->isa(q[Bio::MAGE::Protocol::ParameterizableApplication]));

# testing superclass Bio::MAGE::Describable
result ($protocolapplication->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($protocolapplication->isa(q[Bio::MAGE::Extendable]));

