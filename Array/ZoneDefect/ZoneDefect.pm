##############################
#
# Bio::MAGE::Array::ZoneDefect
#
##############################
package Bio::MAGE::Array::ZoneDefect;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = q[$Id: ZoneDefect.pm,v 1.4 2002/08/24 16:12:11 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Array::ZoneDefect

=head2 SYNOPSIS

  use Bio::MAGE::Array::ZoneDefect;

    # creating an empty instance
  my $zonedefect = Bio::MAGE::Array::ZoneDefect->new();

    # creating an already populated instance
  my $zonedefect = Bio::MAGE::Array::ZoneDefect->new(positionDelta=>$positionDelta_value,
			defectType=>$defectType_value,
			zone=>$zone_value);

    # setting and retrieving object associations
  my $positionDelta_val = $zonedefect->positionDelta();
  $zonedefect->positionDelta($value);

  my $defectType_val = $zonedefect->defectType();
  $zonedefect->defectType($value);

  my $zone_val = $zonedefect->zone();
  $zonedefect->zone($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ZoneDefect> class:

Stores the defect information for a zone.



=cut


=head2 INHERITANCE


Bio::MAGE::Array::ZoneDefect has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Array::ZoneDefect->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * positionDelta

Sets the value of the positionDelta association (from C<Bio::MAGE::Array::ZoneDefect>).


=item * defectType

Sets the value of the defectType association (from C<Bio::MAGE::Array::ZoneDefect>).


=item * zone

Sets the value of the zone association (from C<Bio::MAGE::Array::ZoneDefect>).


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

Returns the full class name for this class, Bio::MAGE::Array::ZoneDefect.

=cut

sub class_name {
  return q[Bio::MAGE::Array::ZoneDefect];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Array::ZoneDefect.

=cut

sub package {
  return q[Array];
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
  my @list = ('positionDelta', 'defectType', 'zone');
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

Bio::MAGE::Array::ZoneDefect: has the following attribute accessor methods:

=over



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'defectType',
          bless( {
                   '__NAME' => 'defectType',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Indicates the type of defect (e.g. a missing zone or a moved zone).',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'positionDelta',
          bless( {
                   '__NAME' => 'positionDelta',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'PositionDelta',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'How the zone deviates in position from the ArrayDesign.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'zone',
          bless( {
                   '__NAME' => 'zone',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'Zone',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Reference to the Zone that was misprinted.',
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

Bio::MAGE::Array::ZoneDefect: has the following association accessor methods:

=over


=item positionDelta


From the MAGE-OM documentation for the C<positionDelta> association:

How the zone deviates in position from the ArrayDesign.



=over


=item $val = $zonedefect->setPositionDelta($val)

The restricted setter method for the positionDelta association.

Input parameters: the value to which the positionDelta association will be set : an instance of type C<Bio::MAGE::Array::PositionDelta>.

Return value: the current value of the positionDelta association : an instance of type C<Bio::MAGE::Array::PositionDelta>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Array::PositionDelta>

=cut

sub setPositionDelta {
  my $self = shift;
  croak(__PACKAGE__ . "::setPositionDelta: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPositionDelta: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setPositionDelta: wrong type: " . ref($val) . " expected Bio::MAGE::Array::PositionDelta") unless UNIVERSAL::isa($val,'Bio::MAGE::Array::PositionDelta');
  return $self->{__POSITIONDELTA} = $val;
}



=item $val = $zonedefect->getPositionDelta()

The restricted getter method for the positionDelta association.

Input parameters: none

Return value: the current value of the positionDelta association : an instance of type C<Bio::MAGE::Array::PositionDelta>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPositionDelta {
  my $self = shift;
  croak(__PACKAGE__ . "::getPositionDelta: arguments passed to getter")
    if @_;
  return $self->{__POSITIONDELTA};
}




=back


=item defectType


From the MAGE-OM documentation for the C<defectType> association:

Indicates the type of defect (e.g. a missing zone or a moved zone).



=over


=item $val = $zonedefect->setDefectType($val)

The restricted setter method for the defectType association.

Input parameters: the value to which the defectType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the defectType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setDefectType {
  my $self = shift;
  croak(__PACKAGE__ . "::setDefectType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDefectType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setDefectType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__DEFECTTYPE} = $val;
}



=item $val = $zonedefect->getDefectType()

The restricted getter method for the defectType association.

Input parameters: none

Return value: the current value of the defectType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDefectType {
  my $self = shift;
  croak(__PACKAGE__ . "::getDefectType: arguments passed to getter")
    if @_;
  return $self->{__DEFECTTYPE};
}




=back


=item zone


From the MAGE-OM documentation for the C<zone> association:

Reference to the Zone that was misprinted.



=over


=item $val = $zonedefect->setZone($val)

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



=item $val = $zonedefect->getZone()

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

