# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Description.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..48\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::DatabaseEntry;
use Bio::MAGE::BQS::BibliographicReference;
use Bio::MAGE::Description::ExternalReference;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $description;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $description = Bio::MAGE::Description::Description->new();
}
result($description->isa('Bio::MAGE::Description::Description'));

# test the package class method
result($description->package() eq q[Description]);

# test the class_name class method
result($description->class_name() eq q[Bio::MAGE::Description::Description]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $description = Bio::MAGE::Description::Description->new(URI => 1,
text => 2);
}
# testing attribute URI
result ($description->getURI() == 1);
$description->setURI(1);
result ($description->getURI() == 1);

# testing attribute text
result ($description->getText() == 2);
$description->setText(2);
result ($description->getText() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Description::Description->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $description = Bio::MAGE::Description::Description->new(databaseReferences => [Bio::MAGE::Description::DatabaseEntry->new()],
externalReference => Bio::MAGE::Description::ExternalReference->new(),
bibliographicReferences => [Bio::MAGE::BQS::BibliographicReference->new()],
annotations => [Bio::MAGE::Description::OntologyEntry->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association databaseReferences
my $databasereferences_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $databasereferences_assn = Bio::MAGE::Description::DatabaseEntry->new();
}
result (UNIVERSAL::isa($description->getDatabaseReferences->[0],q[Bio::MAGE::Description::DatabaseEntry]));
result ($description->setDatabaseReferences([$databasereferences_assn]));
result (UNIVERSAL::isa($description->getDatabaseReferences,'ARRAY')
 and scalar @{$description->getDatabaseReferences()} == 1
 and $description->getDatabaseReferences->[0] == $databasereferences_assn);
$description->addDatabaseReferences($databasereferences_assn);
result (UNIVERSAL::isa($description->getDatabaseReferences,'ARRAY')
 and scalar @{$description->getDatabaseReferences()} == 2
 and $description->getDatabaseReferences->[0] == $databasereferences_assn
 and $description->getDatabaseReferences->[1] == $databasereferences_assn);


# test the meta-data for the assoication
($assn) = $assns{databaseReferences};
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
# testing association externalReference
my $externalreference_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $externalreference_assn = Bio::MAGE::Description::ExternalReference->new();
}
result (UNIVERSAL::isa($description->getExternalReference,q[Bio::MAGE::Description::ExternalReference]));
result ($description->setExternalReference($externalreference_assn) == $externalreference_assn);
result ($description->getExternalReference() == $externalreference_assn);



# test the meta-data for the assoication
($assn) = $assns{externalReference};
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
# testing association bibliographicReferences
my $bibliographicreferences_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bibliographicreferences_assn = Bio::MAGE::BQS::BibliographicReference->new();
}
result (UNIVERSAL::isa($description->getBibliographicReferences->[0],q[Bio::MAGE::BQS::BibliographicReference]));
result ($description->setBibliographicReferences([$bibliographicreferences_assn]));
result (UNIVERSAL::isa($description->getBibliographicReferences,'ARRAY')
 and scalar @{$description->getBibliographicReferences()} == 1
 and $description->getBibliographicReferences->[0] == $bibliographicreferences_assn);
$description->addBibliographicReferences($bibliographicreferences_assn);
result (UNIVERSAL::isa($description->getBibliographicReferences,'ARRAY')
 and scalar @{$description->getBibliographicReferences()} == 2
 and $description->getBibliographicReferences->[0] == $bibliographicreferences_assn
 and $description->getBibliographicReferences->[1] == $bibliographicreferences_assn);


# test the meta-data for the assoication
($assn) = $assns{bibliographicReferences};
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
# testing association annotations
my $annotations_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $annotations_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($description->getAnnotations->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($description->setAnnotations([$annotations_assn]));
result (UNIVERSAL::isa($description->getAnnotations,'ARRAY')
 and scalar @{$description->getAnnotations()} == 1
 and $description->getAnnotations->[0] == $annotations_assn);
$description->addAnnotations($annotations_assn);
result (UNIVERSAL::isa($description->getAnnotations,'ARRAY')
 and scalar @{$description->getAnnotations()} == 2
 and $description->getAnnotations->[0] == $annotations_assn
 and $description->getAnnotations->[1] == $annotations_assn);


# test the meta-data for the assoication
($assn) = $assns{annotations};
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
result (UNIVERSAL::isa($description->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($description->setSecurity($security_assn) == $security_assn);
result ($description->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($description->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($description->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($description->getAuditTrail,'ARRAY')
 and scalar @{$description->getAuditTrail()} == 1
 and $description->getAuditTrail->[0] == $audittrail_assn);
$description->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($description->getAuditTrail,'ARRAY')
 and scalar @{$description->getAuditTrail()} == 2
 and $description->getAuditTrail->[0] == $audittrail_assn
 and $description->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($description->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($description->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($description->getDescriptions,'ARRAY')
 and scalar @{$description->getDescriptions()} == 1
 and $description->getDescriptions->[0] == $descriptions_assn);
$description->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($description->getDescriptions,'ARRAY')
 and scalar @{$description->getDescriptions()} == 2
 and $description->getDescriptions->[0] == $descriptions_assn
 and $description->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($description->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($description->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($description->getPropertySets,'ARRAY')
 and scalar @{$description->getPropertySets()} == 1
 and $description->getPropertySets->[0] == $propertysets_assn);
$description->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($description->getPropertySets,'ARRAY')
 and scalar @{$description->getPropertySets()} == 2
 and $description->getPropertySets->[0] == $propertysets_assn
 and $description->getPropertySets->[1] == $propertysets_assn);


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
result ($description->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($description->isa(q[Bio::MAGE::Extendable]));

