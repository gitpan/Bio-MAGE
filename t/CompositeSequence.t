# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CompositeSequence.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..50\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::BioSequence::BioSequence;
use Bio::MAGE::DesignElement::CompositeCompositeMap;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::DesignElement::ReporterCompositeMap;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $compositesequence;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequence = Bio::MAGE::DesignElement::CompositeSequence->new();
}
result($compositesequence->isa('Bio::MAGE::DesignElement::CompositeSequence'));

# test the package class method
result($compositesequence->package() eq q[DesignElement]);

# test the class_name class method
result($compositesequence->class_name() eq q[Bio::MAGE::DesignElement::CompositeSequence]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequence = Bio::MAGE::DesignElement::CompositeSequence->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($compositesequence->getIdentifier() == 1);
$compositesequence->setIdentifier(1);
result ($compositesequence->getIdentifier() == 1);

# testing attribute name
result ($compositesequence->getName() == 2);
$compositesequence->setName(2);
result ($compositesequence->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::CompositeSequence->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequence = Bio::MAGE::DesignElement::CompositeSequence->new(compositeCompositeMaps => [Bio::MAGE::DesignElement::CompositeCompositeMap->new()],
biologicalCharacteristics => [Bio::MAGE::BioSequence::BioSequence->new()],
reporterCompositeMaps => [Bio::MAGE::DesignElement::ReporterCompositeMap->new()],
controlType => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association compositeCompositeMaps
my $compositecompositemaps_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositecompositemaps_assn = Bio::MAGE::DesignElement::CompositeCompositeMap->new();
}
result (UNIVERSAL::isa($compositesequence->getCompositeCompositeMaps->[0],q[Bio::MAGE::DesignElement::CompositeCompositeMap]));
result ($compositesequence->setCompositeCompositeMaps([$compositecompositemaps_assn]));
result (UNIVERSAL::isa($compositesequence->getCompositeCompositeMaps,'ARRAY')
 and scalar @{$compositesequence->getCompositeCompositeMaps()} == 1
 and $compositesequence->getCompositeCompositeMaps->[0] == $compositecompositemaps_assn);
$compositesequence->addCompositeCompositeMaps($compositecompositemaps_assn);
result (UNIVERSAL::isa($compositesequence->getCompositeCompositeMaps,'ARRAY')
 and scalar @{$compositesequence->getCompositeCompositeMaps()} == 2
 and $compositesequence->getCompositeCompositeMaps->[0] == $compositecompositemaps_assn
 and $compositesequence->getCompositeCompositeMaps->[1] == $compositecompositemaps_assn);


# test the meta-data for the assoication
($assn) = $assns{compositeCompositeMaps};
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
# testing association biologicalCharacteristics
my $biologicalcharacteristics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biologicalcharacteristics_assn = Bio::MAGE::BioSequence::BioSequence->new();
}
result (UNIVERSAL::isa($compositesequence->getBiologicalCharacteristics->[0],q[Bio::MAGE::BioSequence::BioSequence]));
result ($compositesequence->setBiologicalCharacteristics([$biologicalcharacteristics_assn]));
result (UNIVERSAL::isa($compositesequence->getBiologicalCharacteristics,'ARRAY')
 and scalar @{$compositesequence->getBiologicalCharacteristics()} == 1
 and $compositesequence->getBiologicalCharacteristics->[0] == $biologicalcharacteristics_assn);
$compositesequence->addBiologicalCharacteristics($biologicalcharacteristics_assn);
result (UNIVERSAL::isa($compositesequence->getBiologicalCharacteristics,'ARRAY')
 and scalar @{$compositesequence->getBiologicalCharacteristics()} == 2
 and $compositesequence->getBiologicalCharacteristics->[0] == $biologicalcharacteristics_assn
 and $compositesequence->getBiologicalCharacteristics->[1] == $biologicalcharacteristics_assn);


# test the meta-data for the assoication
($assn) = $assns{biologicalCharacteristics};
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
# testing association reporterCompositeMaps
my $reportercompositemaps_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportercompositemaps_assn = Bio::MAGE::DesignElement::ReporterCompositeMap->new();
}
result (UNIVERSAL::isa($compositesequence->getReporterCompositeMaps->[0],q[Bio::MAGE::DesignElement::ReporterCompositeMap]));
result ($compositesequence->setReporterCompositeMaps([$reportercompositemaps_assn]));
result (UNIVERSAL::isa($compositesequence->getReporterCompositeMaps,'ARRAY')
 and scalar @{$compositesequence->getReporterCompositeMaps()} == 1
 and $compositesequence->getReporterCompositeMaps->[0] == $reportercompositemaps_assn);
$compositesequence->addReporterCompositeMaps($reportercompositemaps_assn);
result (UNIVERSAL::isa($compositesequence->getReporterCompositeMaps,'ARRAY')
 and scalar @{$compositesequence->getReporterCompositeMaps()} == 2
 and $compositesequence->getReporterCompositeMaps->[0] == $reportercompositemaps_assn
 and $compositesequence->getReporterCompositeMaps->[1] == $reportercompositemaps_assn);


# test the meta-data for the assoication
($assn) = $assns{reporterCompositeMaps};
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
# testing association controlType
my $controltype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $controltype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($compositesequence->getControlType,q[Bio::MAGE::Description::OntologyEntry]));
result ($compositesequence->setControlType($controltype_assn) == $controltype_assn);
result ($compositesequence->getControlType() == $controltype_assn);



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
result (UNIVERSAL::isa($compositesequence->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($compositesequence->setSecurity($security_assn) == $security_assn);
result ($compositesequence->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($compositesequence->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($compositesequence->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($compositesequence->getAuditTrail,'ARRAY')
 and scalar @{$compositesequence->getAuditTrail()} == 1
 and $compositesequence->getAuditTrail->[0] == $audittrail_assn);
$compositesequence->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($compositesequence->getAuditTrail,'ARRAY')
 and scalar @{$compositesequence->getAuditTrail()} == 2
 and $compositesequence->getAuditTrail->[0] == $audittrail_assn
 and $compositesequence->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($compositesequence->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($compositesequence->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($compositesequence->getDescriptions,'ARRAY')
 and scalar @{$compositesequence->getDescriptions()} == 1
 and $compositesequence->getDescriptions->[0] == $descriptions_assn);
$compositesequence->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($compositesequence->getDescriptions,'ARRAY')
 and scalar @{$compositesequence->getDescriptions()} == 2
 and $compositesequence->getDescriptions->[0] == $descriptions_assn
 and $compositesequence->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($compositesequence->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($compositesequence->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($compositesequence->getPropertySets,'ARRAY')
 and scalar @{$compositesequence->getPropertySets()} == 1
 and $compositesequence->getPropertySets->[0] == $propertysets_assn);
$compositesequence->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($compositesequence->getPropertySets,'ARRAY')
 and scalar @{$compositesequence->getPropertySets()} == 2
 and $compositesequence->getPropertySets->[0] == $propertysets_assn
 and $compositesequence->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::DesignElement::DesignElement
result ($compositesequence->isa(q[Bio::MAGE::DesignElement::DesignElement]));

# testing superclass Bio::MAGE::Identifiable
result ($compositesequence->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($compositesequence->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($compositesequence->isa(q[Bio::MAGE::Extendable]));

