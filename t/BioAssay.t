# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssay.t'

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

BEGIN { $| = 1; print "1..55\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::BioAssay::MeasuredBioAssay;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::BioAssay::PhysicalBioAssay;
use Bio::MAGE::Experiment::FactorValue;
use Bio::MAGE::BioAssay::DerivedBioAssay;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassay;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassay = Bio::MAGE::BioAssay::BioAssay->new();
}
result($bioassay->isa('Bio::MAGE::BioAssay::BioAssay'));

# test the package class method
result($bioassay->package() eq q[BioAssay]);

# test the class_name class method
result($bioassay->class_name() eq q[Bio::MAGE::BioAssay::BioAssay]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassay = Bio::MAGE::BioAssay::BioAssay->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($bioassay->getIdentifier() == 1);
$bioassay->setIdentifier(1);
result ($bioassay->getIdentifier() == 1);

# testing attribute name
result ($bioassay->getName() == 2);
$bioassay->setName(2);
result ($bioassay->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::BioAssay->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassay = Bio::MAGE::BioAssay::BioAssay->new(bioAssayFactorValues => [Bio::MAGE::Experiment::FactorValue->new()],
channels => [Bio::MAGE::BioAssay::Channel->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association bioAssayFactorValues
my $bioassayfactorvalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassayfactorvalues_assn = Bio::MAGE::Experiment::FactorValue->new();
}
result (UNIVERSAL::isa($bioassay->getBioAssayFactorValues->[0],q[Bio::MAGE::Experiment::FactorValue]));
result ($bioassay->setBioAssayFactorValues([$bioassayfactorvalues_assn]));
result (UNIVERSAL::isa($bioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$bioassay->getBioAssayFactorValues()} == 1
 and $bioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn);
$bioassay->addBioAssayFactorValues($bioassayfactorvalues_assn);
result (UNIVERSAL::isa($bioassay->getBioAssayFactorValues,'ARRAY')
 and scalar @{$bioassay->getBioAssayFactorValues()} == 2
 and $bioassay->getBioAssayFactorValues->[0] == $bioassayfactorvalues_assn
 and $bioassay->getBioAssayFactorValues->[1] == $bioassayfactorvalues_assn);


# test the meta-data for the assoication
($assn) = $assns{bioAssayFactorValues};
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
# testing association channels
my $channels_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channels_assn = Bio::MAGE::BioAssay::Channel->new();
}
result (UNIVERSAL::isa($bioassay->getChannels->[0],q[Bio::MAGE::BioAssay::Channel]));
result ($bioassay->setChannels([$channels_assn]));
result (UNIVERSAL::isa($bioassay->getChannels,'ARRAY')
 and scalar @{$bioassay->getChannels()} == 1
 and $bioassay->getChannels->[0] == $channels_assn);
$bioassay->addChannels($channels_assn);
result (UNIVERSAL::isa($bioassay->getChannels,'ARRAY')
 and scalar @{$bioassay->getChannels()} == 2
 and $bioassay->getChannels->[0] == $channels_assn
 and $bioassay->getChannels->[1] == $channels_assn);


# test the meta-data for the assoication
($assn) = $assns{channels};
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
result (UNIVERSAL::isa($bioassay->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($bioassay->setSecurity($security_assn) == $security_assn);
result ($bioassay->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($bioassay->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($bioassay->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($bioassay->getAuditTrail,'ARRAY')
 and scalar @{$bioassay->getAuditTrail()} == 1
 and $bioassay->getAuditTrail->[0] == $audittrail_assn);
$bioassay->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($bioassay->getAuditTrail,'ARRAY')
 and scalar @{$bioassay->getAuditTrail()} == 2
 and $bioassay->getAuditTrail->[0] == $audittrail_assn
 and $bioassay->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($bioassay->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($bioassay->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($bioassay->getDescriptions,'ARRAY')
 and scalar @{$bioassay->getDescriptions()} == 1
 and $bioassay->getDescriptions->[0] == $descriptions_assn);
$bioassay->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($bioassay->getDescriptions,'ARRAY')
 and scalar @{$bioassay->getDescriptions()} == 2
 and $bioassay->getDescriptions->[0] == $descriptions_assn
 and $bioassay->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($bioassay->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassay->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassay->getPropertySets,'ARRAY')
 and scalar @{$bioassay->getPropertySets()} == 1
 and $bioassay->getPropertySets->[0] == $propertysets_assn);
$bioassay->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassay->getPropertySets,'ARRAY')
 and scalar @{$bioassay->getPropertySets()} == 2
 and $bioassay->getPropertySets->[0] == $propertysets_assn
 and $bioassay->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $measuredbioassay = Bio::MAGE::BioAssay::MeasuredBioAssay->new();

  # testing subclass MeasuredBioAssay
  result ($measuredbioassay->isa(q[Bio::MAGE::BioAssay::MeasuredBioAssay]));

  # create a subclass
  my $derivedbioassay = Bio::MAGE::BioAssay::DerivedBioAssay->new();

  # testing subclass DerivedBioAssay
  result ($derivedbioassay->isa(q[Bio::MAGE::BioAssay::DerivedBioAssay]));

  # create a subclass
  my $physicalbioassay = Bio::MAGE::BioAssay::PhysicalBioAssay->new();

  # testing subclass PhysicalBioAssay
  result ($physicalbioassay->isa(q[Bio::MAGE::BioAssay::PhysicalBioAssay]));

}
# testing superclass Bio::MAGE::Identifiable
result ($bioassay->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($bioassay->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($bioassay->isa(q[Bio::MAGE::Extendable]));

