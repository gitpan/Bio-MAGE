# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DatabaseEntry.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..24\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Description::DatabaseEntry;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::Description::Database;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $databaseentry;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $databaseentry = Bio::MAGE::Description::DatabaseEntry->new();
}
result($databaseentry->isa('Bio::MAGE::Description::DatabaseEntry'));

# test the package class method
result($databaseentry->package() eq q[Description]);

# test the class_name class method
result($databaseentry->class_name() eq q[Bio::MAGE::Description::DatabaseEntry]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $databaseentry = Bio::MAGE::Description::DatabaseEntry->new(URI => 1,
accession => 2,
accessionVersion => 3);
}
# testing attribute URI
result ($databaseentry->getURI() == 1);
$databaseentry->setURI(1);
result ($databaseentry->getURI() == 1);

# testing attribute accession
result ($databaseentry->getAccession() == 2);
$databaseentry->setAccession(2);
result ($databaseentry->getAccession() == 2);

# testing attribute accessionVersion
result ($databaseentry->getAccessionVersion() == 3);
$databaseentry->setAccessionVersion(3);
result ($databaseentry->getAccessionVersion() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Description::DatabaseEntry->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $databaseentry = Bio::MAGE::Description::DatabaseEntry->new(database => Bio::MAGE::Description::Database->new(),
type => Bio::MAGE::Description::OntologyEntry->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association database
my $database_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $database_assn = Bio::MAGE::Description::Database->new();
}
result (UNIVERSAL::isa($databaseentry->getDatabase,q[Bio::MAGE::Description::Database]));
result ($databaseentry->setDatabase($database_assn) == $database_assn);
result ($databaseentry->getDatabase() == $database_assn);



# test the meta-data for the assoication
($assn) = $assns{database};
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
result (UNIVERSAL::isa($databaseentry->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($databaseentry->setType($type_assn) == $type_assn);
result ($databaseentry->getType() == $type_assn);



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
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($databaseentry->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($databaseentry->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($databaseentry->getPropertySets,'ARRAY')
 and scalar @{$databaseentry->getPropertySets()} == 1
 and $databaseentry->getPropertySets->[0] == $propertysets_assn);
$databaseentry->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($databaseentry->getPropertySets,'ARRAY')
 and scalar @{$databaseentry->getPropertySets()} == 2
 and $databaseentry->getPropertySets->[0] == $propertysets_assn
 and $databaseentry->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Extendable
result ($databaseentry->isa(q[Bio::MAGE::Extendable]));

