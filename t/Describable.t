# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Describable.t'

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

BEGIN { $| = 1; print "1..43\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Describable;
use Bio::MAGE::HigherLevelAnalysis::Node;
use Bio::MAGE::Array::Fiducial;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::Experiment::ExperimentDesign;
use Bio::MAGE::Identifiable;
use Bio::MAGE::HigherLevelAnalysis::NodeContents;
use Bio::MAGE::BQS::BibliographicReference;
use Bio::MAGE::Protocol::ParameterizableApplication;
use Bio::MAGE::NameValueType;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Array::ManufactureLIMS;
use Bio::MAGE::BioSequence::SeqFeature;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $describable;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $describable = Bio::MAGE::Describable->new();
}
result($describable->isa('Bio::MAGE::Describable'));

# test the package class method
result($describable->package() eq q[MAGE]);

# test the class_name class method
result($describable->class_name() eq q[Bio::MAGE::Describable]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Describable->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $describable = Bio::MAGE::Describable->new(descriptions => [Bio::MAGE::Description::Description->new()],
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association descriptions
my $descriptions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $descriptions_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($describable->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($describable->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($describable->getDescriptions,'ARRAY')
 and scalar @{$describable->getDescriptions()} == 1
 and $describable->getDescriptions->[0] == $descriptions_assn);
$describable->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($describable->getDescriptions,'ARRAY')
 and scalar @{$describable->getDescriptions()} == 2
 and $describable->getDescriptions->[0] == $descriptions_assn
 and $describable->getDescriptions->[1] == $descriptions_assn);


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
# testing association auditTrail
my $audittrail_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audittrail_assn = Bio::MAGE::AuditAndSecurity::Audit->new();
}
result (UNIVERSAL::isa($describable->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($describable->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($describable->getAuditTrail,'ARRAY')
 and scalar @{$describable->getAuditTrail()} == 1
 and $describable->getAuditTrail->[0] == $audittrail_assn);
$describable->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($describable->getAuditTrail,'ARRAY')
 and scalar @{$describable->getAuditTrail()} == 2
 and $describable->getAuditTrail->[0] == $audittrail_assn
 and $describable->getAuditTrail->[1] == $audittrail_assn);


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
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($describable->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($describable->setSecurity($security_assn) == $security_assn);
result ($describable->getSecurity() == $security_assn);



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
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($describable->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($describable->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($describable->getPropertySets,'ARRAY')
 and scalar @{$describable->getPropertySets()} == 1
 and $describable->getPropertySets->[0] == $propertysets_assn);
$describable->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($describable->getPropertySets,'ARRAY')
 and scalar @{$describable->getPropertySets()} == 2
 and $describable->getPropertySets->[0] == $propertysets_assn
 and $describable->getPropertySets->[1] == $propertysets_assn);


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
  my $audit = Bio::MAGE::AuditAndSecurity::Audit->new();

  # testing subclass Audit
  result ($audit->isa(q[Bio::MAGE::AuditAndSecurity::Audit]));

  # create a subclass
  my $seqfeature = Bio::MAGE::BioSequence::SeqFeature->new();

  # testing subclass SeqFeature
  result ($seqfeature->isa(q[Bio::MAGE::BioSequence::SeqFeature]));

  # create a subclass
  my $node = Bio::MAGE::HigherLevelAnalysis::Node->new();

  # testing subclass Node
  result ($node->isa(q[Bio::MAGE::HigherLevelAnalysis::Node]));

  # create a subclass
  my $parameterizableapplication = Bio::MAGE::Protocol::ParameterizableApplication->new();

  # testing subclass ParameterizableApplication
  result ($parameterizableapplication->isa(q[Bio::MAGE::Protocol::ParameterizableApplication]));

  # create a subclass
  my $identifiable = Bio::MAGE::Identifiable->new();

  # testing subclass Identifiable
  result ($identifiable->isa(q[Bio::MAGE::Identifiable]));

  # create a subclass
  my $experimentdesign = Bio::MAGE::Experiment::ExperimentDesign->new();

  # testing subclass ExperimentDesign
  result ($experimentdesign->isa(q[Bio::MAGE::Experiment::ExperimentDesign]));

  # create a subclass
  my $manufacturelims = Bio::MAGE::Array::ManufactureLIMS->new();

  # testing subclass ManufactureLIMS
  result ($manufacturelims->isa(q[Bio::MAGE::Array::ManufactureLIMS]));

  # create a subclass
  my $bibliographicreference = Bio::MAGE::BQS::BibliographicReference->new();

  # testing subclass BibliographicReference
  result ($bibliographicreference->isa(q[Bio::MAGE::BQS::BibliographicReference]));

  # create a subclass
  my $fiducial = Bio::MAGE::Array::Fiducial->new();

  # testing subclass Fiducial
  result ($fiducial->isa(q[Bio::MAGE::Array::Fiducial]));

  # create a subclass
  my $nodecontents = Bio::MAGE::HigherLevelAnalysis::NodeContents->new();

  # testing subclass NodeContents
  result ($nodecontents->isa(q[Bio::MAGE::HigherLevelAnalysis::NodeContents]));

  # create a subclass
  my $description = Bio::MAGE::Description::Description->new();

  # testing subclass Description
  result ($description->isa(q[Bio::MAGE::Description::Description]));

}
# testing superclass Bio::MAGE::Extendable
result ($describable->isa(q[Bio::MAGE::Extendable]));

