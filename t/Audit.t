# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Audit.t'

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
use Bio::MAGE::AuditAndSecurity::Audit;
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
my $audit;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audit = Bio::MAGE::AuditAndSecurity::Audit->new();
}
result($audit->isa('Bio::MAGE::AuditAndSecurity::Audit'));

# test the package class method
result($audit->package() eq q[AuditAndSecurity]);

# test the class_name class method
result($audit->class_name() eq q[Bio::MAGE::AuditAndSecurity::Audit]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audit = Bio::MAGE::AuditAndSecurity::Audit->new(date => 1,
action => 2);
}
# testing attribute date
result ($audit->getDate() == 1);
$audit->setDate(1);
result ($audit->getDate() == 1);

# testing attribute action
result ($audit->getAction() == 2);
$audit->setAction(2);
result ($audit->getAction() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::AuditAndSecurity::Audit->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audit = Bio::MAGE::AuditAndSecurity::Audit->new(performer => Bio::MAGE::AuditAndSecurity::Contact->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association performer
my $performer_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $performer_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($audit->getPerformer,q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($audit->setPerformer($performer_assn) == $performer_assn);
result ($audit->getPerformer() == $performer_assn);



# test the meta-data for the assoication
($assn) = $assns{performer};
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
result (UNIVERSAL::isa($audit->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($audit->setSecurity($security_assn) == $security_assn);
result ($audit->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($audit->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($audit->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($audit->getAuditTrail,'ARRAY')
 and scalar @{$audit->getAuditTrail()} == 1
 and $audit->getAuditTrail->[0] == $audittrail_assn);
$audit->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($audit->getAuditTrail,'ARRAY')
 and scalar @{$audit->getAuditTrail()} == 2
 and $audit->getAuditTrail->[0] == $audittrail_assn
 and $audit->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($audit->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($audit->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($audit->getDescriptions,'ARRAY')
 and scalar @{$audit->getDescriptions()} == 1
 and $audit->getDescriptions->[0] == $descriptions_assn);
$audit->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($audit->getDescriptions,'ARRAY')
 and scalar @{$audit->getDescriptions()} == 2
 and $audit->getDescriptions->[0] == $descriptions_assn
 and $audit->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($audit->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($audit->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($audit->getPropertySets,'ARRAY')
 and scalar @{$audit->getPropertySets()} == 1
 and $audit->getPropertySets->[0] == $propertysets_assn);
$audit->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($audit->getPropertySets,'ARRAY')
 and scalar @{$audit->getPropertySets()} == 2
 and $audit->getPropertySets->[0] == $propertysets_assn
 and $audit->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Describable
result ($audit->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($audit->isa(q[Bio::MAGE::Extendable]));

