##############################
#
# Bio::MAGE::Measurement::Measurement
#
##############################
# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2006 by:
#    * The MicroArray Gene Expression Database Society (MGED)
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



package Bio::MAGE::Measurement::Measurement;
use strict;
use Carp;

use base qw(Bio::MAGE::Extendable);

use Bio::MAGE::Association;

use vars qw($__ASSOCIATIONS
	    $__CLASS_NAME
	    $__PACKAGE_NAME
	    $__SUBCLASSES
	    $__SUPERCLASSES
	    $__ATTRIBUTE_NAMES
	    $__ASSOCIATION_NAMES
	   );

use constant TYPE_CHANGE => 'change';
use constant KINDCV_OTHER => 'other';
use constant KINDCV_CONCENTRATION => 'concentration';
use constant KINDCV_MASS => 'mass';
use constant KINDCV_VOLUME => 'volume';
use constant TYPE_ABSOLUTE => 'absolute';
use constant KINDCV_TEMPERATURE => 'temperature';
use constant KINDCV_QUANTITY => 'quantity';
use constant KINDCV_TIME => 'time';
use constant KINDCV_DISTANCE => 'distance';

=head1 NAME

Bio::MAGE::Measurement::Measurement - Class for the MAGE-OM API

=head1 SYNOPSIS

  use Bio::MAGE::Measurement::Measurement

  # creating an empty instance
  my $measurement = Bio::MAGE::Measurement::Measurement->new();

  # creating an instance with existing data
  my $measurement = Bio::MAGE::Measurement::Measurement->new(
        otherKind=>$otherkind_val,
        value=>$value_val,
        type=>$type_val,
        kindCV=>$kindcv_val,
        propertySets=>\@namevaluetype_list,
        unit=>$unit_ref,
  );


  # 'otherKind' attribute
  my $otherKind_val = $measurement->otherKind(); # getter
  $measurement->otherKind($value); # setter

  # 'value' attribute
  my $value_val = $measurement->value(); # getter
  $measurement->value($value); # setter

  # 'type' attribute
  my $type_val = $measurement->type(); # getter
  $measurement->type($value); # setter

  # 'kindCV' attribute
  my $kindCV_val = $measurement->kindCV(); # getter
  $measurement->kindCV($value); # setter


  # 'propertySets' association
  my $namevaluetype_array_ref = $measurement->propertySets(); # getter
  $measurement->propertySets(\@namevaluetype_list); # setter

  # 'unit' association
  my $unit_ref = $measurement->unit(); # getter
  $measurement->unit($unit_ref); # setter



=head1 DESCRIPTION

From the MAGE-OM documentation for the C<Measurement> class:

A Measurement is a quantity with a unit.



=cut

=head1 INHERITANCE


Bio::MAGE::Measurement::Measurement has the following superclasses:

=over


=item * Bio::MAGE::Extendable


=back



=cut

