##############################
#
# Bio::MAGE
#
##############################
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

package Bio::MAGE;

use strict;
use Carp;
use Bio::MAGE::Base;
require Exporter;
use Tie::IxHash;

use Bio::MAGE::Extendable;
use Bio::MAGE::Identifiable;
use Bio::MAGE::Describable;
use Bio::MAGE::NameValueType;


use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS $__MAGEML_LISTS $__MAGEML_PACKAGES $__CLASS2FULLCLASS);

@ISA = qw(Bio::MAGE::Base Exporter);
$VERSION = 20020902.6;

use constant CARD_1 => '1';
use constant CARD_0_OR_1 => '0..1';
use constant CARD_1_TO_N => '1..N';
use constant CARD_0_TO_N => '0..N';

%EXPORT_TAGS = (ALL => ['']);

sub import {
  my ($pkg,@tags) = @_;
  foreach (@tags) {
    if ($_ =~ /ALL/) {
      import_all();
    }
  }
}

sub import_all {
  eval qq[
require Bio::MAGE::AuditAndSecurity;
require Bio::MAGE::Description;
require Bio::MAGE::Measurement;
require Bio::MAGE::BQS;
require Bio::MAGE::BioEvent;
require Bio::MAGE::Protocol;
require Bio::MAGE::BioMaterial;
require Bio::MAGE::BioSequence;
require Bio::MAGE::DesignElement;
require Bio::MAGE::ArrayDesign;
require Bio::MAGE::Array;
require Bio::MAGE::BioAssay;
require Bio::MAGE::QuantitationType;
require Bio::MAGE::BioAssayData;
require Bio::MAGE::Experiment;
require Bio::MAGE::HigherLevelAnalysis;

	 ];
  if ($@) {
    die "MAGE load error: $@
";
  }
}

sub initialize {
  my ($self) = shift;
  $self->identifiers({});
  $self->packages({});		# create packages on a per-need basis
  $self->registered_objects({});
  $self->tagname('MAGE-ML')
    unless defined $self->tagname();
  $self->add_objects($self->objects())
    if defined $self->objects();
  return 1;
}



=head1 NAME

Bio::MAGE - Container module for classes in the MAGE MAGE package 

=head1 SYNOPSIS

  use Bio::MAGE;

=head1 DESCRIPTION

This is a I<package> module that encapsulates a number of classes in
the Bio::MAGE hierarchy. These classes belong to the
MAGE package of the MAGE-OM object model.

=head1 CLASSES

The Bio::MAGE module contains the following
Bio::MAGE classes:

=over


=item * Extendable


=item * Identifiable


=item * Describable


=item * NameValueType


=back



=head1 CLASS METHODS

=over

=item @class_list = Bio::MAGE::classes();

This method returns a list of non-fully qualified class names
(i.e. they do not have 'Bio::MAGE::' as a prefix) in this package.

=cut

sub classes {
  return ('Extendable',
'Identifiable',
'Describable',
'NameValueType');
}

=item $obj_ref = Bio::MAGE->new(%parameters)

=item $obj_ref_copy = $obj_ref->new()

The C<new()> method is the class constructor. If invoked with an
existing object instance, it is a copy constructor.

B<Return value>: It returns a reference to an object of class
C<Bio::MAGE>.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut

BEGIN {
  $__MAGEML_PACKAGES = [
          'AuditAndSecurity',
          'Description',
          'Measurement',
          'BQS',
          'BioEvent',
          'Protocol',
          'BioMaterial',
          'BioSequence',
          'DesignElement',
          'ArrayDesign',
          'Array',
          'BioAssay',
          'QuantitationType',
          'BioAssayData',
          'Experiment',
          'HigherLevelAnalysis'
        ]
;
}

=item @list_names = Bio::MAGE::mageml_packages();

This method returns an ordered list of the MAGE-ML packages that exist
in the top level MAGE-ML element.

=cut

sub mageml_packages {
  return @{$__MAGEML_PACKAGES};
}


