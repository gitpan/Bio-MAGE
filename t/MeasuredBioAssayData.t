# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl MeasuredBioAssayData.t'

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

BEGIN { $| = 1; print "1..70\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::MeasuredBioAssayData;
use Bio::MAGE::BioAssayData::BioAssayDimension;
use Bio::MAGE::BioAssayData::DesignElementDimension;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssayData::QuantitationTypeDimension;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssayData::BioDataValues;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $measuredbioassaydata;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassaydata = Bio::MAGE::BioAssayData::MeasuredBioAssayData->new();
}
result($measuredbioassaydata->isa('Bio::MAGE::BioAssayData::MeasuredBioAssayData'));

# test the package class method
result($measuredbioassaydata->package() eq q[BioAssayData]);

# test the class_name class method
result($measuredbioassaydata->class_name() eq q[Bio::MAGE::BioAssayData::MeasuredBioAssayData]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassaydata = Bio::MAGE::BioAssayData::MeasuredBioAssayData->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($measuredbioassaydata->getIdentifier() == 1);
$measuredbioassaydata->setIdentifier(1);
result ($measuredbioassaydata->getIdentifier() == 1);

# testing attribute name
result ($measuredbioassaydata->getName() == 2);
$measuredbioassaydata->setName(2);
result ($measuredbioassaydata->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::MeasuredBioAssayData->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $measuredbioassaydata = Bio::MAGE::BioAssayData::MeasuredBioAssayData->new(bioAssayDimension => Bio::MAGE::BioAssayData::BioAssayDimension->new(),
designElementDimension => Bio::MAGE::BioAssayData::DesignElementDimension->new(),
quantitationTypeDimension => Bio::MAGE::BioAssayData::QuantitationTypeDimension->new(),
summaryStatistics => [Bio::MAGE::NameValueType->new()],
bioDataValues => Bio::MAGE::BioAssayData::BioDataValues->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association bioAssayDimension
my $bioassaydimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydimension_assn = Bio::MAGE::BioAssayData::BioAssayDimension->new();
}
result (UNIVERSAL::isa($measuredbioassaydata->getBioAssayDimension,q[Bio::MAGE::BioAssayData::BioAssayDimension]));
result ($measuredbioassaydata->setBioAssayDimension($bioassaydimension_assn) == $bioassaydimension_assn);
result ($measuredbioassaydata->getBioAssayDimension() == $bioassaydimension_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssayDimension};
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
# testing association designElementDimension
my $designelementdimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelementdimension_assn = Bio::MAGE::BioAssayData::DesignElementDimension->new();
}
result (UNIVERSAL::isa($measuredbioassaydata->getDesignElementDimension,q[Bio::MAGE::BioAssayData::DesignElementDimension]));
result ($measuredbioassaydata->setDesignElementDimension($designelementdimension_assn) == $designelementdimension_assn);
result ($measuredbioassaydata->getDesignElementDimension() == $designelementdimension_assn);



# test the meta-data for the assoication
($assn) = $assns{designElementDimension};
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
# testing association quantitationTypeDimension
my $quantitationtypedimension_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtypedimension_assn = Bio::MAGE::BioAssayData::QuantitationTypeDimension->new();
}
result (UNIVERSAL::isa($measuredbioassaydata->getQuantitationTypeDimension,q[Bio::MAGE::BioAssayData::QuantitationTypeDimension]));
result ($measuredbioassaydata->setQuantitationTypeDimension($quantitationtypedimension_assn) == $quantitationtypedimension_assn);
result ($measuredbioassaydata->getQuantitationTypeDimension() == $quantitationtypedimension_assn);



# test the meta-data for the assoication
($assn) = $assns{quantitationTypeDimension};
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
# testing association summaryStatistics
my $summarystatistics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $summarystatistics_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($measuredbioassaydata->getSummaryStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($measuredbioassaydata->setSummaryStatistics([$summarystatistics_assn]));
result (UNIVERSAL::isa($measuredbioassaydata->getSummaryStatistics,'ARRAY')
 and scalar @{$measuredbioassaydata->getSummaryStatistics()} == 1
 and $measuredbioassaydata->getSummaryStatistics->[0] == $summarystatistics_assn);
$measuredbioassaydata->addSummaryStatistics($summarystatistics_assn);
result (UNIVERSAL::isa($measuredbioassaydata->getSummaryStatistics,'ARRAY')
 and scalar @{$measuredbioassaydata->getSummaryStatistics()} == 2
 and $measuredbioassaydata->getSummaryStatistics->[0] == $summarystatistics_assn
 and $measuredbioassaydata->getSummaryStatistics->[1] == $summarystatistics_assn);


# test the meta-data for the assoication
($assn) = $assns{summaryStatistics};
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
# testing association bioDataValues
my $biodatavalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biodatavalues_assn = Bio::MAGE::BioAssayData::BioDataValues->new();
}
result (UNIVERSAL::isa($measuredbioassaydata->getBioDataValues,q[Bio::MAGE::BioAssayData::BioDataValues]));
result ($measuredbioassaydata->setBioDataValues($biodatavalues_assn) == $biodatavalues_assn);
result ($measuredbioassaydata->getBioDataValues() == $biodatavalues_assn);



# test the meta-data for the assoication
($assn) = $assns{bioDataValues};
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
result (UNIVERSAL::isa($measuredbioassaydata->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($measuredbioassaydata->setSecurity($security_assn) == $security_assn);
result ($measuredbioassaydata->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($measuredbioassaydata->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($measuredbioassaydata->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($measuredbioassaydata->getAuditTrail,'ARRAY')
 and scalar @{$measuredbioassaydata->getAuditTrail()} == 1
 and $measuredbioassaydata->getAuditTrail->[0] == $audittrail_assn);
$measuredbioassaydata->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($measuredbioassaydata->getAuditTrail,'ARRAY')
 and scalar @{$measuredbioassaydata->getAuditTrail()} == 2
 and $measuredbioassaydata->getAuditTrail->[0] == $audittrail_assn
 and $measuredbioassaydata->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($measuredbioassaydata->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($measuredbioassaydata->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($measuredbioassaydata->getDescriptions,'ARRAY')
 and scalar @{$measuredbioassaydata->getDescriptions()} == 1
 and $measuredbioassaydata->getDescriptions->[0] == $descriptions_assn);
$measuredbioassaydata->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($measuredbioassaydata->getDescriptions,'ARRAY')
 and scalar @{$measuredbioassaydata->getDescriptions()} == 2
 and $measuredbioassaydata->getDescriptions->[0] == $descriptions_assn
 and $measuredbioassaydata->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($measuredbioassaydata->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($measuredbioassaydata->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($measuredbioassaydata->getPropertySets,'ARRAY')
 and scalar @{$measuredbioassaydata->getPropertySets()} == 1
 and $measuredbioassaydata->getPropertySets->[0] == $propertysets_assn);
$measuredbioassaydata->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($measuredbioassaydata->getPropertySets,'ARRAY')
 and scalar @{$measuredbioassaydata->getPropertySets()} == 2
 and $measuredbioassaydata->getPropertySets->[0] == $propertysets_assn
 and $measuredbioassaydata->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::BioAssayData::BioAssayData
result ($measuredbioassaydata->isa(q[Bio::MAGE::BioAssayData::BioAssayData]));

# testing superclass Bio::MAGE::Identifiable
result ($measuredbioassaydata->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($measuredbioassaydata->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($measuredbioassaydata->isa(q[Bio::MAGE::Extendable]));

