# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl FeatureReporterMap.t'

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

BEGIN { $| = 1; print "1..61\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::FeatureReporterMap;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::DesignElement::Reporter;
use Bio::MAGE::DesignElement::FeatureInformation;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $featurereportermap;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurereportermap = Bio::MAGE::DesignElement::FeatureReporterMap->new();
}
result($featurereportermap->isa('Bio::MAGE::DesignElement::FeatureReporterMap'));

# test the package class method
result($featurereportermap->package() eq q[DesignElement]);

# test the class_name class method
result($featurereportermap->class_name() eq q[Bio::MAGE::DesignElement::FeatureReporterMap]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurereportermap = Bio::MAGE::DesignElement::FeatureReporterMap->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($featurereportermap->getIdentifier() == 1);
$featurereportermap->setIdentifier(1);
result ($featurereportermap->getIdentifier() == 1);

# testing attribute name
result ($featurereportermap->getName() == 2);
$featurereportermap->setName(2);
result ($featurereportermap->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::FeatureReporterMap->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurereportermap = Bio::MAGE::DesignElement::FeatureReporterMap->new(featureInformationSources => [Bio::MAGE::DesignElement::FeatureInformation->new()],
reporter => Bio::MAGE::DesignElement::Reporter->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association featureInformationSources
my $featureinformationsources_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featureinformationsources_assn = Bio::MAGE::DesignElement::FeatureInformation->new();
}
result (UNIVERSAL::isa($featurereportermap->getFeatureInformationSources->[0],q[Bio::MAGE::DesignElement::FeatureInformation]));
result ($featurereportermap->setFeatureInformationSources([$featureinformationsources_assn]));
result (UNIVERSAL::isa($featurereportermap->getFeatureInformationSources,'ARRAY')
 and scalar @{$featurereportermap->getFeatureInformationSources()} == 1
 and $featurereportermap->getFeatureInformationSources->[0] == $featureinformationsources_assn);
$featurereportermap->addFeatureInformationSources($featureinformationsources_assn);
result (UNIVERSAL::isa($featurereportermap->getFeatureInformationSources,'ARRAY')
 and scalar @{$featurereportermap->getFeatureInformationSources()} == 2
 and $featurereportermap->getFeatureInformationSources->[0] == $featureinformationsources_assn
 and $featurereportermap->getFeatureInformationSources->[1] == $featureinformationsources_assn);


# test the meta-data for the assoication
($assn) = $assns{featureInformationSources};
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
# testing association reporter
my $reporter_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporter_assn = Bio::MAGE::DesignElement::Reporter->new();
}
result (UNIVERSAL::isa($featurereportermap->getReporter,q[Bio::MAGE::DesignElement::Reporter]));
result ($featurereportermap->setReporter($reporter_assn) == $reporter_assn);
result ($featurereportermap->getReporter() == $reporter_assn);



# test the meta-data for the assoication
($assn) = $assns{reporter};
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
# testing association protocolApplications
my $protocolapplications_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $protocolapplications_assn = Bio::MAGE::Protocol::ProtocolApplication->new();
}
result (UNIVERSAL::isa($featurereportermap->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($featurereportermap->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($featurereportermap->getProtocolApplications,'ARRAY')
 and scalar @{$featurereportermap->getProtocolApplications()} == 1
 and $featurereportermap->getProtocolApplications->[0] == $protocolapplications_assn);
$featurereportermap->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($featurereportermap->getProtocolApplications,'ARRAY')
 and scalar @{$featurereportermap->getProtocolApplications()} == 2
 and $featurereportermap->getProtocolApplications->[0] == $protocolapplications_assn
 and $featurereportermap->getProtocolApplications->[1] == $protocolapplications_assn);


# test the meta-data for the assoication
($assn) = $assns{protocolApplications};
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
result (UNIVERSAL::isa($featurereportermap->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($featurereportermap->setSecurity($security_assn) == $security_assn);
result ($featurereportermap->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($featurereportermap->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($featurereportermap->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($featurereportermap->getAuditTrail,'ARRAY')
 and scalar @{$featurereportermap->getAuditTrail()} == 1
 and $featurereportermap->getAuditTrail->[0] == $audittrail_assn);
$featurereportermap->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($featurereportermap->getAuditTrail,'ARRAY')
 and scalar @{$featurereportermap->getAuditTrail()} == 2
 and $featurereportermap->getAuditTrail->[0] == $audittrail_assn
 and $featurereportermap->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($featurereportermap->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($featurereportermap->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($featurereportermap->getDescriptions,'ARRAY')
 and scalar @{$featurereportermap->getDescriptions()} == 1
 and $featurereportermap->getDescriptions->[0] == $descriptions_assn);
$featurereportermap->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($featurereportermap->getDescriptions,'ARRAY')
 and scalar @{$featurereportermap->getDescriptions()} == 2
 and $featurereportermap->getDescriptions->[0] == $descriptions_assn
 and $featurereportermap->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($featurereportermap->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($featurereportermap->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($featurereportermap->getPropertySets,'ARRAY')
 and scalar @{$featurereportermap->getPropertySets()} == 1
 and $featurereportermap->getPropertySets->[0] == $propertysets_assn);
$featurereportermap->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($featurereportermap->getPropertySets,'ARRAY')
 and scalar @{$featurereportermap->getPropertySets()} == 2
 and $featurereportermap->getPropertySets->[0] == $propertysets_assn
 and $featurereportermap->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssayData::DesignElementMap
result ($featurereportermap->isa(q[Bio::MAGE::BioAssayData::DesignElementMap]));

# testing superclass Bio::MAGE::BioEvent::Map
result ($featurereportermap->isa(q[Bio::MAGE::BioEvent::Map]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($featurereportermap->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($featurereportermap->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($featurereportermap->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($featurereportermap->isa(q[Bio::MAGE::Extendable]));

