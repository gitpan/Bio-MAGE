##############################
#
# Bio::MAGE::DesignElement::Feature
#
##############################
package Bio::MAGE::DesignElement::Feature;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::DesignElement;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::DesignElement::DesignElement Exporter);
$VERSION = q[$Id: Feature.pm,v 1.7 2002/10/13 21:56:08 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::DesignElement::Feature

=head2 SYNOPSIS

  use Bio::MAGE::DesignElement::Feature;

    # creating an empty instance
  my $feature = Bio::MAGE::DesignElement::Feature->new();

    # creating an already populated instance
  my $feature = Bio::MAGE::DesignElement::Feature->new(controlledFeatures=>$controlledFeatures_value,
			zone=>$zone_value,
			position=>$position_value,
			featureGroup=>$featureGroup_value,
			featureLocation=>$featureLocation_value,
			controlFeatures=>$controlFeatures_value);

    # setting and retrieving object associations
  my $controlledFeatures_val = $feature->controlledFeatures();
  $feature->controlledFeatures($value);

  my $zone_val = $feature->zone();
  $feature->zone($value);

  my $position_val = $feature->position();
  $feature->position($value);

  my $featureGroup_val = $feature->featureGroup();
  $feature->featureGroup($value);

  my $featureLocation_val = $feature->featureLocation();
  $feature->featureLocation($value);

  my $controlFeatures_val = $feature->controlFeatures();
  $feature->controlFeatures($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Feature> class:

An intended  position on an array.




=cut


=head2 INHERITANCE


Bio::MAGE::DesignElement::Feature has the following super classes

=over 


=item * Bio::MAGE::DesignElement::DesignElement


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::DesignElement::Feature->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * controlledFeatures

Sets the value of the controlledFeatures association (from C<Bio::MAGE::DesignElement::Feature>).


=item * zone

Sets the value of the zone association (from C<Bio::MAGE::DesignElement::Feature>).


=item * position

Sets the value of the position association (from C<Bio::MAGE::DesignElement::Feature>).


=item * featureGroup

Sets the value of the featureGroup association (from C<Bio::MAGE::DesignElement::Feature>).


=item * featureLocation

Sets the value of the featureLocation association (from C<Bio::MAGE::DesignElement::Feature>).


=item * controlFeatures

Sets the value of the controlFeatures association (from C<Bio::MAGE::DesignElement::Feature>).


=item * controlType

Sets the value of the controlType association (from C<Bio::MAGE::DesignElement::DesignElement>).


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

Returns the full class name for this class, Bio::MAGE::DesignElement::Feature.

=cut

sub class_name {
  return q[Bio::MAGE::DesignElement::Feature];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::DesignElement::Feature.

=cut

sub package {
  return q[DesignElement];
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
  my @list = ('Bio::MAGE::DesignElement::DesignElement');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ();
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
  my @list = ('controlledFeatures', 'zone', 'position', 'featureGroup', 'featureLocation', 'controlFeatures');
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

Bio::MAGE::DesignElement::Feature: has the following attribute accessor methods:

=over

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
          'controlFeatures',
          bless( {
                   '__NAME' => 'controlFeatures',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Feature',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Associates features with their control features.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'controlledFeatures',
          bless( {
                   '__NAME' => 'controlledFeatures',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Feature',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Associates features with their control features.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'position',
          bless( {
                   '__NAME' => 'position',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'Position',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The position of the feature on the array, relative to the top, left corner.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'zone',
          bless( {
                   '__NAME' => 'zone',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'Zone',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'A reference to the zone this feature is in.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'featureLocation',
          bless( {
                   '__NAME' => 'featureLocation',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'FeatureLocation',
                   '__RANK' => '5',
                   '__DESCRIPTION' => 'Location of this feature relative to a grid.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'featureGroup',
          bless( {
                   '__NAME' => 'featureGroup',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'FeatureGroup',
                   '__RANK' => '6',
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

Bio::MAGE::DesignElement::Feature: has the following association accessor methods:

=over


=item controlledFeatures


From the MAGE-OM documentation for the C<controlledFeatures> association:

Associates features with their control features.



=over


=item $array_ref = $feature->setControlledFeatures($array_ref)

The restricted setter method for the controlledFeatures association.

Input parameters: the value to which the controlledFeatures association will be set : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Return value: the current value of the controlledFeatures association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::DesignElement::Feature> instances

=cut

sub setControlledFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::setControlledFeatures: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setControlledFeatures: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setControlledFeatures: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setControlledFeatures: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  }

  return $self->{__CONTROLLEDFEATURES} = $val;
}



=item $array_ref = $feature->getControlledFeatures()

The restricted getter method for the controlledFeatures association.

Input parameters: none

Return value: the current value of the controlledFeatures association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getControlledFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::getControlledFeatures: arguments passed to getter")
    if @_;
  return $self->{__CONTROLLEDFEATURES};
}



=item $feature->addControlledFeatures(@vals)

Because the controlledFeatures association has list cardinality, it may store more
than one value. This method adds the current list of objects in the controlledFeatures
association.

Input parameters: the list of values C<@vals> to add to the controlledFeatures
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::DesignElement::Feature>

=cut

sub addControlledFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::addControlledFeatures: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addControlledFeatures: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  }

  push(@{$self->{__CONTROLLEDFEATURES}},@vals);
}



=back


=item zone


From the MAGE-OM documentation for the C<zone> association:

A reference to the zone this feature is in.



=over


=item $val = $feature->setZone($val)

The restricted setter method for the zone association.

Input parameters: the value to which the zone association will be set : an instance of type C<Bio::MAGE::ArrayDesign::Zone>.

Return value: the current value of the zone association : an instance of type C<Bio::MAGE::ArrayDesign::Zone>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::ArrayDesign::Zone>

=cut

sub setZone {
  my $self = shift;
  croak(__PACKAGE__ . "::setZone: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setZone: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setZone: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::Zone") unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::Zone');
  return $self->{__ZONE} = $val;
}



=item $val = $feature->getZone()

The restricted getter method for the zone association.

Input parameters: none

Return value: the current value of the zone association : an instance of type C<Bio::MAGE::ArrayDesign::Zone>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getZone {
  my $self = shift;
  croak(__PACKAGE__ . "::getZone: arguments passed to getter")
    if @_;
  return $self->{__ZONE};
}




=back


=item position


From the MAGE-OM documentation for the C<position> association:

The position of the feature on the array, relative to the top, left corner.



=over


=item $val = $feature->setPosition($val)

The restricted setter method for the position association.

Input parameters: the value to which the position association will be set : an instance of type C<Bio::MAGE::DesignElement::Position>.

Return value: the current value of the position association : an instance of type C<Bio::MAGE::DesignElement::Position>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::DesignElement::Position>

=cut

sub setPosition {
  my $self = shift;
  croak(__PACKAGE__ . "::setPosition: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPosition: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setPosition: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Position") unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Position');
  return $self->{__POSITION} = $val;
}



=item $val = $feature->getPosition()

The restricted getter method for the position association.

Input parameters: none

Return value: the current value of the position association : an instance of type C<Bio::MAGE::DesignElement::Position>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPosition {
  my $self = shift;
  croak(__PACKAGE__ . "::getPosition: arguments passed to getter")
    if @_;
  return $self->{__POSITION};
}




=back


=item featureGroup


From the MAGE-OM documentation for the C<featureGroup> association:

The features that belong to this group.



=over


=item $val = $feature->setFeatureGroup($val)

The restricted setter method for the featureGroup association.

Input parameters: the value to which the featureGroup association will be set : an instance of type C<Bio::MAGE::ArrayDesign::FeatureGroup>.

Return value: the current value of the featureGroup association : an instance of type C<Bio::MAGE::ArrayDesign::FeatureGroup>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::ArrayDesign::FeatureGroup>

=cut

sub setFeatureGroup {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureGroup: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureGroup: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setFeatureGroup: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::FeatureGroup") unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::FeatureGroup');
  return $self->{__FEATUREGROUP} = $val;
}



=item $val = $feature->getFeatureGroup()

The restricted getter method for the featureGroup association.

Input parameters: none

Return value: the current value of the featureGroup association : an instance of type C<Bio::MAGE::ArrayDesign::FeatureGroup>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureGroup {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureGroup: arguments passed to getter")
    if @_;
  return $self->{__FEATUREGROUP};
}




=back


=item featureLocation


From the MAGE-OM documentation for the C<featureLocation> association:

Location of this feature relative to a grid.



=over


=item $val = $feature->setFeatureLocation($val)

The restricted setter method for the featureLocation association.

Input parameters: the value to which the featureLocation association will be set : an instance of type C<Bio::MAGE::DesignElement::FeatureLocation>.

Return value: the current value of the featureLocation association : an instance of type C<Bio::MAGE::DesignElement::FeatureLocation>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::DesignElement::FeatureLocation>

=cut

sub setFeatureLocation {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureLocation: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureLocation: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setFeatureLocation: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::FeatureLocation") unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::FeatureLocation');
  return $self->{__FEATURELOCATION} = $val;
}



=item $val = $feature->getFeatureLocation()

The restricted getter method for the featureLocation association.

Input parameters: none

Return value: the current value of the featureLocation association : an instance of type C<Bio::MAGE::DesignElement::FeatureLocation>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureLocation {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureLocation: arguments passed to getter")
    if @_;
  return $self->{__FEATURELOCATION};
}




=back


=item controlFeatures


From the MAGE-OM documentation for the C<controlFeatures> association:

Associates features with their control features.



=over


=item $array_ref = $feature->setControlFeatures($array_ref)

The restricted setter method for the controlFeatures association.

Input parameters: the value to which the controlFeatures association will be set : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Return value: the current value of the controlFeatures association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::DesignElement::Feature> instances

=cut

sub setControlFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::setControlFeatures: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setControlFeatures: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setControlFeatures: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setControlFeatures: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  }

  return $self->{__CONTROLFEATURES} = $val;
}



=item $array_ref = $feature->getControlFeatures()

The restricted getter method for the controlFeatures association.

Input parameters: none

Return value: the current value of the controlFeatures association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::Feature>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getControlFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::getControlFeatures: arguments passed to getter")
    if @_;
  return $self->{__CONTROLFEATURES};
}



=item $feature->addControlFeatures(@vals)

Because the controlFeatures association has list cardinality, it may store more
than one value. This method adds the current list of objects in the controlFeatures
association.

Input parameters: the list of values C<@vals> to add to the controlFeatures
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::DesignElement::Feature>

=cut

sub addControlFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::addControlFeatures: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addControlFeatures: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  }

  push(@{$self->{__CONTROLFEATURES}},@vals);
}



=back

Associations Inherited from Bio::MAGE::DesignElement::DesignElement


=item controlType


From the MAGE-OM documentation for the C<controlType> association:

If the design element represents a control, the type of control it is (normalization, deletion, negative, positive, etc.)



=over


=item $val = $designelement->setControlType($val)

The restricted setter method for the controlType association.

Input parameters: the value to which the controlType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the controlType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut


=item $val = $designelement->getControlType()

The restricted getter method for the controlType association.

Input parameters: none

Return value: the current value of the controlType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

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

