##############################
#
# Bio::MAGE::ArrayDesign::FeatureGroup
#
##############################
package Bio::MAGE::ArrayDesign::FeatureGroup;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::ArrayDesign::DesignElementGroup;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::ArrayDesign::DesignElementGroup Exporter);
$VERSION = q[$Id: FeatureGroup.pm,v 1.4 2002/08/24 16:12:12 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::ArrayDesign::FeatureGroup

=head2 SYNOPSIS

  use Bio::MAGE::ArrayDesign::FeatureGroup;

    # creating an empty instance
  my $featuregroup = Bio::MAGE::ArrayDesign::FeatureGroup->new();

    # creating an already populated instance
  my $featuregroup = Bio::MAGE::ArrayDesign::FeatureGroup->new(featureLength=>$featureLength_value,
			featureWidth=>$featureWidth_value,
			featureHeight=>$featureHeight_value,
			featureShape=>$featureShape_value,
			features=>$features_value,
			distanceUnit=>$distanceUnit_value,
			technologyType=>$technologyType_value);

    # setting and retrieving object attributes
  my $featureLength_val = $featuregroup->featureLength();
  $featuregroup->featureLength($value);

  my $featureWidth_val = $featuregroup->featureWidth();
  $featuregroup->featureWidth($value);

  my $featureHeight_val = $featuregroup->featureHeight();
  $featuregroup->featureHeight($value);

    # setting and retrieving object associations
  my $featureShape_val = $featuregroup->featureShape();
  $featuregroup->featureShape($value);

  my $features_val = $featuregroup->features();
  $featuregroup->features($value);

  my $distanceUnit_val = $featuregroup->distanceUnit();
  $featuregroup->distanceUnit($value);

  my $technologyType_val = $featuregroup->technologyType();
  $featuregroup->technologyType($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<FeatureGroup> class:

A collection of like features.



=cut


=head2 INHERITANCE


Bio::MAGE::ArrayDesign::FeatureGroup has the following super classes

=over 


=item * Bio::MAGE::ArrayDesign::DesignElementGroup


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::ArrayDesign::FeatureGroup->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * featureLength

Sets the value of the featureLength attribute (from C<Bio::MAGE::ArrayDesign::FeatureGroup>).


=item * featureWidth

Sets the value of the featureWidth attribute (from C<Bio::MAGE::ArrayDesign::FeatureGroup>).


=item * featureHeight

Sets the value of the featureHeight attribute (from C<Bio::MAGE::ArrayDesign::FeatureGroup>).


=item * featureShape

Sets the value of the featureShape association (from C<Bio::MAGE::ArrayDesign::FeatureGroup>).


=item * features

Sets the value of the features association (from C<Bio::MAGE::ArrayDesign::FeatureGroup>).


=item * distanceUnit

Sets the value of the distanceUnit association (from C<Bio::MAGE::ArrayDesign::FeatureGroup>).


=item * technologyType

Sets the value of the technologyType association (from C<Bio::MAGE::ArrayDesign::FeatureGroup>).


=item * species

Sets the value of the species association (from C<Bio::MAGE::ArrayDesign::DesignElementGroup>).


=item * types

Sets the value of the types association (from C<Bio::MAGE::ArrayDesign::DesignElementGroup>).


=item * identifier

Sets the value of the identifier attribute (from C<Bio::MAGE::Identifiable>).


=item * name

Sets the value of the name attribute (from C<Bio::MAGE::Identifiable>).


=item * security

Sets the value of the security association (from C<Bio::MAGE::Describable>).


=item * auditTrail

Sets the value of the auditTrail association (from C<Bio::MAGE::Describable>).


=item * descriptions

Sets the value of the descriptions association (from C<Bio::MAGE::Describable>).


=item * propertySets

Sets the value of the propertySets association (from C<Bio::MAGE::Extendable>).


=back



=cut

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



=item $name = class_name()

Returns the full class name for this class, Bio::MAGE::ArrayDesign::FeatureGroup.

=cut

sub class_name {
  return q[Bio::MAGE::ArrayDesign::FeatureGroup];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::ArrayDesign::FeatureGroup.

=cut

sub package {
  return q[ArrayDesign];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ();
  return @list;
}

=item @classes = superclasses()

returns the list of superclasses for this class.

=cut

sub superclasses {
  my @list = ('Bio::MAGE::ArrayDesign::DesignElementGroup');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('featureLength', 'featureWidth', 'featureHeight');
  if ($class->superclasses()) {
    foreach ($class->superclasses()) {
      push(@list,$_->attribute_methods());
    }
  }
  return @list;
}

=item @methods = association_methods()

returns the list of association accessor methods for this class.

=cut

sub association_methods {
  my $class = shift;
  my @list = ('featureShape', 'features', 'distanceUnit', 'technologyType');
  if ($class->superclasses()) {
    foreach ($class->superclasses()) {
      push(@list,$_->association_methods());
    }
  }
  return @list;
}

=item %assns = associations()

returns the association meta-information in a hash where the keys are
the association names and the values are C<Bio::MAGE::Association>
objects that provide the meta-information for the association.

=cut

sub associations {
  my $class = shift;
  my @list = ();
  # superclasses first
  if ($class->superclasses()) {
    foreach ($class->superclasses()) {
      push(@list,$_->associations());
    }
  }
  # then associations from this class
  if (defined $__ASSOCIATIONS) {
    push(@list,@{$__ASSOCIATIONS})
  }
  return @list;
}


=head2 ATTRIBUTES

Attributes are simple data types that belong to a single instance of a
class. In the Perl implementation of the MAGE-OM classes, the
interface to attributes is implemented using separate setter and
getter methods for each attribute.

Bio::MAGE::ArrayDesign::FeatureGroup: has the following attribute accessor methods:

=over


=item featureLength

From the MAGE-OM documentation for the C<featureLength> attribute:

The length of the feature.



=over


=item $val = $featuregroup->setFeatureLength($val)

The restricted setter method for the featureLength attribute.

Input parameters: the value to which the featureLength attribute will be set 

Return value: the current value of the featureLength attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setFeatureLength {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureLength: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureLength: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__FEATURELENGTH} = $val;
}



=item $val = $featuregroup->getFeatureLength()

The restricted getter method for the featureLength attribute.

Input parameters: none

Return value: the current value of the featureLength attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureLength {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureLength: arguments passed to getter")
    if @_;
  return $self->{__FEATURELENGTH};
}




=back


=item featureWidth

From the MAGE-OM documentation for the C<featureWidth> attribute:

The width of the feature.



=over


=item $val = $featuregroup->setFeatureWidth($val)

The restricted setter method for the featureWidth attribute.

Input parameters: the value to which the featureWidth attribute will be set 

Return value: the current value of the featureWidth attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setFeatureWidth {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureWidth: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureWidth: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__FEATUREWIDTH} = $val;
}



=item $val = $featuregroup->getFeatureWidth()

The restricted getter method for the featureWidth attribute.

Input parameters: none

Return value: the current value of the featureWidth attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureWidth {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureWidth: arguments passed to getter")
    if @_;
  return $self->{__FEATUREWIDTH};
}




=back


=item featureHeight

From the MAGE-OM documentation for the C<featureHeight> attribute:

The height of the feature.



=over


=item $val = $featuregroup->setFeatureHeight($val)

The restricted setter method for the featureHeight attribute.

Input parameters: the value to which the featureHeight attribute will be set 

Return value: the current value of the featureHeight attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setFeatureHeight {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureHeight: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureHeight: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__FEATUREHEIGHT} = $val;
}



