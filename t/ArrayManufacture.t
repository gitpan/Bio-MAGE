# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ArrayManufacture.t'

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
use Bio::MAGE::Array::ArrayManufacture;
use Bio::MAGE::Array::Array;
use Bio::MAGE::Protocol::ProtocolApplication;
use Bio::MAGE::NameValueType;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::AuditAndSecurity::Contact;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Array::ManufactureLIMS;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $arraymanufacture;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraymanufacture = Bio::MAGE::Array::ArrayManufacture->new();
}
result($arraymanufacture->isa('Bio::MAGE::Array::ArrayManufacture'));

# test the package class method
result($arraymanufacture->package() eq q[Array]);

# test the class_name class method
result($arraymanufacture->class_name() eq q[Bio::MAGE::Array::ArrayManufacture]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraymanufacture = Bio::MAGE::Array::ArrayManufacture->new(tolerance => 1,
manufacturingDate => 2,
identifier => 3,
name => 4);
}
# testing attribute tolerance
result ($arraymanufacture->getTolerance() == 1);
$arraymanufacture->setTolerance(1);
result ($arraymanufacture->getTolerance() == 1);

# testing attribute manufacturingDate
result ($arraymanufacture->getManufacturingDate() == 2);
$arraymanufacture->setManufacturingDate(2);
result ($arraymanufacture->getManufacturingDate() == 2);

# testing attribute identifier
result ($arraymanufacture->getIdentifier() == 3);
$arraymanufacture->setIdentifier(3);
result ($arraymanufacture->getIdentifier() == 3);

# testing attribute name
result ($arraymanufacture->getName() == 4);
$arraymanufacture->setName(4);
result ($arraymanufacture->getName() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::ArrayManufacture->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraymanufacture = Bio::MAGE::Array::ArrayManufacture->new(arrayManufacturers => [Bio::MAGE::AuditAndSecurity::Contact->new()],
protocolApplications => [Bio::MAGE::Protocol::ProtocolApplication->new()],
featureLIMSs => [Bio::MAGE::Array::ManufactureLIMS->new()],
arrays => [Bio::MAGE::Array::Array->new()],
qualityControlStatistics => [Bio::MAGE::NameValueType->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association arrayManufacturers
my $arraymanufacturers_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arraymanufacturers_assn = Bio::MAGE::AuditAndSecurity::Contact->new();
}
result (UNIVERSAL::isa($arraymanufacture->getArrayManufacturers->[0],q[Bio::MAGE::AuditAndSecurity::Contact]));
result ($arraymanufacture->setArrayManufacturers([$arraymanufacturers_assn]));
result (UNIVERSAL::isa($arraymanufacture->getArrayManufacturers,'ARRAY')
 and scalar @{$arraymanufacture->getArrayManufacturers()} == 1
 and $arraymanufacture->getArrayManufacturers->[0] == $arraymanufacturers_assn);
$arraymanufacture->addArrayManufacturers($arraymanufacturers_assn);
result (UNIVERSAL::isa($arraymanufacture->getArrayManufacturers,'ARRAY')
 and scalar @{$arraymanufacture->getArrayManufacturers()} == 2
 and $arraymanufacture->getArrayManufacturers->[0] == $arraymanufacturers_assn
 and $arraymanufacture->getArrayManufacturers->[1] == $arraymanufacturers_assn);


# test the meta-data for the assoication
($assn) = $assns{arrayManufacturers};
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
result (UNIVERSAL::isa($arraymanufacture->getProtocolApplications->[0],q[Bio::MAGE::Protocol::ProtocolApplication]));
result ($arraymanufacture->setProtocolApplications([$protocolapplications_assn]));
result (UNIVERSAL::isa($arraymanufacture->getProtocolApplications,'ARRAY')
 and scalar @{$arraymanufacture->getProtocolApplications()} == 1
 and $arraymanufacture->getProtocolApplications->[0] == $protocolapplications_assn);
$arraymanufacture->addProtocolApplications($protocolapplications_assn);
result (UNIVERSAL::isa($arraymanufacture->getProtocolApplications,'ARRAY')
 and scalar @{$arraymanufacture->getProtocolApplications()} == 2
 and $arraymanufacture->getProtocolApplications->[0] == $protocolapplications_assn
 and $arraymanufacture->getProtocolApplications->[1] == $protocolapplications_assn);


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
# testing association featureLIMSs
my $featurelimss_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $featurelimss_assn = Bio::MAGE::Array::ManufactureLIMS->new();
}
result (UNIVERSAL::isa($arraymanufacture->getFeatureLIMSs->[0],q[Bio::MAGE::Array::ManufactureLIMS]));
result ($arraymanufacture->setFeatureLIMSs([$featurelimss_assn]));
result (UNIVERSAL::isa($arraymanufacture->getFeatureLIMSs,'ARRAY')
 and scalar @{$arraymanufacture->getFeatureLIMSs()} == 1
 and $arraymanufacture->getFeatureLIMSs->[0] == $featurelimss_assn);
$arraymanufacture->addFeatureLIMSs($featurelimss_assn);
result (UNIVERSAL::isa($arraymanufacture->getFeatureLIMSs,'ARRAY')
 and scalar @{$arraymanufacture->getFeatureLIMSs()} == 2
 and $arraymanufacture->getFeatureLIMSs->[0] == $featurelimss_assn
 and $arraymanufacture->getFeatureLIMSs->[1] == $featurelimss_assn);


# test the meta-data for the assoication
($assn) = $assns{featureLIMSs};
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
# testing association arrays
my $arrays_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $arrays_assn = Bio::MAGE::Array::Array->new();
}
result (UNIVERSAL::isa($arraymanufacture->getArrays->[0],q[Bio::MAGE::Array::Array]));
result ($arraymanufacture->setArrays([$arrays_assn]));
result (UNIVERSAL::isa($arraymanufacture->getArrays,'ARRAY')
 and scalar @{$arraymanufacture->getArrays()} == 1
 and $arraymanufacture->getArrays->[0] == $arrays_assn);
