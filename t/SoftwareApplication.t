# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SoftwareApplication.t'

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
use Bio::MAGE::Protocol::SoftwareApplication;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::Software;
use Bio::MAGE::Protocol::ParameterValue;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $softwareapplication;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $softwareapplication = Bio::MAGE::Protocol::SoftwareApplication->new();
}
result($softwareapplication->isa('Bio::MAGE::Protocol::SoftwareApplication'));

# test the package class method
result($softwareapplication->package() eq q[Protocol]);

# test the class_name class method
result($softwareapplication->class_name() eq q[Bio::MAGE::Protocol::SoftwareApplication]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $softwareapplication = Bio::MAGE::Protocol::SoftwareApplication->new(releaseDate => 1,
version => 2);
}
# testing attribute releaseDate
result ($softwareapplication->getReleaseDate() == 1);
$softwareapplication->setReleaseDate(1);
result ($softwareapplication->getReleaseDate() == 1);

# testing attribute version
result ($softwareapplication->getVersion() == 2);
$softwareapplication->setVersion(2);
result ($softwareapplication->getVersion() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::SoftwareApplication->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $softwareapplication = Bio::MAGE::Protocol::SoftwareApplication->new(software => Bio::MAGE::Protocol::Software->new(),
parameterValues => [Bio::MAGE::Protocol::ParameterValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association software
my $software_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $software_assn = Bio::MAGE::Protocol::Software->new();
}
result (UNIVERSAL::isa($softwareapplication->getSoftware,q[Bio::MAGE::Protocol::Software]));
result ($softwareapplication->setSoftware($software_assn) == $software_assn);
result ($softwareapplication->getSoftware() == $software_assn);



# test the meta-data for the assoication
($assn) = $assns{software};
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
result (UNIVERSAL::isa($softwareapplication->getParameterValues->[0],q[Bio::MAGE::Protocol::ParameterValue]));
result ($softwareapplication->setParameterValues([$parametervalues_assn]));
result (UNIVERSAL::isa($softwareapplication->getParameterValues,'ARRAY')
 and scalar @{$softwareapplication->getParameterValues()} == 1
 and $softwareapplication->getParameterValues->[0] == $parametervalues_assn);
$softwareapplication->addParameterValues($parametervalues_assn);
result (UNIVERSAL::isa($softwareapplication->getParameterValues,'ARRAY')
 and scalar @{$softwareapplication->getParameterValues()} == 2
 and $softwareapplication->getParameterValues->[0] == $parametervalues_assn
 and $softwareapplication->getParameterValues->[1] == $parametervalues_assn);


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
result (UNIVERSAL::isa($softwareapplication->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($softwareapplication->setSecurity($security_assn) == $security_assn);
result ($softwareapplication->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($softwareapplication->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($softwareapplication->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($softwareapplication->getAuditTrail,'ARRAY')
 and scalar @{$softwareapplication->getAuditTrail()} == 1
 and $softwareapplication->getAuditTrail->[0] == $audittrail_assn);
$softwareapplication->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($softwareapplication->getAuditTrail,'ARRAY')
 and scalar @{$softwareapplication->getAuditTrail()} == 2
 and $softwareapplication->getAuditTrail->[0] == $audittrail_assn
 and $softwareapplication->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($softwareapplication->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($softwareapplication->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($softwareapplication->getDescriptions,'ARRAY')
 and scalar @{$softwareapplication->getDescriptions()} == 1
 and $softwareapplication->getDescriptions->[0] == $descriptions_assn);
$softwareapplication->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($softwareapplication->getDescriptions,'ARRAY')
 and scalar @{$softwareapplication->getDescriptions()} == 2
 and $softwareapplication->getDescriptions->[0] == $descriptions_assn
 and $softwareapplication->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($softwareapplication->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($softwareapplication->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($softwareapplication->getPropertySets,'ARRAY')
 and scalar @{$softwareapplication->getPropertySets()} == 1
 and $softwareapplication->getPropertySets->[0] == $propertysets_assn);
$softwareapplication->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($softwareapplication->getPropertySets,'ARRAY')
 and scalar @{$softwareapplication->getPropertySets()} == 2
 and $softwareapplication->getPropertySets->[0] == $propertysets_assn
 and $softwareapplication->getPropertySets->[1] == $propertysets_assn);


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
result ($softwareapplication->isa(q[Bio::MAGE::Protocol::ParameterizableApplication]));

# testing superclass Bio::MAGE::Describable
result ($softwareapplication->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($softwareapplication->isa(q[Bio::MAGE::Extendable]));

