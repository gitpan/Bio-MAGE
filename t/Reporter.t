# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Reporter.t'

# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2002 by:
#    * The MicroArray Gene Expression Database Society (MGED)
#    * Rosetta Inpharmatics
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..72\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::Reporter;
use Bio::MAGE::BioSequence::BioSequence;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::DesignElement::FeatureReporterMap;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $reporter;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporter = Bio::MAGE::DesignElement::Reporter->new();
}
result($reporter->isa('Bio::MAGE::DesignElement::Reporter'));

# test the package class method
result($reporter->package() eq q[DesignElement]);

# test the class_name class method
result($reporter->class_name() eq q[Bio::MAGE::DesignElement::Reporter]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporter = Bio::MAGE::DesignElement::Reporter->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($reporter->getIdentifier() == 1);
$reporter->setIdentifier(1);
result ($reporter->getIdentifier() == 1);

# testing attribute name
result ($reporter->getName() == 2);
$reporter->setName(2);
result ($reporter->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::Reporter->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporter = Bio::MAGE::DesignElement::Reporter->new(warningType => Bio::MAGE::Description::OntologyEntry->new(),
failTypes => [Bio::MAGE::Description::OntologyEntry->new()],
immobilizedCharacteristics => [Bio::MAGE::BioSequence::BioSequence->new()],
featureReporterMaps => [Bio::MAGE::DesignElement::FeatureReporterMap->new()],
controlType => Bio::MAGE::Description::OntologyEntry->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association warningType
my $warningtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $warningtype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($reporter->getWarningType,q[Bio::MAGE::Description::OntologyEntry]));
result ($reporter->setWarningType($warningtype_assn) == $warningtype_assn);
result ($reporter->getWarningType() == $warningtype_assn);



# test the meta-data for the assoication
($assn) = $assns{warningType};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association failTypes
my $failtypes_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $failtypes_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($reporter->getFailTypes->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($reporter->setFailTypes([$failtypes_assn]));
result (UNIVERSAL::isa($reporter->getFailTypes,'ARRAY')
 and scalar @{$reporter->getFailTypes()} == 1
 and $reporter->getFailTypes->[0] == $failtypes_assn);
$reporter->addFailTypes($failtypes_assn);
result (UNIVERSAL::isa($reporter->getFailTypes,'ARRAY')
 and scalar @{$reporter->getFailTypes()} == 2
 and $reporter->getFailTypes->[0] == $failtypes_assn
 and $reporter->getFailTypes->[1] == $failtypes_assn);


# test the meta-data for the assoication
($assn) = $assns{failTypes};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association immobilizedCharacteristics
my $immobilizedcharacteristics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $immobilizedcharacteristics_assn = Bio::MAGE::BioSequence::BioSequence->new();
}
result (UNIVERSAL::isa($reporter->getImmobilizedCharacteristics->[0],q[Bio::MAGE::BioSequence::BioSequence]));
result ($reporter->setImmobilizedCharacteristics([$immobilizedcharacteristics_assn]));
result (UNIVERSAL::isa($reporter->getImmobilizedCharacteristics,'ARRAY')
 and scalar @{$reporter->getImmobilizedCharacteristics()} == 1
 and $reporter->getImmobilizedCharacteristics->[0] == $immobilizedcharacteristics_assn);
$reporter->addImmobilizedCharacteristics($immobilizedcharacteristics_assn);
result (UNIVERSAL::isa($reporter->getImmobilizedCharacteristics,'ARRAY')
 and scalar @{$reporter->getImmobilizedCharacteristics()} == 2
 and $reporter->getImmobilizedCharacteristics->[0] == $immobilizedcharacteristics_assn
 and $reporter->getImmobilizedCharacteristics->[1] == $immobilizedcharacteristics_assn);


# test the meta-data for the assoication
($assn) = $assns{immobilizedCharacteristics};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association featureReporterMaps
my $featurereportermaps_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurereportermaps_assn = Bio::MAGE::DesignElement::FeatureReporterMap->new();
}
result (UNIVERSAL::isa($reporter->getFeatureReporterMaps->[0],q[Bio::MAGE::DesignElement::FeatureReporterMap]));
result ($reporter->setFeatureReporterMaps([$featurereportermaps_assn]));
result (UNIVERSAL::isa($reporter->getFeatureReporterMaps,'ARRAY')
 and scalar @{$reporter->getFeatureReporterMaps()} == 1
 and $reporter->getFeatureReporterMaps->[0] == $featurereportermaps_assn);
$reporter->addFeatureReporterMaps($featurereportermaps_assn);
result (UNIVERSAL::isa($reporter->getFeatureReporterMaps,'ARRAY')
 and scalar @{$reporter->getFeatureReporterMaps()} == 2
 and $reporter->getFeatureReporterMaps->[0] == $featurereportermaps_assn
 and $reporter->getFeatureReporterMaps->[1] == $featurereportermaps_assn);


# test the meta-data for the assoication
($assn) = $assns{featureReporterMaps};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association controlType
my $controltype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $controltype_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($reporter->getControlType,q[Bio::MAGE::Description::OntologyEntry]));
result ($reporter->setControlType($controltype_assn) == $controltype_assn);
result ($reporter->getControlType() == $controltype_assn);



