# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ManufactureLIMSBiomaterial.t'

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

BEGIN { $| = 1; print "1..60\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Array::ManufactureLIMSBiomaterial;
use Bio::MAGE::BioMaterial::BioMaterial;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::Description::Description;
use Bio::MAGE::Description::DatabaseEntry;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $manufacturelimsbiomaterial;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $manufacturelimsbiomaterial = Bio::MAGE::Array::ManufactureLIMSBiomaterial->new();
}
result($manufacturelimsbiomaterial->isa('Bio::MAGE::Array::ManufactureLIMSBiomaterial'));

# test the package class method
result($manufacturelimsbiomaterial->package() eq q[Array]);

# test the class_name class method
result($manufacturelimsbiomaterial->class_name() eq q[Bio::MAGE::Array::ManufactureLIMSBiomaterial]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $manufacturelimsbiomaterial = Bio::MAGE::Array::ManufactureLIMSBiomaterial->new(bioMaterialPlateCol => 1,
bioMaterialPlateRow => 2,
bioMaterialPlateIdentifier => 3,
quality => 4);
}
# testing attribute bioMaterialPlateCol
result ($manufacturelimsbiomaterial->getBioMaterialPlateCol() == 1);
$manufacturelimsbiomaterial->setBioMaterialPlateCol(1);
result ($manufacturelimsbiomaterial->getBioMaterialPlateCol() == 1);

# testing attribute bioMaterialPlateRow
result ($manufacturelimsbiomaterial->getBioMaterialPlateRow() == 2);
$manufacturelimsbiomaterial->setBioMaterialPlateRow(2);
result ($manufacturelimsbiomaterial->getBioMaterialPlateRow() == 2);

# testing attribute bioMaterialPlateIdentifier
result ($manufacturelimsbiomaterial->getBioMaterialPlateIdentifier() == 3);
$manufacturelimsbiomaterial->setBioMaterialPlateIdentifier(3);
result ($manufacturelimsbiomaterial->getBioMaterialPlateIdentifier() == 3);

# testing attribute quality
result ($manufacturelimsbiomaterial->getQuality() == 4);
$manufacturelimsbiomaterial->setQuality(4);
result ($manufacturelimsbiomaterial->getQuality() == 4);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Array::ManufactureLIMSBiomaterial->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $manufacturelimsbiomaterial = Bio::MAGE::Array::ManufactureLIMSBiomaterial->new(feature => Bio::MAGE::DesignElement::Feature->new(),
identifierLIMS => Bio::MAGE::Description::DatabaseEntry->new(),
bioMaterial => Bio::MAGE::BioMaterial::BioMaterial->new(),
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}

my $end;
# testing association feature
my $feature_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $feature_assn = Bio::MAGE::DesignElement::Feature->new();
}
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getFeature,q[Bio::MAGE::DesignElement::Feature]));
result ($manufacturelimsbiomaterial->setFeature($feature_assn) == $feature_assn);
result ($manufacturelimsbiomaterial->getFeature() == $feature_assn);



# test the meta-data for the assoication
($assn) = $assns{feature};
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
# testing association identifierLIMS
my $identifierlims_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $identifierlims_assn = Bio::MAGE::Description::DatabaseEntry->new();
}
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getIdentifierLIMS,q[Bio::MAGE::Description::DatabaseEntry]));
result ($manufacturelimsbiomaterial->setIdentifierLIMS($identifierlims_assn) == $identifierlims_assn);
result ($manufacturelimsbiomaterial->getIdentifierLIMS() == $identifierlims_assn);



# test the meta-data for the assoication
($assn) = $assns{identifierLIMS};
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
# testing association bioMaterial
my $biomaterial_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $biomaterial_assn = Bio::MAGE::BioMaterial::BioMaterial->new();
}
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getBioMaterial,q[Bio::MAGE::BioMaterial::BioMaterial]));
result ($manufacturelimsbiomaterial->setBioMaterial($biomaterial_assn) == $biomaterial_assn);
result ($manufacturelimsbiomaterial->getBioMaterial() == $biomaterial_assn);



# test the meta-data for the assoication
($assn) = $assns{bioMaterial};
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
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($manufacturelimsbiomaterial->setSecurity($security_assn) == $security_assn);
result ($manufacturelimsbiomaterial->getSecurity() == $security_assn);



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
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($manufacturelimsbiomaterial->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getAuditTrail,'ARRAY')
 and scalar @{$manufacturelimsbiomaterial->getAuditTrail()} == 1
 and $manufacturelimsbiomaterial->getAuditTrail->[0] == $audittrail_assn);
$manufacturelimsbiomaterial->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getAuditTrail,'ARRAY')
 and scalar @{$manufacturelimsbiomaterial->getAuditTrail()} == 2
 and $manufacturelimsbiomaterial->getAuditTrail->[0] == $audittrail_assn
 and $manufacturelimsbiomaterial->getAuditTrail->[1] == $audittrail_assn);


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
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($manufacturelimsbiomaterial->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getDescriptions,'ARRAY')
 and scalar @{$manufacturelimsbiomaterial->getDescriptions()} == 1
 and $manufacturelimsbiomaterial->getDescriptions->[0] == $descriptions_assn);
$manufacturelimsbiomaterial->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getDescriptions,'ARRAY')
 and scalar @{$manufacturelimsbiomaterial->getDescriptions()} == 2
 and $manufacturelimsbiomaterial->getDescriptions->[0] == $descriptions_assn
 and $manufacturelimsbiomaterial->getDescriptions->[1] == $descriptions_assn);


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
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($manufacturelimsbiomaterial->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getPropertySets,'ARRAY')
 and scalar @{$manufacturelimsbiomaterial->getPropertySets()} == 1
 and $manufacturelimsbiomaterial->getPropertySets->[0] == $propertysets_assn);
$manufacturelimsbiomaterial->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($manufacturelimsbiomaterial->getPropertySets,'ARRAY')
 and scalar @{$manufacturelimsbiomaterial->getPropertySets()} == 2
 and $manufacturelimsbiomaterial->getPropertySets->[0] == $propertysets_assn
 and $manufacturelimsbiomaterial->getPropertySets->[1] == $propertysets_assn);


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
# testing superclass Bio::MAGE::Array::ManufactureLIMS
result ($manufacturelimsbiomaterial->isa(q[Bio::MAGE::Array::ManufactureLIMS]));

# testing superclass Bio::MAGE::Describable
result ($manufacturelimsbiomaterial->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($manufacturelimsbiomaterial->isa(q[Bio::MAGE::Extendable]));

