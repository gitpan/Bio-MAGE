##############################
#
# Bio::MAGE::Array::ArrayManufacture
#
##############################
package Bio::MAGE::Array::ArrayManufacture;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: ArrayManufacture.pm,v 1.4 2002/08/24 16:12:11 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Array::ArrayManufacture

=head2 SYNOPSIS

  use Bio::MAGE::Array::ArrayManufacture;

    # creating an empty instance
  my $arraymanufacture = Bio::MAGE::Array::ArrayManufacture->new();

    # creating an already populated instance
  my $arraymanufacture = Bio::MAGE::Array::ArrayManufacture->new(tolerance=>$tolerance_value,
			manufacturingDate=>$manufacturingDate_value,
			arrayManufacturers=>$arrayManufacturers_value,
			protocolApplications=>$protocolApplications_value,
			featureLIMSs=>$featureLIMSs_value,
			arrays=>$arrays_value,
			qualityControlStatistics=>$qualityControlStatistics_value);

    # setting and retrieving object attributes
  my $tolerance_val = $arraymanufacture->tolerance();
  $arraymanufacture->tolerance($value);

  my $manufacturingDate_val = $arraymanufacture->manufacturingDate();
  $arraymanufacture->manufacturingDate($value);

    # setting and retrieving object associations
  my $arrayManufacturers_val = $arraymanufacture->arrayManufacturers();
  $arraymanufacture->arrayManufacturers($value);

  my $protocolApplications_val = $arraymanufacture->protocolApplications();
  $arraymanufacture->protocolApplications($value);

  my $featureLIMSs_val = $arraymanufacture->featureLIMSs();
  $arraymanufacture->featureLIMSs($value);

  my $arrays_val = $arraymanufacture->arrays();
  $arraymanufacture->arrays($value);

  my $qualityControlStatistics_val = $arraymanufacture->qualityControlStatistics();
  $arraymanufacture->qualityControlStatistics($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ArrayManufacture> class:

Describes the process by which arrays are produced.  



=cut


=head2 INHERITANCE


Bio::MAGE::Array::ArrayManufacture has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Array::ArrayManufacture->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * tolerance

Sets the value of the tolerance attribute (from C<Bio::MAGE::Array::ArrayManufacture>).


=item * manufacturingDate

Sets the value of the manufacturingDate attribute (from C<Bio::MAGE::Array::ArrayManufacture>).


=item * arrayManufacturers

Sets the value of the arrayManufacturers association (from C<Bio::MAGE::Array::ArrayManufacture>).


=item * protocolApplications

Sets the value of the protocolApplications association (from C<Bio::MAGE::Array::ArrayManufacture>).


=item * featureLIMSs

Sets the value of the featureLIMSs association (from C<Bio::MAGE::Array::ArrayManufacture>).


=item * arrays

Sets the value of the arrays association (from C<Bio::MAGE::Array::ArrayManufacture>).


=item * qualityControlStatistics

Sets the value of the qualityControlStatistics association (from C<Bio::MAGE::Array::ArrayManufacture>).


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

Returns the full class name for this class, Bio::MAGE::Array::ArrayManufacture.

=cut

sub class_name {
  return q[Bio::MAGE::Array::ArrayManufacture];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Array::ArrayManufacture.

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
  my @list = ('tolerance', 'manufacturingDate');
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
  my @list = ('arrayManufacturers', 'protocolApplications', 'featureLIMSs', 'arrays', 'qualityControlStatistics');
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

Bio::MAGE::Array::ArrayManufacture: has the following attribute accessor methods:

=over


=item tolerance

From the MAGE-OM documentation for the C<tolerance> attribute:

The allowable error of a feature printed to its intended position.



=over


=item $val = $arraymanufacture->setTolerance($val)

The restricted setter method for the tolerance attribute.

Input parameters: the value to which the tolerance attribute will be set 

Return value: the current value of the tolerance attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setTolerance {
  my $self = shift;
  croak(__PACKAGE__ . "::setTolerance: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setTolerance: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__TOLERANCE} = $val;
}



=item $val = $arraymanufacture->getTolerance()

The restricted getter method for the tolerance attribute.

Input parameters: none

Return value: the current value of the tolerance attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getTolerance {
  my $self = shift;
  croak(__PACKAGE__ . "::getTolerance: arguments passed to getter")
    if @_;
  return $self->{__TOLERANCE};
}




=back


=item manufacturingDate

From the MAGE-OM documentation for the C<manufacturingDate> attribute:

The date the arrays were manufactured



=over


=item $val = $arraymanufacture->setManufacturingDate($val)

The restricted setter method for the manufacturingDate attribute.

Input parameters: the value to which the manufacturingDate attribute will be set 

Return value: the current value of the manufacturingDate attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setManufacturingDate {
  my $self = shift;
  croak(__PACKAGE__ . "::setManufacturingDate: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setManufacturingDate: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__MANUFACTURINGDATE} = $val;
}



=item $val = $arraymanufacture->getManufacturingDate()

The restricted getter method for the manufacturingDate attribute.

Input parameters: none

Return value: the current value of the manufacturingDate attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getManufacturingDate {
  my $self = shift;
  croak(__PACKAGE__ . "::getManufacturingDate: arguments passed to getter")
    if @_;
  return $self->{__MANUFACTURINGDATE};
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
          'arrays',
          bless( {
                   '__NAME' => 'arrays',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1..N',
                   '__CLASS_NAME' => 'Array',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Association between the manufactured array and the information on that manufacture.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'arrayManufacturers',
          bless( {
                   '__NAME' => 'arrayManufacturers',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Contact',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The person or organization to contact for information concerning the ArrayManufacture.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'qualityControlStatistics',
          bless( {
                   '__NAME' => 'qualityControlStatistics',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'NameValueType',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Information on the quality of the ArrayManufacture.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'featureLIMSs',
          bless( {
                   '__NAME' => 'featureLIMSs',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'ManufactureLIMS',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'Information on the manufacture of the features.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'protocolApplications',
          bless( {
                   '__NAME' => 'protocolApplications',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'ProtocolApplication',
                   '__RANK' => '5',
                   '__DESCRIPTION' => 'The protocols followed in the manufacturing of the arrays.',
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

Bio::MAGE::Array::ArrayManufacture: has the following association accessor methods:

=over


=item arrayManufacturers


From the MAGE-OM documentation for the C<arrayManufacturers> association:

The person or organization to contact for information concerning the ArrayManufacture.



=over


=item $array_ref = $arraymanufacture->setArrayManufacturers($array_ref)

The restricted setter method for the arrayManufacturers association.

Input parameters: the value to which the arrayManufacturers association will be set : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Return value: the current value of the arrayManufacturers association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::AuditAndSecurity::Contact> instances

=cut

sub setArrayManufacturers {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrayManufacturers: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrayManufacturers: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setArrayManufacturers: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setArrayManufacturers: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Contact")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Contact');
  }

  return $self->{__ARRAYMANUFACTURERS} = $val;
}



=item $array_ref = $arraymanufacture->getArrayManufacturers()

The restricted getter method for the arrayManufacturers association.

Input parameters: none

Return value: the current value of the arrayManufacturers association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrayManufacturers {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrayManufacturers: arguments passed to getter")
    if @_;
  return $self->{__ARRAYMANUFACTURERS};
}



=item $arraymanufacture->addArrayManufacturers(@vals)

Because the arrayManufacturers association has list cardinality, it may store more
than one value. This method adds the current list of objects in the arrayManufacturers
association.

Input parameters: the list of values C<@vals> to add to the arrayManufacturers
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::AuditAndSecurity::Contact>

=cut

sub addArrayManufacturers {
  my $self = shift;
  croak(__PACKAGE__ . "::addArrayManufacturers: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addArrayManufacturers: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Contact")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Contact');
  }

  push(@{$self->{__ARRAYMANUFACTURERS}},@vals);
}



=back


=item protocolApplications


From the MAGE-OM documentation for the C<protocolApplications> association:

The protocols followed in the manufacturing of the arrays.



=over


=item $array_ref = $arraymanufacture->setProtocolApplications($array_ref)

The restricted setter method for the protocolApplications association.

Input parameters: the value to which the protocolApplications association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Return value: the current value of the protocolApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::ProtocolApplication> instances

=cut

sub setProtocolApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::setProtocolApplications: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setProtocolApplications: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setProtocolApplications: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setProtocolApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::ProtocolApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::ProtocolApplication');
  }

  return $self->{__PROTOCOLAPPLICATIONS} = $val;
}



=item $array_ref = $arraymanufacture->getProtocolApplications()

The restricted getter method for the protocolApplications association.

Input parameters: none

Return value: the current value of the protocolApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getProtocolApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::getProtocolApplications: arguments passed to getter")
    if @_;
  return $self->{__PROTOCOLAPPLICATIONS};
}



=item $arraymanufacture->addProtocolApplications(@vals)

Because the protocolApplications association has list cardinality, it may store more
than one value. This method adds the current list of objects in the protocolApplications
association.

Input parameters: the list of values C<@vals> to add to the protocolApplications
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::ProtocolApplication>

=cut

sub addProtocolApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::addProtocolApplications: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addProtocolApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::ProtocolApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::ProtocolApplication');
  }

  push(@{$self->{__PROTOCOLAPPLICATIONS}},@vals);
}



=back


=item featureLIMSs


From the MAGE-OM documentation for the C<featureLIMSs> association:

Information on the manufacture of the features.



=over


=item $array_ref = $arraymanufacture->setFeatureLIMSs($array_ref)

The restricted setter method for the featureLIMSs association.

Input parameters: the value to which the featureLIMSs association will be set : a reference to an array of objects of type C<Bio::MAGE::Array::ManufactureLIMS>

Return value: the current value of the featureLIMSs association : a reference to an array of objects of type C<Bio::MAGE::Array::ManufactureLIMS>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Array::ManufactureLIMS> instances

=cut

sub setFeatureLIMSs {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureLIMSs: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureLIMSs: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFeatureLIMSs: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setFeatureLIMSs: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ManufactureLIMS")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ManufactureLIMS');
  }

  return $self->{__FEATURELIMSS} = $val;
}



=item $array_ref = $arraymanufacture->getFeatureLIMSs()

The restricted getter method for the featureLIMSs association.

Input parameters: none

Return value: the current value of the featureLIMSs association : a reference to an array of objects of type C<Bio::MAGE::Array::ManufactureLIMS>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureLIMSs {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureLIMSs: arguments passed to getter")
    if @_;
  return $self->{__FEATURELIMSS};
}



=item $arraymanufacture->addFeatureLIMSs(@vals)

Because the featureLIMSs association has list cardinality, it may store more
than one value. This method adds the current list of objects in the featureLIMSs
association.

Input parameters: the list of values C<@vals> to add to the featureLIMSs
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Array::ManufactureLIMS>

=cut

sub addFeatureLIMSs {
  my $self = shift;
  croak(__PACKAGE__ . "::addFeatureLIMSs: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFeatureLIMSs: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ManufactureLIMS")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ManufactureLIMS');
  }

  push(@{$self->{__FEATURELIMSS}},@vals);
}



=back


=item arrays


From the MAGE-OM documentation for the C<arrays> association:

Association between the manufactured array and the information on that manufacture.



=over


=item $array_ref = $arraymanufacture->setArrays($array_ref)

The restricted setter method for the arrays association.

Input parameters: the value to which the arrays association will be set : a reference to an array of objects of type C<Bio::MAGE::Array::Array>

Return value: the current value of the arrays association : a reference to an array of objects of type C<Bio::MAGE::Array::Array>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Array::Array> instances

=cut

sub setArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrays: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrays: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setArrays: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setArrays: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Array")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Array');
  }

  return $self->{__ARRAYS} = $val;
}



=item $array_ref = $arraymanufacture->getArrays()

The restricted getter method for the arrays association.

Input parameters: none

Return value: the current value of the arrays association : a reference to an array of objects of type C<Bio::MAGE::Array::Array>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrays: arguments passed to getter")
    if @_;
  return $self->{__ARRAYS};
}



=item $arraymanufacture->addArrays(@vals)

Because the arrays association has list cardinality, it may store more
than one value. This method adds the current list of objects in the arrays
association.

Input parameters: the list of values C<@vals> to add to the arrays
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Array::Array>

=cut

sub addArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::addArrays: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addArrays: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Array")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Array');
  }

  push(@{$self->{__ARRAYS}},@vals);
}



=back


=item qualityControlStatistics


From the MAGE-OM documentation for the C<qualityControlStatistics> association:

Information on the quality of the ArrayManufacture.



=over


=item $array_ref = $arraymanufacture->setQualityControlStatistics($array_ref)

The restricted setter method for the qualityControlStatistics association.

Input parameters: the value to which the qualityControlStatistics association will be set : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Return value: the current value of the qualityControlStatistics association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::NameValueType> instances

=cut

sub setQualityControlStatistics {
  my $self = shift;
  croak(__PACKAGE__ . "::setQualityControlStatistics: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setQualityControlStatistics: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setQualityControlStatistics: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setQualityControlStatistics: wrong type: " . ref($val) . " expected Bio::MAGE::NameValueType")
      unless UNIVERSAL::isa($val,'Bio::MAGE::NameValueType');
  }

  return $self->{__QUALITYCONTROLSTATISTICS} = $val;
}



=item $array_ref = $arraymanufacture->getQualityControlStatistics()

The restricted getter method for the qualityControlStatistics association.

Input parameters: none

Return value: the current value of the qualityControlStatistics association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getQualityControlStatistics {
  my $self = shift;
  croak(__PACKAGE__ . "::getQualityControlStatistics: arguments passed to getter")
    if @_;
  return $self->{__QUALITYCONTROLSTATISTICS};
}



=item $arraymanufacture->addQualityControlStatistics(@vals)

Because the qualityControlStatistics association has list cardinality, it may store more
than one value. This method adds the current list of objects in the qualityControlStatistics
association.

Input parameters: the list of values C<@vals> to add to the qualityControlStatistics
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::NameValueType>

=cut

sub addQualityControlStatistics {
  my $self = shift;
  croak(__PACKAGE__ . "::addQualityControlStatistics: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addQualityControlStatistics: wrong type: " . ref($val) . " expected Bio::MAGE::NameValueType")
      unless UNIVERSAL::isa($val,'Bio::MAGE::NameValueType');
  }

  push(@{$self->{__QUALITYCONTROLSTATISTICS}},@vals);
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

