# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl HardwareApplication.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..37\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::HardwareApplication;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::ParameterValue;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Protocol::Hardware;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $hardwareapplication;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardwareapplication = Bio::MAGE::Protocol::HardwareApplication->new();
}
result($hardwareapplication->isa('Bio::MAGE::Protocol::HardwareApplication'));

# test the package class method
result($hardwareapplication->package() eq q[Protocol]);

# test the class_name class method
result($hardwareapplication->class_name() eq q[Bio::MAGE::Protocol::HardwareApplication]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardwareapplication = Bio::MAGE::Protocol::HardwareApplication->new(serialNumber => 1);
}
# testing attribute serialNumber
result ($hardwareapplication->getSerialNumber() == 1);
$hardwareapplication->setSerialNumber(1);
result ($hardwareapplication->getSerialNumber() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::HardwareApplication->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardwareapplication = Bio::MAGE::Protocol::HardwareApplication->new(hardware => Bio::MAGE::Protocol::Hardware->new(),
parameterValues => [Bio::MAGE::Protocol::ParameterValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association hardware
my $hardware_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardware_assn = Bio::MAGE::Protocol::Hardware->new();
}
result (UNIVERSAL::isa($hardwareapplication->getHardware,q[Bio::MAGE::Protocol::Hardware]));
result ($hardwareapplication->setHardware($hardware_assn) == $hardware_assn);
result ($hardwareapplication->getHardware() == $hardware_assn);



# test the meta-data for the assoication
($assn) = $assns{hardware};
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
result (UNIVERSAL::isa($hardwareapplication->getParameterValues->[0],q[Bio::MAGE::Protocol::ParameterValue]));
result ($hardwareapplication->setParameterValues([$parametervalues_assn]));
result (UNIVERSAL::isa($hardwareapplication->getParameterValues,'ARRAY')
 and scalar @{$hardwareapplication->getParameterValues()} == 1
 and $hardwareapplication->getParameterValues->[0] == $parametervalues_assn);
$hardwareapplication->addParameterValues($parametervalues_assn);
result (UNIVERSAL::isa($hardwareapplication->getParameterValues,'ARRAY')
 and scalar @{$hardwareapplication->getParameterValues()} == 2
 and $hardwareapplication->getParameterValues->[0] == $parametervalues_assn
 and $hardwareapplication->getParameterValues->[1] == $parametervalues_assn);


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
result (UNIVERSAL::isa($hardwareapplication->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($hardwareapplication->setSecurity($security_assn) == $security_assn);
result ($hardwareapplication->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($hardwareapplication->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($hardwareapplication->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($hardwareapplication->getAuditTrail,'ARRAY')
 and scalar @{$hardwareapplication->getAuditTrail()} == 1
 and $hardwareapplication->getAuditTrail->[0] == $audittrail_assn);
$hardwareapplication->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($hardwareapplication->getAuditTrail,'ARRAY')
 and scalar @{$hardwareapplication->getAuditTrail()} == 2
 and $hardwareapplication->getAuditTrail->[0] == $audittrail_assn
 and $hardwareapplication->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($hardwareapplication->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($hardwareapplication->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($hardwareapplication->getDescriptions,'ARRAY')
 and scalar @{$hardwareapplication->getDescriptions()} == 1
 and $hardwareapplication->getDescriptions->[0] == $descriptions_assn);
$hardwareapplication->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($hardwareapplication->getDescriptions,'ARRAY')
 and scalar @{$hardwareapplication->getDescriptions()} == 2
 and $hardwareapplication->getDescriptions->[0] == $descriptions_assn
 and $hardwareapplication->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($hardwareapplication->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($hardwareapplication->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($hardwareapplication->getPropertySets,'ARRAY')
 and scalar @{$hardwareapplication->getPropertySets()} == 1
 and $hardwareapplication->getPropertySets->[0] == $propertysets_assn);
$hardwareapplication->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($hardwareapplication->getPropertySets,'ARRAY')
 and scalar @{$hardwareapplication->getPropertySets()} == 2
 and $hardwareapplication->getPropertySets->[0] == $propertysets_assn
 and $hardwareapplication->getPropertySets->[1] == $propertysets_assn);


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
result ($hardwareapplication->isa(q[Bio::MAGE::Protocol::ParameterizableApplication]));

# testing superclass Bio::MAGE::Describable
result ($hardwareapplication->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($hardwareapplication->isa(q[Bio::MAGE::Extendable]));

