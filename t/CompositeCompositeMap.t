# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CompositeCompositeMap.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..47\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::CompositeCompositeMap;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::DesignElement::CompositePosition;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $compositecompositemap;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositecompositemap = Bio::MAGE::DesignElement::CompositeCompositeMap->new();
}
result($compositecompositemap->isa('Bio::MAGE::DesignElement::CompositeCompositeMap'));

# test the package class method
result($compositecompositemap->package() eq q[DesignElement]);

# test the class_name class method
result($compositecompositemap->class_name() eq q[Bio::MAGE::DesignElement::CompositeCompositeMap]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositecompositemap = Bio::MAGE::DesignElement::CompositeCompositeMap->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($compositecompositemap->getIdentifier() == 1);
$compositecompositemap->setIdentifier(1);
result ($compositecompositemap->getIdentifier() == 1);

# testing attribute name
result ($compositecompositemap->getName() == 2);
$compositecompositemap->setName(2);
result ($compositecompositemap->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::CompositeCompositeMap->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositecompositemap = Bio::MAGE::DesignElement::CompositeCompositeMap->new(compositeSequence => Bio::MAGE::DesignElement::CompositeSequence->new(),
compositePositionSources => [Bio::MAGE::DesignElement::CompositePosition->new()],
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association compositeSequence
my $compositesequence_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequence_assn = Bio::MAGE::DesignElement::CompositeSequence->new();
}
result (UNIVERSAL::isa($compositecompositemap->getCompositeSequence,q[Bio::MAGE::DesignElement::CompositeSequence]));
result ($compositecompositemap->setCompositeSequence($compositesequence_assn) == $compositesequence_assn);
result ($compositecompositemap->getCompositeSequence() == $compositesequence_assn);



# test the meta-data for the assoication
($assn) = $assns{compositeSequence};
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
# testing association compositePositionSources
my $compositepositionsources_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositepositionsources_assn = Bio::MAGE::DesignElement::CompositePosition->new();
}
result (UNIVERSAL::isa($compositecompositemap->getCompositePositionSources->[0],q[Bio::MAGE::DesignElement::CompositePosition]));
result ($compositecompositemap->setCompositePositionSources([$compositepositionsources_assn]));
result (UNIVERSAL::isa($compositecompositemap->getCompositePositionSources,'ARRAY')
 and scalar @{$compositecompositemap->getCompositePositionSources()} == 1
 and $compositecompositemap->getCompositePositionSources->[0] == $compositepositionsources_assn);
$compositecompositemap->addCompositePositionSources($compositepositionsources_assn);
result (UNIVERSAL::isa($compositecompositemap->getCompositePositionSources,'ARRAY')
 and scalar @{$compositecompositemap->getCompositePositionSources()} == 2
 and $compositecompositemap->getCompositePositionSources->[0] == $compositepositionsources_assn
 and $compositecompositemap->getCompositePositionSources->[1] == $compositepositionsources_assn);


# test the meta-data for the assoication
($assn) = $assns{compositePositionSources};
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
# testing association protocolApplications
my $protocolapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplications_assn = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result (UNIVERSAL::isa($compositecompositemap->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($compositecompositemap->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($compositecompositemap->getProtocolApplications,'ARRAY')
 and scalar @{$compositecompositemap->getProtocolApplications()} == 1
 and $compositecompositemap->getProtocolApplications->[0] == $protocolapplications_assn);
$compositecompositemap->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($compositecompositemap->getProtocolApplications,'ARRAY')
 and scalar @{$compositecompositemap->getProtocolApplications()} == 2
 and $compositecompositemap->getProtocolApplications->[0] == $protocolapplications_assn
 and $compositecompositemap->getProtocolApplications->[1] == $protocolapplications_assn);


# test the meta-data for the assoication
($assn) = $assns{protocolApplications};
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
result (UNIVERSAL::isa($compositecompositemap->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($compositecompositemap->setSecurity($security_assn) == $security_assn);
result ($compositecompositemap->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($compositecompositemap->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($compositecompositemap->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($compositecompositemap->getAuditTrail,'ARRAY')
 and scalar @{$compositecompositemap->getAuditTrail()} == 1
 and $compositecompositemap->getAuditTrail->[0] == $audittrail_assn);
$compositecompositemap->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($compositecompositemap->getAuditTrail,'ARRAY')
 and scalar @{$compositecompositemap->getAuditTrail()} == 2
 and $compositecompositemap->getAuditTrail->[0] == $audittrail_assn
 and $compositecompositemap->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($compositecompositemap->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($compositecompositemap->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($compositecompositemap->getDescriptions,'ARRAY')
 and scalar @{$compositecompositemap->getDescriptions()} == 1
 and $compositecompositemap->getDescriptions->[0] == $descriptions_assn);
$compositecompositemap->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($compositecompositemap->getDescriptions,'ARRAY')
 and scalar @{$compositecompositemap->getDescriptions()} == 2
 and $compositecompositemap->getDescriptions->[0] == $descriptions_assn
 and $compositecompositemap->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($compositecompositemap->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($compositecompositemap->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($compositecompositemap->getPropertySets,'ARRAY')
 and scalar @{$compositecompositemap->getPropertySets()} == 1
 and $compositecompositemap->getPropertySets->[0] == $propertysets_assn);
$compositecompositemap->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($compositecompositemap->getPropertySets,'ARRAY')
 and scalar @{$compositecompositemap->getPropertySets()} == 2
 and $compositecompositemap->getPropertySets->[0] == $propertysets_assn
 and $compositecompositemap->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssayData::DesignElementMap
result ($compositecompositemap->isa(q[Bio::MAGE::BioAssayData::DesignElementMap]));

# testing superclass Bio::MAGE::BioEvent::Map
result ($compositecompositemap->isa(q[Bio::MAGE::BioEvent::Map]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($compositecompositemap->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($compositecompositemap->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($compositecompositemap->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($compositecompositemap->isa(q[Bio::MAGE::Extendable]));

