# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Organization.t'

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
use Bio::MAGE::AuditAndSecurity::Organization;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::AuditAndSecurity::Organization;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $organization;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $organization = Bio::MAGE::AuditAndSecurity::Organization->new();
}
result($organization->isa('Bio::MAGE::AuditAndSecurity::Organization'));

# test the package class method
result($organization->package() eq q[AuditAndSecurity]);

# test the class_name class method
result($organization->class_name() eq q[Bio::MAGE::AuditAndSecurity::Organization]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $organization = Bio::MAGE::AuditAndSecurity::Organization->new(URI => 1,
address => 2,
phone => 3,
tollFreePhone => 4,
email => 5,
fax => 6,
identifier => 7,
name => 8);
}
# testing attribute URI
result ($organization->getURI() == 1);
$organization->setURI(1);
result ($organization->getURI() == 1);

# testing attribute address
result ($organization->getAddress() == 2);
$organization->setAddress(2);
result ($organization->getAddress() == 2);

# testing attribute phone
result ($organization->getPhone() == 3);
$organization->setPhone(3);
result ($organization->getPhone() == 3);

# testing attribute tollFreePhone
result ($organization->getTollFreePhone() == 4);
$organization->setTollFreePhone(4);
result ($organization->getTollFreePhone() == 4);

# testing attribute email
result ($organization->getEmail() == 5);
$organization->setEmail(5);
result ($organization->getEmail() == 5);

# testing attribute fax
result ($organization->getFax() == 6);
$organization->setFax(6);
result ($organization->getFax() == 6);

# testing attribute identifier
result ($organization->getIdentifier() == 7);
$organization->setIdentifier(7);
result ($organization->getIdentifier() == 7);

# testing attribute name
result ($organization->getName() == 8);
$organization->setName(8);
result ($organization->getName() == 8);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::AuditAndSecurity::Organization->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $organization = Bio::MAGE::AuditAndSecurity::Organization->new(parent => Bio::MAGE::AuditAndSecurity::Organization->new(),
roles => [Bio::MAGE::Description::OntologyEntry->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association parent
my $parent_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parent_assn = Bio::MAGE::AuditAndSecurity::Organization->new();
}
result (UNIVERSAL::isa($organization->getParent,q[Bio::MAGE::AuditAndSecurity::Organization]));
result ($organization->setParent($parent_assn) == $parent_assn);
result ($organization->getParent() == $parent_assn);



# test the meta-data for the assoication
($assn) = $assns{parent};
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
# testing association roles
my $roles_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $roles_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($organization->getRoles->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($organization->setRoles([$roles_assn]));
result (UNIVERSAL::isa($organization->getRoles,'ARRAY')
 and scalar @{$organization->getRoles()} == 1
 and $organization->getRoles->[0] == $roles_assn);
$organization->addRoles($roles_assn);
result (UNIVERSAL::isa($organization->getRoles,'ARRAY')
 and scalar @{$organization->getRoles()} == 2
 and $organization->getRoles->[0] == $roles_assn
 and $organization->getRoles->[1] == $roles_assn);


# test the meta-data for the assoication
($assn) = $assns{roles};
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
result (UNIVERSAL::isa($organization->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($organization->setSecurity($security_assn) == $security_assn);
result ($organization->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($organization->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($organization->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($organization->getAuditTrail,'ARRAY')
 and scalar @{$organization->getAuditTrail()} == 1
 and $organization->getAuditTrail->[0] == $audittrail_assn);
$organization->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($organization->getAuditTrail,'ARRAY')
 and scalar @{$organization->getAuditTrail()} == 2
 and $organization->getAuditTrail->[0] == $audittrail_assn
 and $organization->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($organization->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($organization->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($organization->getDescriptions,'ARRAY')
 and scalar @{$organization->getDescriptions()} == 1
 and $organization->getDescriptions->[0] == $descriptions_assn);
$organization->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($organization->getDescriptions,'ARRAY')
 and scalar @{$organization->getDescriptions()} == 2
 and $organization->getDescriptions->[0] == $descriptions_assn
 and $organization->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($organization->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($organization->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($organization->getPropertySets,'ARRAY')
 and scalar @{$organization->getPropertySets()} == 1
 and $organization->getPropertySets->[0] == $propertysets_assn);
$organization->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($organization->getPropertySets,'ARRAY')
 and scalar @{$organization->getPropertySets()} == 2
 and $organization->getPropertySets->[0] == $propertysets_assn
 and $organization->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::AuditAndSecurity::Contact
result ($organization->isa(q[Bio::MAGE::AuditAndSecurity::Contact]));

# testing superclass Bio::MAGE::Identifiable
result ($organization->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($organization->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($organization->isa(q[Bio::MAGE::Extendable]));

