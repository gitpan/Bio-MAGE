# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Fiducial.t'

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
use Bio::MAGE::Array::Fiducial;
use Bio::MAGE::Measurement::DistanceUnit;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::DesignElement::Position;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $fiducial;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $fiducial = Bio::MAGE::Array::Fiducial->new();
}
result($fiducial->isa('Bio::MAGE::Array::Fiducial'));

# test the package class method
result($fiducial->package() eq q[Array]);

# test the class_name class method
result($fiducial->class_name() eq q[Bio::MAGE::Array::Fiducial]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::Fiducial->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $fiducial = Bio::MAGE::Array::Fiducial->new(distanceUnit => Bio::MAGE::Measurement::DistanceUnit->new(),
position => Bio::MAGE::DesignElement::Position->new(),
fiducialType => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association distanceUnit
my $distanceunit_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $distanceunit_assn = Bio::MAGE::Measurement::DistanceUnit->new();
}
result (UNIVERSAL::isa($fiducial->getDistanceUnit,q[Bio::MAGE::Measurement::DistanceUnit]));
result ($fiducial->setDistanceUnit($distanceunit_assn) == $distanceunit_assn);
result ($fiducial->getDistanceUnit() == $distanceunit_assn);



# test the meta-data for the assoication
($assn) = $assns{distanceUnit};
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
# testing association position
my $position_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $position_assn = Bio::MAGE::DesignElement::Position->new();
}
result (UNIVERSAL::isa($fiducial->getPosition,q[Bio::MAGE::DesignElement::Position]));
result ($fiducial->setPosition($position_assn) == $position_assn);
result ($fiducial->getPosition() == $position_assn);



# test the meta-data for the assoication
($assn) = $assns{position};
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
# testing association fiducialType
my $fiducialtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $fiducialtype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($fiducial->getFiducialType,q[Bio::MAGE::Description::OntologyEntry]));
result ($fiducial->setFiducialType($fiducialtype_assn) == $fiducialtype_assn);
result ($fiducial->getFiducialType() == $fiducialtype_assn);



# test the meta-data for the assoication
($assn) = $assns{fiducialType};
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
result (UNIVERSAL::isa($fiducial->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($fiducial->setSecurity($security_assn) == $security_assn);
result ($fiducial->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($fiducial->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($fiducial->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($fiducial->getAuditTrail,'ARRAY')
 and scalar @{$fiducial->getAuditTrail()} == 1
 and $fiducial->getAuditTrail->[0] == $audittrail_assn);
$fiducial->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($fiducial->getAuditTrail,'ARRAY')
 and scalar @{$fiducial->getAuditTrail()} == 2
 and $fiducial->getAuditTrail->[0] == $audittrail_assn
 and $fiducial->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($fiducial->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($fiducial->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($fiducial->getDescriptions,'ARRAY')
 and scalar @{$fiducial->getDescriptions()} == 1
 and $fiducial->getDescriptions->[0] == $descriptions_assn);
$fiducial->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($fiducial->getDescriptions,'ARRAY')
 and scalar @{$fiducial->getDescriptions()} == 2
 and $fiducial->getDescriptions->[0] == $descriptions_assn
 and $fiducial->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($fiducial->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($fiducial->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($fiducial->getPropertySets,'ARRAY')
 and scalar @{$fiducial->getPropertySets()} == 1
 and $fiducial->getPropertySets->[0] == $propertysets_assn);
$fiducial->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($fiducial->getPropertySets,'ARRAY')
 and scalar @{$fiducial->getPropertySets()} == 2
 and $fiducial->getPropertySets->[0] == $propertysets_assn
 and $fiducial->getPropertySets->[1] == $propertysets_assn);


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
result ($fiducial->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($fiducial->isa(q[Bio::MAGE::Extendable]));

