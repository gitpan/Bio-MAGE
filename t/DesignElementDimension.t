# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl DesignElementDimension.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..33\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::DesignElementDimension;
use Bio::MAGE::BioAssayData::FeatureDimension;
use Bio::MAGE::BioAssayData::CompositeSequenceDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssayData::ReporterDimension;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $designelementdimension;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementdimension = Bio::MAGE::BioAssayData::DesignElementDimension->new();
}
result($designelementdimension->isa('Bio::MAGE::BioAssayData::DesignElementDimension'));

# test the package class method
result($designelementdimension->package() eq q[BioAssayData]);

# test the class_name class method
result($designelementdimension->class_name() eq q[Bio::MAGE::BioAssayData::DesignElementDimension]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementdimension = Bio::MAGE::BioAssayData::DesignElementDimension->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($designelementdimension->getIdentifier() == 1);
$designelementdimension->setIdentifier(1);
result ($designelementdimension->getIdentifier() == 1);

# testing attribute name
result ($designelementdimension->getName() == 2);
$designelementdimension->setName(2);
result ($designelementdimension->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::DesignElementDimension->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementdimension = Bio::MAGE::BioAssayData::DesignElementDimension->new(security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($designelementdimension->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($designelementdimension->setSecurity($security_assn) == $security_assn);
result ($designelementdimension->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($designelementdimension->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($designelementdimension->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($designelementdimension->getAuditTrail,'ARRAY')
 and scalar @{$designelementdimension->getAuditTrail()} == 1
 and $designelementdimension->getAuditTrail->[0] == $audittrail_assn);
$designelementdimension->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($designelementdimension->getAuditTrail,'ARRAY')
 and scalar @{$designelementdimension->getAuditTrail()} == 2
 and $designelementdimension->getAuditTrail->[0] == $audittrail_assn
 and $designelementdimension->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($designelementdimension->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($designelementdimension->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($designelementdimension->getDescriptions,'ARRAY')
 and scalar @{$designelementdimension->getDescriptions()} == 1
 and $designelementdimension->getDescriptions->[0] == $descriptions_assn);
$designelementdimension->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($designelementdimension->getDescriptions,'ARRAY')
 and scalar @{$designelementdimension->getDescriptions()} == 2
 and $designelementdimension->getDescriptions->[0] == $descriptions_assn
 and $designelementdimension->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($designelementdimension->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($designelementdimension->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($designelementdimension->getPropertySets,'ARRAY')
 and scalar @{$designelementdimension->getPropertySets()} == 1
 and $designelementdimension->getPropertySets->[0] == $propertysets_assn);
$designelementdimension->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($designelementdimension->getPropertySets,'ARRAY')
 and scalar @{$designelementdimension->getPropertySets()} == 2
 and $designelementdimension->getPropertySets->[0] == $propertysets_assn
 and $designelementdimension->getPropertySets->[1] == $propertysets_assn);


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
  my $reporterdimension = Bio::MAGE::BioAssayData::ReporterDimension->new();

  # testing subclass ReporterDimension
  result ($reporterdimension->isa(q[Bio::MAGE::BioAssayData::ReporterDimension]));

  # create a subclass
  my $compositesequencedimension = Bio::MAGE::BioAssayData::CompositeSequenceDimension->new();

  # testing subclass CompositeSequenceDimension
  result ($compositesequencedimension->isa(q[Bio::MAGE::BioAssayData::CompositeSequenceDimension]));

  # create a subclass
  my $featuredimension = Bio::MAGE::BioAssayData::FeatureDimension->new();

  # testing subclass FeatureDimension
  result ($featuredimension->isa(q[Bio::MAGE::BioAssayData::FeatureDimension]));

}
# testing superclass Bio::MAGE::Identifiable
result ($designelementdimension->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($designelementdimension->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($designelementdimension->isa(q[Bio::MAGE::Extendable]));

