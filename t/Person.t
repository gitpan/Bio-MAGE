# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Person.t'

# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2002 by:
#    * The MicroArray Gene Expression Database Society (MGED)
#    * Rosetta Inpharmatics
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..70\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::AuditAndSecurity::Person;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::AuditAndSecurity::Organization;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $person;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $person = Bio::MAGE::AuditAndSecurity::Person->new();
}
result($person->isa('Bio::MAGE::AuditAndSecurity::Person'));

# test the package class method
result($person->package() eq q[AuditAndSecurity]);

# test the class_name class method
result($person->class_name() eq q[Bio::MAGE::AuditAndSecurity::Person]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $person = Bio::MAGE::AuditAndSecurity::Person->new(firstName => 1,
midInitials => 2,
lastName => 3,
URI => 4,
address => 5,
phone => 6,
tollFreePhone => 7,
email => 8,
fax => 9,
identifier => 10,
name => 11);
}
# testing attribute firstName
result ($person->getFirstName() == 1);
$person->setFirstName(1);
result ($person->getFirstName() == 1);

# testing attribute midInitials
result ($person->getMidInitials() == 2);
$person->setMidInitials(2);
result ($person->getMidInitials() == 2);

# testing attribute lastName
result ($person->getLastName() == 3);
$person->setLastName(3);
result ($person->getLastName() == 3);

# testing attribute URI
result ($person->getURI() == 4);
$person->setURI(4);
result ($person->getURI() == 4);

# testing attribute address
result ($person->getAddress() == 5);
$person->setAddress(5);
result ($person->getAddress() == 5);

# testing attribute phone
result ($person->getPhone() == 6);
$person->setPhone(6);
result ($person->getPhone() == 6);

# testing attribute tollFreePhone
result ($person->getTollFreePhone() == 7);
$person->setTollFreePhone(7);
result ($person->getTollFreePhone() == 7);

# testing attribute email
result ($person->getEmail() == 8);
$person->setEmail(8);
result ($person->getEmail() == 8);

# testing attribute fax
result ($person->getFax() == 9);
$person->setFax(9);
result ($person->getFax() == 9);

# testing attribute identifier
result ($person->getIdentifier() == 10);
$person->setIdentifier(10);
result ($person->getIdentifier() == 10);

# testing attribute name
result ($person->getName() == 11);
$person->setName(11);
result ($person->getName() == 11);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::AuditAndSecurity::Person->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $person = Bio::MAGE::AuditAndSecurity::Person->new(affiliation => Bio::MAGE::AuditAndSecurity::Organization->new(),
roles => [Bio::MAGE::Description::OntologyEntry->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association affiliation
my $affiliation_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $affiliation_assn = Bio::MAGE::AuditAndSecurity::Organization->new();
}
result (UNIVERSAL::isa($person->getAffiliation,q[Bio::MAGE::AuditAndSecurity::Organization]));
result ($person->setAffiliation($affiliation_assn) == $affiliation_assn);
result ($person->getAffiliation() == $affiliation_assn);



# test the meta-data for the assoication
($assn) = $assns{affiliation};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association roles
my $roles_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $roles_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($person->getRoles->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($person->setRoles([$roles_assn]));
result (UNIVERSAL::isa($person->getRoles,'ARRAY')
 and scalar @{$person->getRoles()} == 1
 and $person->getRoles->[0] == $roles_assn);
$person->addRoles($roles_assn);
result (UNIVERSAL::isa($person->getRoles,'ARRAY')
 and scalar @{$person->getRoles()} == 2
 and $person->getRoles->[0] == $roles_assn
 and $person->getRoles->[1] == $roles_assn);


# test the meta-data for the assoication
($assn) = $assns{roles};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($person->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($person->setSecurity($security_assn) == $security_assn);
result ($person->getSecurity() == $security_assn);



# test the meta-data for the assoication
($assn) = $assns{security};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association auditTrail
my $audittrail_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audittrail_assn = Bio::MAGE::AuditAndSecurity::Audit->new();
}
result (UNIVERSAL::isa($person->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($person->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($person->getAuditTrail,'ARRAY')
 and scalar @{$person->getAuditTrail()} == 1
 and $person->getAuditTrail->[0] == $audittrail_assn);
$person->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($person->getAuditTrail,'ARRAY')
 and scalar @{$person->getAuditTrail()} == 2
 and $person->getAuditTrail->[0] == $audittrail_assn
 and $person->getAuditTrail->[1] == $audittrail_assn);


# test the meta-data for the assoication
($assn) = $assns{auditTrail};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association descriptions
my $descriptions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $descriptions_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($person->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($person->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($person->getDescriptions,'ARRAY')
 and scalar @{$person->getDescriptions()} == 1
 and $person->getDescriptions->[0] == $descriptions_assn);
$person->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($person->getDescriptions,'ARRAY')
 and scalar @{$person->getDescriptions()} == 2
 and $person->getDescriptions->[0] == $descriptions_assn
 and $person->getDescriptions->[1] == $descriptions_assn);


# test the meta-data for the assoication
($assn) = $assns{descriptions};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($person->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($person->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($person->getPropertySets,'ARRAY')
 and scalar @{$person->getPropertySets()} == 1
 and $person->getPropertySets->[0] == $propertysets_assn);
$person->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($person->getPropertySets,'ARRAY')
 and scalar @{$person->getPropertySets()} == 2
 and $person->getPropertySets->[0] == $propertysets_assn
 and $person->getPropertySets->[1] == $propertysets_assn);


# test the meta-data for the assoication
($assn) = $assns{propertySets};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing superclass Bio::MAGE::AuditAndSecurity::Contact
result ($person->isa(q[Bio::MAGE::AuditAndSecurity::Contact]));

# testing superclass Bio::MAGE::Identifiable
result ($person->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($person->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($person->isa(q[Bio::MAGE::Extendable]));

