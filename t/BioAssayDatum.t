# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BioAssayDatum.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..24\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::BioAssayDatum;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::QuantitationType::QuantitationType;
use Bio::MAGE::NameValueType;
use Bio::MAGE::DesignElement::DesignElement;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $bioassaydatum;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatum = Bio::MAGE::BioAssayData::BioAssayDatum->new();
}
result($bioassaydatum->isa('Bio::MAGE::BioAssayData::BioAssayDatum'));

# test the package class method
result($bioassaydatum->package() eq q[BioAssayData]);

# test the class_name class method
result($bioassaydatum->class_name() eq q[Bio::MAGE::BioAssayData::BioAssayDatum]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatum = Bio::MAGE::BioAssayData::BioAssayDatum->new(value => 1);
}
# testing attribute value
result ($bioassaydatum->getValue() == 1);
$bioassaydatum->setValue(1);
result ($bioassaydatum->getValue() == 1);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssayData::BioAssayDatum->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassaydatum = Bio::MAGE::BioAssayData::BioAssayDatum->new(quantitationType => Bio::MAGE::QuantitationType::QuantitationType->new(),
bioAssay => Bio::MAGE::BioAssay::BioAssay->new(),
designElement => Bio::MAGE::DesignElement::DesignElement->new(),
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association quantitationType
my $quantitationtype_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $quantitationtype_assn = Bio::MAGE::QuantitationType::QuantitationType->new();
}
result (UNIVERSAL::isa($bioassaydatum->getQuantitationType,q[Bio::MAGE::QuantitationType::QuantitationType]));
result ($bioassaydatum->setQuantitationType($quantitationtype_assn) == $quantitationtype_assn);
result ($bioassaydatum->getQuantitationType() == $quantitationtype_assn);



# test the meta-data for the assoication
($assn) = $assns{quantitationType};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association bioAssay
my $bioassay_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $bioassay_assn = Bio::MAGE::BioAssay::BioAssay->new();
}
result (UNIVERSAL::isa($bioassaydatum->getBioAssay,q[Bio::MAGE::BioAssay::BioAssay]));
result ($bioassaydatum->setBioAssay($bioassay_assn) == $bioassay_assn);
result ($bioassaydatum->getBioAssay() == $bioassay_assn);



# test the meta-data for the assoication
($assn) = $assns{bioAssay};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association designElement
my $designelement_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $designelement_assn = Bio::MAGE::DesignElement::DesignElement->new();
}
result (UNIVERSAL::isa($bioassaydatum->getDesignElement,q[Bio::MAGE::DesignElement::DesignElement]));
result ($bioassaydatum->setDesignElement($designelement_assn) == $designelement_assn);
result ($bioassaydatum->getDesignElement() == $designelement_assn);



# test the meta-data for the assoication
($assn) = $assns{designElement};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($bioassaydatum->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($bioassaydatum->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($bioassaydatum->getPropertySets,'ARRAY')
 and scalar @{$bioassaydatum->getPropertySets()} == 1
 and $bioassaydatum->getPropertySets->[0] == $propertysets_assn);
$bioassaydatum->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($bioassaydatum->getPropertySets,'ARRAY')
 and scalar @{$bioassaydatum->getPropertySets()} == 2
 and $bioassaydatum->getPropertySets->[0] == $propertysets_assn
 and $bioassaydatum->getPropertySets->[1] == $propertysets_assn);


# test the meta-data for the assoication
($assn) = $assns{propertySets};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing superclass Bio::MAGE::Extendable
result ($bioassaydatum->isa(q[Bio::MAGE::Extendable]));

