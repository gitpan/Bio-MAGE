# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Security.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..40\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::AuditAndSecurity::SecurityGroup;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $security;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security = Bio::MAGE::AuditAndSecurity::Security->new();
}
result($security->isa('Bio::MAGE::AuditAndSecurity::Security'));

# test the package class method
result($security->package() eq q[AuditAndSecurity]);

# test the class_name class method
result($security->class_name() eq q[Bio::MAGE::AuditAndSecurity::Security]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security = Bio::MAGE::AuditAndSecurity::Security->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($security->getIdentifier() == 1);
$security->setIdentifier(1);
result ($security->getIdentifier() == 1);

# testing attribute name
result ($security->getName() == 2);
$security->setName(2);
result ($security->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::AuditAndSecurity::Security->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security = Bio::MAGE::AuditAndSecurity::Security->new(owner => [Bio::MAGE::AuditAndSecurity::Contact->new()],
securityGroups => [Bio::MAGE::AuditAndSecurity::SecurityGroup->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association owner
my $owner_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $owner_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($security->getOwner->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($security->setOwner([$owner_assn]));
result (UNIVERSAL::isa($security->getOwner,'ARRAY')
 and scalar @{$security->getOwner()} == 1
 and $security->getOwner->[0] == $owner_assn);
$security->addOwner($owner_assn);
result (UNIVERSAL::isa($security->getOwner,'ARRAY')
 and scalar @{$security->getOwner()} == 2
 and $security->getOwner->[0] == $owner_assn
 and $security->getOwner->[1] == $owner_assn);


# test the meta-data for the assoication
($assn) = $assns{owner};
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
# testing association securityGroups
my $securitygroups_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $securitygroups_assn = Bio::MAGE::AuditAndSecurity::SecurityGroup->new();
}
result (UNIVERSAL::isa($security->getSecurityGroups->[0],q[Bio::MAGE::AuditAndSecurity::SecurityGroup]));
result ($security->setSecurityGroups([$securitygroups_assn]));
result (UNIVERSAL::isa($security->getSecurityGroups,'ARRAY')
 and scalar @{$security->getSecurityGroups()} == 1
 and $security->getSecurityGroups->[0] == $securitygroups_assn);
$security->addSecurityGroups($securitygroups_assn);
result (UNIVERSAL::isa($security->getSecurityGroups,'ARRAY')
 and scalar @{$security->getSecurityGroups()} == 2
 and $security->getSecurityGroups->[0] == $securitygroups_assn
 and $security->getSecurityGroups->[1] == $securitygroups_assn);


# test the meta-data for the assoication
($assn) = $assns{securityGroups};
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
result (UNIVERSAL::isa($security->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($security->setSecurity($security_assn) == $security_assn);
result ($security->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($security->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($security->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($security->getAuditTrail,'ARRAY')
 and scalar @{$security->getAuditTrail()} == 1
 and $security->getAuditTrail->[0] == $audittrail_assn);
$security->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($security->getAuditTrail,'ARRAY')
 and scalar @{$security->getAuditTrail()} == 2
 and $security->getAuditTrail->[0] == $audittrail_assn
 and $security->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($security->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($security->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($security->getDescriptions,'ARRAY')
 and scalar @{$security->getDescriptions()} == 1
 and $security->getDescriptions->[0] == $descriptions_assn);
$security->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($security->getDescriptions,'ARRAY')
 and scalar @{$security->getDescriptions()} == 2
 and $security->getDescriptions->[0] == $descriptions_assn
 and $security->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($security->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($security->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($security->getPropertySets,'ARRAY')
 and scalar @{$security->getPropertySets()} == 1
 and $security->getPropertySets->[0] == $propertysets_assn);
$security->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($security->getPropertySets,'ARRAY')
 and scalar @{$security->getPropertySets()} == 2
 and $security->getPropertySets->[0] == $propertysets_assn
 and $security->getPropertySets->[1] == $propertysets_assn);


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
result ($security->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($security->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($security->isa(q[Bio::MAGE::Extendable]));

