# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Software.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..56\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::Software;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::Software;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Protocol::Parameter;
use Bio::MAGE::Protocol::Hardware;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $software;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $software = Bio::MAGE::Protocol::Software->new();
}
result($software->isa('Bio::MAGE::Protocol::Software'));

# test the package class method
result($software->package() eq q[Protocol]);

# test the class_name class method
result($software->class_name() eq q[Bio::MAGE::Protocol::Software]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $software = Bio::MAGE::Protocol::Software->new(URI => 1,
identifier => 2,
name => 3);
}
# testing attribute URI
result ($software->getURI() == 1);
$software->setURI(1);
result ($software->getURI() == 1);

# testing attribute identifier
result ($software->getIdentifier() == 2);
$software->setIdentifier(2);
result ($software->getIdentifier() == 2);

# testing attribute name
result ($software->getName() == 3);
$software->setName(3);
result ($software->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::Software->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $software = Bio::MAGE::Protocol::Software->new(softwareManufacturers => [Bio::MAGE::AuditAndSecurity::Contact->new()],
softwares => [Bio::MAGE::Protocol::Software->new()],
hardware => Bio::MAGE::Protocol::Hardware->new(),
type => Bio::MAGE::Description::OntologyEntry->new(),
parameterTypes => [Bio::MAGE::Protocol::Parameter->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association softwareManufacturers
my $softwaremanufacturers_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $softwaremanufacturers_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($software->getSoftwareManufacturers->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($software->setSoftwareManufacturers([$softwaremanufacturers_assn]));
result (UNIVERSAL::isa($software->getSoftwareManufacturers,'ARRAY')
 and scalar @{$software->getSoftwareManufacturers()} == 1
 and $software->getSoftwareManufacturers->[0] == $softwaremanufacturers_assn);
$software->addSoftwareManufacturers($softwaremanufacturers_assn);
result (UNIVERSAL::isa($software->getSoftwareManufacturers,'ARRAY')
 and scalar @{$software->getSoftwareManufacturers()} == 2
 and $software->getSoftwareManufacturers->[0] == $softwaremanufacturers_assn
 and $software->getSoftwareManufacturers->[1] == $softwaremanufacturers_assn);


# test the meta-data for the assoication
($assn) = $assns{softwareManufacturers};
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
# testing association softwares
my $softwares_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $softwares_assn = Bio::MAGE::Protocol::Software->new();
}
result (UNIVERSAL::isa($software->getSoftwares->[0],q[Bio::MAGE::Protocol::Software]));
result ($software->setSoftwares([$softwares_assn]));
result (UNIVERSAL::isa($software->getSoftwares,'ARRAY')
 and scalar @{$software->getSoftwares()} == 1
 and $software->getSoftwares->[0] == $softwares_assn);
$software->addSoftwares($softwares_assn);
result (UNIVERSAL::isa($software->getSoftwares,'ARRAY')
 and scalar @{$software->getSoftwares()} == 2
 and $software->getSoftwares->[0] == $softwares_assn
 and $software->getSoftwares->[1] == $softwares_assn);


# test the meta-data for the assoication
($assn) = $assns{softwares};
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
# testing association hardware
my $hardware_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardware_assn = Bio::MAGE::Protocol::Hardware->new();
}
result (UNIVERSAL::isa($software->getHardware,q[Bio::MAGE::Protocol::Hardware]));
result ($software->setHardware($hardware_assn) == $hardware_assn);
result ($software->getHardware() == $hardware_assn);



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
# testing association type
my $type_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $type_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($software->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($software->setType($type_assn) == $type_assn);
result ($software->getType() == $type_assn);



# test the meta-data for the assoication
($assn) = $assns{type};
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
# testing association parameterTypes
my $parametertypes_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parametertypes_assn = Bio::MAGE::Protocol::Parameter->new();
}
result (UNIVERSAL::isa($software->getParameterTypes->[0],q[Bio::MAGE::Protocol::Parameter]));
result ($software->setParameterTypes([$parametertypes_assn]));
result (UNIVERSAL::isa($software->getParameterTypes,'ARRAY')
 and scalar @{$software->getParameterTypes()} == 1
 and $software->getParameterTypes->[0] == $parametertypes_assn);
$software->addParameterTypes($parametertypes_assn);
result (UNIVERSAL::isa($software->getParameterTypes,'ARRAY')
 and scalar @{$software->getParameterTypes()} == 2
 and $software->getParameterTypes->[0] == $parametertypes_assn
 and $software->getParameterTypes->[1] == $parametertypes_assn);


# test the meta-data for the assoication
($assn) = $assns{parameterTypes};
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
result (UNIVERSAL::isa($software->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($software->setSecurity($security_assn) == $security_assn);
result ($software->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($software->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($software->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($software->getAuditTrail,'ARRAY')
 and scalar @{$software->getAuditTrail()} == 1
 and $software->getAuditTrail->[0] == $audittrail_assn);
$software->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($software->getAuditTrail,'ARRAY')
 and scalar @{$software->getAuditTrail()} == 2
 and $software->getAuditTrail->[0] == $audittrail_assn
 and $software->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($software->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($software->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($software->getDescriptions,'ARRAY')
 and scalar @{$software->getDescriptions()} == 1
 and $software->getDescriptions->[0] == $descriptions_assn);
$software->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($software->getDescriptions,'ARRAY')
 and scalar @{$software->getDescriptions()} == 2
 and $software->getDescriptions->[0] == $descriptions_assn
 and $software->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($software->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($software->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($software->getPropertySets,'ARRAY')
 and scalar @{$software->getPropertySets()} == 1
 and $software->getPropertySets->[0] == $propertysets_assn);
$software->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($software->getPropertySets,'ARRAY')
 and scalar @{$software->getPropertySets()} == 2
 and $software->getPropertySets->[0] == $propertysets_assn
 and $software->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Protocol::Parameterizable
result ($software->isa(q[Bio::MAGE::Protocol::Parameterizable]));

# testing superclass Bio::MAGE::Identifiable
result ($software->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($software->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($software->isa(q[Bio::MAGE::Extendable]));

