# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioSequence.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..65\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioSequence::BioSequence;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Description::DatabaseEntry;
use Bio::MAGE::BioSequence::SeqFeature;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $biosequence;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosequence = Bio::MAGE::BioSequence::BioSequence->new();
}
result($biosequence->isa('Bio::MAGE::BioSequence::BioSequence'));

# test the package class method
result($biosequence->package() eq q[BioSequence]);

# test the class_name class method
result($biosequence->class_name() eq q[Bio::MAGE::BioSequence::BioSequence]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosequence = Bio::MAGE::BioSequence::BioSequence->new(isApproximateLength => 1,
length => 2,
sequence => 3,
isCircular => 4,
identifier => 5,
name => 6);
}
# testing attribute isApproximateLength
result ($biosequence->getIsApproximateLength() == 1);
$biosequence->setIsApproximateLength(1);
result ($biosequence->getIsApproximateLength() == 1);

# testing attribute length
result ($biosequence->getLength() == 2);
$biosequence->setLength(2);
result ($biosequence->getLength() == 2);

# testing attribute sequence
result ($biosequence->getSequence() == 3);
$biosequence->setSequence(3);
result ($biosequence->getSequence() == 3);

# testing attribute isCircular
result ($biosequence->getIsCircular() == 4);
$biosequence->setIsCircular(4);
result ($biosequence->getIsCircular() == 4);

# testing attribute identifier
result ($biosequence->getIdentifier() == 5);
$biosequence->setIdentifier(5);
result ($biosequence->getIdentifier() == 5);

# testing attribute name
result ($biosequence->getName() == 6);
$biosequence->setName(6);
result ($biosequence->getName() == 6);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioSequence::BioSequence->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biosequence = Bio::MAGE::BioSequence::BioSequence->new(sequenceDatabases => [Bio::MAGE::Description::DatabaseEntry->new()],
ontologyEntries => [Bio::MAGE::Description::OntologyEntry->new()],
seqFeatures => [Bio::MAGE::BioSequence::SeqFeature->new()],
species => Bio::MAGE::Description::OntologyEntry->new(),
type => Bio::MAGE::Description::OntologyEntry->new(),
polymerType => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association sequenceDatabases
my $sequencedatabases_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $sequencedatabases_assn = Bio::MAGE::Description::DatabaseEntry->new();
}
result (UNIVERSAL::isa($biosequence->getSequenceDatabases->[0],q[Bio::MAGE::Description::DatabaseEntry]));
result ($biosequence->setSequenceDatabases([$sequencedatabases_assn]));
result (UNIVERSAL::isa($biosequence->getSequenceDatabases,'ARRAY')
 and scalar @{$biosequence->getSequenceDatabases()} == 1
 and $biosequence->getSequenceDatabases->[0] == $sequencedatabases_assn);
$biosequence->addSequenceDatabases($sequencedatabases_assn);
result (UNIVERSAL::isa($biosequence->getSequenceDatabases,'ARRAY')
 and scalar @{$biosequence->getSequenceDatabases()} == 2
 and $biosequence->getSequenceDatabases->[0] == $sequencedatabases_assn
 and $biosequence->getSequenceDatabases->[1] == $sequencedatabases_assn);


# test the meta-data for the assoication
($assn) = $assns{sequenceDatabases};
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
# testing association ontologyEntries
my $ontologyentries_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $ontologyentries_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biosequence->getOntologyEntries->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($biosequence->setOntologyEntries([$ontologyentries_assn]));
result (UNIVERSAL::isa($biosequence->getOntologyEntries,'ARRAY')
 and scalar @{$biosequence->getOntologyEntries()} == 1
 and $biosequence->getOntologyEntries->[0] == $ontologyentries_assn);
$biosequence->addOntologyEntries($ontologyentries_assn);
result (UNIVERSAL::isa($biosequence->getOntologyEntries,'ARRAY')
 and scalar @{$biosequence->getOntologyEntries()} == 2
 and $biosequence->getOntologyEntries->[0] == $ontologyentries_assn
 and $biosequence->getOntologyEntries->[1] == $ontologyentries_assn);


