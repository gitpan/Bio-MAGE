# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Extendable.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..36\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;
use Bio::MAGE::Describable;
use Bio::MAGE::Array::ArrayManufactureDeviation;
use Bio::MAGE::Measurement::Unit;
use Bio::MAGE::DesignElement::Position;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::ArrayDesign::ZoneGroup;
use Bio::MAGE::Array::PositionDelta;
use Bio::MAGE::Measurement::Measurement;
use Bio::MAGE::Array::FeatureDefect;
use Bio::MAGE::Description::DatabaseEntry;
use Bio::MAGE::DesignElement::FeatureLocation;
use Bio::MAGE::BioAssayData::BioAssayDatum;
use Bio::MAGE::Protocol::ParameterValue;
use Bio::MAGE::HigherLevelAnalysis::NodeValue;
use Bio::MAGE::BioSequence::SeqFeatureLocation;
use Bio::MAGE::Description::ExternalReference;
use Bio::MAGE::BioSequence::SequencePosition;
use Bio::MAGE::BioAssayData::DesignElementMapping;
use Bio::MAGE::DesignElement::MismatchInformation;
use Bio::MAGE::BioMaterial::CompoundMeasurement;
use Bio::MAGE::BioAssayData::BioAssayMapping;
use Bio::MAGE::DesignElement::FeatureInformation;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioMaterial::BioMaterialMeasurement;
use Bio::MAGE::BioAssayData::QuantitationTypeMapping;
use Bio::MAGE::BioAssayData::BioDataValues;
use Bio::MAGE::Array::ZoneDefect;
use Bio::MAGE::ArrayDesign::ZoneLayout;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $extendable;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $extendable = Bio::MAGE::Extendable->new();
}
result($extendable->isa('Bio::MAGE::Extendable'));

# test the package class method
result($extendable->package() eq q[MAGE]);