BEGIN {
  $__CLASS2FULLCLASS = {
          'Describable' => 'Bio::MAGE::Describable',
          'Error' => 'Bio::MAGE::QuantitationType::Error',
          'Parameter' => 'Bio::MAGE::Protocol::Parameter',
          'ConfidenceIndicator' => 'Bio::MAGE::QuantitationType::ConfidenceIndicator',
          'ImageAcquisition' => 'Bio::MAGE::BioAssay::ImageAcquisition',
          'ArrayManufacture' => 'Bio::MAGE::Array::ArrayManufacture',
          'Node' => 'Bio::MAGE::HigherLevelAnalysis::Node',
          'Contact' => 'Bio::MAGE::AuditAndSecurity::Contact',
          'Compound' => 'Bio::MAGE::BioMaterial::Compound',
          'Protocol' => 'Bio::MAGE::Protocol::Protocol',
          'DerivedSignal' => 'Bio::MAGE::QuantitationType::DerivedSignal',
          'Array' => 'Bio::MAGE::Array::Array',
          'Hybridization' => 'Bio::MAGE::BioAssay::Hybridization',
          'ConcentrationUnit' => 'Bio::MAGE::Measurement::ConcentrationUnit',
          'QuantitationTypeDimension' => 'Bio::MAGE::BioAssayData::QuantitationTypeDimension',
          'QuantitationType' => 'Bio::MAGE::QuantitationType::QuantitationType',
          'BioSequence' => 'Bio::MAGE::BioSequence::BioSequence',
          'BioEvent' => 'Bio::MAGE::BioEvent::BioEvent',
          'BioAssay' => 'Bio::MAGE::BioAssay::BioAssay',
          'FactorValue' => 'Bio::MAGE::Experiment::FactorValue',
          'MismatchInformation' => 'Bio::MAGE::DesignElement::MismatchInformation',
          'Failed' => 'Bio::MAGE::QuantitationType::Failed',
          'FeatureLocation' => 'Bio::MAGE::DesignElement::FeatureLocation',
          'Hardware' => 'Bio::MAGE::Protocol::Hardware',
          'PhysicalBioAssay' => 'Bio::MAGE::BioAssay::PhysicalBioAssay',
          'CompositePosition' => 'Bio::MAGE::DesignElement::CompositePosition',
          'DesignElementMapping' => 'Bio::MAGE::BioAssayData::DesignElementMapping',
          'MeasuredBioAssayData' => 'Bio::MAGE::BioAssayData::MeasuredBioAssayData',
          'ExperimentDesign' => 'Bio::MAGE::Experiment::ExperimentDesign',
          'LabeledExtract' => 'Bio::MAGE::BioMaterial::LabeledExtract',
          'DerivedBioAssay' => 'Bio::MAGE::BioAssay::DerivedBioAssay',
          'Channel' => 'Bio::MAGE::BioAssay::Channel',
          'FeatureExtraction' => 'Bio::MAGE::BioAssay::FeatureExtraction',
          'PhysicalArrayDesign' => 'Bio::MAGE::ArrayDesign::PhysicalArrayDesign',
          'BioSample' => 'Bio::MAGE::BioMaterial::BioSample',
          'ParameterizableApplication' => 'Bio::MAGE::Protocol::ParameterizableApplication',
          'BioSource' => 'Bio::MAGE::BioMaterial::BioSource',
          'ReporterCompositeMap' => 'Bio::MAGE::DesignElement::ReporterCompositeMap',
          'Parameterizable' => 'Bio::MAGE::Protocol::Parameterizable',
          'BioAssayData' => 'Bio::MAGE::BioAssayData::BioAssayData',
          'StandardQuantitationType' => 'Bio::MAGE::QuantitationType::StandardQuantitationType',
          'QuantityUnit' => 'Bio::MAGE::Measurement::QuantityUnit',
          'BioDataCube' => 'Bio::MAGE::BioAssayData::BioDataCube',
          'FeatureDimension' => 'Bio::MAGE::BioAssayData::FeatureDimension',
          'Software' => 'Bio::MAGE::Protocol::Software',
          'SoftwareApplication' => 'Bio::MAGE::Protocol::SoftwareApplication',
          'Feature' => 'Bio::MAGE::DesignElement::Feature',
          'MeasuredSignal' => 'Bio::MAGE::QuantitationType::MeasuredSignal',
          'Description' => 'Bio::MAGE::Description::Description',
          'DesignElement' => 'Bio::MAGE::DesignElement::DesignElement',
          'SequencePosition' => 'Bio::MAGE::BioSequence::SequencePosition',
          'Unit' => 'Bio::MAGE::Measurement::Unit',
          'ParameterValue' => 'Bio::MAGE::Protocol::ParameterValue',
          'Measurement' => 'Bio::MAGE::Measurement::Measurement',
          'NodeValue' => 'Bio::MAGE::HigherLevelAnalysis::NodeValue',
          'DistanceUnit' => 'Bio::MAGE::Measurement::DistanceUnit',
          'MassUnit' => 'Bio::MAGE::Measurement::MassUnit',
          'BioAssayDataCluster' => 'Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster',
          'Extendable' => 'Bio::MAGE::Extendable',
          'SpecializedQuantitationType' => 'Bio::MAGE::QuantitationType::SpecializedQuantitationType',
          'Image' => 'Bio::MAGE::BioAssay::Image',
          'ManufactureLIMSBiomaterial' => 'Bio::MAGE::Array::ManufactureLIMSBiomaterial',
          'Ratio' => 'Bio::MAGE::QuantitationType::Ratio',
          'CompoundMeasurement' => 'Bio::MAGE::BioMaterial::CompoundMeasurement',
          'Person' => 'Bio::MAGE::AuditAndSecurity::Person',
          'DesignElementGroup' => 'Bio::MAGE::ArrayDesign::DesignElementGroup',
          'HardwareApplication' => 'Bio::MAGE::Protocol::HardwareApplication',
          'BibliographicReference' => 'Bio::MAGE::BQS::BibliographicReference',
          'ZoneLayout' => 'Bio::MAGE::ArrayDesign::ZoneLayout',
          'DesignElementMap' => 'Bio::MAGE::BioAssayData::DesignElementMap',
          'Database' => 'Bio::MAGE::Description::Database',
          'BioAssayTreatment' => 'Bio::MAGE::BioAssay::BioAssayTreatment',
          'ExternalReference' => 'Bio::MAGE::Description::ExternalReference',
          'ExpectedValue' => 'Bio::MAGE::QuantitationType::ExpectedValue',
          'ArrayGroup' => 'Bio::MAGE::Array::ArrayGroup',
          'ExperimentalFactor' => 'Bio::MAGE::Experiment::ExperimentalFactor',
          'BioMaterial' => 'Bio::MAGE::BioMaterial::BioMaterial',
          'ReporterPosition' => 'Bio::MAGE::DesignElement::ReporterPosition',
          'CompositeGroup' => 'Bio::MAGE::ArrayDesign::CompositeGroup',
          'TemperatureUnit' => 'Bio::MAGE::Measurement::TemperatureUnit',
          'NodeContents' => 'Bio::MAGE::HigherLevelAnalysis::NodeContents',
          'OntologyEntry' => 'Bio::MAGE::Description::OntologyEntry',
          'QuantitationTypeMap' => 'Bio::MAGE::BioAssayData::QuantitationTypeMap',
          'Map' => 'Bio::MAGE::BioEvent::Map',
          'Security' => 'Bio::MAGE::AuditAndSecurity::Security',
          'SecurityGroup' => 'Bio::MAGE::AuditAndSecurity::SecurityGroup',
          'Transformation' => 'Bio::MAGE::BioAssayData::Transformation',
          'MeasuredBioAssay' => 'Bio::MAGE::BioAssay::MeasuredBioAssay',
          'Experiment' => 'Bio::MAGE::Experiment::Experiment',
          'SeqFeature' => 'Bio::MAGE::BioSequence::SeqFeature',
          'TimeUnit' => 'Bio::MAGE::Measurement::TimeUnit',
          'ReporterDimension' => 'Bio::MAGE::BioAssayData::ReporterDimension',
          'CompositeSequence' => 'Bio::MAGE::DesignElement::CompositeSequence',
          'PValue' => 'Bio::MAGE::QuantitationType::PValue',
          'BioAssayMap' => 'Bio::MAGE::BioAssayData::BioAssayMap',
          'NameValueType' => 'Bio::MAGE::NameValueType',
          'DesignElementDimension' => 'Bio::MAGE::BioAssayData::DesignElementDimension',
          'FeatureReporterMap' => 'Bio::MAGE::DesignElement::FeatureReporterMap',
          'ZoneDefect' => 'Bio::MAGE::Array::ZoneDefect',
          'Zone' => 'Bio::MAGE::ArrayDesign::Zone',
          'Organization' => 'Bio::MAGE::AuditAndSecurity::Organization',
          'BioMaterialMeasurement' => 'Bio::MAGE::BioMaterial::BioMaterialMeasurement',
          'FeatureInformation' => 'Bio::MAGE::DesignElement::FeatureInformation',
          'BioDataValues' => 'Bio::MAGE::BioAssayData::BioDataValues',
          'PositionDelta' => 'Bio::MAGE::Array::PositionDelta',
          'BioAssayCreation' => 'Bio::MAGE::BioAssay::BioAssayCreation',
          'QuantitationTypeMapping' => 'Bio::MAGE::BioAssayData::QuantitationTypeMapping',
          'CompositeCompositeMap' => 'Bio::MAGE::DesignElement::CompositeCompositeMap',
          'FeatureDefect' => 'Bio::MAGE::Array::FeatureDefect',
          'Audit' => 'Bio::MAGE::AuditAndSecurity::Audit',
          'BioAssayMapping' => 'Bio::MAGE::BioAssayData::BioAssayMapping',
          'ArrayDesign' => 'Bio::MAGE::ArrayDesign::ArrayDesign',
          'VolumeUnit' => 'Bio::MAGE::Measurement::VolumeUnit',
          'Identifiable' => 'Bio::MAGE::Identifiable',
          'ManufactureLIMS' => 'Bio::MAGE::Array::ManufactureLIMS',
          'Position' => 'Bio::MAGE::DesignElement::Position',
          'Fiducial' => 'Bio::MAGE::Array::Fiducial',
          'Treatment' => 'Bio::MAGE::BioMaterial::Treatment',
          'BioDataTuples' => 'Bio::MAGE::BioAssayData::BioDataTuples',
          'ZoneGroup' => 'Bio::MAGE::ArrayDesign::ZoneGroup',
          'DerivedBioAssayData' => 'Bio::MAGE::BioAssayData::DerivedBioAssayData',
          'ProtocolApplication' => 'Bio::MAGE::Protocol::ProtocolApplication',
          'CompositeSequenceDimension' => 'Bio::MAGE::BioAssayData::CompositeSequenceDimension',
          'FeatureGroup' => 'Bio::MAGE::ArrayDesign::FeatureGroup',
          'BioAssayDimension' => 'Bio::MAGE::BioAssayData::BioAssayDimension',
          'BioAssayDatum' => 'Bio::MAGE::BioAssayData::BioAssayDatum',
          'DatabaseEntry' => 'Bio::MAGE::Description::DatabaseEntry',
          'ReporterGroup' => 'Bio::MAGE::ArrayDesign::ReporterGroup',
          'PresentAbsent' => 'Bio::MAGE::QuantitationType::PresentAbsent',
          'Reporter' => 'Bio::MAGE::DesignElement::Reporter',
          'SeqFeatureLocation' => 'Bio::MAGE::BioSequence::SeqFeatureLocation',
          'ArrayManufactureDeviation' => 'Bio::MAGE::Array::ArrayManufactureDeviation'
        }
;
}

