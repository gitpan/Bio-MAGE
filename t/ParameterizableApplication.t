# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ParameterizableApplication.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..33\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::ParameterizableApplication;
use Bio::MAGE::Protocol::SoftwareApplication;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::Protocol::HardwareApplication;
use Bio::MAGE::Protocol::ParameterValue;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $parameterizableapplication;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameterizableapplication = Bio::MAGE::Protocol::ParameterizableApplication->new();
}
result($parameterizableapplication->isa('Bio::MAGE::Protocol::ParameterizableApplication'));

# test the package class method
result($parameterizableapplication->package() eq q[Protocol]);

# test the class_name class method
result($parameterizableapplication->class_name() eq q[Bio::MAGE::Protocol::ParameterizableApplication]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::ParameterizableApplication->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameterizableapplication = Bio::MAGE::Protocol::ParameterizableApplication->new(parameterValues => [Bio::MAGE::Protocol::ParameterValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association parameterValues
my $parametervalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parametervalues_assn = Bio::MAGE::Protocol::ParameterValue->new();
}
result (UNIVERSAL::isa($parameterizableapplication->getParameterValues->[0],q[Bio::MAGE::Protocol::ParameterValue]));
result ($parameterizableapplication->setParameterValues([$parametervalues_assn]));
result (UNIVERSAL::isa($parameterizableapplication->getParameterValues,'ARRAY')
 and scalar @{$parameterizableapplication->getParameterValues()} == 1
 and $parameterizableapplication->getParameterValues->[0] == $parametervalues_assn);
$parameterizableapplication->addParameterValues($parametervalues_assn);
result (UNIVERSAL::isa($parameterizableapplication->getParameterValues,'ARRAY')
 and scalar @{$parameterizableapplication->getParameterValues()} == 2
 and $parameterizableapplication->getParameterValues->[0] == $parametervalues_assn
 and $parameterizableapplication->getParameterValues->[1] == $parametervalues_assn);


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
result (UNIVERSAL::isa($parameterizableapplication->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($parameterizableapplication->setSecurity($security_assn) == $security_assn);
result ($parameterizableapplication->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($parameterizableapplication->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($parameterizableapplication->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($parameterizableapplication->getAuditTrail,'ARRAY')
 and scalar @{$parameterizableapplication->getAuditTrail()} == 1
 and $parameterizableapplication->getAuditTrail->[0] == $audittrail_assn);
$parameterizableapplication->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($parameterizableapplication->getAuditTrail,'ARRAY')
 and scalar @{$parameterizableapplication->getAuditTrail()} == 2
 and $parameterizableapplication->getAuditTrail->[0] == $audittrail_assn
 and $parameterizableapplication->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($parameterizableapplication->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($parameterizableapplication->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($parameterizableapplication->getDescriptions,'ARRAY')
 and scalar @{$parameterizableapplication->getDescriptions()} == 1
 and $parameterizableapplication->getDescriptions->[0] == $descriptions_assn);
$parameterizableapplication->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($parameterizableapplication->getDescriptions,'ARRAY')
 and scalar @{$parameterizableapplication->getDescriptions()} == 2
 and $parameterizableapplication->getDescriptions->[0] == $descriptions_assn
 and $parameterizableapplication->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($parameterizableapplication->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($parameterizableapplication->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($parameterizableapplication->getPropertySets,'ARRAY')
 and scalar @{$parameterizableapplication->getPropertySets()} == 1
 and $parameterizableapplication->getPropertySets->[0] == $propertysets_assn);
$parameterizableapplication->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($parameterizableapplication->getPropertySets,'ARRAY')
 and scalar @{$parameterizableapplication->getPropertySets()} == 2
 and $parameterizableapplication->getPropertySets->[0] == $propertysets_assn
 and $parameterizableapplication->getPropertySets->[1] == $propertysets_assn);


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
  my $hardwareapplication = Bio::MAGE::Protocol::HardwareApplication->new();

  # testing subclass HardwareApplication
  result ($hardwareapplication->isa(q[Bio::MAGE::Protocol::HardwareApplication]));

  # create a subclass
  my $protocolapplication = Bio::MAGE::Protocol::ProtocolApplication->new();

  # testing subclass ProtocolApplication
  result ($protocolapplication->isa(q[Bio::MAGE::Protocol::ProtocolApplication]));

  # create a subclass
  my $softwareapplication = Bio::MAGE::Protocol::SoftwareApplication->new();

  # testing subclass SoftwareApplication
  result ($softwareapplication->isa(q[Bio::MAGE::Protocol::SoftwareApplication]));

}
# testing superclass Bio::MAGE::Describable
result ($parameterizableapplication->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($parameterizableapplication->isa(q[Bio::MAGE::Extendable]));

