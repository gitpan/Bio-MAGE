# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayDimension.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..35\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::BioAssayDimension;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassaydimension;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydimension = Bio::MAGE::BioAssayData::BioAssayDimension->new();
}
result($bioassaydimension->isa('Bio::MAGE::BioAssayData::BioAssayDimension'));

# test the package class method
result($bioassaydimension->package() eq q[BioAssayData]);

# test the class_name class method
result($bioassaydimension->class_name() eq q[Bio::MAGE::BioAssayData::BioAssayDimension]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydimension = Bio::MAGE::BioAssayData::BioAssayDimension->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($bioassaydimension->getIdentifier() == 1);
$bioassaydimension->setIdentifier(1);
result ($bioassaydimension->getIdentifier() == 1);

# testing attribute name
result ($bioassaydimension->getName() == 2);
$bioassaydimension->setName(2);
result ($bioassaydimension->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioAssayDimension->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydimension = Bio::MAGE::BioAssayData::BioAssayDimension->new(bioAssays => [Bio::MAGE::BioAssay::BioAssay->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association bioAssays
my $bioassays_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassays_assn = Bio::MAGE::BioAssay::BioAssay->new();
}
result (UNIVERSAL::isa($bioassaydimension->getBioAssays->[0],q[Bio::MAGE::BioAssay::BioAssay]));
result ($bioassaydimension->setBioAssays([$bioassays_assn]));
result (UNIVERSAL::isa($bioassaydimension->getBioAssays,'ARRAY')
 and scalar @{$bioassaydimension->getBioAssays()} == 1
 and $bioassaydimension->getBioAssays->[0] == $bioassays_assn);
$bioassaydimension->addBioAssays($bioassays_assn);
result (UNIVERSAL::isa($bioassaydimension->getBioAssays,'ARRAY')
 and scalar @{$bioassaydimension->getBioAssays()} == 2
 and $bioassaydimension->getBioAssays->[0] == $bioassays_assn
 and $bioassaydimension->getBioAssays->[1] == $bioassays_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssays};
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
result (UNIVERSAL::isa($bioassaydimension->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($bioassaydimension->setSecurity($security_assn) == $security_assn);
result ($bioassaydimension->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($bioassaydimension->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($bioassaydimension->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($bioassaydimension->getAuditTrail,'ARRAY')
 and scalar @{$bioassaydimension->getAuditTrail()} == 1
 and $bioassaydimension->getAuditTrail->[0] == $audittrail_assn);
$bioassaydimension->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($bioassaydimension->getAuditTrail,'ARRAY')
 and scalar @{$bioassaydimension->getAuditTrail()} == 2
 and $bioassaydimension->getAuditTrail->[0] == $audittrail_assn
 and $bioassaydimension->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($bioassaydimension->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($bioassaydimension->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($bioassaydimension->getDescriptions,'ARRAY')
 and scalar @{$bioassaydimension->getDescriptions()} == 1
 and $bioassaydimension->getDescriptions->[0] == $descriptions_assn);
$bioassaydimension->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($bioassaydimension->getDescriptions,'ARRAY')
 and scalar @{$bioassaydimension->getDescriptions()} == 2
 and $bioassaydimension->getDescriptions->[0] == $descriptions_assn
 and $bioassaydimension->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($bioassaydimension->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaydimension->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaydimension->getPropertySets,'ARRAY')
 and scalar @{$bioassaydimension->getPropertySets()} == 1
 and $bioassaydimension->getPropertySets->[0] == $propertysets_assn);
$bioassaydimension->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaydimension->getPropertySets,'ARRAY')
 and scalar @{$bioassaydimension->getPropertySets()} == 2
 and $bioassaydimension->getPropertySets->[0] == $propertysets_assn
 and $bioassaydimension->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Identifiable
result ($bioassaydimension->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($bioassaydimension->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($bioassaydimension->isa(q[Bio::MAGE::Extendable]));