=item $hash_ref = Bio::MAGE::class2fullclass();

This method returns a hash table that specifies the fully-delimited
class name of a class given the abbreviated name.

=cut

sub class2fullclass {
  return %{$__CLASS2FULLCLASS};
}


=back

=head1 INSTANCE METHODS

=over

=cut

=item $mage->add_objects(@list)

The objects in C<@list> are added to the MAGE
object. This method will recursively descend that association hierarcy
of each object and place all Identifiable objects in their appropriate
lists for writing as MAGE-ML.

=cut

sub add_objects {
  my ($self,$list_ref) = @_;
  croak "Bio::MAGE::add_objects: Expected array reference but got $list_ref"
    unless UNIVERSAL::isa($list_ref,'ARRAY');
  foreach my $object (@{$list_ref}) {
    # we've been asked to register the objects, so we do it
    $self->register($object,1);
  }
}

=item $pkg_obj = $mage->getAuditAndSecurity_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::AuditAndSecurity> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getAuditAndSecurity_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'AuditAndSecurity'}) {
    eval "require Bio::MAGE::AuditAndSecurity";
    die "Couldn't require Bio::MAGE::AuditAndSecurity"
      if $@;
    $self->{__PACKAGES}{'AuditAndSecurity'} = Bio::MAGE::AuditAndSecurity->new();
  }
  return $self->{__PACKAGES}{'AuditAndSecurity'};
}


