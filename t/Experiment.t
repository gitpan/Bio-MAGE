# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Experiment.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..54\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Experiment::Experiment;
use Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::BioAssayData::BioAssayData;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Experiment::ExperimentDesign;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $experiment;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experiment = Bio::MAGE::Experiment::Experiment->new();
}
result($experiment->isa('Bio::MAGE::Experiment::Experiment'));

# test the package class method
result($experiment->package() eq q[Experiment]);

# test the class_name class method
result($experiment->class_name() eq q[Bio::MAGE::Experiment::Experiment]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experiment = Bio::MAGE::Experiment::Experiment->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($experiment->getIdentifier() == 1);
$experiment->setIdentifier(1);
result ($experiment->getIdentifier() == 1);

# testing attribute name
result ($experiment->getName() == 2);
$experiment->setName(2);
result ($experiment->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Experiment::Experiment->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experiment = Bio::MAGE::Experiment::Experiment->new(bioAssays => [Bio::MAGE::BioAssay::BioAssay->new()],
providers => [Bio::MAGE::AuditAndSecurity::Contact->new()],
bioAssayData => [Bio::MAGE::BioAssayData::BioAssayData->new()],
analysisResults => [Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster->new()],
experimentDesign => Bio::MAGE::Experiment::ExperimentDesign->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association bioAssays
my $bioassays_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassays_assn = Bio::MAGE::BioAssay::BioAssay->new();
}
result (UNIVERSAL::isa($experiment->getBioAssays->[0],q[Bio::MAGE::BioAssay::BioAssay]));
result ($experiment->setBioAssays([$bioassays_assn]));
result (UNIVERSAL::isa($experiment->getBioAssays,'ARRAY')
 and scalar @{$experiment->getBioAssays()} == 1
 and $experiment->getBioAssays->[0] == $bioassays_assn);
$experiment->addBioAssays($bioassays_assn);
result (UNIVERSAL::isa($experiment->getBioAssays,'ARRAY')
 and scalar @{$experiment->getBioAssays()} == 2
 and $experiment->getBioAssays->[0] == $bioassays_assn
 and $experiment->getBioAssays->[1] == $bioassays_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssays};
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
# testing association providers
my $providers_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $providers_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($experiment->getProviders->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($experiment->setProviders([$providers_assn]));
result (UNIVERSAL::isa($experiment->getProviders,'ARRAY')
 and scalar @{$experiment->getProviders()} == 1
 and $experiment->getProviders->[0] == $providers_assn);
$experiment->addProviders($providers_assn);
result (UNIVERSAL::isa($experiment->getProviders,'ARRAY')
 and scalar @{$experiment->getProviders()} == 2
 and $experiment->getProviders->[0] == $providers_assn
 and $experiment->getProviders->[1] == $providers_assn);


# test the meta-data for the assoication
($assn) = $assns{providers};
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
# testing association bioAssayData
my $bioassaydata_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydata_assn = Bio::MAGE::BioAssayData::BioAssayData->new();
}
result (UNIVERSAL::isa($experiment->getBioAssayData->[0],q[Bio::MAGE::BioAssayData::BioAssayData]));
result ($experiment->setBioAssayData([$bioassaydata_assn]));
result (UNIVERSAL::isa($experiment->getBioAssayData,'ARRAY')
 and scalar @{$experiment->getBioAssayData()} == 1
 and $experiment->getBioAssayData->[0] == $bioassaydata_assn);
$experiment->addBioAssayData($bioassaydata_assn);
result (UNIVERSAL::isa($experiment->getBioAssayData,'ARRAY')
 and scalar @{$experiment->getBioAssayData()} == 2
 and $experiment->getBioAssayData->[0] == $bioassaydata_assn
 and $experiment->getBioAssayData->[1] == $bioassaydata_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssayData};
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
# testing association analysisResults
my $analysisresults_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $analysisresults_assn = Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster->new();
}
result (UNIVERSAL::isa($experiment->getAnalysisResults->[0],q[Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster]));
result ($experiment->setAnalysisResults([$analysisresults_assn]));
result (UNIVERSAL::isa($experiment->getAnalysisResults,'ARRAY')
 and scalar @{$experiment->getAnalysisResults()} == 1
 and $experiment->getAnalysisResults->[0] == $analysisresults_assn);
$experiment->addAnalysisResults($analysisresults_assn);
result (UNIVERSAL::isa($experiment->getAnalysisResults,'ARRAY')
 and scalar @{$experiment->getAnalysisResults()} == 2
 and $experiment->getAnalysisResults->[0] == $analysisresults_assn
 and $experiment->getAnalysisResults->[1] == $analysisresults_assn);


# test the meta-data for the assoication
($assn) = $assns{analysisResults};
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
# testing association experimentDesign
my $experimentdesign_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentdesign_assn = Bio::MAGE::Experiment::ExperimentDesign->new();
}
result (UNIVERSAL::isa($experiment->getExperimentDesign,q[Bio::MAGE::Experiment::ExperimentDesign]));
result ($experiment->setExperimentDesign($experimentdesign_assn) == $experimentdesign_assn);
result ($experiment->getExperimentDesign() == $experimentdesign_assn);



# test the meta-data for the assoication
($assn) = $assns{experimentDesign};
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
result (UNIVERSAL::isa($experiment->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($experiment->setSecurity($security_assn) == $security_assn);
result ($experiment->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($experiment->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($experiment->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($experiment->getAuditTrail,'ARRAY')
 and scalar @{$experiment->getAuditTrail()} == 1
 and $experiment->getAuditTrail->[0] == $audittrail_assn);
$experiment->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($experiment->getAuditTrail,'ARRAY')
 and scalar @{$experiment->getAuditTrail()} == 2
 and $experiment->getAuditTrail->[0] == $audittrail_assn
 and $experiment->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($experiment->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($experiment->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($experiment->getDescriptions,'ARRAY')
 and scalar @{$experiment->getDescriptions()} == 1
 and $experiment->getDescriptions->[0] == $descriptions_assn);
$experiment->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($experiment->getDescriptions,'ARRAY')
 and scalar @{$experiment->getDescriptions()} == 2
 and $experiment->getDescriptions->[0] == $descriptions_assn
 and $experiment->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($experiment->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($experiment->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($experiment->getPropertySets,'ARRAY')
 and scalar @{$experiment->getPropertySets()} == 1
 and $experiment->getPropertySets->[0] == $propertysets_assn);
$experiment->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($experiment->getPropertySets,'ARRAY')
 and scalar @{$experiment->getPropertySets()} == 2
 and $experiment->getPropertySets->[0] == $propertysets_assn
 and $experiment->getPropertySets->[1] == $propertysets_assn);


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
result ($experiment->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($experiment->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($experiment->isa(q[Bio::MAGE::Extendable]));

