# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ReporterGroup.t'

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
use Bio::MAGE::ArrayDesign::ReporterGroup;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::DesignElement::Reporter;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $reportergroup;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportergroup = Bio::MAGE::ArrayDesign::ReporterGroup->new();
}
result($reportergroup->isa('Bio::MAGE::ArrayDesign::ReporterGroup'));

# test the package class method
result($reportergroup->package() eq q[ArrayDesign]);

# test the class_name class method
result($reportergroup->class_name() eq q[Bio::MAGE::ArrayDesign::ReporterGroup]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportergroup = Bio::MAGE::ArrayDesign::ReporterGroup->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($reportergroup->getIdentifier() == 1);
$reportergroup->setIdentifier(1);
result ($reportergroup->getIdentifier() == 1);

# testing attribute name
result ($reportergroup->getName() == 2);
$reportergroup->setName(2);
result ($reportergroup->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::ReporterGroup->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportergroup = Bio::MAGE::ArrayDesign::ReporterGroup->new(reporters => [Bio::MAGE::DesignElement::Reporter->new()],
species => Bio::MAGE::Description::OntologyEntry->new(),
types => [Bio::MAGE::Description::OntologyEntry->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association reporters
my $reporters_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporters_assn = Bio::MAGE::DesignElement::Reporter->new();
}
result (UNIVERSAL::isa($reportergroup->getReporters->[0],q[Bio::MAGE::DesignElement::Reporter]));
result ($reportergroup->setReporters([$reporters_assn]));
result (UNIVERSAL::isa($reportergroup->getReporters,'ARRAY')
 and scalar @{$reportergroup->getReporters()} == 1
 and $reportergroup->getReporters->[0] == $reporters_assn);
$reportergroup->addReporters($reporters_assn);
result (UNIVERSAL::isa($reportergroup->getReporters,'ARRAY')
 and scalar @{$reportergroup->getReporters()} == 2
 and $reportergroup->getReporters->[0] == $reporters_assn
 and $reportergroup->getReporters->[1] == $reporters_assn);


# test the meta-data for the assoication
($assn) = $assns{reporters};
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
result (UNIVERSAL::isa($reportergroup->getSpecies,q[Bio::MAGE::Description::OntologyEntry]));
result ($reportergroup->setSpecies($species_assn) == $species_assn);
result ($reportergroup->getSpecies() == $species_assn);



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
# testing association types
my $types_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $types_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($reportergroup->getTypes->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($reportergroup->setTypes([$types_assn]));
result (UNIVERSAL::isa($reportergroup->getTypes,'ARRAY')
 and scalar @{$reportergroup->getTypes()} == 1
 and $reportergroup->getTypes->[0] == $types_assn);
$reportergroup->addTypes($types_assn);
result (UNIVERSAL::isa($reportergroup->getTypes,'ARRAY')
 and scalar @{$reportergroup->getTypes()} == 2
 and $reportergroup->getTypes->[0] == $types_assn
 and $reportergroup->getTypes->[1] == $types_assn);


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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($reportergroup->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($reportergroup->setSecurity($security_assn) == $security_assn);
result ($reportergroup->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($reportergroup->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($reportergroup->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($reportergroup->getAuditTrail,'ARRAY')
 and scalar @{$reportergroup->getAuditTrail()} == 1
 and $reportergroup->getAuditTrail->[0] == $audittrail_assn);
$reportergroup->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($reportergroup->getAuditTrail,'ARRAY')
 and scalar @{$reportergroup->getAuditTrail()} == 2
 and $reportergroup->getAuditTrail->[0] == $audittrail_assn
 and $reportergroup->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($reportergroup->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($reportergroup->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($reportergroup->getDescriptions,'ARRAY')
 and scalar @{$reportergroup->getDescriptions()} == 1
 and $reportergroup->getDescriptions->[0] == $descriptions_assn);
$reportergroup->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($reportergroup->getDescriptions,'ARRAY')
 and scalar @{$reportergroup->getDescriptions()} == 2
 and $reportergroup->getDescriptions->[0] == $descriptions_assn
 and $reportergroup->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($reportergroup->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($reportergroup->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($reportergroup->getPropertySets,'ARRAY')
 and scalar @{$reportergroup->getPropertySets()} == 1
 and $reportergroup->getPropertySets->[0] == $propertysets_assn);
$reportergroup->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($reportergroup->getPropertySets,'ARRAY')
 and scalar @{$reportergroup->getPropertySets()} == 2
 and $reportergroup->getPropertySets->[0] == $propertysets_assn
 and $reportergroup->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::ArrayDesign::DesignElementGroup
result ($reportergroup->isa(q[Bio::MAGE::ArrayDesign::DesignElementGroup]));

# testing superclass Bio::MAGE::Identifiable
result ($reportergroup->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($reportergroup->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($reportergroup->isa(q[Bio::MAGE::Extendable]));