=item $pkg_obj = $mage->getDescription_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::Description> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getDescription_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'Description'}) {
    eval "require Bio::MAGE::Description";
    die "Couldn't require Bio::MAGE::Description"
      if $@;
    $self->{__PACKAGES}{'Description'} = Bio::MAGE::Description->new();
  }
  return $self->{__PACKAGES}{'Description'};
}


=item $pkg_obj = $mage->getMeasurement_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::Measurement> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getMeasurement_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'Measurement'}) {
    eval "require Bio::MAGE::Measurement";
    die "Couldn't require Bio::MAGE::Measurement"
      if $@;
    $self->{__PACKAGES}{'Measurement'} = Bio::MAGE::Measurement->new();
  }
  return $self->{__PACKAGES}{'Measurement'};
}


=item $pkg_obj = $mage->getBQS_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::BQS> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBQS_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'BQS'}) {
    eval "require Bio::MAGE::BQS";
    die "Couldn't require Bio::MAGE::BQS"
      if $@;
    $self->{__PACKAGES}{'BQS'} = Bio::MAGE::BQS->new();
  }
  return $self->{__PACKAGES}{'BQS'};
}


=item $pkg_obj = $mage->getBioEvent_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::BioEvent> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioEvent_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'BioEvent'}) {
    eval "require Bio::MAGE::BioEvent";
    die "Couldn't require Bio::MAGE::BioEvent"
      if $@;
    $self->{__PACKAGES}{'BioEvent'} = Bio::MAGE::BioEvent->new();
  }
  return $self->{__PACKAGES}{'BioEvent'};
}