# test the meta-data for the assoication
($assn) = $assns{controlType};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($reporter->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($reporter->setSecurity($security_assn) == $security_assn);
result ($reporter->getSecurity() == $security_assn);



# test the meta-data for the assoication
($assn) = $assns{security};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association auditTrail
my $audittrail_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audittrail_assn = Bio::MAGE::AuditAndSecurity::Audit->new();
}
result (UNIVERSAL::isa($reporter->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($reporter->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($reporter->getAuditTrail,'ARRAY')
 and scalar @{$reporter->getAuditTrail()} == 1
 and $reporter->getAuditTrail->[0] == $audittrail_assn);
$reporter->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($reporter->getAuditTrail,'ARRAY')
 and scalar @{$reporter->getAuditTrail()} == 2
 and $reporter->getAuditTrail->[0] == $audittrail_assn
 and $reporter->getAuditTrail->[1] == $audittrail_assn);


# test the meta-data for the assoication
($assn) = $assns{auditTrail};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association descriptions
my $descriptions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $descriptions_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($reporter->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($reporter->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($reporter->getDescriptions,'ARRAY')
 and scalar @{$reporter->getDescriptions()} == 1
 and $reporter->getDescriptions->[0] == $descriptions_assn);
$reporter->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($reporter->getDescriptions,'ARRAY')
 and scalar @{$reporter->getDescriptions()} == 2
 and $reporter->getDescriptions->[0] == $descriptions_assn
 and $reporter->getDescriptions->[1] == $descriptions_assn);


# test the meta-data for the assoication
($assn) = $assns{descriptions};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($reporter->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($reporter->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($reporter->getPropertySets,'ARRAY')
 and scalar @{$reporter->getPropertySets()} == 1
 and $reporter->getPropertySets->[0] == $propertysets_assn);
$reporter->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($reporter->getPropertySets,'ARRAY')
 and scalar @{$reporter->getPropertySets()} == 2
 and $reporter->getPropertySets->[0] == $propertysets_assn
 and $reporter->getPropertySets->[1] == $propertysets_assn);


# test the meta-data for the assoication
($assn) = $assns{propertySets};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association'));
$end = $assn->other();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->rank(),
       and $end->rank(),
       and defined $end->ordered(),
       and ($end->ordered() == 0 or $end->ordered() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
       and defined $end->name(),
       and $end->name(),
      );

$end = $assn->self();
result(defined $end
       and is_object($end)
       and $end->isa('Bio::MAGE::Association::End')
       and defined $end->documentation(),
       and defined $end->cardinality(),
       and grep {$_ eq $end->cardinality} ('0..1','1','1..N','0..N'),
       and defined $end->is_ref(),
       and ($end->is_ref() == 0 or $end->is_ref() == 1),
       and defined $end->class_name(),
       and $end->class_name(),
      );
# testing superclass Bio::MAGE::DesignElement::DesignElement
result ($reporter->isa(q[Bio::MAGE::DesignElement::DesignElement]));

# testing superclass Bio::MAGE::Identifiable
result ($reporter->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($reporter->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($reporter->isa(q[Bio::MAGE::Extendable]));

