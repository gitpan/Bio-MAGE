# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ReporterCompositeMap.t'

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
use Bio::MAGE::DesignElement::ReporterCompositeMap;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::DesignElement::ReporterPosition;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $reportercompositemap;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportercompositemap = Bio::MAGE::DesignElement::ReporterCompositeMap->new();
}
result($reportercompositemap->isa('Bio::MAGE::DesignElement::ReporterCompositeMap'));

# test the package class method
result($reportercompositemap->package() eq q[DesignElement]);

# test the class_name class method
result($reportercompositemap->class_name() eq q[Bio::MAGE::DesignElement::ReporterCompositeMap]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportercompositemap = Bio::MAGE::DesignElement::ReporterCompositeMap->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($reportercompositemap->getIdentifier() == 1);
$reportercompositemap->setIdentifier(1);
result ($reportercompositemap->getIdentifier() == 1);

# testing attribute name
result ($reportercompositemap->getName() == 2);
$reportercompositemap->setName(2);
result ($reportercompositemap->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::DesignElement::ReporterCompositeMap->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reportercompositemap = Bio::MAGE::DesignElement::ReporterCompositeMap->new(reporterPositionSources => [Bio::MAGE::DesignElement::ReporterPosition->new()],
compositeSequence => Bio::MAGE::DesignElement::CompositeSequence->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association reporterPositionSources
my $reporterpositionsources_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $reporterpositionsources_assn = Bio::MAGE::DesignElement::ReporterPosition->new();
}
result (UNIVERSAL::isa($reportercompositemap->getReporterPositionSources->[0],q[Bio::MAGE::DesignElement::ReporterPosition]));
result ($reportercompositemap->setReporterPositionSources([$reporterpositionsources_assn]));
result (UNIVERSAL::isa($reportercompositemap->getReporterPositionSources,'ARRAY')
 and scalar @{$reportercompositemap->getReporterPositionSources()} == 1
 and $reportercompositemap->getReporterPositionSources->[0] == $reporterpositionsources_assn);
$reportercompositemap->addReporterPositionSources($reporterpositionsources_assn);
result (UNIVERSAL::isa($reportercompositemap->getReporterPositionSources,'ARRAY')
 and scalar @{$reportercompositemap->getReporterPositionSources()} == 2
 and $reportercompositemap->getReporterPositionSources->[0] == $reporterpositionsources_assn
 and $reportercompositemap->getReporterPositionSources->[1] == $reporterpositionsources_assn);


# test the meta-data for the assoication
($assn) = $assns{reporterPositionSources};
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
# testing association compositeSequence
my $compositesequence_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $compositesequence_assn = Bio::MAGE::DesignElement::CompositeSequence->new();
}
result (UNIVERSAL::isa($reportercompositemap->getCompositeSequence,q[Bio::MAGE::DesignElement::CompositeSequence]));
result ($reportercompositemap->setCompositeSequence($compositesequence_assn) == $compositesequence_assn);
result ($reportercompositemap->getCompositeSequence() == $compositesequence_assn);



# test the meta-data for the assoication
($assn) = $assns{compositeSequence};
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
result (UNIVERSAL::isa($reportercompositemap->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($reportercompositemap->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($reportercompositemap->getProtocolApplications,'ARRAY')
 and scalar @{$reportercompositemap->getProtocolApplications()} == 1
 and $reportercompositemap->getProtocolApplications->[0] == $protocolapplications_assn);
$reportercompositemap->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($reportercompositemap->getProtocolApplications,'ARRAY')
 and scalar @{$reportercompositemap->getProtocolApplications()} == 2
 and $reportercompositemap->getProtocolApplications->[0] == $protocolapplications_assn
 and $reportercompositemap->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($reportercompositemap->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($reportercompositemap->setSecurity($security_assn) == $security_assn);
result ($reportercompositemap->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($reportercompositemap->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($reportercompositemap->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($reportercompositemap->getAuditTrail,'ARRAY')
 and scalar @{$reportercompositemap->getAuditTrail()} == 1
 and $reportercompositemap->getAuditTrail->[0] == $audittrail_assn);
$reportercompositemap->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($reportercompositemap->getAuditTrail,'ARRAY')
 and scalar @{$reportercompositemap->getAuditTrail()} == 2
 and $reportercompositemap->getAuditTrail->[0] == $audittrail_assn
 and $reportercompositemap->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($reportercompositemap->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($reportercompositemap->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($reportercompositemap->getDescriptions,'ARRAY')
 and scalar @{$reportercompositemap->getDescriptions()} == 1
 and $reportercompositemap->getDescriptions->[0] == $descriptions_assn);
$reportercompositemap->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($reportercompositemap->getDescriptions,'ARRAY')
 and scalar @{$reportercompositemap->getDescriptions()} == 2
 and $reportercompositemap->getDescriptions->[0] == $descriptions_assn
 and $reportercompositemap->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($reportercompositemap->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($reportercompositemap->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($reportercompositemap->getPropertySets,'ARRAY')
 and scalar @{$reportercompositemap->getPropertySets()} == 1
 and $reportercompositemap->getPropertySets->[0] == $propertysets_assn);
$reportercompositemap->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($reportercompositemap->getPropertySets,'ARRAY')
 and scalar @{$reportercompositemap->getPropertySets()} == 2
 and $reportercompositemap->getPropertySets->[0] == $propertysets_assn
 and $reportercompositemap->getPropertySets->[1] == $propertysets_assn);


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
result ($reportercompositemap->isa(q[Bio::MAGE::BioAssayData::DesignElementMap]));

# testing superclass Bio::MAGE::BioEvent::Map
result ($reportercompositemap->isa(q[Bio::MAGE::BioEvent::Map]));

# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($reportercompositemap->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($reportercompositemap->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($reportercompositemap->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($reportercompositemap->isa(q[Bio::MAGE::Extendable]));