=item $pkg_obj = $mage->getProtocol_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::Protocol> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getProtocol_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'Protocol'}) {
    eval "require Bio::MAGE::Protocol";
    die "Couldn't require Bio::MAGE::Protocol"
      if $@;
    $self->{__PACKAGES}{'Protocol'} = Bio::MAGE::Protocol->new();
  }
  return $self->{__PACKAGES}{'Protocol'};
}


=item $pkg_obj = $mage->getBioMaterial_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::BioMaterial> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioMaterial_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'BioMaterial'}) {
    eval "require Bio::MAGE::BioMaterial";
    die "Couldn't require Bio::MAGE::BioMaterial"
      if $@;
    $self->{__PACKAGES}{'BioMaterial'} = Bio::MAGE::BioMaterial->new();
  }
  return $self->{__PACKAGES}{'BioMaterial'};
}


=item $pkg_obj = $mage->getBioSequence_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::BioSequence> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioSequence_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'BioSequence'}) {
    eval "require Bio::MAGE::BioSequence";
    die "Couldn't require Bio::MAGE::BioSequence"
      if $@;
    $self->{__PACKAGES}{'BioSequence'} = Bio::MAGE::BioSequence->new();
  }
  return $self->{__PACKAGES}{'BioSequence'};
}


=item $pkg_obj = $mage->getDesignElement_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::DesignElement> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getDesignElement_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'DesignElement'}) {
    eval "require Bio::MAGE::DesignElement";
    die "Couldn't require Bio::MAGE::DesignElement"
      if $@;
    $self->{__PACKAGES}{'DesignElement'} = Bio::MAGE::DesignElement->new();
  }
  return $self->{__PACKAGES}{'DesignElement'};
}