# test the meta-data for the assoication
($assn) = $assns{ontologyEntries};
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
# testing association seqFeatures
my $seqfeatures_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $seqfeatures_assn = Bio::MAGE::BioSequence::SeqFeature->new();
}
result (UNIVERSAL::isa($biosequence->getSeqFeatures->[0],q[Bio::MAGE::BioSequence::SeqFeature]));
result ($biosequence->setSeqFeatures([$seqfeatures_assn]));
result (UNIVERSAL::isa($biosequence->getSeqFeatures,'ARRAY')
 and scalar @{$biosequence->getSeqFeatures()} == 1
 and $biosequence->getSeqFeatures->[0] == $seqfeatures_assn);
$biosequence->addSeqFeatures($seqfeatures_assn);
result (UNIVERSAL::isa($biosequence->getSeqFeatures,'ARRAY')
 and scalar @{$biosequence->getSeqFeatures()} == 2
 and $biosequence->getSeqFeatures->[0] == $seqfeatures_assn
 and $biosequence->getSeqFeatures->[1] == $seqfeatures_assn);


# test the meta-data for the assoication
($assn) = $assns{seqFeatures};
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
# testing association species
my $species_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $species_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biosequence->getSpecies,q[Bio::MAGE::Description::OntologyEntry]));
result ($biosequence->setSpecies($species_assn) == $species_assn);
result ($biosequence->getSpecies() == $species_assn);



# test the meta-data for the assoication
($assn) = $assns{species};
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
# testing association type
my $type_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $type_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biosequence->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($biosequence->setType($type_assn) == $type_assn);
result ($biosequence->getType() == $type_assn);



# test the meta-data for the assoication
($assn) = $assns{type};
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
# testing association polymerType
my $polymertype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $polymertype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($biosequence->getPolymerType,q[Bio::MAGE::Description::OntologyEntry]));
result ($biosequence->setPolymerType($polymertype_assn) == $polymertype_assn);
result ($biosequence->getPolymerType() == $polymertype_assn);



# test the meta-data for the assoication
($assn) = $assns{polymerType};
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
result (UNIVERSAL::isa($biosequence->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($biosequence->setSecurity($security_assn) == $security_assn);
result ($biosequence->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($biosequence->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($biosequence->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($biosequence->getAuditTrail,'ARRAY')
 and scalar @{$biosequence->getAuditTrail()} == 1
 and $biosequence->getAuditTrail->[0] == $audittrail_assn);
$biosequence->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($biosequence->getAuditTrail,'ARRAY')
 and scalar @{$biosequence->getAuditTrail()} == 2
 and $biosequence->getAuditTrail->[0] == $audittrail_assn
 and $biosequence->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($biosequence->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($biosequence->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($biosequence->getDescriptions,'ARRAY')
 and scalar @{$biosequence->getDescriptions()} == 1
 and $biosequence->getDescriptions->[0] == $descriptions_assn);
$biosequence->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($biosequence->getDescriptions,'ARRAY')
 and scalar @{$biosequence->getDescriptions()} == 2
 and $biosequence->getDescriptions->[0] == $descriptions_assn
 and $biosequence->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($biosequence->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($biosequence->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($biosequence->getPropertySets,'ARRAY')
 and scalar @{$biosequence->getPropertySets()} == 1
 and $biosequence->getPropertySets->[0] == $propertysets_assn);
$biosequence->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($biosequence->getPropertySets,'ARRAY')
 and scalar @{$biosequence->getPropertySets()} == 2
 and $biosequence->getPropertySets->[0] == $propertysets_assn
 and $biosequence->getPropertySets->[1] == $propertysets_assn);


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
result ($biosequence->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($biosequence->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($biosequence->isa(q[Bio::MAGE::Extendable]));