=item $val = $featuregroup->getFeatureHeight()

The restricted getter method for the featureHeight attribute.

Input parameters: none

Return value: the current value of the featureHeight attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureHeight {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureHeight: arguments passed to getter")
    if @_;
  return $self->{__FEATUREHEIGHT};
}




=back

Attributes Inherited from Bio::MAGE::Identifiable


=item identifier

From the MAGE-OM documentation for the C<identifier> attribute:

An identifier is an unambiguous string that is unique within the scope (i.e. a document, a set of related documents, or a repository) of its use.



=over


=item $val = $identifiable->setIdentifier($val)

The restricted setter method for the identifier attribute.

Input parameters: the value to which the identifier attribute will be set 

Return value: the current value of the identifier attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $identifiable->getIdentifier()

The restricted getter method for the identifier attribute.

Input parameters: none

Return value: the current value of the identifier attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back


=item name

From the MAGE-OM documentation for the C<name> attribute:

The potentially ambiguous common identifier.



=over


=item $val = $identifiable->setName($val)

The restricted setter method for the name attribute.

Input parameters: the value to which the name attribute will be set 

Return value: the current value of the name attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $identifiable->getName()

The restricted getter method for the name attribute.

Input parameters: none

Return value: the current value of the name attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'technologyType',
          bless( {
                   '__NAME' => 'technologyType',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The technology type of this design.  By specifying a technology type, higher level analysis can use appropriate algorithms to compare the results from multiple arrays.  The technology type may be spotted cDNA or in situ photolithography.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'featureShape',
          bless( {
                   '__NAME' => 'featureShape',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The expected shape of the feature on the array: circular, oval, square, etc.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'distanceUnit',
          bless( {
                   '__NAME' => 'distanceUnit',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'DistanceUnit',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The unit for the feature measures.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'features',
          bless( {
                   '__NAME' => 'features',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1..N',
                   '__CLASS_NAME' => 'Feature',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'The features that belong to this group.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' )
        ]

}

=head2 ASSOCIATIONS

Associations are references to other class objects which can be shared
by multiple class instances at the same time. In the Perl
implementation of MAGE-OM classes, associations are implemented using
three separate methods:

=over

=item get*

Retrieves the current value. If the association has list cardinality,
an array reference is returned.

=item set*

Sets the current value B<replacing> any existing value. If the
association has list cardinality, the argument must be an array
reference. Unless you know what you are doing, you probably should be
using the add* methods.

=item add*

This method exists only for associations with list cardinality. It
appends a list of objects to any values that may already be stored in
the association.

=back

Bio::MAGE::ArrayDesign::FeatureGroup: has the following association accessor methods:

=over


=item featureShape


From the MAGE-OM documentation for the C<featureShape> association:

The expected shape of the feature on the array: circular, oval, square, etc.



=over


=item $val = $featuregroup->setFeatureShape($val)

The restricted setter method for the featureShape association.

Input parameters: the value to which the featureShape association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the featureShape association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setFeatureShape {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureShape: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureShape: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setFeatureShape: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__FEATURESHAPE} = $val;
}



=item $val = $featuregroup->getFeatureShape()

The restricted getter method for the featureShape association.

Input parameters: none

Return value: the current value of the featureShape association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureShape {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureShape: arguments passed to getter")
    if @_;
  return $self->{__FEATURESHAPE};
}




=back


=item features


From the MAGE-OM documentation for the C<features> association:

The features that belong to this group.



=over


=item $array_ref = $featuregroup->setFeatures($array_ref)

The restricted setter method for the features association.

Input parameters: the value to which the features association will be set : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Return value: the current value of the features association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::DesignElement::Feature> instances

=cut

sub setFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatures: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatures: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFeatures: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setFeatures: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  }

  return $self->{__FEATURES} = $val;
}



=item $array_ref = $featuregroup->getFeatures()

The restricted getter method for the features association.

Input parameters: none

Return value: the current value of the features association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatures: arguments passed to getter")
    if @_;
  return $self->{__FEATURES};
}



=item $featuregroup->addFeatures(@vals)

Because the features association has list cardinality, it may store more
than one value. This method adds the current list of objects in the features
association.

Input parameters: the list of values C<@vals> to add to the features
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::DesignElement::Feature>

=cut

sub addFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::addFeatures: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFeatures: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  }

  push(@{$self->{__FEATURES}},@vals);
}



