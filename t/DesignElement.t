# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DesignElement.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..37\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::DesignElement;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::DesignElement::Reporter;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $designelement;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelement = Bio::MAGE::DesignElement::DesignElement->new();
}
result($designelement->isa('Bio::MAGE::DesignElement::DesignElement'));

# test the package class method
result($designelement->package() eq q[DesignElement]);

# test the class_name class method
result($designelement->class_name() eq q[Bio::MAGE::DesignElement::DesignElement]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelement = Bio::MAGE::DesignElement::DesignElement->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($designelement->getIdentifier() == 1);
$designelement->setIdentifier(1);
result ($designelement->getIdentifier() == 1);

# testing attribute name
result ($designelement->getName() == 2);
$designelement->setName(2);
result ($designelement->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::DesignElement->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelement = Bio::MAGE::DesignElement::DesignElement->new(controlType => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association controlType
my $controltype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $controltype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($designelement->getControlType,q[Bio::MAGE::Description::OntologyEntry]));
result ($designelement->setControlType($controltype_assn) == $controltype_assn);
result ($designelement->getControlType() == $controltype_assn);



# test the meta-data for the assoication
($assn) = $assns{controlType};
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
result (UNIVERSAL::isa($designelement->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($designelement->setSecurity($security_assn) == $security_assn);
result ($designelement->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($designelement->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($designelement->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($designelement->getAuditTrail,'ARRAY')
 and scalar @{$designelement->getAuditTrail()} == 1
 and $designelement->getAuditTrail->[0] == $audittrail_assn);
$designelement->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($designelement->getAuditTrail,'ARRAY')
 and scalar @{$designelement->getAuditTrail()} == 2
 and $designelement->getAuditTrail->[0] == $audittrail_assn
 and $designelement->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($designelement->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($designelement->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($designelement->getDescriptions,'ARRAY')
 and scalar @{$designelement->getDescriptions()} == 1
 and $designelement->getDescriptions->[0] == $descriptions_assn);
$designelement->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($designelement->getDescriptions,'ARRAY')
 and scalar @{$designelement->getDescriptions()} == 2
 and $designelement->getDescriptions->[0] == $descriptions_assn
 and $designelement->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($designelement->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($designelement->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($designelement->getPropertySets,'ARRAY')
 and scalar @{$designelement->getPropertySets()} == 1
 and $designelement->getPropertySets->[0] == $propertysets_assn);
$designelement->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($designelement->getPropertySets,'ARRAY')
 and scalar @{$designelement->getPropertySets()} == 2
 and $designelement->getPropertySets->[0] == $propertysets_assn
 and $designelement->getPropertySets->[1] == $propertysets_assn);


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
  my $reporter = Bio::MAGE::DesignElement::Reporter->new();

  # testing subclass Reporter
  result ($reporter->isa(q[Bio::MAGE::DesignElement::Reporter]));

  # create a subclass
  my $compositesequence = Bio::MAGE::DesignElement::CompositeSequence->new();

  # testing subclass CompositeSequence
  result ($compositesequence->isa(q[Bio::MAGE::DesignElement::CompositeSequence]));

  # create a subclass
  my $feature = Bio::MAGE::DesignElement::Feature->new();

  # testing subclass Feature
  result ($feature->isa(q[Bio::MAGE::DesignElement::Feature]));

}
# testing superclass Bio::MAGE::Identifiable
result ($designelement->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($designelement->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($designelement->isa(q[Bio::MAGE::Extendable]));

