# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CompositeGroup.t'

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
use Bio::MAGE::ArrayDesign::CompositeGroup;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $compositegroup;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositegroup = Bio::MAGE::ArrayDesign::CompositeGroup->new();
}
result($compositegroup->isa('Bio::MAGE::ArrayDesign::CompositeGroup'));

# test the package class method
result($compositegroup->package() eq q[ArrayDesign]);

# test the class_name class method
result($compositegroup->class_name() eq q[Bio::MAGE::ArrayDesign::CompositeGroup]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositegroup = Bio::MAGE::ArrayDesign::CompositeGroup->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($compositegroup->getIdentifier() == 1);
$compositegroup->setIdentifier(1);
result ($compositegroup->getIdentifier() == 1);

# testing attribute name
result ($compositegroup->getName() == 2);
$compositegroup->setName(2);
result ($compositegroup->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::ArrayDesign::CompositeGroup->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositegroup = Bio::MAGE::ArrayDesign::CompositeGroup->new(compositeSequences => [Bio::MAGE::DesignElement::CompositeSequence->new()],
species => Bio::MAGE::Description::OntologyEntry->new(),
types => [Bio::MAGE::Description::OntologyEntry->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association compositeSequences
my $compositesequences_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequences_assn = Bio::MAGE::DesignElement::CompositeSequence->new();
}
result (UNIVERSAL::isa($compositegroup->getCompositeSequences->[0],q[Bio::MAGE::DesignElement::CompositeSequence]));
result ($compositegroup->setCompositeSequences([$compositesequences_assn]));
result (UNIVERSAL::isa($compositegroup->getCompositeSequences,'ARRAY')
 and scalar @{$compositegroup->getCompositeSequences()} == 1
 and $compositegroup->getCompositeSequences->[0] == $compositesequences_assn);
$compositegroup->addCompositeSequences($compositesequences_assn);
result (UNIVERSAL::isa($compositegroup->getCompositeSequences,'ARRAY')
 and scalar @{$compositegroup->getCompositeSequences()} == 2
 and $compositegroup->getCompositeSequences->[0] == $compositesequences_assn
 and $compositegroup->getCompositeSequences->[1] == $compositesequences_assn);


# test the meta-data for the assoication
($assn) = $assns{compositeSequences};
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
result (UNIVERSAL::isa($compositegroup->getSpecies,q[Bio::MAGE::Description::OntologyEntry]));
result ($compositegroup->setSpecies($species_assn) == $species_assn);
result ($compositegroup->getSpecies() == $species_assn);



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
result (UNIVERSAL::isa($compositegroup->getTypes->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($compositegroup->setTypes([$types_assn]));
result (UNIVERSAL::isa($compositegroup->getTypes,'ARRAY')
 and scalar @{$compositegroup->getTypes()} == 1
 and $compositegroup->getTypes->[0] == $types_assn);
$compositegroup->addTypes($types_assn);
result (UNIVERSAL::isa($compositegroup->getTypes,'ARRAY')
 and scalar @{$compositegroup->getTypes()} == 2
 and $compositegroup->getTypes->[0] == $types_assn
 and $compositegroup->getTypes->[1] == $types_assn);


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
result (UNIVERSAL::isa($compositegroup->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($compositegroup->setSecurity($security_assn) == $security_assn);
result ($compositegroup->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($compositegroup->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($compositegroup->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($compositegroup->getAuditTrail,'ARRAY')
 and scalar @{$compositegroup->getAuditTrail()} == 1
 and $compositegroup->getAuditTrail->[0] == $audittrail_assn);
$compositegroup->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($compositegroup->getAuditTrail,'ARRAY')
 and scalar @{$compositegroup->getAuditTrail()} == 2
 and $compositegroup->getAuditTrail->[0] == $audittrail_assn
 and $compositegroup->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($compositegroup->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($compositegroup->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($compositegroup->getDescriptions,'ARRAY')
 and scalar @{$compositegroup->getDescriptions()} == 1
 and $compositegroup->getDescriptions->[0] == $descriptions_assn);
$compositegroup->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($compositegroup->getDescriptions,'ARRAY')
 and scalar @{$compositegroup->getDescriptions()} == 2
 and $compositegroup->getDescriptions->[0] == $descriptions_assn
 and $compositegroup->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($compositegroup->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($compositegroup->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($compositegroup->getPropertySets,'ARRAY')
 and scalar @{$compositegroup->getPropertySets()} == 1
 and $compositegroup->getPropertySets->[0] == $propertysets_assn);
$compositegroup->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($compositegroup->getPropertySets,'ARRAY')
 and scalar @{$compositegroup->getPropertySets()} == 2
 and $compositegroup->getPropertySets->[0] == $propertysets_assn
 and $compositegroup->getPropertySets->[1] == $propertysets_assn);


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
result ($compositegroup->isa(q[Bio::MAGE::ArrayDesign::DesignElementGroup]));

# testing superclass Bio::MAGE::Identifiable
result ($compositegroup->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($compositegroup->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($compositegroup->isa(q[Bio::MAGE::Extendable]));

