# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ReporterDimension.t'

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
use Bio::MAGE::BioAssayData::ReporterDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::DesignElement::Reporter;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $reporterdimension;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporterdimension = Bio::MAGE::BioAssayData::ReporterDimension->new();
}
result($reporterdimension->isa('Bio::MAGE::BioAssayData::ReporterDimension'));

# test the package class method
result($reporterdimension->package() eq q[BioAssayData]);

# test the class_name class method
result($reporterdimension->class_name() eq q[Bio::MAGE::BioAssayData::ReporterDimension]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporterdimension = Bio::MAGE::BioAssayData::ReporterDimension->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($reporterdimension->getIdentifier() == 1);
$reporterdimension->setIdentifier(1);
result ($reporterdimension->getIdentifier() == 1);

# testing attribute name
result ($reporterdimension->getName() == 2);
$reporterdimension->setName(2);
result ($reporterdimension->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::ReporterDimension->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporterdimension = Bio::MAGE::BioAssayData::ReporterDimension->new(reporters => [Bio::MAGE::DesignElement::Reporter->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association reporters
my $reporters_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporters_assn = Bio::MAGE::DesignElement::Reporter->new();
}
result (UNIVERSAL::isa($reporterdimension->getReporters->[0],q[Bio::MAGE::DesignElement::Reporter]));
result ($reporterdimension->setReporters([$reporters_assn]));
result (UNIVERSAL::isa($reporterdimension->getReporters,'ARRAY')
 and scalar @{$reporterdimension->getReporters()} == 1
 and $reporterdimension->getReporters->[0] == $reporters_assn);
$reporterdimension->addReporters($reporters_assn);
result (UNIVERSAL::isa($reporterdimension->getReporters,'ARRAY')
 and scalar @{$reporterdimension->getReporters()} == 2
 and $reporterdimension->getReporters->[0] == $reporters_assn
 and $reporterdimension->getReporters->[1] == $reporters_assn);


# test the meta-data for the assoication
($assn) = $assns{reporters};
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
result (UNIVERSAL::isa($reporterdimension->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($reporterdimension->setSecurity($security_assn) == $security_assn);
result ($reporterdimension->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($reporterdimension->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($reporterdimension->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($reporterdimension->getAuditTrail,'ARRAY')
 and scalar @{$reporterdimension->getAuditTrail()} == 1
 and $reporterdimension->getAuditTrail->[0] == $audittrail_assn);
$reporterdimension->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($reporterdimension->getAuditTrail,'ARRAY')
 and scalar @{$reporterdimension->getAuditTrail()} == 2
 and $reporterdimension->getAuditTrail->[0] == $audittrail_assn
 and $reporterdimension->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($reporterdimension->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($reporterdimension->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($reporterdimension->getDescriptions,'ARRAY')
 and scalar @{$reporterdimension->getDescriptions()} == 1
 and $reporterdimension->getDescriptions->[0] == $descriptions_assn);
$reporterdimension->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($reporterdimension->getDescriptions,'ARRAY')
 and scalar @{$reporterdimension->getDescriptions()} == 2
 and $reporterdimension->getDescriptions->[0] == $descriptions_assn
 and $reporterdimension->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($reporterdimension->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($reporterdimension->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($reporterdimension->getPropertySets,'ARRAY')
 and scalar @{$reporterdimension->getPropertySets()} == 1
 and $reporterdimension->getPropertySets->[0] == $propertysets_assn);
$reporterdimension->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($reporterdimension->getPropertySets,'ARRAY')
 and scalar @{$reporterdimension->getPropertySets()} == 2
 and $reporterdimension->getPropertySets->[0] == $propertysets_assn
 and $reporterdimension->getPropertySets->[1] == $propertysets_assn);


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
result ($reporterdimension->isa(q[Bio::MAGE::BioAssayData::DesignElementDimension]));

# testing superclass Bio::MAGE::Identifiable
result ($reporterdimension->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($reporterdimension->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($reporterdimension->isa(q[Bio::MAGE::Extendable]));

