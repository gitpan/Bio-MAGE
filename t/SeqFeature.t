# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SeqFeature.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..32\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioSequence::SeqFeature;
use Bio::MAGE::BioSequence::SeqFeatureLocation;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $seqfeature;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $seqfeature = Bio::MAGE::BioSequence::SeqFeature->new();
}
result($seqfeature->isa('Bio::MAGE::BioSequence::SeqFeature'));

# test the package class method
result($seqfeature->package() eq q[BioSequence]);

# test the class_name class method
result($seqfeature->class_name() eq q[Bio::MAGE::BioSequence::SeqFeature]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $seqfeature = Bio::MAGE::BioSequence::SeqFeature->new(basis => 1);
}
# testing attribute basis
result ($seqfeature->getBasis() == 1);
$seqfeature->setBasis(1);
result ($seqfeature->getBasis() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioSequence::SeqFeature->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $seqfeature = Bio::MAGE::BioSequence::SeqFeature->new(regions => [Bio::MAGE::BioSequence::SeqFeatureLocation->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association regions
my $regions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $regions_assn = Bio::MAGE::BioSequence::SeqFeatureLocation->new();
}
result (UNIVERSAL::isa($seqfeature->getRegions->[0],q[Bio::MAGE::BioSequence::SeqFeatureLocation]));
result ($seqfeature->setRegions([$regions_assn]));
result (UNIVERSAL::isa($seqfeature->getRegions,'ARRAY')
 and scalar @{$seqfeature->getRegions()} == 1
 and $seqfeature->getRegions->[0] == $regions_assn);
$seqfeature->addRegions($regions_assn);
result (UNIVERSAL::isa($seqfeature->getRegions,'ARRAY')
 and scalar @{$seqfeature->getRegions()} == 2
 and $seqfeature->getRegions->[0] == $regions_assn
 and $seqfeature->getRegions->[1] == $regions_assn);


# test the meta-data for the assoication
($assn) = $assns{regions};
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
result (UNIVERSAL::isa($seqfeature->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($seqfeature->setSecurity($security_assn) == $security_assn);
result ($seqfeature->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($seqfeature->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($seqfeature->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($seqfeature->getAuditTrail,'ARRAY')
 and scalar @{$seqfeature->getAuditTrail()} == 1
 and $seqfeature->getAuditTrail->[0] == $audittrail_assn);
$seqfeature->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($seqfeature->getAuditTrail,'ARRAY')
 and scalar @{$seqfeature->getAuditTrail()} == 2
 and $seqfeature->getAuditTrail->[0] == $audittrail_assn
 and $seqfeature->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($seqfeature->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($seqfeature->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($seqfeature->getDescriptions,'ARRAY')
 and scalar @{$seqfeature->getDescriptions()} == 1
 and $seqfeature->getDescriptions->[0] == $descriptions_assn);
$seqfeature->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($seqfeature->getDescriptions,'ARRAY')
 and scalar @{$seqfeature->getDescriptions()} == 2
 and $seqfeature->getDescriptions->[0] == $descriptions_assn
 and $seqfeature->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($seqfeature->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($seqfeature->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($seqfeature->getPropertySets,'ARRAY')
 and scalar @{$seqfeature->getPropertySets()} == 1
 and $seqfeature->getPropertySets->[0] == $propertysets_assn);
$seqfeature->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($seqfeature->getPropertySets,'ARRAY')
 and scalar @{$seqfeature->getPropertySets()} == 2
 and $seqfeature->getPropertySets->[0] == $propertysets_assn
 and $seqfeature->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Describable
result ($seqfeature->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($seqfeature->isa(q[Bio::MAGE::Extendable]));

