##############################
#
# Bio::MAGE::Array::Array
#
##############################
package Bio::MAGE::Array::Array;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: Array.pm,v 1.4 2002/08/24 16:12:10 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Array::Array

=head2 SYNOPSIS

  use Bio::MAGE::Array::Array;

    # creating an empty instance
  my $array = Bio::MAGE::Array::Array->new();

    # creating an already populated instance
  my $array = Bio::MAGE::Array::Array->new(arrayXOrigin=>$arrayXOrigin_value,
			arrayYOrigin=>$arrayYOrigin_value,
			arrayIdentifier=>$arrayIdentifier_value,
			originRelativeTo=>$originRelativeTo_value,
			arrayGroup=>$arrayGroup_value,
			arrayDesign=>$arrayDesign_value,
			information=>$information_value,
			arrayManufactureDeviations=>$arrayManufactureDeviations_value);

    # setting and retrieving object attributes
  my $arrayXOrigin_val = $array->arrayXOrigin();
  $array->arrayXOrigin($value);

  my $arrayYOrigin_val = $array->arrayYOrigin();
  $array->arrayYOrigin($value);

  my $arrayIdentifier_val = $array->arrayIdentifier();
  $array->arrayIdentifier($value);

  my $originRelativeTo_val = $array->originRelativeTo();
  $array->originRelativeTo($value);

    # setting and retrieving object associations
  my $arrayGroup_val = $array->arrayGroup();
  $array->arrayGroup($value);

  my $arrayDesign_val = $array->arrayDesign();
  $array->arrayDesign($value);

  my $information_val = $array->information();
  $array->information($value);

  my $arrayManufactureDeviations_val = $array->arrayManufactureDeviations();
  $array->arrayManufactureDeviations($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Array> class:

The physical substrate along with its features and their annotation



=cut


=head2 INHERITANCE


Bio::MAGE::Array::Array has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Array::Array->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * arrayXOrigin

Sets the value of the arrayXOrigin attribute (from C<Bio::MAGE::Array::Array>).


=item * arrayYOrigin

Sets the value of the arrayYOrigin attribute (from C<Bio::MAGE::Array::Array>).


=item * arrayIdentifier

Sets the value of the arrayIdentifier attribute (from C<Bio::MAGE::Array::Array>).


=item * originRelativeTo

Sets the value of the originRelativeTo attribute (from C<Bio::MAGE::Array::Array>).


=item * arrayGroup

Sets the value of the arrayGroup association (from C<Bio::MAGE::Array::Array>).


=item * arrayDesign

Sets the value of the arrayDesign association (from C<Bio::MAGE::Array::Array>).


=item * information

Sets the value of the information association (from C<Bio::MAGE::Array::Array>).


=item * arrayManufactureDeviations

Sets the value of the arrayManufactureDeviations association (from C<Bio::MAGE::Array::Array>).


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

Returns the full class name for this class, Bio::MAGE::Array::Array.

=cut

sub class_name {
  return q[Bio::MAGE::Array::Array];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Array::Array.

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
  my @list = ('Bio::MAGE::Identifiable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('arrayXOrigin', 'arrayYOrigin', 'arrayIdentifier', 'originRelativeTo');
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
  my @list = ('arrayGroup', 'arrayDesign', 'information', 'arrayManufactureDeviations');
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

Bio::MAGE::Array::Array: has the following attribute accessor methods:

=over


=item arrayXOrigin

From the MAGE-OM documentation for the C<arrayXOrigin> attribute:

This can indicate the x position on a slide, chip, etc. of the first Feature and is usually specified relative to the fiducial.



=over


=item $val = $array->setArrayXOrigin($val)

The restricted setter method for the arrayXOrigin attribute.

Input parameters: the value to which the arrayXOrigin attribute will be set 

Return value: the current value of the arrayXOrigin attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setArrayXOrigin {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrayXOrigin: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrayXOrigin: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ARRAYXORIGIN} = $val;
}



=item $val = $array->getArrayXOrigin()

The restricted getter method for the arrayXOrigin attribute.

Input parameters: none

Return value: the current value of the arrayXOrigin attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrayXOrigin {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrayXOrigin: arguments passed to getter")
    if @_;
  return $self->{__ARRAYXORIGIN};
}




=back


=item arrayYOrigin

From the MAGE-OM documentation for the C<arrayYOrigin> attribute:

This can indicate the y position on a slide, chip, etc. of the first Feature and is usually specified relative to the fiducial.



=over


=item $val = $array->setArrayYOrigin($val)

The restricted setter method for the arrayYOrigin attribute.

Input parameters: the value to which the arrayYOrigin attribute will be set 

Return value: the current value of the arrayYOrigin attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setArrayYOrigin {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrayYOrigin: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrayYOrigin: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ARRAYYORIGIN} = $val;
}



=item $val = $array->getArrayYOrigin()

The restricted getter method for the arrayYOrigin attribute.

Input parameters: none

Return value: the current value of the arrayYOrigin attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrayYOrigin {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrayYOrigin: arguments passed to getter")
    if @_;
  return $self->{__ARRAYYORIGIN};
}




=back


=item arrayIdentifier

From the MAGE-OM documentation for the C<arrayIdentifier> attribute:

An identifying string, e.g. a barcode.



=over


=item $val = $array->setArrayIdentifier($val)

The restricted setter method for the arrayIdentifier attribute.

Input parameters: the value to which the arrayIdentifier attribute will be set 

Return value: the current value of the arrayIdentifier attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setArrayIdentifier {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrayIdentifier: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrayIdentifier: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ARRAYIDENTIFIER} = $val;
}



