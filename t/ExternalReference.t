# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ExternalReference.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..18\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Description::ExternalReference;
use Bio::MAGE::NameValueType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $externalreference;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $externalreference = Bio::MAGE::Description::ExternalReference->new();
}
result($externalreference->isa('Bio::MAGE::Description::ExternalReference'));

# test the package class method
result($externalreference->package() eq q[Description]);

# test the class_name class method
result($externalreference->class_name() eq q[Bio::MAGE::Description::ExternalReference]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $externalreference = Bio::MAGE::Description::ExternalReference->new(exportedFromDB => 1,
exportName => 2,
exportID => 3,
exportedFromServer => 4);
}
# testing attribute exportedFromDB
result ($externalreference->getExportedFromDB() == 1);
$externalreference->setExportedFromDB(1);
result ($externalreference->getExportedFromDB() == 1);

# testing attribute exportName
result ($externalreference->getExportName() == 2);
$externalreference->setExportName(2);
result ($externalreference->getExportName() == 2);

# testing attribute exportID
result ($externalreference->getExportID() == 3);
$externalreference->setExportID(3);
result ($externalreference->getExportID() == 3);

# testing attribute exportedFromServer
result ($externalreference->getExportedFromServer() == 4);
$externalreference->setExportedFromServer(4);
result ($externalreference->getExportedFromServer() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Description::ExternalReference->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $externalreference = Bio::MAGE::Description::ExternalReference->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($externalreference->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($externalreference->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($externalreference->getPropertySets,'ARRAY')
 and scalar @{$externalreference->getPropertySets()} == 1
 and $externalreference->getPropertySets->[0] == $propertysets_assn);
$externalreference->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($externalreference->getPropertySets,'ARRAY')
 and scalar @{$externalreference->getPropertySets()} == 2
 and $externalreference->getPropertySets->[0] == $propertysets_assn
 and $externalreference->getPropertySets->[1] == $propertysets_assn);


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
result ($externalreference->isa(q[Bio::MAGE::Extendable]));

