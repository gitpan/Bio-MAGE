# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Node.t'

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
use Bio::MAGE::HigherLevelAnalysis::Node;
use Bio::MAGE::HigherLevelAnalysis::Node;
use Bio::MAGE::HigherLevelAnalysis::NodeContents;
use Bio::MAGE::HigherLevelAnalysis::NodeValue;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $node;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $node = Bio::MAGE::HigherLevelAnalysis::Node->new();
}
result($node->isa('Bio::MAGE::HigherLevelAnalysis::Node'));

# test the package class method
result($node->package() eq q[HigherLevelAnalysis]);

# test the class_name class method
result($node->class_name() eq q[Bio::MAGE::HigherLevelAnalysis::Node]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::HigherLevelAnalysis::Node->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $node = Bio::MAGE::HigherLevelAnalysis::Node->new(nodeValue => [Bio::MAGE::HigherLevelAnalysis::NodeValue->new()],
nodeContents => [Bio::MAGE::HigherLevelAnalysis::NodeContents->new()],
nodes => [Bio::MAGE::HigherLevelAnalysis::Node->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association nodeValue
my $nodevalue_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodevalue_assn = Bio::MAGE::HigherLevelAnalysis::NodeValue->new();
}
result (UNIVERSAL::isa($node->getNodeValue->[0],q[Bio::MAGE::HigherLevelAnalysis::NodeValue]));
result ($node->setNodeValue([$nodevalue_assn]));
result (UNIVERSAL::isa($node->getNodeValue,'ARRAY')
 and scalar @{$node->getNodeValue()} == 1
 and $node->getNodeValue->[0] == $nodevalue_assn);
$node->addNodeValue($nodevalue_assn);
result (UNIVERSAL::isa($node->getNodeValue,'ARRAY')
 and scalar @{$node->getNodeValue()} == 2
 and $node->getNodeValue->[0] == $nodevalue_assn
 and $node->getNodeValue->[1] == $nodevalue_assn);


# test the meta-data for the assoication
($assn) = $assns{nodeValue};
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
# testing association nodeContents
my $nodecontents_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodecontents_assn = Bio::MAGE::HigherLevelAnalysis::NodeContents->new();
}
result (UNIVERSAL::isa($node->getNodeContents->[0],q[Bio::MAGE::HigherLevelAnalysis::NodeContents]));
result ($node->setNodeContents([$nodecontents_assn]));
result (UNIVERSAL::isa($node->getNodeContents,'ARRAY')
 and scalar @{$node->getNodeContents()} == 1
 and $node->getNodeContents->[0] == $nodecontents_assn);
$node->addNodeContents($nodecontents_assn);
result (UNIVERSAL::isa($node->getNodeContents,'ARRAY')
 and scalar @{$node->getNodeContents()} == 2
 and $node->getNodeContents->[0] == $nodecontents_assn
 and $node->getNodeContents->[1] == $nodecontents_assn);


# test the meta-data for the assoication
($assn) = $assns{nodeContents};
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
# testing association nodes
my $nodes_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodes_assn = Bio::MAGE::HigherLevelAnalysis::Node->new();
}
result (UNIVERSAL::isa($node->getNodes->[0],q[Bio::MAGE::HigherLevelAnalysis::Node]));
result ($node->setNodes([$nodes_assn]));
result (UNIVERSAL::isa($node->getNodes,'ARRAY')
 and scalar @{$node->getNodes()} == 1
 and $node->getNodes->[0] == $nodes_assn);
$node->addNodes($nodes_assn);
result (UNIVERSAL::isa($node->getNodes,'ARRAY')
 and scalar @{$node->getNodes()} == 2
 and $node->getNodes->[0] == $nodes_assn
 and $node->getNodes->[1] == $nodes_assn);


# test the meta-data for the assoication
($assn) = $assns{nodes};
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
result (UNIVERSAL::isa($node->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($node->setSecurity($security_assn) == $security_assn);
result ($node->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($node->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($node->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($node->getAuditTrail,'ARRAY')
 and scalar @{$node->getAuditTrail()} == 1
 and $node->getAuditTrail->[0] == $audittrail_assn);
$node->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($node->getAuditTrail,'ARRAY')
 and scalar @{$node->getAuditTrail()} == 2
 and $node->getAuditTrail->[0] == $audittrail_assn
 and $node->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($node->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($node->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($node->getDescriptions,'ARRAY')
 and scalar @{$node->getDescriptions()} == 1
 and $node->getDescriptions->[0] == $descriptions_assn);
$node->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($node->getDescriptions,'ARRAY')
 and scalar @{$node->getDescriptions()} == 2
 and $node->getDescriptions->[0] == $descriptions_assn
 and $node->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($node->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($node->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($node->getPropertySets,'ARRAY')
 and scalar @{$node->getPropertySets()} == 1
 and $node->getPropertySets->[0] == $propertysets_assn);
$node->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($node->getPropertySets,'ARRAY')
 and scalar @{$node->getPropertySets()} == 2
 and $node->getPropertySets->[0] == $propertysets_assn
 and $node->getPropertySets->[1] == $propertysets_assn);


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
result ($node->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($node->isa(q[Bio::MAGE::Extendable]));

