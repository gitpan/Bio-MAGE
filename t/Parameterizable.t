# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Parameterizable.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..40\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::Parameterizable;
use Bio::MAGE::Protocol::Protocol;
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
my $parameterizable;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameterizable = Bio::MAGE::Protocol::Parameterizable->new();
}
result($parameterizable->isa('Bio::MAGE::Protocol::Parameterizable'));

# test the package class method
result($parameterizable->package() eq q[Protocol]);

# test the class_name class method
result($parameterizable->class_name() eq q[Bio::MAGE::Protocol::Parameterizable]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameterizable = Bio::MAGE::Protocol::Parameterizable->new(URI => 1,
identifier => 2,
name => 3);
}
# testing attribute URI
result ($parameterizable->getURI() == 1);
$parameterizable->setURI(1);
result ($parameterizable->getURI() == 1);

# testing attribute identifier
result ($parameterizable->getIdentifier() == 2);
$parameterizable->setIdentifier(2);
result ($parameterizable->getIdentifier() == 2);

# testing attribute name
result ($parameterizable->getName() == 3);
$parameterizable->setName(3);
result ($parameterizable->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Protocol::Parameterizable->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parameterizable = Bio::MAGE::Protocol::Parameterizable->new(parameterTypes => [Bio::MAGE::Protocol::Parameter->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association parameterTypes
my $parametertypes_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $parametertypes_assn = Bio::MAGE::Protocol::Parameter->new();
}
result (UNIVERSAL::isa($parameterizable->getParameterTypes->[0],q[Bio::MAGE::Protocol::Parameter]));
result ($parameterizable->setParameterTypes([$parametertypes_assn]));
result (UNIVERSAL::isa($parameterizable->getParameterTypes,'ARRAY')
 and scalar @{$parameterizable->getParameterTypes()} == 1
 and $parameterizable->getParameterTypes->[0] == $parametertypes_assn);
$parameterizable->addParameterTypes($parametertypes_assn);
result (UNIVERSAL::isa($parameterizable->getParameterTypes,'ARRAY')
 and scalar @{$parameterizable->getParameterTypes()} == 2
 and $parameterizable->getParameterTypes->[0] == $parametertypes_assn
 and $parameterizable->getParameterTypes->[1] == $parametertypes_assn);


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
result (UNIVERSAL::isa($parameterizable->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($parameterizable->setSecurity($security_assn) == $security_assn);
result ($parameterizable->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($parameterizable->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($parameterizable->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($parameterizable->getAuditTrail,'ARRAY')
 and scalar @{$parameterizable->getAuditTrail()} == 1
 and $parameterizable->getAuditTrail->[0] == $audittrail_assn);
$parameterizable->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($parameterizable->getAuditTrail,'ARRAY')
 and scalar @{$parameterizable->getAuditTrail()} == 2
 and $parameterizable->getAuditTrail->[0] == $audittrail_assn
 and $parameterizable->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($parameterizable->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($parameterizable->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($parameterizable->getDescriptions,'ARRAY')
 and scalar @{$parameterizable->getDescriptions()} == 1
 and $parameterizable->getDescriptions->[0] == $descriptions_assn);
$parameterizable->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($parameterizable->getDescriptions,'ARRAY')
 and scalar @{$parameterizable->getDescriptions()} == 2
 and $parameterizable->getDescriptions->[0] == $descriptions_assn
 and $parameterizable->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($parameterizable->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($parameterizable->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($parameterizable->getPropertySets,'ARRAY')
 and scalar @{$parameterizable->getPropertySets()} == 1
 and $parameterizable->getPropertySets->[0] == $propertysets_assn);
$parameterizable->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($parameterizable->getPropertySets,'ARRAY')
 and scalar @{$parameterizable->getPropertySets()} == 2
 and $parameterizable->getPropertySets->[0] == $propertysets_assn
 and $parameterizable->getPropertySets->[1] == $propertysets_assn);


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
  my $protocol = Bio::MAGE::Protocol::Protocol->new();

  # testing subclass Protocol
  result ($protocol->isa(q[Bio::MAGE::Protocol::Protocol]));

  # create a subclass
  my $hardware = Bio::MAGE::Protocol::Hardware->new();

  # testing subclass Hardware
  result ($hardware->isa(q[Bio::MAGE::Protocol::Hardware]));

  # create a subclass
  my $software = Bio::MAGE::Protocol::Software->new();

  # testing subclass Software
  result ($software->isa(q[Bio::MAGE::Protocol::Software]));

}
# testing superclass Bio::MAGE::Identifiable
result ($parameterizable->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($parameterizable->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($parameterizable->isa(q[Bio::MAGE::Extendable]));

