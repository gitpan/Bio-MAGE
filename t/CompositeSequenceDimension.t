# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CompositeSequenceDimension.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..36\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::CompositeSequenceDimension;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $compositesequencedimension;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequencedimension = Bio::MAGE::BioAssayData::CompositeSequenceDimension->new();
}
result($compositesequencedimension->isa('Bio::MAGE::BioAssayData::CompositeSequenceDimension'));

# test the package class method
result($compositesequencedimension->package() eq q[BioAssayData]);

# test the class_name class method
result($compositesequencedimension->class_name() eq q[Bio::MAGE::BioAssayData::CompositeSequenceDimension]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequencedimension = Bio::MAGE::BioAssayData::CompositeSequenceDimension->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($compositesequencedimension->getIdentifier() == 1);
$compositesequencedimension->setIdentifier(1);
result ($compositesequencedimension->getIdentifier() == 1);

# testing attribute name
result ($compositesequencedimension->getName() == 2);
$compositesequencedimension->setName(2);
result ($compositesequencedimension->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::CompositeSequenceDimension->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequencedimension = Bio::MAGE::BioAssayData::CompositeSequenceDimension->new(compositeSequences => [Bio::MAGE::DesignElement::CompositeSequence->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association compositeSequences
my $compositesequences_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequences_assn = Bio::MAGE::DesignElement::CompositeSequence->new();
}
result (UNIVERSAL::isa($compositesequencedimension->getCompositeSequences->[0],q[Bio::MAGE::DesignElement::CompositeSequence]));
result ($compositesequencedimension->setCompositeSequences([$compositesequences_assn]));
result (UNIVERSAL::isa($compositesequencedimension->getCompositeSequences,'ARRAY')
 and scalar @{$compositesequencedimension->getCompositeSequences()} == 1
 and $compositesequencedimension->getCompositeSequences->[0] == $compositesequences_assn);
$compositesequencedimension->addCompositeSequences($compositesequences_assn);
result (UNIVERSAL::isa($compositesequencedimension->getCompositeSequences,'ARRAY')
 and scalar @{$compositesequencedimension->getCompositeSequences()} == 2
 and $compositesequencedimension->getCompositeSequences->[0] == $compositesequences_assn
 and $compositesequencedimension->getCompositeSequences->[1] == $compositesequences_assn);


# test the meta-data for the assoication
($assn) = $assns{compositeSequences};
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
result (UNIVERSAL::isa($compositesequencedimension->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($compositesequencedimension->setSecurity($security_assn) == $security_assn);
result ($compositesequencedimension->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($compositesequencedimension->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($compositesequencedimension->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($compositesequencedimension->getAuditTrail,'ARRAY')
 and scalar @{$compositesequencedimension->getAuditTrail()} == 1
 and $compositesequencedimension->getAuditTrail->[0] == $audittrail_assn);
$compositesequencedimension->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($compositesequencedimension->getAuditTrail,'ARRAY')
 and scalar @{$compositesequencedimension->getAuditTrail()} == 2
 and $compositesequencedimension->getAuditTrail->[0] == $audittrail_assn
 and $compositesequencedimension->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($compositesequencedimension->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($compositesequencedimension->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($compositesequencedimension->getDescriptions,'ARRAY')
 and scalar @{$compositesequencedimension->getDescriptions()} == 1
 and $compositesequencedimension->getDescriptions->[0] == $descriptions_assn);
$compositesequencedimension->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($compositesequencedimension->getDescriptions,'ARRAY')
 and scalar @{$compositesequencedimension->getDescriptions()} == 2
 and $compositesequencedimension->getDescriptions->[0] == $descriptions_assn
 and $compositesequencedimension->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($compositesequencedimension->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($compositesequencedimension->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($compositesequencedimension->getPropertySets,'ARRAY')
 and scalar @{$compositesequencedimension->getPropertySets()} == 1
 and $compositesequencedimension->getPropertySets->[0] == $propertysets_assn);
$compositesequencedimension->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($compositesequencedimension->getPropertySets,'ARRAY')
 and scalar @{$compositesequencedimension->getPropertySets()} == 2
 and $compositesequencedimension->getPropertySets->[0] == $propertysets_assn
 and $compositesequencedimension->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssayData::DesignElementDimension
result ($compositesequencedimension->isa(q[Bio::MAGE::BioAssayData::DesignElementDimension]));

# testing superclass Bio::MAGE::Identifiable
result ($compositesequencedimension->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($compositesequencedimension->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($compositesequencedimension->isa(q[Bio::MAGE::Extendable]));

