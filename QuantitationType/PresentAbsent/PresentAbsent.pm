##############################
#
# Bio::MAGE::QuantitationType::PresentAbsent
#
##############################
package Bio::MAGE::QuantitationType::PresentAbsent;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::QuantitationType::StandardQuantitationType;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::QuantitationType::StandardQuantitationType Exporter);
$VERSION = q[$Id: PresentAbsent.pm,v 1.4 2002/10/08 23:29:34 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::QuantitationType::PresentAbsent

=head2 SYNOPSIS

  use Bio::MAGE::QuantitationType::PresentAbsent;

    # creating an empty instance
  my $presentabsent = Bio::MAGE::QuantitationType::PresentAbsent->new();


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<PresentAbsent> class:

Indicates relative presence or absence.  From the enumeration AbsoluteCallTypeEnum {Present | Absent | Marginal | No call} or ComparisonCallTypeEnum {Increase I Marginal Increase | Decrease | Marginal Decrease |  No change | No Call | Unknown }, as specified by the dataType.



=cut


=head2 INHERITANCE


Bio::MAGE::QuantitationType::PresentAbsent has the following super classes

=over 


=item * Bio::MAGE::QuantitationType::StandardQuantitationType


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::QuantitationType::PresentAbsent->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * isBackground

Sets the value of the isBackground attribute (from C<Bio::MAGE::QuantitationType::QuantitationType>).


=item * channel

Sets the value of the channel association (from C<Bio::MAGE::QuantitationType::QuantitationType>).


=item * quantitationTypeMaps

Sets the value of the quantitationTypeMaps association (from C<Bio::MAGE::QuantitationType::QuantitationType>).


=item * dataType

Sets the value of the dataType association (from C<Bio::MAGE::QuantitationType::QuantitationType>).


=item * scale

Sets the value of the scale association (from C<Bio::MAGE::QuantitationType::QuantitationType>).


=item * confidenceIndicators

Sets the value of the confidenceIndicators association (from C<Bio::MAGE::QuantitationType::QuantitationType>).


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

Returns the full class name for this class, Bio::MAGE::QuantitationType::PresentAbsent.

=cut

sub class_name {
  return q[Bio::MAGE::QuantitationType::PresentAbsent];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::QuantitationType::PresentAbsent.

=cut

sub package {
  return q[QuantitationType];
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
  my @list = ('Bio::MAGE::QuantitationType::StandardQuantitationType');
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

Bio::MAGE::QuantitationType::PresentAbsent: has the following attribute accessor methods:

=over

Attributes Inherited from Bio::MAGE::QuantitationType::QuantitationType


=item isBackground

From the MAGE-OM documentation for the C<isBackground> attribute:

Indicates whether the quantitation has been measured from the background or from the feature itself.



=over


=item $val = $quantitationtype->setIsBackground($val)

The restricted setter method for the isBackground attribute.

Input parameters: the value to which the isBackground attribute will be set 

Return value: the current value of the isBackground attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $quantitationtype->getIsBackground()

The restricted getter method for the isBackground attribute.

Input parameters: none

Return value: the current value of the isBackground attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



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

