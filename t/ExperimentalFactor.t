# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ExperimentalFactor.t'

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

BEGIN { $| = 1; print "1..58\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Experiment::ExperimentalFactor;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Experiment::FactorValue;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $experimentalfactor;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentalfactor = Bio::MAGE::Experiment::ExperimentalFactor->new();
}
result($experimentalfactor->isa('Bio::MAGE::Experiment::ExperimentalFactor'));

# test the package class method
result($experimentalfactor->package() eq q[Experiment]);

# test the class_name class method
result($experimentalfactor->class_name() eq q[Bio::MAGE::Experiment::ExperimentalFactor]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentalfactor = Bio::MAGE::Experiment::ExperimentalFactor->new(identifier => 1,
name => 2);
}
# testing attribute identifier
result ($experimentalfactor->getIdentifier() == 1);
$experimentalfactor->setIdentifier(1);
result ($experimentalfactor->getIdentifier() == 1);

# testing attribute name
result ($experimentalfactor->getName() == 2);
$experimentalfactor->setName(2);
result ($experimentalfactor->getName() == 2);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Experiment::ExperimentalFactor->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $experimentalfactor = Bio::MAGE::Experiment::ExperimentalFactor->new(category => Bio::MAGE::Description::OntologyEntry->new(),
annotations => [Bio::MAGE::Description::OntologyEntry->new()],
factorValues => [Bio::MAGE::Experiment::FactorValue->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association category
my $category_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $category_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($experimentalfactor->getCategory,q[Bio::MAGE::Description::OntologyEntry]));
result ($experimentalfactor->setCategory($category_assn) == $category_assn);
result ($experimentalfactor->getCategory() == $category_assn);



# test the meta-data for the assoication
($assn) = $assns{category};
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
# testing association annotations
my $annotations_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $annotations_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($experimentalfactor->getAnnotations->[0],q[Bio::MAGE::Description::OntologyEntry]));
result ($experimentalfactor->setAnnotations([$annotations_assn]));
result (UNIVERSAL::isa($experimentalfactor->getAnnotations,'ARRAY')
 and scalar @{$experimentalfactor->getAnnotations()} == 1
 and $experimentalfactor->getAnnotations->[0] == $annotations_assn);
$experimentalfactor->addAnnotations($annotations_assn);
result (UNIVERSAL::isa($experimentalfactor->getAnnotations,'ARRAY')
 and scalar @{$experimentalfactor->getAnnotations()} == 2
 and $experimentalfactor->getAnnotations->[0] == $annotations_assn
 and $experimentalfactor->getAnnotations->[1] == $annotations_assn);


# test the meta-data for the assoication
($assn) = $assns{annotations};
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
# testing association factorValues
my $factorvalues_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $factorvalues_assn = Bio::MAGE::Experiment::FactorValue->new();
}
result (UNIVERSAL::isa($experimentalfactor->getFactorValues->[0],q[Bio::MAGE::Experiment::FactorValue]));
result ($experimentalfactor->setFactorValues([$factorvalues_assn]));
result (UNIVERSAL::isa($experimentalfactor->getFactorValues,'ARRAY')
 and scalar @{$experimentalfactor->getFactorValues()} == 1
 and $experimentalfactor->getFactorValues->[0] == $factorvalues_assn);
$experimentalfactor->addFactorValues($factorvalues_assn);
result (UNIVERSAL::isa($experimentalfactor->getFactorValues,'ARRAY')
 and scalar @{$experimentalfactor->getFactorValues()} == 2
 and $experimentalfactor->getFactorValues->[0] == $factorvalues_assn
 and $experimentalfactor->getFactorValues->[1] == $factorvalues_assn);


# test the meta-data for the assoication
($assn) = $assns{factorValues};
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
result (UNIVERSAL::isa($experimentalfactor->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($experimentalfactor->setSecurity($security_assn) == $security_assn);
result ($experimentalfactor->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($experimentalfactor->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($experimentalfactor->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($experimentalfactor->getAuditTrail,'ARRAY')
 and scalar @{$experimentalfactor->getAuditTrail()} == 1
 and $experimentalfactor->getAuditTrail->[0] == $audittrail_assn);
$experimentalfactor->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($experimentalfactor->getAuditTrail,'ARRAY')
 and scalar @{$experimentalfactor->getAuditTrail()} == 2
 and $experimentalfactor->getAuditTrail->[0] == $audittrail_assn
 and $experimentalfactor->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($experimentalfactor->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($experimentalfactor->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($experimentalfactor->getDescriptions,'ARRAY')
 and scalar @{$experimentalfactor->getDescriptions()} == 1
 and $experimentalfactor->getDescriptions->[0] == $descriptions_assn);
$experimentalfactor->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($experimentalfactor->getDescriptions,'ARRAY')
 and scalar @{$experimentalfactor->getDescriptions()} == 2
 and $experimentalfactor->getDescriptions->[0] == $descriptions_assn
 and $experimentalfactor->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($experimentalfactor->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($experimentalfactor->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($experimentalfactor->getPropertySets,'ARRAY')
 and scalar @{$experimentalfactor->getPropertySets()} == 1
 and $experimentalfactor->getPropertySets->[0] == $propertysets_assn);
$experimentalfactor->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($experimentalfactor->getPropertySets,'ARRAY')
 and scalar @{$experimentalfactor->getPropertySets()} == 2
 and $experimentalfactor->getPropertySets->[0] == $propertysets_assn
 and $experimentalfactor->getPropertySets->[1] == $propertysets_assn);


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
result ($experimentalfactor->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($experimentalfactor->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($experimentalfactor->isa(q[Bio::MAGE::Extendable]));

