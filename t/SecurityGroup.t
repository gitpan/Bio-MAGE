# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SecurityGroup.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..35\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
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
my $securitygroup;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $securitygroup = Bio::MAGE::AuditAndSecurity::SecurityGroup->new();
}
result($securitygroup->isa('Bio::MAGE::AuditAndSecurity::SecurityGroup'));

# test the package class method
result($securitygroup->package() eq q[AuditAndSecurity]);

# test the class_name class method
result($securitygroup->class_name() eq q[Bio::MAGE::AuditAndSecurity::SecurityGroup]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $securitygroup = Bio::MAGE::AuditAndSecurity::SecurityGroup->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($securitygroup->getIdentifier() == 1);
$securitygroup->setIdentifier(1);
result ($securitygroup->getIdentifier() == 1);

# testing attribute name
result ($securitygroup->getName() == 2);
$securitygroup->setName(2);
result ($securitygroup->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::AuditAndSecurity::SecurityGroup->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $securitygroup = Bio::MAGE::AuditAndSecurity::SecurityGroup->new(members => [Bio::MAGE::AuditAndSecurity::Contact->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association members
my $members_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $members_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($securitygroup->getMembers->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($securitygroup->setMembers([$members_assn]));
result (UNIVERSAL::isa($securitygroup->getMembers,'ARRAY')
 and scalar @{$securitygroup->getMembers()} == 1
 and $securitygroup->getMembers->[0] == $members_assn);
$securitygroup->addMembers($members_assn);
result (UNIVERSAL::isa($securitygroup->getMembers,'ARRAY')
 and scalar @{$securitygroup->getMembers()} == 2
 and $securitygroup->getMembers->[0] == $members_assn
 and $securitygroup->getMembers->[1] == $members_assn);


# test the meta-data for the assoication
($assn) = $assns{members};
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
result (UNIVERSAL::isa($securitygroup->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($securitygroup->setSecurity($security_assn) == $security_assn);
result ($securitygroup->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($securitygroup->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($securitygroup->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($securitygroup->getAuditTrail,'ARRAY')
 and scalar @{$securitygroup->getAuditTrail()} == 1
 and $securitygroup->getAuditTrail->[0] == $audittrail_assn);
$securitygroup->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($securitygroup->getAuditTrail,'ARRAY')
 and scalar @{$securitygroup->getAuditTrail()} == 2
 and $securitygroup->getAuditTrail->[0] == $audittrail_assn
 and $securitygroup->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($securitygroup->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($securitygroup->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($securitygroup->getDescriptions,'ARRAY')
 and scalar @{$securitygroup->getDescriptions()} == 1
 and $securitygroup->getDescriptions->[0] == $descriptions_assn);
$securitygroup->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($securitygroup->getDescriptions,'ARRAY')
 and scalar @{$securitygroup->getDescriptions()} == 2
 and $securitygroup->getDescriptions->[0] == $descriptions_assn
 and $securitygroup->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($securitygroup->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($securitygroup->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($securitygroup->getPropertySets,'ARRAY')
 and scalar @{$securitygroup->getPropertySets()} == 1
 and $securitygroup->getPropertySets->[0] == $propertysets_assn);
$securitygroup->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($securitygroup->getPropertySets,'ARRAY')
 and scalar @{$securitygroup->getPropertySets()} == 2
 and $securitygroup->getPropertySets->[0] == $propertysets_assn
 and $securitygroup->getPropertySets->[1] == $propertysets_assn);


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
result ($securitygroup->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($securitygroup->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($securitygroup->isa(q[Bio::MAGE::Extendable]));