=item $pkg_obj = $mage->getArrayDesign_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::ArrayDesign> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getArrayDesign_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'ArrayDesign'}) {
    eval "require Bio::MAGE::ArrayDesign";
    die "Couldn't require Bio::MAGE::ArrayDesign"
      if $@;
    $self->{__PACKAGES}{'ArrayDesign'} = Bio::MAGE::ArrayDesign->new();
  }
  return $self->{__PACKAGES}{'ArrayDesign'};
}


=item $pkg_obj = $mage->getArray_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::Array> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getArray_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'Array'}) {
    eval "require Bio::MAGE::Array";
    die "Couldn't require Bio::MAGE::Array"
      if $@;
    $self->{__PACKAGES}{'Array'} = Bio::MAGE::Array->new();
  }
  return $self->{__PACKAGES}{'Array'};
}


=item $pkg_obj = $mage->getBioAssay_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::BioAssay> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioAssay_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'BioAssay'}) {
    eval "require Bio::MAGE::BioAssay";
    die "Couldn't require Bio::MAGE::BioAssay"
      if $@;
    $self->{__PACKAGES}{'BioAssay'} = Bio::MAGE::BioAssay->new();
  }
  return $self->{__PACKAGES}{'BioAssay'};
}


=item $pkg_obj = $mage->getQuantitationType_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::QuantitationType> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getQuantitationType_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'QuantitationType'}) {
    eval "require Bio::MAGE::QuantitationType";
    die "Couldn't require Bio::MAGE::QuantitationType"
      if $@;
    $self->{__PACKAGES}{'QuantitationType'} = Bio::MAGE::QuantitationType->new();
  }
  return $self->{__PACKAGES}{'QuantitationType'};
}


=item $pkg_obj = $mage->getBioAssayData_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::BioAssayData> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioAssayData_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'BioAssayData'}) {
    eval "require Bio::MAGE::BioAssayData";
    die "Couldn't require Bio::MAGE::BioAssayData"
      if $@;
    $self->{__PACKAGES}{'BioAssayData'} = Bio::MAGE::BioAssayData->new();
  }
  return $self->{__PACKAGES}{'BioAssayData'};
}


=item $pkg_obj = $mage->getExperiment_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::Experiment> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getExperiment_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'Experiment'}) {
    eval "require Bio::MAGE::Experiment";
    die "Couldn't require Bio::MAGE::Experiment"
      if $@;
    $self->{__PACKAGES}{'Experiment'} = Bio::MAGE::Experiment->new();
  }
  return $self->{__PACKAGES}{'Experiment'};
}


=item $pkg_obj = $mage->getHigherLevelAnalysis_package()

This method manages the handling of the singleton class object for the
C<Bio::MAGE::HigherLevelAnalysis> class. When called it will return
the object, creating one if it has not already been created.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getHigherLevelAnalysis_package {
  my $self = shift;
  if (not exists $self->{__PACKAGES}{'HigherLevelAnalysis'}) {
    eval "require Bio::MAGE::HigherLevelAnalysis";
    die "Couldn't require Bio::MAGE::HigherLevelAnalysis"
      if $@;
    $self->{__PACKAGES}{'HigherLevelAnalysis'} = Bio::MAGE::HigherLevelAnalysis->new();
  }
  return $self->{__PACKAGES}{'HigherLevelAnalysis'};
}



#
# code for new() inherited from Base.pm
#

