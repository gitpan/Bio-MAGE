# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Database.t'

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
use Bio::MAGE::Description::Database;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $database;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $database = Bio::MAGE::Description::Database->new();
}
result($database->isa('Bio::MAGE::Description::Database'));

# test the package class method
result($database->package() eq q[Description]);

# test the class_name class method
result($database->class_name() eq q[Bio::MAGE::Description::Database]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $database = Bio::MAGE::Description::Database->new(URI => 1,
version => 2,
identifier => 3,
name => 4);
}
# testing attribute URI
result ($database->getURI() == 1);
$database->setURI(1);
result ($database->getURI() == 1);

# testing attribute version
result ($database->getVersion() == 2);
$database->setVersion(2);
result ($database->getVersion() == 2);

# testing attribute identifier
result ($database->getIdentifier() == 3);
$database->setIdentifier(3);
result ($database->getIdentifier() == 3);

# testing attribute name
result ($database->getName() == 4);
$database->setName(4);
result ($database->getName() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Description::Database->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $database = Bio::MAGE::Description::Database->new(contacts => [Bio::MAGE::AuditAndSecurity::Contact->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association contacts
my $contacts_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $contacts_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($database->getContacts->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($database->setContacts([$contacts_assn]));
result (UNIVERSAL::isa($database->getContacts,'ARRAY')
 and scalar @{$database->getContacts()} == 1
 and $database->getContacts->[0] == $contacts_assn);
$database->addContacts($contacts_assn);
result (UNIVERSAL::isa($database->getContacts,'ARRAY')
 and scalar @{$database->getContacts()} == 2
 and $database->getContacts->[0] == $contacts_assn
 and $database->getContacts->[1] == $contacts_assn);


# test the meta-data for the assoication
($assn) = $assns{contacts};
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
result (UNIVERSAL::isa($database->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($database->setSecurity($security_assn) == $security_assn);
result ($database->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($database->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($database->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($database->getAuditTrail,'ARRAY')
 and scalar @{$database->getAuditTrail()} == 1
 and $database->getAuditTrail->[0] == $audittrail_assn);
$database->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($database->getAuditTrail,'ARRAY')
 and scalar @{$database->getAuditTrail()} == 2
 and $database->getAuditTrail->[0] == $audittrail_assn
 and $database->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($database->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($database->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($database->getDescriptions,'ARRAY')
 and scalar @{$database->getDescriptions()} == 1
 and $database->getDescriptions->[0] == $descriptions_assn);
$database->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($database->getDescriptions,'ARRAY')
 and scalar @{$database->getDescriptions()} == 2
 and $database->getDescriptions->[0] == $descriptions_assn
 and $database->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($database->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($database->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($database->getPropertySets,'ARRAY')
 and scalar @{$database->getPropertySets()} == 1
 and $database->getPropertySets->[0] == $propertysets_assn);
$database->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($database->getPropertySets,'ARRAY')
 and scalar @{$database->getPropertySets()} == 2
 and $database->getPropertySets->[0] == $propertysets_assn
 and $database->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Identifiable
result ($database->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($database->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($database->isa(q[Bio::MAGE::Extendable]));

