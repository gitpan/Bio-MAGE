# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DesignElementGroup.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..42\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::ArrayDesign::DesignElementGroup;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::ArrayDesign::FeatureGroup;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::ArrayDesign::CompositeGroup;
use Bio::MAGE::ArrayDesign::ReporterGroup;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $designelementgroup;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementgroup = Bio::MAGE::ArrayDesign::DesignElementGroup->new();
}
result($designelementgroup->isa('Bio::MAGE::ArrayDesign::DesignElementGroup'));

# test the package class method
result($designelementgroup->package() eq q[ArrayDesign]);

# test the class_name class method
result($designelementgroup->class_name() eq q[Bio::MAGE::ArrayDesign::DesignElementGroup]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementgroup = Bio::MAGE::ArrayDesign::DesignElementGroup->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($designelementgroup->getIdentifier() == 1);
$designelementgroup->setIdentifier(1);
result ($designelementgroup->getIdentifier() == 1);

# testing attribute name
result ($designelementgroup->getName() == 2);
$designelementgroup->setName(2);
result ($designelementgroup->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::DesignElementGroup->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementgroup = Bio::MAGE::ArrayDesign::DesignElementGroup->new(types => [Bio::MAGE::Description::OntologyEntry->new()],
species => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association types
my $types_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $types_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($designelementgroup->getTypes->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($designelementgroup->setTypes([$types_assn]));
result (UNIVERSAL::isa($designelementgroup->getTypes,'ARRAY')
 and scalar @{$designelementgroup->getTypes()} == 1
 and $designelementgroup->getTypes->[0] == $types_assn);
$designelementgroup->addTypes($types_assn);
result (UNIVERSAL::isa($designelementgroup->getTypes,'ARRAY')
 and scalar @{$designelementgroup->getTypes()} == 2
 and $designelementgroup->getTypes->[0] == $types_assn
 and $designelementgroup->getTypes->[1] == $types_assn);


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
# testing association species
my $species_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $species_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($designelementgroup->getSpecies,q[Bio::MAGE::Description::OntologyEntry]));
result ($designelementgroup->setSpecies($species_assn) == $species_assn);
result ($designelementgroup->getSpecies() == $species_assn);



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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($designelementgroup->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($designelementgroup->setSecurity($security_assn) == $security_assn);
result ($designelementgroup->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($designelementgroup->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($designelementgroup->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($designelementgroup->getAuditTrail,'ARRAY')
 and scalar @{$designelementgroup->getAuditTrail()} == 1
 and $designelementgroup->getAuditTrail->[0] == $audittrail_assn);
$designelementgroup->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($designelementgroup->getAuditTrail,'ARRAY')
 and scalar @{$designelementgroup->getAuditTrail()} == 2
 and $designelementgroup->getAuditTrail->[0] == $audittrail_assn
 and $designelementgroup->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($designelementgroup->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($designelementgroup->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($designelementgroup->getDescriptions,'ARRAY')
 and scalar @{$designelementgroup->getDescriptions()} == 1
 and $designelementgroup->getDescriptions->[0] == $descriptions_assn);
$designelementgroup->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($designelementgroup->getDescriptions,'ARRAY')
 and scalar @{$designelementgroup->getDescriptions()} == 2
 and $designelementgroup->getDescriptions->[0] == $descriptions_assn
 and $designelementgroup->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($designelementgroup->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($designelementgroup->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($designelementgroup->getPropertySets,'ARRAY')
 and scalar @{$designelementgroup->getPropertySets()} == 1
 and $designelementgroup->getPropertySets->[0] == $propertysets_assn);
$designelementgroup->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($designelementgroup->getPropertySets,'ARRAY')
 and scalar @{$designelementgroup->getPropertySets()} == 2
 and $designelementgroup->getPropertySets->[0] == $propertysets_assn
 and $designelementgroup->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $compositegroup = Bio::MAGE::ArrayDesign::CompositeGroup->new();

  # testing subclass CompositeGroup
  result ($compositegroup->isa(q[Bio::MAGE::ArrayDesign::CompositeGroup]));

  # create a subclass
  my $reportergroup = Bio::MAGE::ArrayDesign::ReporterGroup->new();

  # testing subclass ReporterGroup
  result ($reportergroup->isa(q[Bio::MAGE::ArrayDesign::ReporterGroup]));

  # create a subclass
  my $featuregroup = Bio::MAGE::ArrayDesign::FeatureGroup->new();

  # testing subclass FeatureGroup
  result ($featuregroup->isa(q[Bio::MAGE::ArrayDesign::FeatureGroup]));

}
# testing superclass Bio::MAGE::Identifiable
result ($designelementgroup->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($designelementgroup->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($designelementgroup->isa(q[Bio::MAGE::Extendable]));

