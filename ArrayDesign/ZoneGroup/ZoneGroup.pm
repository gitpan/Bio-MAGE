##############################
#
# Bio::MAGE::ArrayDesign::ZoneGroup
#
##############################
package Bio::MAGE::ArrayDesign::ZoneGroup;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = q[$Id: ZoneGroup.pm,v 1.4 2002/08/24 16:12:12 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::ArrayDesign::ZoneGroup

=head2 SYNOPSIS

  use Bio::MAGE::ArrayDesign::ZoneGroup;

    # creating an empty instance
  my $zonegroup = Bio::MAGE::ArrayDesign::ZoneGroup->new();

    # creating an already populated instance
  my $zonegroup = Bio::MAGE::ArrayDesign::ZoneGroup->new(zonesPerY=>$zonesPerY_value,
			zonesPerX=>$zonesPerX_value,
			spacingsBetweenZonesX=>$spacingsBetweenZonesX_value,
			spacingsBetweenZonesY=>$spacingsBetweenZonesY_value,
			zoneLayout=>$zoneLayout_value,
			distanceUnit=>$distanceUnit_value,
			zoneLocations=>$zoneLocations_value);

    # setting and retrieving object attributes
  my $zonesPerY_val = $zonegroup->zonesPerY();
  $zonegroup->zonesPerY($value);

  my $zonesPerX_val = $zonegroup->zonesPerX();
  $zonegroup->zonesPerX($value);

  my $spacingsBetweenZonesX_val = $zonegroup->spacingsBetweenZonesX();
  $zonegroup->spacingsBetweenZonesX($value);

  my $spacingsBetweenZonesY_val = $zonegroup->spacingsBetweenZonesY();
  $zonegroup->spacingsBetweenZonesY($value);

    # setting and retrieving object associations
  my $zoneLayout_val = $zonegroup->zoneLayout();
  $zonegroup->zoneLayout($value);

  my $distanceUnit_val = $zonegroup->distanceUnit();
  $zonegroup->distanceUnit($value);

  my $zoneLocations_val = $zonegroup->zoneLocations();
  $zonegroup->zoneLocations($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ZoneGroup> class:

Specifies a repeating area on an array.  This is useful for printing when the same pattern is repeated in a regular fashion.



=cut


=head2 INHERITANCE


Bio::MAGE::ArrayDesign::ZoneGroup has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::ArrayDesign::ZoneGroup->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * zonesPerY

Sets the value of the zonesPerY attribute (from C<Bio::MAGE::ArrayDesign::ZoneGroup>).


=item * zonesPerX

Sets the value of the zonesPerX attribute (from C<Bio::MAGE::ArrayDesign::ZoneGroup>).


=item * spacingsBetweenZonesX

Sets the value of the spacingsBetweenZonesX attribute (from C<Bio::MAGE::ArrayDesign::ZoneGroup>).


=item * spacingsBetweenZonesY

Sets the value of the spacingsBetweenZonesY attribute (from C<Bio::MAGE::ArrayDesign::ZoneGroup>).


=item * zoneLayout

Sets the value of the zoneLayout association (from C<Bio::MAGE::ArrayDesign::ZoneGroup>).


=item * distanceUnit

Sets the value of the distanceUnit association (from C<Bio::MAGE::ArrayDesign::ZoneGroup>).


=item * zoneLocations

Sets the value of the zoneLocations association (from C<Bio::MAGE::ArrayDesign::ZoneGroup>).


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

Returns the full class name for this class, Bio::MAGE::ArrayDesign::ZoneGroup.

=cut

sub class_name {
  return q[Bio::MAGE::ArrayDesign::ZoneGroup];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::ArrayDesign::ZoneGroup.

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
  my @list = ('Bio::MAGE::Extendable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('zonesPerY', 'zonesPerX', 'spacingsBetweenZonesX', 'spacingsBetweenZonesY');
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
  my @list = ('zoneLayout', 'distanceUnit', 'zoneLocations');
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

Bio::MAGE::ArrayDesign::ZoneGroup: has the following attribute accessor methods:

=over


=item zonesPerY

From the MAGE-OM documentation for the C<zonesPerY> attribute:

The number of zones on the y-axis.



=over


=item $val = $zonegroup->setZonesPerY($val)

The restricted setter method for the zonesPerY attribute.

Input parameters: the value to which the zonesPerY attribute will be set 

Return value: the current value of the zonesPerY attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setZonesPerY {
  my $self = shift;
  croak(__PACKAGE__ . "::setZonesPerY: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setZonesPerY: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ZONESPERY} = $val;
}



=item $val = $zonegroup->getZonesPerY()

The restricted getter method for the zonesPerY attribute.

Input parameters: none

Return value: the current value of the zonesPerY attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getZonesPerY {
  my $self = shift;
  croak(__PACKAGE__ . "::getZonesPerY: arguments passed to getter")
    if @_;
  return $self->{__ZONESPERY};
}




=back


=item zonesPerX

From the MAGE-OM documentation for the C<zonesPerX> attribute:

The number of zones on the x-axis.



=over


=item $val = $zonegroup->setZonesPerX($val)

The restricted setter method for the zonesPerX attribute.

Input parameters: the value to which the zonesPerX attribute will be set 

Return value: the current value of the zonesPerX attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setZonesPerX {
  my $self = shift;
  croak(__PACKAGE__ . "::setZonesPerX: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setZonesPerX: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ZONESPERX} = $val;
}



=item $val = $zonegroup->getZonesPerX()

The restricted getter method for the zonesPerX attribute.

Input parameters: none

Return value: the current value of the zonesPerX attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getZonesPerX {
  my $self = shift;
  croak(__PACKAGE__ . "::getZonesPerX: arguments passed to getter")
    if @_;
  return $self->{__ZONESPERX};
}




=back


=item spacingsBetweenZonesX

From the MAGE-OM documentation for the C<spacingsBetweenZonesX> attribute:

Spacing between zones, if applicable.



=over


=item $val = $zonegroup->setSpacingsBetweenZonesX($val)

The restricted setter method for the spacingsBetweenZonesX attribute.

Input parameters: the value to which the spacingsBetweenZonesX attribute will be set 

Return value: the current value of the spacingsBetweenZonesX attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setSpacingsBetweenZonesX {
  my $self = shift;
  croak(__PACKAGE__ . "::setSpacingsBetweenZonesX: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSpacingsBetweenZonesX: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__SPACINGSBETWEENZONESX} = $val;
}



=item $val = $zonegroup->getSpacingsBetweenZonesX()

The restricted getter method for the spacingsBetweenZonesX attribute.

Input parameters: none

Return value: the current value of the spacingsBetweenZonesX attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSpacingsBetweenZonesX {
  my $self = shift;
  croak(__PACKAGE__ . "::getSpacingsBetweenZonesX: arguments passed to getter")
    if @_;
  return $self->{__SPACINGSBETWEENZONESX};
}




=back


=item spacingsBetweenZonesY

From the MAGE-OM documentation for the C<spacingsBetweenZonesY> attribute:

Spacing between zones, if applicable.



=over


=item $val = $zonegroup->setSpacingsBetweenZonesY($val)

The restricted setter method for the spacingsBetweenZonesY attribute.

Input parameters: the value to which the spacingsBetweenZonesY attribute will be set 

Return value: the current value of the spacingsBetweenZonesY attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setSpacingsBetweenZonesY {
  my $self = shift;
  croak(__PACKAGE__ . "::setSpacingsBetweenZonesY: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSpacingsBetweenZonesY: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__SPACINGSBETWEENZONESY} = $val;
}



=item $val = $zonegroup->getSpacingsBetweenZonesY()

The restricted getter method for the spacingsBetweenZonesY attribute.

Input parameters: none

Return value: the current value of the spacingsBetweenZonesY attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSpacingsBetweenZonesY {
  my $self = shift;
  croak(__PACKAGE__ . "::getSpacingsBetweenZonesY: arguments passed to getter")
    if @_;
  return $self->{__SPACINGSBETWEENZONESY};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'distanceUnit',
          bless( {
                   '__NAME' => 'distanceUnit',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'DistanceUnit',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Unit for the ZoneGroup attributes.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'zoneLayout',
          bless( {
                   '__NAME' => 'zoneLayout',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'ZoneLayout',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Describes the rectangular layout of features in the array design. ',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'zoneLocations',
          bless( {
                   '__NAME' => 'zoneLocations',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Zone',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Describes the location of different zones within the array design.',
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

Bio::MAGE::ArrayDesign::ZoneGroup: has the following association accessor methods:

=over


=item zoneLayout


From the MAGE-OM documentation for the C<zoneLayout> association:

Describes the rectangular layout of features in the array design. 



=over


=item $val = $zonegroup->setZoneLayout($val)

The restricted setter method for the zoneLayout association.

Input parameters: the value to which the zoneLayout association will be set : an instance of type C<Bio::MAGE::ArrayDesign::ZoneLayout>.

Return value: the current value of the zoneLayout association : an instance of type C<Bio::MAGE::ArrayDesign::ZoneLayout>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::ArrayDesign::ZoneLayout>

=cut

sub setZoneLayout {
  my $self = shift;
  croak(__PACKAGE__ . "::setZoneLayout: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setZoneLayout: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setZoneLayout: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::ZoneLayout") unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::ZoneLayout');
  return $self->{__ZONELAYOUT} = $val;
}



=item $val = $zonegroup->getZoneLayout()

The restricted getter method for the zoneLayout association.

Input parameters: none

Return value: the current value of the zoneLayout association : an instance of type C<Bio::MAGE::ArrayDesign::ZoneLayout>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getZoneLayout {
  my $self = shift;
  croak(__PACKAGE__ . "::getZoneLayout: arguments passed to getter")
    if @_;
  return $self->{__ZONELAYOUT};
}




=back


=item distanceUnit


From the MAGE-OM documentation for the C<distanceUnit> association:

Unit for the ZoneGroup attributes.



=over


=item $val = $zonegroup->setDistanceUnit($val)

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



=item $val = $zonegroup->getDistanceUnit()

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


=item zoneLocations


From the MAGE-OM documentation for the C<zoneLocations> association:

Describes the location of different zones within the array design.



=over


=item $array_ref = $zonegroup->setZoneLocations($array_ref)

The restricted setter method for the zoneLocations association.

Input parameters: the value to which the zoneLocations association will be set : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::Zone>

Return value: the current value of the zoneLocations association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::Zone>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::ArrayDesign::Zone> instances

=cut

sub setZoneLocations {
  my $self = shift;
  croak(__PACKAGE__ . "::setZoneLocations: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setZoneLocations: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setZoneLocations: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setZoneLocations: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::Zone")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::Zone');
  }

  return $self->{__ZONELOCATIONS} = $val;
}



=item $array_ref = $zonegroup->getZoneLocations()

The restricted getter method for the zoneLocations association.

Input parameters: none

Return value: the current value of the zoneLocations association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::Zone>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getZoneLocations {
  my $self = shift;
  croak(__PACKAGE__ . "::getZoneLocations: arguments passed to getter")
    if @_;
  return $self->{__ZONELOCATIONS};
}



=item $zonegroup->addZoneLocations(@vals)

Because the zoneLocations association has list cardinality, it may store more
than one value. This method adds the current list of objects in the zoneLocations
association.

Input parameters: the list of values C<@vals> to add to the zoneLocations
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::ArrayDesign::Zone>

=cut

sub addZoneLocations {
  my $self = shift;
  croak(__PACKAGE__ . "::addZoneLocations: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addZoneLocations: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::Zone")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::Zone');
  }

  push(@{$self->{__ZONELOCATIONS}},@vals);
}



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