=back


=item distanceUnit


From the MAGE-OM documentation for the C<distanceUnit> association:

The unit for the feature measures.



=over


=item $val = $featuregroup->setDistanceUnit($val)

The restricted setter method for the distanceUnit association.

Input parameters: the value to which the distanceUnit association will be set : an instance of type C<Bio::MAGE::Measurement::DistanceUnit>.

Return value: the current value of the distanceUnit association : an instance of type C<Bio::MAGE::Measurement::DistanceUnit>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Measurement::DistanceUnit>

=cut

sub setDistanceUnit {
  my $self = shift;
  croak(__PACKAGE__ . "::setDistanceUnit: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDistanceUnit: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setDistanceUnit: wrong type: " . ref($val) . " expected Bio::MAGE::Measurement::DistanceUnit") unless UNIVERSAL::isa($val,'Bio::MAGE::Measurement::DistanceUnit');
  return $self->{__DISTANCEUNIT} = $val;
}



=item $val = $featuregroup->getDistanceUnit()

The restricted getter method for the distanceUnit association.

Input parameters: none

Return value: the current value of the distanceUnit association : an instance of type C<Bio::MAGE::Measurement::DistanceUnit>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDistanceUnit {
  my $self = shift;
  croak(__PACKAGE__ . "::getDistanceUnit: arguments passed to getter")
    if @_;
  return $self->{__DISTANCEUNIT};
}




=back


=item technologyType


From the MAGE-OM documentation for the C<technologyType> association:

The technology type of this design.  By specifying a technology type, higher level analysis can use appropriate algorithms to compare the results from multiple arrays.  The technology type may be spotted cDNA or in situ photolithography.



=over


=item $val = $featuregroup->setTechnologyType($val)

The restricted setter method for the technologyType association.