BEGIN {
  $__CLASS_NAME        = q[Bio::MAGE::Measurement::Measurement];
  $__PACKAGE_NAME      = q[Measurement];
  $__SUBCLASSES        = [];
  $__SUPERCLASSES      = ['Bio::MAGE::Extendable'];
  $__ATTRIBUTE_NAMES   = ['otherKind', 'value', 'type', 'kindCV'];
  $__ASSOCIATION_NAMES = ['propertySets', 'unit'];
  $__ASSOCIATIONS      = [
          'unit',
          bless( {
                   '__SELF' => bless( {
                                        '__NAME' => undef,
                                        '__IS_REF' => 0,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'The Unit associated with the Measurement.',
                                        '__CLASS_NAME' => 'Measurement',
                                        '__RANK' => undef,
                                        '__ORDERED' => undef
                                      }, 'Bio::MAGE::Association::End' ),
                   '__OTHER' => bless( {
                                         '__NAME' => 'unit',
                                         '__IS_REF' => 1,
                                         '__CARDINALITY' => '0..1',
                                         '__DOCUMENTATION' => 'The Unit associated with the Measurement.',
                                         '__CLASS_NAME' => 'Unit',
                                         '__RANK' => '1',
                                         '__ORDERED' => 0
                                       }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' )
        ]

}

=head1 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Measurement::Measurement->methodname() syntax.

=over

=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over

=item * otherKind

Sets the value of the C<otherKind> attribute

=item * value

Sets the value of the C<value> attribute

=item * type

Sets the value of the C<type> attribute

=item * kindCV

Sets the value of the C<kindCV> attribute


=item * propertySets

Sets the value of the C<propertySets> association (this association was inherited from class C<Bio::MAGE::Extendable>).


The value must be of type: array of C<Bio::MAGE::NameValueType>.


=item * unit

Sets the value of the C<unit> association

The value must be of type: instance of C<Bio::MAGE::Measurement::Unit>.


=back

=item $obj = class->new(%parameters)

The C<new()> method is the class constructor.

B<Parameters>: if given a list of name/value parameters the
corresponding slots, attributes, or associations will have their
initial values set by the constructor.

B<Return value>: It returns a reference to an object of the class.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut

#
# code for new() inherited from Base.pm
#

=item @names = class->get_slot_names()

The C<get_slot_names()> method is used to retrieve the name of all
slots defined in a given class.

B<NOTE>: the list of names does not include attribute or association
names.

B<Return value>: A list of the names of all slots defined for this class.

B<Side effects>: none

=cut

#
# code for get_slot_names() inherited from Base.pm
#

=item @name_list = get_attribute_names()

returns the list of attribute data members for this class.

=cut

#
# code for get_attribute_names() inherited from Base.pm
#

=item @name_list = get_association_names()

returns the list of association data members for this class.

=cut

#
# code for get_association_names() inherited from Base.pm
#

=item @class_list = get_superclasses()

returns the list of superclasses for this class.

=cut

#
# code for get_superclasses() inherited from Base.pm
#

=item @class_list = get_subclasses()

returns the list of subclasses for this class.

=cut

#
# code for get_subclasses() inherited from Base.pm
#

=item $name = class_name()

Returns the full class name for this class.

=cut

#
# code for class_name() inherited from Base.pm
#

=item $package_name = package_name()

Returns the base package name (i.e. no 'namespace::') of the package
that contains this class.

=cut

#
# code for package_name() inherited from Base.pm
#

=item %assns = associations()

returns the association meta-information in a hash where the keys are
the association names and the values are C<Association> objects that
provide the meta-information for the association.

=cut

#
# code for associations() inherited from Base.pm
#



=back

=head1 INSTANCE METHODS

=item $obj_copy = $obj->new()

When invoked with an existing object reference and not a class name,
the C<new()> method acts as a copy constructor - with the new object's
initial values set to be those of the existing object.

B<Parameters>: No input parameters  are used in the copy  constructor,
the initial values are taken directly from the object to be copied.

B<Return value>: It returns a reference to an object of the class.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

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

=item @obj_list = $obj->get_slots(@name_list)

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


=head2 ATTRIBUTES

Attributes are simple data types that belong to a single instance of a
class. In the Perl implementation of the MAGE-OM classes, the
interface to attributes is implemented using separate setter and
getter methods for each attribute.

C<Bio::MAGE::Measurement::Measurement> has the following attribute accessor methods:

=over


=item otherKind

Methods for the C<otherKind> attribute.


From the MAGE-OM documentation:

Name of the controlled vocabulary if it isn't one of the Unit subclasses.


=over


=item $val = $measurement->setOtherKind($val)

The restricted setter method for the C<otherKind> attribute.


Input parameters: the value to which the C<otherKind> attribute will be set 

Return value: the current value of the C<otherKind> attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified

=cut


sub setOtherKind {
  my $self = shift;
  croak(__PACKAGE__ . "::setOtherKind: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setOtherKind: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__OTHERKIND} = $val;
}


=item $val = $measurement->getOtherKind()

The restricted getter method for the C<otherKind> attribute.

Input parameters: none

Return value: the current value of the C<otherKind> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getOtherKind {
  my $self = shift;
  croak(__PACKAGE__ . "::getOtherKind: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__OTHERKIND};
}





=back


=item value

Methods for the C<value> attribute.


From the MAGE-OM documentation:

The value of the measurement.  kindCV (and otherKind) determine with Unit the datatype of value.


=over


=item $val = $measurement->setValue($val)

The restricted setter method for the C<value> attribute.


Input parameters: the value to which the C<value> attribute will be set 

Return value: the current value of the C<value> attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified

=cut


sub setValue {
  my $self = shift;
  croak(__PACKAGE__ . "::setValue: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setValue: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__VALUE} = $val;
}


=item $val = $measurement->getValue()

The restricted getter method for the C<value> attribute.

Input parameters: none

Return value: the current value of the C<value> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getValue {
  my $self = shift;
  croak(__PACKAGE__ . "::getValue: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__VALUE};
}





=back


=item type

Methods for the C<type> attribute.


From the MAGE-OM documentation:

The type of measurement, for instance if the measurement is five feet, it can be either absolute (five feet tall) or change (five feet further along).


=over


=item $val = $measurement->setType($val)

The restricted setter method for the C<type> attribute.

C<type> is an B<enumerated> attribute - it can only be set to C<undef> or one of the following values: absolute change


Input parameters: the value to which the C<type> attribute will be set 

Return value: the current value of the C<type> attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$val> is not one of the accepted enumeration values: absolute change

=cut


sub setType {
  my $self = shift;
  croak(__PACKAGE__ . "::setType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setType: expected one of enum values : absolute change, got $val")
    unless (not defined $val) or (grep {$val eq $_} qw(absolute change));

  return $self->{__TYPE} = $val;
}


=item $val = $measurement->getType()

The restricted getter method for the C<type> attribute.

Input parameters: none

Return value: the current value of the C<type> attribute : an instance of type C<absolute change>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getType {
  my $self = shift;
  croak(__PACKAGE__ . "::getType: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__TYPE};
}





=back


=item kindCV

Methods for the C<kindCV> attribute.


From the MAGE-OM documentation:

One of the enumeration values to determine the controlled vocabulary of the value.


=over


=item $val = $measurement->setKindCV($val)

The restricted setter method for the C<kindCV> attribute.

C<kindCV> is an B<enumerated> attribute - it can only be set to C<undef> or one of the following values: time distance temperature quantity mass volume concentration other


Input parameters: the value to which the C<kindCV> attribute will be set 

Return value: the current value of the C<kindCV> attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$val> is not one of the accepted enumeration values: time distance temperature quantity mass volume concentration other

=cut


sub setKindCV {
  my $self = shift;
  croak(__PACKAGE__ . "::setKindCV: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setKindCV: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setKindCV: expected one of enum values : time distance temperature quantity mass volume concentration other, got $val")
    unless (not defined $val) or (grep {$val eq $_} qw(time distance temperature quantity mass volume concentration other));

  return $self->{__KINDCV} = $val;
}


=item $val = $measurement->getKindCV()

The restricted getter method for the C<kindCV> attribute.

Input parameters: none

Return value: the current value of the C<kindCV> attribute : an instance of type C<time distance temperature quantity mass volume concentration other>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getKindCV {
  my $self = shift;
  croak(__PACKAGE__ . "::getKindCV: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__KINDCV};
}





=back


=back


=head2 ASSOCIATIONS

Associations are references to other classes. Associations in MAGE-OM have a cardinality that determines the minimum and
maximum number of instances of the 'other' class that maybe included
in the association:

=over

=item 1

There B<must> be exactly one item in the association, i.e. this is a
mandatory data field.

=item 0..1

There B<may> be one item in the association, i.e. this is an optional
data field.

=item 1..N

There B<must> be one or more items in the association, i.e. this is a
mandatory data field, with list cardinality.

=item 0..N

There B<may> be one or more items in the association, i.e. this is an
optional data field, with list cardinality.

=back

Bio::MAGE::Measurement::Measurement has the following association accessor methods:

=over


=item propertySets

Methods for the C<propertySets> association.


From the MAGE-OM documentation:

Allows specification of name/value pairs.  Meant to primarily help in-house, pipeline processing of instances by providing a place for values that aren't part of the specification proper.


=over


=item $array_ref = $measurement->setPropertySets($array_ref)

The restricted setter method for the C<propertySets> association.


Input parameters: the value to which the C<propertySets> association will be set : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Return value: the current value of the C<propertySets> association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$array_ref> is not a reference to an array class C<Bio::MAGE::NameValueType> instances

=cut


sub setPropertySets {
  my $self = shift;
  croak(__PACKAGE__ . "::setPropertySets: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPropertySets: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setPropertySets: expected array reference, got $self")
    unless (not defined $val) or UNIVERSAL::isa($val,'ARRAY');
  if (defined $val) {
    foreach my $val_ent (@{$val}) {
      croak(__PACKAGE__ . "::setPropertySets: wrong type: " . ref($val_ent) . " expected Bio::MAGE::NameValueType")
        unless UNIVERSAL::isa($val_ent,'Bio::MAGE::NameValueType');
    }
  }

  return $self->{__PROPERTYSETS} = $val;
}


=item $array_ref = $measurement->getPropertySets()

The restricted getter method for the C<propertySets> association.

Input parameters: none

Return value: the current value of the C<propertySets> association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getPropertySets {
  my $self = shift;
  croak(__PACKAGE__ . "::getPropertySets: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__PROPERTYSETS};
}




=item $val = $measurement->addPropertySets(@vals)

Because the propertySets association has list cardinality, it may store more
than one value. This method adds the current list of objects in the propertySets association.

Input parameters: the list of values C<@vals> to add to the propertySets association. B<NOTE>: submitting a single value is permitted.

Return value: the number of items stored in the slot B<after> adding C<@vals>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::NameValueType>

=cut


sub addPropertySets {
  my $self = shift;
  croak(__PACKAGE__ . "::addPropertySets: no arguments passed to adder")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addPropertySets: wrong type: " . ref($val) . " expected Bio::MAGE::NameValueType")
      unless UNIVERSAL::isa($val,'Bio::MAGE::NameValueType');
  }

  return push(@{$self->{__PROPERTYSETS}},@vals);
}





=back


=item unit

Methods for the C<unit> association.


From the MAGE-OM documentation:

The Unit associated with the Measurement.


=over


=item $val = $measurement->setUnit($val)

The restricted setter method for the C<unit> association.


Input parameters: the value to which the C<unit> association will be set : one of the accepted enumerated values.

Return value: the current value of the C<unit> association : one of the accepted enumerated values.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$val> is not an instance of class C<Bio::MAGE::Measurement::Unit>

=cut


sub setUnit {
  my $self = shift;
  croak(__PACKAGE__ . "::setUnit: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setUnit: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setUnit: wrong type: " . ref($val) . " expected Bio::MAGE::Measurement::Unit") unless (not defined $val) or UNIVERSAL::isa($val,'Bio::MAGE::Measurement::Unit');
  return $self->{__UNIT} = $val;
}


=item $val = $measurement->getUnit()

The restricted getter method for the C<unit> association.

Input parameters: none

Return value: the current value of the C<unit> association : an instance of type C<Bio::MAGE::Measurement::Unit>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getUnit {
  my $self = shift;
  croak(__PACKAGE__ . "::getUnit: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__UNIT};
}





=back


sub initialize {


  my $self = shift;
  return 1;


}

=back


=cut


=head1 SLOTS, ATTRIBUTES, AND ASSOCIATIONS

In the Perl implementation of MAGE-OM classes, there are
three types of class data members: C<slots>, C<attributes>, and
C<associations>.

=head2 SLOTS

This API uses the term C<slot> to indicate a data member of the class
that was not present in the UML model and is used for mainly internal
purposes - use only if you understand the inner workings of the
API. Most often slots are used by generic methods such as those in the
XML writing and reading classes.

Slots are implemented using unified getter/setter methods:

=over

=item $var = $obj->slot_name();

Retrieves the current value of the slot.

=item $new_var = $obj->slot_name($new_var);

Store $new_var in the slot - the return value is also $new_var.

=item @names = $obj->get_slot_names()

Returns the list of all slots in the class.

=back

B<DATA CHECKING>: No data type checking is made for these methods.

=head2 ATTRIBUTES AND ASSOCIATIONS

The terms C<attribute> and C<association> indicate data members of the
class that were specified directly from the UML model.

In the Perl implementation of MAGE-OM classes,
association and attribute accessors are implemented using three
separate methods:

=over

=item get*

Retrieves the current value.

B<NOTE>: For associations, if the association has list cardinality, an
array reference is returned.

B<DATA CHECKING>: Ensure that no argument is provided.

=item set*

Sets the current value, B<replacing> any existing value.

B<NOTE>: For associations, if the association has list cardinality,
the argument must be an array reference. Because of this, you probably
should be using the add* methods.

B<DATA CHECKING>: For attributes, ensure that a single value is
provided as the argument. For associations, if the association has
list cardinality, ensure that the argument is a reference to an array
of instances of the correct MAGE-OM class, otherwise
ensure that there is a single argument of the correct MAGE-OM class.

=item add*

B<NOTE>: Only present in associations with list cardinality. 

Appends a list of objects to any values that may already be stored
in the association.

B<DATA CHECKING>: Ensure that all arguments are of the correct MAGE-OM class.

=back

=head2 GENERIC METHODS

The unified base class of all MAGE-OM classes, C<Bio::MAGE::Base>, provides a set of generic methods that
will operate on slots, attributes, and associations:

=over

=item $val = $obj->get_slot($name)

=item \@list_ref = $obj->get_slots(@name_list);

=item $val = $obj->set_slot($name,$val)

=item $obj->set_slots(%parameters)

=item $obj->set_slots(\@name_list, \@value_list)

See elsewhere in this page for a detailed description of these
methods.

=back

=cut


=head1 BUGS

Please send bug reports to the project mailing list: (mged-mage 'at' lists 'dot' sf 'dot' net)

=head1 AUTHOR

Jason E. Stewart (jasons 'at' cpan 'dot' org)

=head1 SEE ALSO

perl(1).

=cut

# all perl modules must be true...
1;

