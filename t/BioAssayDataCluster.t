# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayDataCluster.t'

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
use Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster;
use Bio::MAGE::HigherLevelAnalysis::Node;
use Bio::MAGE::BioAssayData::BioAssayData;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassaydatacluster;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatacluster = Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster->new();
}
result($bioassaydatacluster->isa('Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster'));

# test the package class method
result($bioassaydatacluster->package() eq q[HigherLevelAnalysis]);

# test the class_name class method
result($bioassaydatacluster->class_name() eq q[Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatacluster = Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($bioassaydatacluster->getIdentifier() == 1);
$bioassaydatacluster->setIdentifier(1);
result ($bioassaydatacluster->getIdentifier() == 1);

# testing attribute name
result ($bioassaydatacluster->getName() == 2);
$bioassaydatacluster->setName(2);
result ($bioassaydatacluster->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatacluster = Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster->new(nodes => [Bio::MAGE::HigherLevelAnalysis::Node->new()],
clusterBioAssayData => Bio::MAGE::BioAssayData::BioAssayData->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association nodes
my $nodes_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodes_assn = Bio::MAGE::HigherLevelAnalysis::Node->new();
}
result (UNIVERSAL::isa($bioassaydatacluster->getNodes->[0],q[Bio::MAGE::HigherLevelAnalysis::Node]));
result ($bioassaydatacluster->setNodes([$nodes_assn]));
result (UNIVERSAL::isa($bioassaydatacluster->getNodes,'ARRAY')
 and scalar @{$bioassaydatacluster->getNodes()} == 1
 and $bioassaydatacluster->getNodes->[0] == $nodes_assn);
$bioassaydatacluster->addNodes($nodes_assn);
result (UNIVERSAL::isa($bioassaydatacluster->getNodes,'ARRAY')
 and scalar @{$bioassaydatacluster->getNodes()} == 2
 and $bioassaydatacluster->getNodes->[0] == $nodes_assn
 and $bioassaydatacluster->getNodes->[1] == $nodes_assn);


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
# testing association clusterBioAssayData
my $clusterbioassaydata_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $clusterbioassaydata_assn = Bio::MAGE::BioAssayData::BioAssayData->new();
}
result (UNIVERSAL::isa($bioassaydatacluster->getClusterBioAssayData,q[Bio::MAGE::BioAssayData::BioAssayData]));
result ($bioassaydatacluster->setClusterBioAssayData($clusterbioassaydata_assn) == $clusterbioassaydata_assn);
result ($bioassaydatacluster->getClusterBioAssayData() == $clusterbioassaydata_assn);



# test the meta-data for the assoication
($assn) = $assns{clusterBioAssayData};
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
result (UNIVERSAL::isa($bioassaydatacluster->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($bioassaydatacluster->setSecurity($security_assn) == $security_assn);
result ($bioassaydatacluster->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($bioassaydatacluster->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($bioassaydatacluster->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($bioassaydatacluster->getAuditTrail,'ARRAY')
 and scalar @{$bioassaydatacluster->getAuditTrail()} == 1
 and $bioassaydatacluster->getAuditTrail->[0] == $audittrail_assn);
$bioassaydatacluster->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($bioassaydatacluster->getAuditTrail,'ARRAY')
 and scalar @{$bioassaydatacluster->getAuditTrail()} == 2
 and $bioassaydatacluster->getAuditTrail->[0] == $audittrail_assn
 and $bioassaydatacluster->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($bioassaydatacluster->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($bioassaydatacluster->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($bioassaydatacluster->getDescriptions,'ARRAY')
 and scalar @{$bioassaydatacluster->getDescriptions()} == 1
 and $bioassaydatacluster->getDescriptions->[0] == $descriptions_assn);
$bioassaydatacluster->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($bioassaydatacluster->getDescriptions,'ARRAY')
 and scalar @{$bioassaydatacluster->getDescriptions()} == 2
 and $bioassaydatacluster->getDescriptions->[0] == $descriptions_assn
 and $bioassaydatacluster->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($bioassaydatacluster->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaydatacluster->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaydatacluster->getPropertySets,'ARRAY')
 and scalar @{$bioassaydatacluster->getPropertySets()} == 1
 and $bioassaydatacluster->getPropertySets->[0] == $propertysets_assn);
$bioassaydatacluster->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaydatacluster->getPropertySets,'ARRAY')
 and scalar @{$bioassaydatacluster->getPropertySets()} == 2
 and $bioassaydatacluster->getPropertySets->[0] == $propertysets_assn
 and $bioassaydatacluster->getPropertySets->[1] == $propertysets_assn);


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
result ($bioassaydatacluster->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($bioassaydatacluster->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($bioassaydatacluster->isa(q[Bio::MAGE::Extendable]));