=item $obj->set_slots(%parameters)

=item $obj->set_slots(\@name_list, \@value_list)

The C<set_slots()> method is used to set a number of slots at the same
time. It has two different invocation methods. The first takes a named
parameter list, and the second takes two array references.

B<Return value>: none

B<Side effects>: will call C<croak()> if a slot_name is used that the class
does not define.

=cut

#
# code for set_slots() inherited from Base.pm
#

=item $obj->get_slots(@name_list)

The C<get_slots()> method is used to get the values of a number of
slots at the same time.

B<Return value>: a list of instance objects

B<Side effects>: none

=cut

#
# code for get_slots() inherited from Base.pm
#

=item $val = $obj->set_slot($name,$val)

The C<set_slot()> method sets the slot C<$name> to the value C<$val>

B<Return value>: the new value of the slot, i.e. C<$val>

B<Side effects>: none

=cut

#
# code for set_slot() inherited from Base.pm
#

=item $val = $obj->get_slot($name)

The C<get_slot()> method is used to get the values of a number of
slots at the same time.

B<Return value>: a single slot value, or undef if the slot has not been
initialized.

B<Side effects>: none

=cut

#
# code for get_slot() inherited from Base.pm
#

=item @names = $obj->get_slot_names()

The C<get_slot_names()> method is used to retrieve the name of all
slots defined for a given object.

B<Return value>: a single slot value, or undef if the slot has not been
initialized.

B<Side effects>: none

=cut

#
# code for get_slot_names() inherited from Base.pm
#




=item $val = $mage->objects()

=item $val = $mage->objects($val)

This is the unified setter/getter method for the objects slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the objects
slot

Side effects: none

Exceptions: none

=cut

sub objects {
  my $self = shift;
  if (@_) {
    $self->{__OBJECTS} = shift;
  }
  return $self->{__OBJECTS};
}

=item $val = $mage->tagname()

=item $val = $mage->tagname($val)

This is the unified setter/getter method for the tagname slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the tagname
slot

Side effects: none

Exceptions: none

=cut

sub tagname {
  my $self = shift;
  if (@_) {
    $self->{__TAGNAME} = shift;
  }
  return $self->{__TAGNAME};
}

=item $val = $mage->identifier()

=item $val = $mage->identifier($val)

This is the unified setter/getter method for the identifier slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the identifier
slot

Side effects: none

Exceptions: none

=cut

sub identifier {
  my $self = shift;
  if (@_) {
    $self->{__IDENTIFIER} = shift;
  }
  return $self->{__IDENTIFIER};
}

=item $val = $mage->registered_objects()

=item $val = $mage->registered_objects($val)

This is the unified setter/getter method for the registered_objects slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the registered_objects
slot

Side effects: none

Exceptions: none

=cut

sub registered_objects {
  my $self = shift;
  if (@_) {
    $self->{__REGISTERED_OBJECTS} = shift;
  }
  return $self->{__REGISTERED_OBJECTS};
}

=item $val = $mage->identifiers()

=item $val = $mage->identifiers($val)

This is the unified setter/getter method for the identifiers slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the identifiers
slot

Side effects: none

Exceptions: none

=cut

sub identifiers {
  my $self = shift;
  if (@_) {
    $self->{__IDENTIFIERS} = shift;
  }
  return $self->{__IDENTIFIERS};
}

=item $val = $mage->packages()

=item $val = $mage->packages($val)

This is the unified setter/getter method for the packages slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the packages
slot

Side effects: none

Exceptions: none

=cut

sub packages {
  my $self = shift;
  if (@_) {
    $self->{__PACKAGES} = shift;
  }
  return $self->{__PACKAGES};
}




=back

=cut

