# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Contact.t'

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

BEGIN { $| = 1; print "1..59\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Person;
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
my $contact;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $contact = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result($contact->isa('Bio::MAGE::AuditAndSecurity::Contact'));

# test the package class method
result($contact->package() eq q[AuditAndSecurity]);

# test the class_name class method
result($contact->class_name() eq q[Bio::MAGE::AuditAndSecurity::Contact]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $contact = Bio::MAGE::AuditAndSecurity::Contact->new(email => 1,
URI => 2,
fax => 3,
tollFreePhone => 4,
address => 5,
phone => 6,
identifier => 7,
name => 8);
}
# testing attribute email
result ($contact->getEmail() == 1);
$contact->setEmail(1);
result ($contact->getEmail() == 1);

# testing attribute URI
result ($contact->getURI() == 2);
$contact->setURI(2);
result ($contact->getURI() == 2);

# testing attribute fax
result ($contact->getFax() == 3);
$contact->setFax(3);
result ($contact->getFax() == 3);

# testing attribute tollFreePhone
result ($contact->getTollFreePhone() == 4);
$contact->setTollFreePhone(4);
result ($contact->getTollFreePhone() == 4);

# testing attribute address
result ($contact->getAddress() == 5);
$contact->setAddress(5);
result ($contact->getAddress() == 5);

# testing attribute phone
result ($contact->getPhone() == 6);
$contact->setPhone(6);
result ($contact->getPhone() == 6);

# testing attribute identifier
result ($contact->getIdentifier() == 7);
$contact->setIdentifier(7);
result ($contact->getIdentifier() == 7);

# testing attribute name
result ($contact->getName() == 8);
$contact->setName(8);
result ($contact->getName() == 8);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::AuditAndSecurity::Contact->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $contact = Bio::MAGE::AuditAndSecurity::Contact->new(roles => [Bio::MAGE::Description::OntologyEntry->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association roles
my $roles_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $roles_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($contact->getRoles->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($contact->setRoles([$roles_assn]));
result (UNIVERSAL::isa($contact->getRoles,'ARRAY')
 and scalar @{$contact->getRoles()} == 1
 and $contact->getRoles->[0] == $roles_assn);
$contact->addRoles($roles_assn);
result (UNIVERSAL::isa($contact->getRoles,'ARRAY')
 and scalar @{$contact->getRoles()} == 2
 and $contact->getRoles->[0] == $roles_assn
 and $contact->getRoles->[1] == $roles_assn);


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
result (UNIVERSAL::isa($contact->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($contact->setSecurity($security_assn) == $security_assn);
result ($contact->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($contact->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($contact->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($contact->getAuditTrail,'ARRAY')
 and scalar @{$contact->getAuditTrail()} == 1
 and $contact->getAuditTrail->[0] == $audittrail_assn);
$contact->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($contact->getAuditTrail,'ARRAY')
 and scalar @{$contact->getAuditTrail()} == 2
 and $contact->getAuditTrail->[0] == $audittrail_assn
 and $contact->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($contact->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($contact->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($contact->getDescriptions,'ARRAY')
 and scalar @{$contact->getDescriptions()} == 1
 and $contact->getDescriptions->[0] == $descriptions_assn);
$contact->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($contact->getDescriptions,'ARRAY')
 and scalar @{$contact->getDescriptions()} == 2
 and $contact->getDescriptions->[0] == $descriptions_assn
 and $contact->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($contact->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($contact->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($contact->getPropertySets,'ARRAY')
 and scalar @{$contact->getPropertySets()} == 1
 and $contact->getPropertySets->[0] == $propertysets_assn);
$contact->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($contact->getPropertySets,'ARRAY')
 and scalar @{$contact->getPropertySets()} == 2
 and $contact->getPropertySets->[0] == $propertysets_assn
 and $contact->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $organization = Bio::MAGE::AuditAndSecurity::Organization->new();

  # testing subclass Organization
  result ($organization->isa(q[Bio::MAGE::AuditAndSecurity::Organization]));

  # create a subclass
  my $person = Bio::MAGE::AuditAndSecurity::Person->new();

  # testing subclass Person
  result ($person->isa(q[Bio::MAGE::AuditAndSecurity::Person]));

}
# testing superclass Bio::MAGE::Identifiable
result ($contact->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($contact->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($contact->isa(q[Bio::MAGE::Extendable]));

