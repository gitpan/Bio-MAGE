# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Channel.t'

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
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioMaterial::Compound;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $channel;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channel = Bio::MAGE::BioAssay::Channel->new();
}
result($channel->isa('Bio::MAGE::BioAssay::Channel'));

# test the package class method
result($channel->package() eq q[BioAssay]);

# test the class_name class method
result($channel->class_name() eq q[Bio::MAGE::BioAssay::Channel]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channel = Bio::MAGE::BioAssay::Channel->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($channel->getIdentifier() == 1);
$channel->setIdentifier(1);
result ($channel->getIdentifier() == 1);

# testing attribute name
result ($channel->getName() == 2);
$channel->setName(2);
result ($channel->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::Channel->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channel = Bio::MAGE::BioAssay::Channel->new(labels => [Bio::MAGE::BioMaterial::Compound->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association labels
my $labels_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $labels_assn = Bio::MAGE::BioMaterial::Compound->new();
}
result (UNIVERSAL::isa($channel->getLabels->[0],q[Bio::MAGE::BioMaterial::Compound]));
result ($channel->setLabels([$labels_assn]));
result (UNIVERSAL::isa($channel->getLabels,'ARRAY')
 and scalar @{$channel->getLabels()} == 1
 and $channel->getLabels->[0] == $labels_assn);
$channel->addLabels($labels_assn);
result (UNIVERSAL::isa($channel->getLabels,'ARRAY')
 and scalar @{$channel->getLabels()} == 2
 and $channel->getLabels->[0] == $labels_assn
 and $channel->getLabels->[1] == $labels_assn);


# test the meta-data for the assoication
($assn) = $assns{labels};
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
result (UNIVERSAL::isa($channel->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($channel->setSecurity($security_assn) == $security_assn);
result ($channel->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($channel->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($channel->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($channel->getAuditTrail,'ARRAY')
 and scalar @{$channel->getAuditTrail()} == 1
 and $channel->getAuditTrail->[0] == $audittrail_assn);
$channel->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($channel->getAuditTrail,'ARRAY')
 and scalar @{$channel->getAuditTrail()} == 2
 and $channel->getAuditTrail->[0] == $audittrail_assn
 and $channel->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($channel->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($channel->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($channel->getDescriptions,'ARRAY')
 and scalar @{$channel->getDescriptions()} == 1
 and $channel->getDescriptions->[0] == $descriptions_assn);
$channel->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($channel->getDescriptions,'ARRAY')
 and scalar @{$channel->getDescriptions()} == 2
 and $channel->getDescriptions->[0] == $descriptions_assn
 and $channel->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($channel->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($channel->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($channel->getPropertySets,'ARRAY')
 and scalar @{$channel->getPropertySets()} == 1
 and $channel->getPropertySets->[0] == $propertysets_assn);
$channel->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($channel->getPropertySets,'ARRAY')
 and scalar @{$channel->getPropertySets()} == 2
 and $channel->getPropertySets->[0] == $propertysets_assn
 and $channel->getPropertySets->[1] == $propertysets_assn);


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
result ($channel->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($channel->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($channel->isa(q[Bio::MAGE::Extendable]));