$arraymanufacture->addArrays($arrays_assn);
result (UNIVERSAL::isa($arraymanufacture->getArrays,'ARRAY')
 and scalar @{$arraymanufacture->getArrays()} == 2
 and $arraymanufacture->getArrays->[0] == $arrays_assn
 and $arraymanufacture->getArrays->[1] == $arrays_assn);


# test the meta-data for the assoication
($assn) = $assns{arrays};
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
# testing association qualityControlStatistics
my $qualitycontrolstatistics_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $qualitycontrolstatistics_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($arraymanufacture->getQualityControlStatistics->[0],q[Bio::MAGE::NameValueType]));
result ($arraymanufacture->setQualityControlStatistics([$qualitycontrolstatistics_assn]));
result (UNIVERSAL::isa($arraymanufacture->getQualityControlStatistics,'ARRAY')
 and scalar @{$arraymanufacture->getQualityControlStatistics()} == 1
 and $arraymanufacture->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn);
$arraymanufacture->addQualityControlStatistics($qualitycontrolstatistics_assn);
result (UNIVERSAL::isa($arraymanufacture->getQualityControlStatistics,'ARRAY')
 and scalar @{$arraymanufacture->getQualityControlStatistics()} == 2
 and $arraymanufacture->getQualityControlStatistics->[0] == $qualitycontrolstatistics_assn
 and $arraymanufacture->getQualityControlStatistics->[1] == $qualitycontrolstatistics_assn);


# test the meta-data for the assoication
($assn) = $assns{qualityControlStatistics};
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
result (UNIVERSAL::isa($arraymanufacture->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($arraymanufacture->setSecurity($security_assn) == $security_assn);
result ($arraymanufacture->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($arraymanufacture->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($arraymanufacture->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($arraymanufacture->getAuditTrail,'ARRAY')
 and scalar @{$arraymanufacture->getAuditTrail()} == 1
 and $arraymanufacture->getAuditTrail->[0] == $audittrail_assn);
$arraymanufacture->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($arraymanufacture->getAuditTrail,'ARRAY')
 and scalar @{$arraymanufacture->getAuditTrail()} == 2
 and $arraymanufacture->getAuditTrail->[0] == $audittrail_assn
 and $arraymanufacture->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($arraymanufacture->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($arraymanufacture->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($arraymanufacture->getDescriptions,'ARRAY')
 and scalar @{$arraymanufacture->getDescriptions()} == 1
 and $arraymanufacture->getDescriptions->[0] == $descriptions_assn);
$arraymanufacture->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($arraymanufacture->getDescriptions,'ARRAY')
 and scalar @{$arraymanufacture->getDescriptions()} == 2
 and $arraymanufacture->getDescriptions->[0] == $descriptions_assn
 and $arraymanufacture->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($arraymanufacture->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($arraymanufacture->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($arraymanufacture->getPropertySets,'ARRAY')
 and scalar @{$arraymanufacture->getPropertySets()} == 1
 and $arraymanufacture->getPropertySets->[0] == $propertysets_assn);
$arraymanufacture->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($arraymanufacture->getPropertySets,'ARRAY')
 and scalar @{$arraymanufacture->getPropertySets()} == 2
 and $arraymanufacture->getPropertySets->[0] == $propertysets_assn
 and $arraymanufacture->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Identifiable
result ($arraymanufacture->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($arraymanufacture->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($arraymanufacture->isa(q[Bio::MAGE::Extendable]));

