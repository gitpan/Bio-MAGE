# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Hardware.t'

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
use Bio::MAGE::Protocol::Hardware;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::Software;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Protocol::Parameter;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $hardware;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardware = Bio::MAGE::Protocol::Hardware->new();
}
result($hardware->isa('Bio::MAGE::Protocol::Hardware'));

# test the package class method
result($hardware->package() eq q[Protocol]);

# test the class_name class method
result($hardware->class_name() eq q[Bio::MAGE::Protocol::Hardware]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardware = Bio::MAGE::Protocol::Hardware->new(make => 1,
model => 2,
URI => 3,
identifier => 4,
name => 5);
}
# testing attribute make
result ($hardware->getMake() == 1);
$hardware->setMake(1);
result ($hardware->getMake() == 1);

# testing attribute model
result ($hardware->getModel() == 2);
$hardware->setModel(2);
result ($hardware->getModel() == 2);

# testing attribute URI
result ($hardware->getURI() == 3);
$hardware->setURI(3);
result ($hardware->getURI() == 3);

# testing attribute identifier
result ($hardware->getIdentifier() == 4);
$hardware->setIdentifier(4);
result ($hardware->getIdentifier() == 4);

# testing attribute name
result ($hardware->getName() == 5);
$hardware->setName(5);
result ($hardware->getName() == 5);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::Hardware->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardware = Bio::MAGE::Protocol::Hardware->new(hardwareManufacturers => [Bio::MAGE::AuditAndSecurity::Contact->new()],
softwares => [Bio::MAGE::Protocol::Software->new()],
type => Bio::MAGE::Description::OntologyEntry->new(),
parameterTypes => [Bio::MAGE::Protocol::Parameter->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association hardwareManufacturers
my $hardwaremanufacturers_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardwaremanufacturers_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($hardware->getHardwareManufacturers->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($hardware->setHardwareManufacturers([$hardwaremanufacturers_assn]));
result (UNIVERSAL::isa($hardware->getHardwareManufacturers,'ARRAY')
 and scalar @{$hardware->getHardwareManufacturers()} == 1
 and $hardware->getHardwareManufacturers->[0] == $hardwaremanufacturers_assn);
$hardware->addHardwareManufacturers($hardwaremanufacturers_assn);
result (UNIVERSAL::isa($hardware->getHardwareManufacturers,'ARRAY')
 and scalar @{$hardware->getHardwareManufacturers()} == 2
 and $hardware->getHardwareManufacturers->[0] == $hardwaremanufacturers_assn
 and $hardware->getHardwareManufacturers->[1] == $hardwaremanufacturers_assn);


# test the meta-data for the assoication
($assn) = $assns{hardwareManufacturers};
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
result (UNIVERSAL::isa($hardware->getSoftwares->[0],q[Bio::MAGE::Protocol::Software]));
result ($hardware->setSoftwares([$softwares_assn]));
result (UNIVERSAL::isa($hardware->getSoftwares,'ARRAY')
 and scalar @{$hardware->getSoftwares()} == 1
 and $hardware->getSoftwares->[0] == $softwares_assn);
$hardware->addSoftwares($softwares_assn);
result (UNIVERSAL::isa($hardware->getSoftwares,'ARRAY')
 and scalar @{$hardware->getSoftwares()} == 2
 and $hardware->getSoftwares->[0] == $softwares_assn
 and $hardware->getSoftwares->[1] == $softwares_assn);


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
# testing association type
my $type_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $type_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($hardware->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($hardware->setType($type_assn) == $type_assn);
result ($hardware->getType() == $type_assn);



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
result (UNIVERSAL::isa($hardware->getParameterTypes->[0],q[Bio::MAGE::Protocol::Parameter]));
result ($hardware->setParameterTypes([$parametertypes_assn]));
result (UNIVERSAL::isa($hardware->getParameterTypes,'ARRAY')
 and scalar @{$hardware->getParameterTypes()} == 1
 and $hardware->getParameterTypes->[0] == $parametertypes_assn);
$hardware->addParameterTypes($parametertypes_assn);
result (UNIVERSAL::isa($hardware->getParameterTypes,'ARRAY')
 and scalar @{$hardware->getParameterTypes()} == 2
 and $hardware->getParameterTypes->[0] == $parametertypes_assn
 and $hardware->getParameterTypes->[1] == $parametertypes_assn);


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
result (UNIVERSAL::isa($hardware->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($hardware->setSecurity($security_assn) == $security_assn);
result ($hardware->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($hardware->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($hardware->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($hardware->getAuditTrail,'ARRAY')
 and scalar @{$hardware->getAuditTrail()} == 1
 and $hardware->getAuditTrail->[0] == $audittrail_assn);
$hardware->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($hardware->getAuditTrail,'ARRAY')
 and scalar @{$hardware->getAuditTrail()} == 2
 and $hardware->getAuditTrail->[0] == $audittrail_assn
 and $hardware->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($hardware->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($hardware->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($hardware->getDescriptions,'ARRAY')
 and scalar @{$hardware->getDescriptions()} == 1
 and $hardware->getDescriptions->[0] == $descriptions_assn);
$hardware->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($hardware->getDescriptions,'ARRAY')
 and scalar @{$hardware->getDescriptions()} == 2
 and $hardware->getDescriptions->[0] == $descriptions_assn
 and $hardware->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($hardware->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($hardware->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($hardware->getPropertySets,'ARRAY')
 and scalar @{$hardware->getPropertySets()} == 1
 and $hardware->getPropertySets->[0] == $propertysets_assn);
$hardware->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($hardware->getPropertySets,'ARRAY')
 and scalar @{$hardware->getPropertySets()} == 2
 and $hardware->getPropertySets->[0] == $propertysets_assn
 and $hardware->getPropertySets->[1] == $propertysets_assn);


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
result ($hardware->isa(q[Bio::MAGE::Protocol::Parameterizable]));

# testing superclass Bio::MAGE::Identifiable
result ($hardware->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($hardware->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($hardware->isa(q[Bio::MAGE::Extendable]));

