# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Protocol.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..56\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::Protocol;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::Software;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Protocol::Parameter;
use Bio::MAGE::Protocol::Hardware;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $protocol;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocol = Bio::MAGE::Protocol::Protocol->new();
}
result($protocol->isa('Bio::MAGE::Protocol::Protocol'));

# test the package class method
result($protocol->package() eq q[Protocol]);

# test the class_name class method
result($protocol->class_name() eq q[Bio::MAGE::Protocol::Protocol]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocol = Bio::MAGE::Protocol::Protocol->new(text => 1,
title => 2,
URI => 3,
identifier => 4,
name => 5);
}
# testing attribute text
result ($protocol->getText() == 1);
$protocol->setText(1);
result ($protocol->getText() == 1);

# testing attribute title
result ($protocol->getTitle() == 2);
$protocol->setTitle(2);
result ($protocol->getTitle() == 2);

# testing attribute URI
result ($protocol->getURI() == 3);
$protocol->setURI(3);
result ($protocol->getURI() == 3);

# testing attribute identifier
result ($protocol->getIdentifier() == 4);
$protocol->setIdentifier(4);
result ($protocol->getIdentifier() == 4);

# testing attribute name
result ($protocol->getName() == 5);
$protocol->setName(5);
result ($protocol->getName() == 5);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::Protocol->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocol = Bio::MAGE::Protocol::Protocol->new(hardwares => [Bio::MAGE::Protocol::Hardware->new()],
softwares => [Bio::MAGE::Protocol::Software->new()],
type => Bio::MAGE::Description::OntologyEntry->new(),
parameterTypes => [Bio::MAGE::Protocol::Parameter->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association hardwares
my $hardwares_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $hardwares_assn = Bio::MAGE::Protocol::Hardware->new();
}
result (UNIVERSAL::isa($protocol->getHardwares->[0],q[Bio::MAGE::Protocol::Hardware]));
result ($protocol->setHardwares([$hardwares_assn]));
result (UNIVERSAL::isa($protocol->getHardwares,'ARRAY')
 and scalar @{$protocol->getHardwares()} == 1
 and $protocol->getHardwares->[0] == $hardwares_assn);
$protocol->addHardwares($hardwares_assn);
result (UNIVERSAL::isa($protocol->getHardwares,'ARRAY')
 and scalar @{$protocol->getHardwares()} == 2
 and $protocol->getHardwares->[0] == $hardwares_assn
 and $protocol->getHardwares->[1] == $hardwares_assn);


# test the meta-data for the assoication
($assn) = $assns{hardwares};
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
# testing association softwares
my $softwares_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $softwares_assn = Bio::MAGE::Protocol::Software->new();
}
result (UNIVERSAL::isa($protocol->getSoftwares->[0],q[Bio::MAGE::Protocol::Software]));
result ($protocol->setSoftwares([$softwares_assn]));
result (UNIVERSAL::isa($protocol->getSoftwares,'ARRAY')
 and scalar @{$protocol->getSoftwares()} == 1
 and $protocol->getSoftwares->[0] == $softwares_assn);
$protocol->addSoftwares($softwares_assn);
result (UNIVERSAL::isa($protocol->getSoftwares,'ARRAY')
 and scalar @{$protocol->getSoftwares()} == 2
 and $protocol->getSoftwares->[0] == $softwares_assn
 and $protocol->getSoftwares->[1] == $softwares_assn);


# test the meta-data for the assoication
($assn) = $assns{softwares};
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
result (UNIVERSAL::isa($protocol->getType,q[Bio::MAGE::Description::OntologyEntry]));
result ($protocol->setType($type_assn) == $type_assn);
result ($protocol->getType() == $type_assn);



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
# testing association parameterTypes
my $parametertypes_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parametertypes_assn = Bio::MAGE::Protocol::Parameter->new();
}
result (UNIVERSAL::isa($protocol->getParameterTypes->[0],q[Bio::MAGE::Protocol::Parameter]));
result ($protocol->setParameterTypes([$parametertypes_assn]));
result (UNIVERSAL::isa($protocol->getParameterTypes,'ARRAY')
 and scalar @{$protocol->getParameterTypes()} == 1
 and $protocol->getParameterTypes->[0] == $parametertypes_assn);
$protocol->addParameterTypes($parametertypes_assn);
result (UNIVERSAL::isa($protocol->getParameterTypes,'ARRAY')
 and scalar @{$protocol->getParameterTypes()} == 2
 and $protocol->getParameterTypes->[0] == $parametertypes_assn
 and $protocol->getParameterTypes->[1] == $parametertypes_assn);


# test the meta-data for the assoication
($assn) = $assns{parameterTypes};
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
result (UNIVERSAL::isa($protocol->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($protocol->setSecurity($security_assn) == $security_assn);
result ($protocol->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($protocol->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($protocol->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($protocol->getAuditTrail,'ARRAY')
 and scalar @{$protocol->getAuditTrail()} == 1
 and $protocol->getAuditTrail->[0] == $audittrail_assn);
$protocol->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($protocol->getAuditTrail,'ARRAY')
 and scalar @{$protocol->getAuditTrail()} == 2
 and $protocol->getAuditTrail->[0] == $audittrail_assn
 and $protocol->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($protocol->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($protocol->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($protocol->getDescriptions,'ARRAY')
 and scalar @{$protocol->getDescriptions()} == 1
 and $protocol->getDescriptions->[0] == $descriptions_assn);
$protocol->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($protocol->getDescriptions,'ARRAY')
 and scalar @{$protocol->getDescriptions()} == 2
 and $protocol->getDescriptions->[0] == $descriptions_assn
 and $protocol->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($protocol->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($protocol->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($protocol->getPropertySets,'ARRAY')
 and scalar @{$protocol->getPropertySets()} == 1
 and $protocol->getPropertySets->[0] == $propertysets_assn);
$protocol->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($protocol->getPropertySets,'ARRAY')
 and scalar @{$protocol->getPropertySets()} == 2
 and $protocol->getPropertySets->[0] == $propertysets_assn
 and $protocol->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Protocol::Parameterizable
result ($protocol->isa(q[Bio::MAGE::Protocol::Parameterizable]));

# testing superclass Bio::MAGE::Identifiable
result ($protocol->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($protocol->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($protocol->isa(q[Bio::MAGE::Extendable]));