=item $val = $array->getArrayIdentifier()

The restricted getter method for the arrayIdentifier attribute.

Input parameters: none

Return value: the current value of the arrayIdentifier attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrayIdentifier {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrayIdentifier: arguments passed to getter")
    if @_;
  return $self->{__ARRAYIDENTIFIER};
}




=back


=item originRelativeTo

From the MAGE-OM documentation for the C<originRelativeTo> attribute:

What the array origin is relative to, e.g. upper left corner, fiducial, etc.



=over


=item $val = $array->setOriginRelativeTo($val)

The restricted setter method for the originRelativeTo attribute.

Input parameters: the value to which the originRelativeTo attribute will be set 

Return value: the current value of the originRelativeTo attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setOriginRelativeTo {
  my $self = shift;
  croak(__PACKAGE__ . "::setOriginRelativeTo: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setOriginRelativeTo: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ORIGINRELATIVETO} = $val;
}



=item $val = $array->getOriginRelativeTo()

The restricted getter method for the originRelativeTo attribute.

Input parameters: none

Return value: the current value of the originRelativeTo attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getOriginRelativeTo {
  my $self = shift;
  croak(__PACKAGE__ . "::getOriginRelativeTo: arguments passed to getter")
    if @_;
  return $self->{__ORIGINRELATIVETO};
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
          'arrayDesign',
          bless( {
                   '__NAME' => 'arrayDesign',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'ArrayDesign',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The association of a physical array with its array design.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'information',
          bless( {
                   '__NAME' => 'information',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'ArrayManufacture',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Association between the manufactured array and the information on that manufacture.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'arrayGroup',
          bless( {
                   '__NAME' => 'arrayGroup',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'ArrayGroup',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'arrayManufactureDeviations',
          bless( {
                   '__NAME' => 'arrayManufactureDeviations',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'ArrayManufactureDeviation',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'Association to classes to describe deviations from the ArrayDesign.',
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

Bio::MAGE::Array::Array: has the following association accessor methods:

=over


=item arrayGroup


From the MAGE-OM documentation for the C<arrayGroup> association:

Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. 



=over


=item $val = $array->setArrayGroup($val)

The restricted setter method for the arrayGroup association.

Input parameters: the value to which the arrayGroup association will be set : an instance of type C<Bio::MAGE::Array::ArrayGroup>.

Return value: the current value of the arrayGroup association : an instance of type C<Bio::MAGE::Array::ArrayGroup>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Array::ArrayGroup>

=cut

sub setArrayGroup {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrayGroup: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrayGroup: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setArrayGroup: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ArrayGroup") unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ArrayGroup');
  return $self->{__ARRAYGROUP} = $val;
}



=item $val = $array->getArrayGroup()

The restricted getter method for the arrayGroup association.

Input parameters: none

Return value: the current value of the arrayGroup association : an instance of type C<Bio::MAGE::Array::ArrayGroup>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrayGroup {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrayGroup: arguments passed to getter")
    if @_;
  return $self->{__ARRAYGROUP};
}




=back


=item arrayDesign


From the MAGE-OM documentation for the C<arrayDesign> association:

The association of a physical array with its array design.



=over


=item $val = $array->setArrayDesign($val)

The restricted setter method for the arrayDesign association.

Input parameters: the value to which the arrayDesign association will be set : an instance of type C<Bio::MAGE::ArrayDesign::ArrayDesign>.

Return value: the current value of the arrayDesign association : an instance of type C<Bio::MAGE::ArrayDesign::ArrayDesign>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::ArrayDesign::ArrayDesign>

=cut

sub setArrayDesign {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrayDesign: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrayDesign: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setArrayDesign: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::ArrayDesign") unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::ArrayDesign');
  return $self->{__ARRAYDESIGN} = $val;
}



=item $val = $array->getArrayDesign()

The restricted getter method for the arrayDesign association.

Input parameters: none

Return value: the current value of the arrayDesign association : an instance of type C<Bio::MAGE::ArrayDesign::ArrayDesign>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrayDesign {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrayDesign: arguments passed to getter")
    if @_;
  return $self->{__ARRAYDESIGN};
}




=back


=item information


From the MAGE-OM documentation for the C<information> association:

Association between the manufactured array and the information on that manufacture.



=over


=item $val = $array->setInformation($val)

The restricted setter method for the information association.

Input parameters: the value to which the information association will be set : an instance of type C<Bio::MAGE::Array::ArrayManufacture>.

Return value: the current value of the information association : an instance of type C<Bio::MAGE::Array::ArrayManufacture>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Array::ArrayManufacture>

=cut

sub setInformation {
  my $self = shift;
  croak(__PACKAGE__ . "::setInformation: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setInformation: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setInformation: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ArrayManufacture") unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ArrayManufacture');
  return $self->{__INFORMATION} = $val;
}



=item $val = $array->getInformation()

The restricted getter method for the information association.

Input parameters: none

Return value: the current value of the information association : an instance of type C<Bio::MAGE::Array::ArrayManufacture>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getInformation {
  my $self = shift;
  croak(__PACKAGE__ . "::getInformation: arguments passed to getter")
    if @_;
  return $self->{__INFORMATION};
}




=back


=item arrayManufactureDeviations


From the MAGE-OM documentation for the C<arrayManufactureDeviations> association:

Association to classes to describe deviations from the ArrayDesign.



=over


=item $array_ref = $array->setArrayManufactureDeviations($array_ref)

The restricted setter method for the arrayManufactureDeviations association.

Input parameters: the value to which the arrayManufactureDeviations association will be set : a reference to an array of objects of type C<Bio::MAGE::Array::ArrayManufactureDeviation>

Return value: the current value of the arrayManufactureDeviations association : a reference to an array of objects of type C<Bio::MAGE::Array::ArrayManufactureDeviation>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Array::ArrayManufactureDeviation> instances

=cut

sub setArrayManufactureDeviations {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrayManufactureDeviations: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrayManufactureDeviations: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setArrayManufactureDeviations: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setArrayManufactureDeviations: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ArrayManufactureDeviation")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ArrayManufactureDeviation');
  }

  return $self->{__ARRAYMANUFACTUREDEVIATIONS} = $val;
}



=item $array_ref = $array->getArrayManufactureDeviations()

The restricted getter method for the arrayManufactureDeviations association.

Input parameters: none

Return value: the current value of the arrayManufactureDeviations association : a reference to an array of objects of type C<Bio::MAGE::Array::ArrayManufactureDeviation>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrayManufactureDeviations {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrayManufactureDeviations: arguments passed to getter")
    if @_;
  return $self->{__ARRAYMANUFACTUREDEVIATIONS};
}



=item $array->addArrayManufactureDeviations(@vals)

Because the arrayManufactureDeviations association has list cardinality, it may store more
than one value. This method adds the current list of objects in the arrayManufactureDeviations
association.

Input parameters: the list of values C<@vals> to add to the arrayManufactureDeviations
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Array::ArrayManufactureDeviation>

=cut

sub addArrayManufactureDeviations {
  my $self = shift;
  croak(__PACKAGE__ . "::addArrayManufactureDeviations: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addArrayManufactureDeviations: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ArrayManufactureDeviation")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ArrayManufactureDeviation');
  }

  push(@{$self->{__ARRAYMANUFACTUREDEVIATIONS}},@vals);
}



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