sub obj2mageml {
  my ($self,$writer) = @_;

  # now get the MAGE specific stuff out
  my $identifier = $self->identifier();
  croak "Bio::MAGE::obj2mageml: Identifier not specified for topmost level object"
    unless defined $identifier;
  my @attrs;
  if (defined $identifier) {
    push(@attrs,identifier=>$identifier);
  }
  my $empty = 0;
  my $tag = $self->tagname();
  $writer->write_start_tag($tag,$empty,@attrs);

  my %packages = %{$self->packages()};
  foreach my $package ($self->mageml_packages()) {
    next unless exists $packages{$package};
    my $pkg_obj = $packages{$package};
    $pkg_obj->obj2mageml($writer);
  }

  # and we're done
  $writer->write_end_tag($tag);

}


###############################################################################
# obj2database: Method to serialize an object to a relational database
###############################################################################
sub obj2database {
  my ($self,$writer) = @_;

  # now get the MAGE specific stuff out
  my $identifier = $self->identifier();
  die "Bio::MAGE: Identifier not specified"
    unless defined $identifier;
  my @attrs;
  if (defined $identifier) {
    push(@attrs,identifier=>$identifier);
  }
  my $empty = 0;
  my $tag = $self->tagname();
  #$writer->write_start_tag($tag,$empty,@attrs);

  my %packages = %{$self->packages()};
  foreach my $package ($self->mageml_packages()) {
    next unless exists $packages{$package};
    my $pkg_obj = $packages{$package};
    $pkg_obj->obj2database($writer);
  }

  # and we're done
  #$writer->write_end_tag($tag);

}


sub register {
  my ($self,$obj,$register) = @_;

  # to avoid circular references keep track of objectst that
  # we have already or are in the process of registering
  #
  # This method has one shortcoming - that if someone registers the
  # object, then modifies an attribute/association and adds the object
  # again, it will not be added, even though one could argue that it
  # should.

  my $registered = $self->registered_objects();
  return if $registered->{$obj};
  $registered->{$obj}++;

  # objects only register themselves if they are Identifiable
  # and we have been told to register them
  my $known_identifiers = $self->identifiers();
  if ($register and $obj->isa('Bio::MAGE::Identifiable')) {
    die "Object must have identifier: $obj"
      unless $obj->getIdentifier();
    unless (exists $known_identifiers->{$obj->getIdentifier}) {
      my $packages = $self->packages();
      my $package_name = $obj->package();
      my $pkg_obj = $packages->{$package_name};
      unless (defined $pkg_obj) {
	# we only create the package objects if we need them
	# register is the first time they will be needed
	my $class = "Bio::MAGE::$package_name";
	$pkg_obj = $class->new();
	$packages->{$package_name} = $pkg_obj;
      }
      $pkg_obj->register($obj);
      $known_identifiers->{$obj->getIdentifier}++;
    }
  }

  # regardless, they must enable their sub objects to register themselves
  my %assns_hash = $obj->associations();
  foreach my $association ($obj->association_methods()) {
    # do not register objects that are references
    my $association_obj;
    {
      no strict 'refs';
      my $assoc_name = 'get' . ucfirst($association);
      $association_obj = $obj->$assoc_name();
    }
    next unless defined $association_obj;

    # we need to know what kind of an association this is
    # if it is an aggregate association then it doesn't matter
    # if the object is Identifiable or not, we don't want to
    # register it, but we still want to register it's sub-objects
    # so we need to alert register()
    #
    # to decide if the association is aggregate, we look at
    # the 'self' end of the association
    my $register = $assns_hash{$association}->self->is_ref();

    # register a list of sub objects or a single one
    if ($assns_hash{$association}->other->cardinality() eq "0..N" or
        $assns_hash{$association}->other->cardinality() eq "1..N") {
      if (ref($association_obj) =~ /ARRAY/) {
	foreach my $element (@$association_obj) {
	  $self->register($element,$register)
	    if defined $element;
	}
      } else {
	die "Expected array ref: $obj, association: $association, got $association_obj\n";
      }
    } else {
      $self->register($association_obj,$register)
	if defined $association_obj;
    }
  }
}


=head1 BUGS

Please send bug reports to mged-mage@lists.sf.net

=head1 AUTHOR

Jason E. Stewart (www.openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut


#
# End the module by returning a true value
#
1;

