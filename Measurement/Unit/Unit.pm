##############################
#
# Bio::MAGE::Measurement::Unit
#
##############################
package Bio::MAGE::Measurement::Unit;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = q[$Id: Unit.pm,v 1.4 2002/08/24 16:12:21 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Measurement::Unit

=head2 SYNOPSIS

  use Bio::MAGE::Measurement::Unit;

    # creating an empty instance
  my $unit = Bio::MAGE::Measurement::Unit->new();

    # creating an already populated instance
  my $unit = Bio::MAGE::Measurement::Unit->new(unitName=>$unitName_value);

    # setting and retrieving object attributes
  my $unitName_val = $unit->unitName();
  $unit->unitName($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Unit> class:

The unit is a strict enumeration of types.



=cut


=head2 INHERITANCE


Bio::MAGE::Measurement::Unit has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


Bio::MAGE::Measurement::Unit has the following subclasses

=over 


=item * Bio::MAGE::Measurement::TemperatureUnit


=item * Bio::MAGE::Measurement::DistanceUnit


=item * Bio::MAGE::Measurement::QuantityUnit


=item * Bio::MAGE::Measurement::MassUnit


=item * Bio::MAGE::Measurement::ConcentrationUnit


=item * Bio::MAGE::Measurement::TimeUnit


=item * Bio::MAGE::Measurement::VolumeUnit


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Measurement::Unit->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * unitName

Sets the value of the unitName attribute (from C<Bio::MAGE::Measurement::Unit>).


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

Returns the full class name for this class, Bio::MAGE::Measurement::Unit.

=cut

sub class_name {
  return q[Bio::MAGE::Measurement::Unit];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Measurement::Unit.

=cut

sub package {
  return q[Measurement];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ('Bio::MAGE::Measurement::TemperatureUnit', 'Bio::MAGE::Measurement::DistanceUnit', 'Bio::MAGE::Measurement::QuantityUnit', 'Bio::MAGE::Measurement::MassUnit', 'Bio::MAGE::Measurement::ConcentrationUnit', 'Bio::MAGE::Measurement::TimeUnit', 'Bio::MAGE::Measurement::VolumeUnit');
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
  my @list = ('unitName');
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
  my @list = ();
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

Bio::MAGE::Measurement::Unit: has the following attribute accessor methods:

=over


=item unitName

From the MAGE-OM documentation for the C<unitName> attribute:

The name of the unit.



=over


=item $val = $unit->setUnitName($val)

The restricted setter method for the unitName attribute.

Input parameters: the value to which the unitName attribute will be set 

Return value: the current value of the unitName attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setUnitName {
  my $self = shift;
  croak(__PACKAGE__ . "::setUnitName: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setUnitName: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__UNITNAME} = $val;
}



=item $val = $unit->getUnitName()

The restricted getter method for the unitName attribute.

Input parameters: none

Return value: the current value of the unitName attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getUnitName {
  my $self = shift;
  croak(__PACKAGE__ . "::getUnitName: arguments passed to getter")
    if @_;
  return $self->{__UNITNAME};
}




=back



=back


=cut



sub initialize {
  carp "Bio::MAGE::Measurement::Unit::initialize: abstract base classes should not be instantiated";
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

