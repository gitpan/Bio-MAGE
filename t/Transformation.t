# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Transformation.t'

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

BEGIN { $| = 1; print "1..77\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::Transformation;
use Bio::MAGE::BioAssayData::DerivedBioAssayData;
use Bio::MAGE::BioAssayData::BioAssayData;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::BioAssayData::DesignElementMapping;
use Bio::MAGE::BioAssayData::BioAssayMapping;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssayData::QuantitationTypeMapping;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $transformation;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $transformation = Bio::MAGE::BioAssayData::Transformation->new();
}
result($transformation->isa('Bio::MAGE::BioAssayData::Transformation'));

# test the package class method
result($transformation->package() eq q[BioAssayData]);

# test the class_name class method
result($transformation->class_name() eq q[Bio::MAGE::BioAssayData::Transformation]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $transformation = Bio::MAGE::BioAssayData::Transformation->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($transformation->getIdentifier() == 1);
$transformation->setIdentifier(1);
result ($transformation->getIdentifier() == 1);

# testing attribute name
result ($transformation->getName() == 2);
$transformation->setName(2);
result ($transformation->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::Transformation->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $transformation = Bio::MAGE::BioAssayData::Transformation->new(quantitationTypeMapping => Bio::MAGE::BioAssayData::QuantitationTypeMapping->new(),
designElementMapping => Bio::MAGE::BioAssayData::DesignElementMapping->new(),
derivedBioAssayDataTarget => Bio::MAGE::BioAssayData::DerivedBioAssayData->new(),
bioAssayDataSources => [Bio::MAGE::BioAssayData::BioAssayData->new()],
bioAssayMapping => Bio::MAGE::BioAssayData::BioAssayMapping->new(),
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association quantitationTypeMapping
my $quantitationtypemapping_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypemapping_assn = Bio::MAGE::BioAssayData::QuantitationTypeMapping->new();
}
result (UNIVERSAL::isa($transformation->getQuantitationTypeMapping,q[Bio::MAGE::BioAssayData::QuantitationTypeMapping]));
result ($transformation->setQuantitationTypeMapping($quantitationtypemapping_assn) == $quantitationtypemapping_assn);
result ($transformation->getQuantitationTypeMapping() == $quantitationtypemapping_assn);



# test the meta-data for the assoication
($assn) = $assns{quantitationTypeMapping};
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
# testing association designElementMapping
my $designelementmapping_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementmapping_assn = Bio::MAGE::BioAssayData::DesignElementMapping->new();
}
result (UNIVERSAL::isa($transformation->getDesignElementMapping,q[Bio::MAGE::BioAssayData::DesignElementMapping]));
result ($transformation->setDesignElementMapping($designelementmapping_assn) == $designelementmapping_assn);
result ($transformation->getDesignElementMapping() == $designelementmapping_assn);



# test the meta-data for the assoication
($assn) = $assns{designElementMapping};
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
# testing association derivedBioAssayDataTarget
my $derivedbioassaydatatarget_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $derivedbioassaydatatarget_assn = Bio::MAGE::BioAssayData::DerivedBioAssayData->new();
}
result (UNIVERSAL::isa($transformation->getDerivedBioAssayDataTarget,q[Bio::MAGE::BioAssayData::DerivedBioAssayData]));
result ($transformation->setDerivedBioAssayDataTarget($derivedbioassaydatatarget_assn) == $derivedbioassaydatatarget_assn);
result ($transformation->getDerivedBioAssayDataTarget() == $derivedbioassaydatatarget_assn);



# test the meta-data for the assoication
($assn) = $assns{derivedBioAssayDataTarget};
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
# testing association bioAssayDataSources
my $bioassaydatasources_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatasources_assn = Bio::MAGE::BioAssayData::BioAssayData->new();
}
result (UNIVERSAL::isa($transformation->getBioAssayDataSources->[0],q[Bio::MAGE::BioAssayData::BioAssayData]));
result ($transformation->setBioAssayDataSources([$bioassaydatasources_assn]));
result (UNIVERSAL::isa($transformation->getBioAssayDataSources,'ARRAY')
 and scalar @{$transformation->getBioAssayDataSources()} == 1
 and $transformation->getBioAssayDataSources->[0] == $bioassaydatasources_assn);
$transformation->addBioAssayDataSources($bioassaydatasources_assn);
result (UNIVERSAL::isa($transformation->getBioAssayDataSources,'ARRAY')
 and scalar @{$transformation->getBioAssayDataSources()} == 2
 and $transformation->getBioAssayDataSources->[0] == $bioassaydatasources_assn
 and $transformation->getBioAssayDataSources->[1] == $bioassaydatasources_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssayDataSources};
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
# testing association bioAssayMapping
my $bioassaymapping_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaymapping_assn = Bio::MAGE::BioAssayData::BioAssayMapping->new();
}
result (UNIVERSAL::isa($transformation->getBioAssayMapping,q[Bio::MAGE::BioAssayData::BioAssayMapping]));
result ($transformation->setBioAssayMapping($bioassaymapping_assn) == $bioassaymapping_assn);
result ($transformation->getBioAssayMapping() == $bioassaymapping_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssayMapping};
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
result (UNIVERSAL::isa($transformation->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($transformation->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($transformation->getProtocolApplications,'ARRAY')
 and scalar @{$transformation->getProtocolApplications()} == 1
 and $transformation->getProtocolApplications->[0] == $protocolapplications_assn);
$transformation->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($transformation->getProtocolApplications,'ARRAY')
 and scalar @{$transformation->getProtocolApplications()} == 2
 and $transformation->getProtocolApplications->[0] == $protocolapplications_assn
 and $transformation->getProtocolApplications->[1] == $protocolapplications_assn);


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
result (UNIVERSAL::isa($transformation->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($transformation->setSecurity($security_assn) == $security_assn);
result ($transformation->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($transformation->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($transformation->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($transformation->getAuditTrail,'ARRAY')
 and scalar @{$transformation->getAuditTrail()} == 1
 and $transformation->getAuditTrail->[0] == $audittrail_assn);
$transformation->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($transformation->getAuditTrail,'ARRAY')
 and scalar @{$transformation->getAuditTrail()} == 2
 and $transformation->getAuditTrail->[0] == $audittrail_assn
 and $transformation->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($transformation->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($transformation->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($transformation->getDescriptions,'ARRAY')
 and scalar @{$transformation->getDescriptions()} == 1
 and $transformation->getDescriptions->[0] == $descriptions_assn);
$transformation->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($transformation->getDescriptions,'ARRAY')
 and scalar @{$transformation->getDescriptions()} == 2
 and $transformation->getDescriptions->[0] == $descriptions_assn
 and $transformation->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($transformation->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($transformation->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($transformation->getPropertySets,'ARRAY')
 and scalar @{$transformation->getPropertySets()} == 1
 and $transformation->getPropertySets->[0] == $propertysets_assn);
$transformation->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($transformation->getPropertySets,'ARRAY')
 and scalar @{$transformation->getPropertySets()} == 2
 and $transformation->getPropertySets->[0] == $propertysets_assn
 and $transformation->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioEvent::BioEvent
result ($transformation->isa(q[Bio::MAGE::BioEvent::BioEvent]));

# testing superclass Bio::MAGE::Identifiable
result ($transformation->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($transformation->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($transformation->isa(q[Bio::MAGE::Extendable]));