# test the class_name class method
result($extendable->class_name() eq q[Bio::MAGE::Extendable]);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::Extendable->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $extendable = Bio::MAGE::Extendable->new(propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($extendable->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($extendable->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($extendable->getPropertySets,'ARRAY')
 and scalar @{$extendable->getPropertySets()} == 1
 and $extendable->getPropertySets->[0] == $propertysets_assn);
$extendable->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($extendable->getPropertySets,'ARRAY')
 and scalar @{$extendable->getPropertySets()} == 2
 and $extendable->getPropertySets->[0] == $propertysets_assn
 and $extendable->getPropertySets->[1] == $propertysets_assn);


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
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  # create a subclass
  my $bioassaydatum = Bio::MAGE::BioAssayData::BioAssayDatum->new();

  # testing subclass BioAssayDatum
  result ($bioassaydatum->isa(q[Bio::MAGE::BioAssayData::BioAssayDatum]));

  # create a subclass
  my $biodatavalues = Bio::MAGE::BioAssayData::BioDataValues->new();

  # testing subclass BioDataValues
  result ($biodatavalues->isa(q[Bio::MAGE::BioAssayData::BioDataValues]));

  # create a subclass
  my $externalreference = Bio::MAGE::Description::ExternalReference->new();

  # testing subclass ExternalReference
  result ($externalreference->isa(q[Bio::MAGE::Description::ExternalReference]));

  # create a subclass
  my $zonedefect = Bio::MAGE::Array::ZoneDefect->new();

  # testing subclass ZoneDefect
  result ($zonedefect->isa(q[Bio::MAGE::Array::ZoneDefect]));

  # create a subclass
  my $designelementmapping = Bio::MAGE::BioAssayData::DesignElementMapping->new();

  # testing subclass DesignElementMapping
  result ($designelementmapping->isa(q[Bio::MAGE::BioAssayData::DesignElementMapping]));

  # create a subclass
  my $featurelocation = Bio::MAGE::DesignElement::FeatureLocation->new();

  # testing subclass FeatureLocation
  result ($featurelocation->isa(q[Bio::MAGE::DesignElement::FeatureLocation]));

  # create a subclass
  my $quantitationtypemapping = Bio::MAGE::BioAssayData::QuantitationTypeMapping->new();

  # testing subclass QuantitationTypeMapping
  result ($quantitationtypemapping->isa(q[Bio::MAGE::BioAssayData::QuantitationTypeMapping]));

  # create a subclass
  my $biomaterialmeasurement = Bio::MAGE::BioMaterial::BioMaterialMeasurement->new();

  # testing subclass BioMaterialMeasurement
  result ($biomaterialmeasurement->isa(q[Bio::MAGE::BioMaterial::BioMaterialMeasurement]));

  # create a subclass
  my $ontologyentry = Bio::MAGE::Description::OntologyEntry->new();

  # testing subclass OntologyEntry
  result ($ontologyentry->isa(q[Bio::MAGE::Description::OntologyEntry]));

  # create a subclass
  my $parametervalue = Bio::MAGE::Protocol::ParameterValue->new();

  # testing subclass ParameterValue
  result ($parametervalue->isa(q[Bio::MAGE::Protocol::ParameterValue]));

  # create a subclass
  my $position = Bio::MAGE::DesignElement::Position->new();

  # testing subclass Position
  result ($position->isa(q[Bio::MAGE::DesignElement::Position]));

  # create a subclass
  my $mismatchinformation = Bio::MAGE::DesignElement::MismatchInformation->new();

  # testing subclass MismatchInformation
  result ($mismatchinformation->isa(q[Bio::MAGE::DesignElement::MismatchInformation]));

  # create a subclass
  my $nodevalue = Bio::MAGE::HigherLevelAnalysis::NodeValue->new();

  # testing subclass NodeValue
  result ($nodevalue->isa(q[Bio::MAGE::HigherLevelAnalysis::NodeValue]));

  # create a subclass
  my $measurement = Bio::MAGE::Measurement::Measurement->new();

  # testing subclass Measurement
  result ($measurement->isa(q[Bio::MAGE::Measurement::Measurement]));

  # create a subclass
  my $zonelayout = Bio::MAGE::ArrayDesign::ZoneLayout->new();

  # testing subclass ZoneLayout
  result ($zonelayout->isa(q[Bio::MAGE::ArrayDesign::ZoneLayout]));

  # create a subclass
  my $unit = Bio::MAGE::Measurement::Unit->new();

  # testing subclass Unit
  result ($unit->isa(q[Bio::MAGE::Measurement::Unit]));

  # create a subclass
  my $arraymanufacturedeviation = Bio::MAGE::Array::ArrayManufactureDeviation->new();

  # testing subclass ArrayManufactureDeviation
  result ($arraymanufacturedeviation->isa(q[Bio::MAGE::Array::ArrayManufactureDeviation]));

  # create a subclass
  my $bioassaymapping = Bio::MAGE::BioAssayData::BioAssayMapping->new();

  # testing subclass BioAssayMapping
  result ($bioassaymapping->isa(q[Bio::MAGE::BioAssayData::BioAssayMapping]));

  # create a subclass
  my $featureinformation = Bio::MAGE::DesignElement::FeatureInformation->new();

  # testing subclass FeatureInformation
  result ($featureinformation->isa(q[Bio::MAGE::DesignElement::FeatureInformation]));

  # create a subclass
  my $compoundmeasurement = Bio::MAGE::BioMaterial::CompoundMeasurement->new();

  # testing subclass CompoundMeasurement
  result ($compoundmeasurement->isa(q[Bio::MAGE::BioMaterial::CompoundMeasurement]));

  # create a subclass
  my $seqfeaturelocation = Bio::MAGE::BioSequence::SeqFeatureLocation->new();

  # testing subclass SeqFeatureLocation
  result ($seqfeaturelocation->isa(q[Bio::MAGE::BioSequence::SeqFeatureLocation]));

  # create a subclass
  my $positiondelta = Bio::MAGE::Array::PositionDelta->new();

  # testing subclass PositionDelta
  result ($positiondelta->isa(q[Bio::MAGE::Array::PositionDelta]));

  # create a subclass
  my $databaseentry = Bio::MAGE::Description::DatabaseEntry->new();

  # testing subclass DatabaseEntry
  result ($databaseentry->isa(q[Bio::MAGE::Description::DatabaseEntry]));

  # create a subclass
  my $describable = Bio::MAGE::Describable->new();

  # testing subclass Describable
  result ($describable->isa(q[Bio::MAGE::Describable]));

  # create a subclass
  my $zonegroup = Bio::MAGE::ArrayDesign::ZoneGroup->new();

  # testing subclass ZoneGroup
  result ($zonegroup->isa(q[Bio::MAGE::ArrayDesign::ZoneGroup]));

  # create a subclass
  my $featuredefect = Bio::MAGE::Array::FeatureDefect->new();

  # testing subclass FeatureDefect
  result ($featuredefect->isa(q[Bio::MAGE::Array::FeatureDefect]));

  # create a subclass
  my $sequenceposition = Bio::MAGE::BioSequence::SequencePosition->new();

  # testing subclass SequencePosition
  result ($sequenceposition->isa(q[Bio::MAGE::BioSequence::SequencePosition]));

}
