##############################
#
# Bio::MAGE::NameValueType
#
##############################
package Bio::MAGE::NameValueType;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base  Exporter);
$VERSION = q[$Id: NameValueType.pm,v 1.5 2002/08/24 16:12:21 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::NameValueType

=head2 SYNOPSIS

  use Bio::MAGE::NameValueType;

    # creating an empty instance
  my $namevaluetype = Bio::MAGE::NameValueType->new();

    # creating an already populated instance
  my $namevaluetype = Bio::MAGE::NameValueType->new(value=>$value_value,
			name=>$name_value,
			type=>$type_value,
			propertySets=>$propertySets_value);

    # setting and retrieving object attributes
  my $value_val = $namevaluetype->value();
  $namevaluetype->value($value);

  my $name_val = $namevaluetype->name();
  $namevaluetype->name($value);

  my $type_val = $namevaluetype->type();
  $namevaluetype->type($value);

    # setting and retrieving object associations
  my $propertySets_val = $namevaluetype->propertySets();
  $namevaluetype->propertySets($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<NameValueType> class:

A tuple designed to store data, keyed by a name and type.



=cut


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::NameValueType->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * value

Sets the value of the value attribute (from C<Bio::MAGE::NameValueType>).


=item * name

Sets the value of the name attribute (from C<Bio::MAGE::NameValueType>).


=item * type

Sets the value of the type attribute (from C<Bio::MAGE::NameValueType>).


=item * propertySets

Sets the value of the propertySets association (from C<Bio::MAGE::NameValueType>).


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

Returns the full class name for this class, Bio::MAGE::NameValueType.

=cut

sub class_name {
  return q[Bio::MAGE::NameValueType];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::NameValueType.

=cut

sub package {
  return q[MAGE];
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
  my @list = ();
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('value', 'name', 'type');
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
  my @list = ('propertySets');
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

Bio::MAGE::NameValueType: has the following attribute accessor methods:

=over


=item value

From the MAGE-OM documentation for the C<value> attribute:

The value of the name.



=over


=item $val = $namevaluetype->setValue($val)

The restricted setter method for the value attribute.

Input parameters: the value to which the value attribute will be set 

Return value: the current value of the value attribute 

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



=item $val = $namevaluetype->getValue()

The restricted getter method for the value attribute.

Input parameters: none

Return value: the current value of the value attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getValue {
  my $self = shift;
  croak(__PACKAGE__ . "::getValue: arguments passed to getter")
    if @_;
  return $self->{__VALUE};
}




=back


=item name

From the MAGE-OM documentation for the C<name> attribute:

The name of the key.



=over


=item $val = $namevaluetype->setName($val)

The restricted setter method for the name attribute.

Input parameters: the value to which the name attribute will be set 

Return value: the current value of the name attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setName {
  my $self = shift;
  croak(__PACKAGE__ . "::setName: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setName: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__NAME} = $val;
}



=item $val = $namevaluetype->getName()

The restricted getter method for the name attribute.

Input parameters: none

Return value: the current value of the name attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getName {
  my $self = shift;
  croak(__PACKAGE__ . "::getName: arguments passed to getter")
    if @_;
  return $self->{__NAME};
}




=back


=item type

From the MAGE-OM documentation for the C<type> attribute:

The type of the key.



=over


=item $val = $namevaluetype->setType($val)

The restricted setter method for the type attribute.

Input parameters: the value to which the type attribute will be set 

Return value: the current value of the type attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setType {
  my $self = shift;
  croak(__PACKAGE__ . "::setType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__TYPE} = $val;
}



=item $val = $namevaluetype->getType()

The restricted getter method for the type attribute.

Input parameters: none

Return value: the current value of the type attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getType {
  my $self = shift;
  croak(__PACKAGE__ . "::getType: arguments passed to getter")
    if @_;
  return $self->{__TYPE};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'propertySets',
          bless( {
                   '__NAME' => 'propertySets',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'NameValueType',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Allows nested specification of name/value pairs',
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

Bio::MAGE::NameValueType: has the following association accessor methods:

=over


=item propertySets


From the MAGE-OM documentation for the C<propertySets> association:

Allows nested specification of name/value pairs



=over


=item $array_ref = $namevaluetype->setPropertySets($array_ref)

The restricted setter method for the propertySets association.

Input parameters: the value to which the propertySets association will be set : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Return value: the current value of the propertySets association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::NameValueType> instances

=cut

sub setPropertySets {
  my $self = shift;
  croak(__PACKAGE__ . "::setPropertySets: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPropertySets: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setPropertySets: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setPropertySets: wrong type: " . ref($val) . " expected Bio::MAGE::NameValueType")
      unless UNIVERSAL::isa($val,'Bio::MAGE::NameValueType');
  }

  return $self->{__PROPERTYSETS} = $val;
}



=item $array_ref = $namevaluetype->getPropertySets()

The restricted getter method for the propertySets association.

Input parameters: none

Return value: the current value of the propertySets association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPropertySets {
  my $self = shift;
  croak(__PACKAGE__ . "::getPropertySets: arguments passed to getter")
    if @_;
  return $self->{__PROPERTYSETS};
}



=item $namevaluetype->addPropertySets(@vals)

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

sub addPropertySets {
  my $self = shift;
  croak(__PACKAGE__ . "::addPropertySets: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addPropertySets: wrong type: " . ref($val) . " expected Bio::MAGE::NameValueType")
      unless UNIVERSAL::isa($val,'Bio::MAGE::NameValueType');
  }

  push(@{$self->{__PROPERTYSETS}},@vals);
}



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

