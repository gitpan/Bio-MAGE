# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ExperimentDesign.t'

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
use Bio::MAGE::Experiment::ExperimentDesign;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Experiment::ExperimentalFactor;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $experimentdesign;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentdesign = Bio::MAGE::Experiment::ExperimentDesign->new();
}
result($experimentdesign->isa('Bio::MAGE::Experiment::ExperimentDesign'));

# test the package class method
result($experimentdesign->package() eq q[Experiment]);

# test the class_name class method
result($experimentdesign->class_name() eq q[Bio::MAGE::Experiment::ExperimentDesign]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Experiment::ExperimentDesign->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentdesign = Bio::MAGE::Experiment::ExperimentDesign->new(replicateDescription => Bio::MAGE::Description::Description->new(),
types => [Bio::MAGE::Description::OntologyEntry->new()],
experimentalFactors => [Bio::MAGE::Experiment::ExperimentalFactor->new()],
qualityControlDescription => Bio::MAGE::Description::Description->new(),
topLevelBioAssays => [Bio::MAGE::BioAssay::BioAssay->new()],
normalizationDescription => Bio::MAGE::Description::Description->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association replicateDescription
my $replicatedescription_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $replicatedescription_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($experimentdesign->getReplicateDescription,q[Bio::MAGE::Description::Description]));
result ($experimentdesign->setReplicateDescription($replicatedescription_assn) == $replicatedescription_assn);
result ($experimentdesign->getReplicateDescription() == $replicatedescription_assn);



# test the meta-data for the assoication
($assn) = $assns{replicateDescription};
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
# testing association types
my $types_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $types_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($experimentdesign->getTypes->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($experimentdesign->setTypes([$types_assn]));
result (UNIVERSAL::isa($experimentdesign->getTypes,'ARRAY')
 and scalar @{$experimentdesign->getTypes()} == 1
 and $experimentdesign->getTypes->[0] == $types_assn);
$experimentdesign->addTypes($types_assn);
result (UNIVERSAL::isa($experimentdesign->getTypes,'ARRAY')
 and scalar @{$experimentdesign->getTypes()} == 2
 and $experimentdesign->getTypes->[0] == $types_assn
 and $experimentdesign->getTypes->[1] == $types_assn);


# test the meta-data for the assoication
($assn) = $assns{types};
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
# testing association experimentalFactors
my $experimentalfactors_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentalfactors_assn = Bio::MAGE::Experiment::ExperimentalFactor->new();
}
result (UNIVERSAL::isa($experimentdesign->getExperimentalFactors->[0],q[Bio::MAGE::Experiment::ExperimentalFactor]));
result ($experimentdesign->setExperimentalFactors([$experimentalfactors_assn]));
result (UNIVERSAL::isa($experimentdesign->getExperimentalFactors,'ARRAY')
 and scalar @{$experimentdesign->getExperimentalFactors()} == 1
 and $experimentdesign->getExperimentalFactors->[0] == $experimentalfactors_assn);
$experimentdesign->addExperimentalFactors($experimentalfactors_assn);
result (UNIVERSAL::isa($experimentdesign->getExperimentalFactors,'ARRAY')
 and scalar @{$experimentdesign->getExperimentalFactors()} == 2
 and $experimentdesign->getExperimentalFactors->[0] == $experimentalfactors_assn
 and $experimentdesign->getExperimentalFactors->[1] == $experimentalfactors_assn);


# test the meta-data for the assoication
($assn) = $assns{experimentalFactors};
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
# testing association qualityControlDescription
my $qualitycontroldescription_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $qualitycontroldescription_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($experimentdesign->getQualityControlDescription,q[Bio::MAGE::Description::Description]));
result ($experimentdesign->setQualityControlDescription($qualitycontroldescription_assn) == $qualitycontroldescription_assn);
result ($experimentdesign->getQualityControlDescription() == $qualitycontroldescription_assn);



# test the meta-data for the assoication
($assn) = $assns{qualityControlDescription};
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
# testing association topLevelBioAssays
my $toplevelbioassays_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $toplevelbioassays_assn = Bio::MAGE::BioAssay::BioAssay->new();
}
result (UNIVERSAL::isa($experimentdesign->getTopLevelBioAssays->[0],q[Bio::MAGE::BioAssay::BioAssay]));
result ($experimentdesign->setTopLevelBioAssays([$toplevelbioassays_assn]));
result (UNIVERSAL::isa($experimentdesign->getTopLevelBioAssays,'ARRAY')
 and scalar @{$experimentdesign->getTopLevelBioAssays()} == 1
 and $experimentdesign->getTopLevelBioAssays->[0] == $toplevelbioassays_assn);
$experimentdesign->addTopLevelBioAssays($toplevelbioassays_assn);
result (UNIVERSAL::isa($experimentdesign->getTopLevelBioAssays,'ARRAY')
 and scalar @{$experimentdesign->getTopLevelBioAssays()} == 2
 and $experimentdesign->getTopLevelBioAssays->[0] == $toplevelbioassays_assn
 and $experimentdesign->getTopLevelBioAssays->[1] == $toplevelbioassays_assn);


# test the meta-data for the assoication
($assn) = $assns{topLevelBioAssays};
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
# testing association normalizationDescription
my $normalizationdescription_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $normalizationdescription_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($experimentdesign->getNormalizationDescription,q[Bio::MAGE::Description::Description]));
result ($experimentdesign->setNormalizationDescription($normalizationdescription_assn) == $normalizationdescription_assn);
result ($experimentdesign->getNormalizationDescription() == $normalizationdescription_assn);



# test the meta-data for the assoication
($assn) = $assns{normalizationDescription};
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
result (UNIVERSAL::isa($experimentdesign->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($experimentdesign->setSecurity($security_assn) == $security_assn);
result ($experimentdesign->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($experimentdesign->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($experimentdesign->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($experimentdesign->getAuditTrail,'ARRAY')
 and scalar @{$experimentdesign->getAuditTrail()} == 1
 and $experimentdesign->getAuditTrail->[0] == $audittrail_assn);
$experimentdesign->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($experimentdesign->getAuditTrail,'ARRAY')
 and scalar @{$experimentdesign->getAuditTrail()} == 2
 and $experimentdesign->getAuditTrail->[0] == $audittrail_assn
 and $experimentdesign->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($experimentdesign->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($experimentdesign->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($experimentdesign->getDescriptions,'ARRAY')
 and scalar @{$experimentdesign->getDescriptions()} == 1
 and $experimentdesign->getDescriptions->[0] == $descriptions_assn);
$experimentdesign->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($experimentdesign->getDescriptions,'ARRAY')
 and scalar @{$experimentdesign->getDescriptions()} == 2
 and $experimentdesign->getDescriptions->[0] == $descriptions_assn
 and $experimentdesign->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($experimentdesign->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($experimentdesign->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($experimentdesign->getPropertySets,'ARRAY')
 and scalar @{$experimentdesign->getPropertySets()} == 1
 and $experimentdesign->getPropertySets->[0] == $propertysets_assn);
$experimentdesign->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($experimentdesign->getPropertySets,'ARRAY')
 and scalar @{$experimentdesign->getPropertySets()} == 2
 and $experimentdesign->getPropertySets->[0] == $propertysets_assn
 and $experimentdesign->getPropertySets->[1] == $propertysets_assn);


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
result ($experimentdesign->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($experimentdesign->isa(q[Bio::MAGE::Extendable]));

