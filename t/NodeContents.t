# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl NodeContents.t'

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
use Bio::MAGE::HigherLevelAnalysis::NodeContents;
use Bio::MAGE::BioAssayData::QuantitationTypeDimension;
use Bio::MAGE::BioAssayData::BioAssayDimension;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssayData::DesignElementDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $nodecontents;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodecontents = Bio::MAGE::HigherLevelAnalysis::NodeContents->new();
}
result($nodecontents->isa('Bio::MAGE::HigherLevelAnalysis::NodeContents'));

# test the package class method
result($nodecontents->package() eq q[HigherLevelAnalysis]);

# test the class_name class method
result($nodecontents->class_name() eq q[Bio::MAGE::HigherLevelAnalysis::NodeContents]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::HigherLevelAnalysis::NodeContents->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $nodecontents = Bio::MAGE::HigherLevelAnalysis::NodeContents->new(bioAssayDimension => Bio::MAGE::BioAssayData::BioAssayDimension->new(),
designElementDimension => Bio::MAGE::BioAssayData::DesignElementDimension->new(),
quantitationDimension => Bio::MAGE::BioAssayData::QuantitationTypeDimension->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association bioAssayDimension
my $bioassaydimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydimension_assn = Bio::MAGE::BioAssayData::BioAssayDimension->new();
}
result (UNIVERSAL::isa($nodecontents->getBioAssayDimension,q[Bio::MAGE::BioAssayData::BioAssayDimension]));
result ($nodecontents->setBioAssayDimension($bioassaydimension_assn) == $bioassaydimension_assn);
result ($nodecontents->getBioAssayDimension() == $bioassaydimension_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssayDimension};
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
# testing association designElementDimension
my $designelementdimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementdimension_assn = Bio::MAGE::BioAssayData::DesignElementDimension->new();
}
result (UNIVERSAL::isa($nodecontents->getDesignElementDimension,q[Bio::MAGE::BioAssayData::DesignElementDimension]));
result ($nodecontents->setDesignElementDimension($designelementdimension_assn) == $designelementdimension_assn);
result ($nodecontents->getDesignElementDimension() == $designelementdimension_assn);



# test the meta-data for the assoication
($assn) = $assns{designElementDimension};
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
# testing association quantitationDimension
my $quantitationdimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationdimension_assn = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new();
}
result (UNIVERSAL::isa($nodecontents->getQuantitationDimension,q[Bio::MAGE::BioAssayData::QuantitationTypeDimension]));
result ($nodecontents->setQuantitationDimension($quantitationdimension_assn) == $quantitationdimension_assn);
result ($nodecontents->getQuantitationDimension() == $quantitationdimension_assn);



# test the meta-data for the assoication
($assn) = $assns{quantitationDimension};
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
result (UNIVERSAL::isa($nodecontents->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($nodecontents->setSecurity($security_assn) == $security_assn);
result ($nodecontents->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($nodecontents->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($nodecontents->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($nodecontents->getAuditTrail,'ARRAY')
 and scalar @{$nodecontents->getAuditTrail()} == 1
 and $nodecontents->getAuditTrail->[0] == $audittrail_assn);
$nodecontents->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($nodecontents->getAuditTrail,'ARRAY')
 and scalar @{$nodecontents->getAuditTrail()} == 2
 and $nodecontents->getAuditTrail->[0] == $audittrail_assn
 and $nodecontents->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($nodecontents->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($nodecontents->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($nodecontents->getDescriptions,'ARRAY')
 and scalar @{$nodecontents->getDescriptions()} == 1
 and $nodecontents->getDescriptions->[0] == $descriptions_assn);
$nodecontents->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($nodecontents->getDescriptions,'ARRAY')
 and scalar @{$nodecontents->getDescriptions()} == 2
 and $nodecontents->getDescriptions->[0] == $descriptions_assn
 and $nodecontents->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($nodecontents->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($nodecontents->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($nodecontents->getPropertySets,'ARRAY')
 and scalar @{$nodecontents->getPropertySets()} == 1
 and $nodecontents->getPropertySets->[0] == $propertysets_assn);
$nodecontents->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($nodecontents->getPropertySets,'ARRAY')
 and scalar @{$nodecontents->getPropertySets()} == 2
 and $nodecontents->getPropertySets->[0] == $propertysets_assn
 and $nodecontents->getPropertySets->[1] == $propertysets_assn);


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
result ($nodecontents->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($nodecontents->isa(q[Bio::MAGE::Extendable]));

