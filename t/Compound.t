# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Compound.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..45\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioMaterial::Compound;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::BioMaterial::CompoundMeasurement;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Description::DatabaseEntry;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $compound;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compound = Bio::MAGE::BioMaterial::Compound->new();
}
result($compound->isa('Bio::MAGE::BioMaterial::Compound'));

# test the package class method
result($compound->package() eq q[BioMaterial]);

# test the class_name class method
result($compound->class_name() eq q[Bio::MAGE::BioMaterial::Compound]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compound = Bio::MAGE::BioMaterial::Compound->new(isSolvent => 1,
identifier => 2,
name => 3);
}
# testing attribute isSolvent
result ($compound->getIsSolvent() == 1);
$compound->setIsSolvent(1);
result ($compound->getIsSolvent() == 1);

# testing attribute identifier
result ($compound->getIdentifier() == 2);
$compound->setIdentifier(2);
result ($compound->getIdentifier() == 2);

# testing attribute name
result ($compound->getName() == 3);
$compound->setName(3);
result ($compound->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioMaterial::Compound->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compound = Bio::MAGE::BioMaterial::Compound->new(componentCompounds => [Bio::MAGE::BioMaterial::CompoundMeasurement->new()],
externalLIMS => Bio::MAGE::Description::DatabaseEntry->new(),
merckIndex => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association componentCompounds
my $componentcompounds_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $componentcompounds_assn = Bio::MAGE::BioMaterial::CompoundMeasurement->new();
}
result (UNIVERSAL::isa($compound->getComponentCompounds->[0],q[Bio::MAGE::BioMaterial::CompoundMeasurement]));
result ($compound->setComponentCompounds([$componentcompounds_assn]));
result (UNIVERSAL::isa($compound->getComponentCompounds,'ARRAY')
 and scalar @{$compound->getComponentCompounds()} == 1
 and $compound->getComponentCompounds->[0] == $componentcompounds_assn);
$compound->addComponentCompounds($componentcompounds_assn);
result (UNIVERSAL::isa($compound->getComponentCompounds,'ARRAY')
 and scalar @{$compound->getComponentCompounds()} == 2
 and $compound->getComponentCompounds->[0] == $componentcompounds_assn
 and $compound->getComponentCompounds->[1] == $componentcompounds_assn);


# test the meta-data for the assoication
($assn) = $assns{componentCompounds};
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
# testing association externalLIMS
my $externallims_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $externallims_assn = Bio::MAGE::Description::DatabaseEntry->new();
}
result (UNIVERSAL::isa($compound->getExternalLIMS,q[Bio::MAGE::Description::DatabaseEntry]));
result ($compound->setExternalLIMS($externallims_assn) == $externallims_assn);
result ($compound->getExternalLIMS() == $externallims_assn);



# test the meta-data for the assoication
($assn) = $assns{externalLIMS};
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
# testing association merckIndex
my $merckindex_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $merckindex_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($compound->getMerckIndex,q[Bio::MAGE::Description::OntologyEntry]));
result ($compound->setMerckIndex($merckindex_assn) == $merckindex_assn);
result ($compound->getMerckIndex() == $merckindex_assn);



# test the meta-data for the assoication
($assn) = $assns{merckIndex};
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
result (UNIVERSAL::isa($compound->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($compound->setSecurity($security_assn) == $security_assn);
result ($compound->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($compound->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($compound->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($compound->getAuditTrail,'ARRAY')
 and scalar @{$compound->getAuditTrail()} == 1
 and $compound->getAuditTrail->[0] == $audittrail_assn);
$compound->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($compound->getAuditTrail,'ARRAY')
 and scalar @{$compound->getAuditTrail()} == 2
 and $compound->getAuditTrail->[0] == $audittrail_assn
 and $compound->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($compound->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($compound->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($compound->getDescriptions,'ARRAY')
 and scalar @{$compound->getDescriptions()} == 1
 and $compound->getDescriptions->[0] == $descriptions_assn);
$compound->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($compound->getDescriptions,'ARRAY')
 and scalar @{$compound->getDescriptions()} == 2
 and $compound->getDescriptions->[0] == $descriptions_assn
 and $compound->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($compound->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($compound->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($compound->getPropertySets,'ARRAY')
 and scalar @{$compound->getPropertySets()} == 1
 and $compound->getPropertySets->[0] == $propertysets_assn);
$compound->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($compound->getPropertySets,'ARRAY')
 and scalar @{$compound->getPropertySets()} == 2
 and $compound->getPropertySets->[0] == $propertysets_assn
 and $compound->getPropertySets->[1] == $propertysets_assn);


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
result ($compound->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($compound->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($compound->isa(q[Bio::MAGE::Extendable]));