Input parameters: the value to which the technologyType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the technologyType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setTechnologyType {
  my $self = shift;
  croak(__PACKAGE__ . "::setTechnologyType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setTechnologyType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setTechnologyType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__TECHNOLOGYTYPE} = $val;
}



=item $val = $featuregroup->getTechnologyType()

The restricted getter method for the technologyType association.

Input parameters: none

Return value: the current value of the technologyType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getTechnologyType {
  my $self = shift;
  croak(__PACKAGE__ . "::getTechnologyType: arguments passed to getter")
    if @_;
  return $self->{__TECHNOLOGYTYPE};
}




=back

Associations Inherited from Bio::MAGE::ArrayDesign::DesignElementGroup


=item species


From the MAGE-OM documentation for the C<species> association:

The organism from which the biosequences of this group are from.



=over


=item $val = $designelementgroup->setSpecies($val)

The restricted setter method for the species association.

Input parameters: the value to which the species association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the species association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut


=item $val = $designelementgroup->getSpecies()

The restricted getter method for the species association.

Input parameters: none

Return value: the current value of the species association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back


=item types


From the MAGE-OM documentation for the C<types> association:

The specific type of a feature, reporter, or composite.  A composite type might be a gene while a reporter type might be a cDNA clone or an oligo.



=over


=item $array_ref = $designelementgroup->setTypes($array_ref)

The restricted setter method for the types association.

Input parameters: the value to which the types association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the types association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut


=item $array_ref = $designelementgroup->getTypes()

The restricted getter method for the types association.

Input parameters: none

Return value: the current value of the types association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $designelementgroup->addTypes(@vals)

Because the types association has list cardinality, it may store more
than one value. This method adds the current list of objects in the types
association.

Input parameters: the list of values C<@vals> to add to the types
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut



=back

Associations Inherited from Bio::MAGE::Describable


=item security


From the MAGE-OM documentation for the C<security> association:

Information on the security for the instance of the class.



=over


=item $val = $describable->setSecurity($val)

The restricted setter method for the security association.

Input parameters: the value to which the security association will be set : an instance of type C<Bio::MAGE::AuditAndSecurity::Security>.

Return value: the current value of the security association : an instance of type C<Bio::MAGE::AuditAndSecurity::Security>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::AuditAndSecurity::Security>

=cut


=item $val = $describable->getSecurity()

The restricted getter method for the security association.

Input parameters: none

Return value: the current value of the security association : an instance of type C<Bio::MAGE::AuditAndSecurity::Security>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back


=item auditTrail


From the MAGE-OM documentation for the C<auditTrail> association:

A list of Audit instances that track changes to the instance of Describable.



=over


=item $array_ref = $describable->setAuditTrail($array_ref)

The restricted setter method for the auditTrail association.

Input parameters: the value to which the auditTrail association will be set : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Return value: the current value of the auditTrail association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::AuditAndSecurity::Audit> instances

=cut


=item $array_ref = $describable->getAuditTrail()

The restricted getter method for the auditTrail association.

Input parameters: none

Return value: the current value of the auditTrail association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $describable->addAuditTrail(@vals)

Because the auditTrail association has list cardinality, it may store more
than one value. This method adds the current list of objects in the auditTrail
association.

Input parameters: the list of values C<@vals> to add to the auditTrail
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::AuditAndSecurity::Audit>

=cut



=back


=item descriptions


From the MAGE-OM documentation for the C<descriptions> association:

Free hand text descriptions.  Makes available the associations of Description to an instance of Describable.



=over


=item $array_ref = $describable->setDescriptions($array_ref)

The restricted setter method for the descriptions association.

Input parameters: the value to which the descriptions association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Return value: the current value of the descriptions association : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::Description> instances

=cut


=item $array_ref = $describable->getDescriptions()

The restricted getter method for the descriptions association.

Input parameters: none

Return value: the current value of the descriptions association : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $describable->addDescriptions(@vals)

Because the descriptions association has list cardinality, it may store more
than one value. This method adds the current list of objects in the descriptions
association.

Input parameters: the list of values C<@vals> to add to the descriptions
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::Description>

=cut



=back

Associations Inherited from Bio::MAGE::Extendable


=item propertySets


From the MAGE-OM documentation for the C<propertySets> association:

Allows specification of name/value pairs.  Meant to primarily help in-house, pipeline processing of instances by providing a place for values that aren't part of the specification proper.



=over


=item $array_ref = $extendable->setPropertySets($array_ref)

The restricted setter method for the propertySets association.

Input parameters: the value to which the propertySets association will be set : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Return value: the current value of the propertySets association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::NameValueType> instances

=cut


=item $array_ref = $extendable->getPropertySets()

The restricted getter method for the propertySets association.

Input parameters: none

Return value: the current value of the propertySets association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $extendable->addPropertySets(@vals)

Because the propertySets association has list cardinality, it may store more
than one value. This method adds the current list of objects in the propertySets
association.

Input parameters: the list of values C<@vals> to add to the propertySets
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::NameValueType>

=cut



=back



=back


=cut



sub initialize {
  my $self = shift;
  return 1;
}



=head1 BUGS

Please send bug reports to mged-mage@lists.sf.net

=head1 AUTHOR

Jason E. Stewart (jason@openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut

#
# End the module by returning a true value
#
1;

