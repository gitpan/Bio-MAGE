##############################
#
# Bio::MAGE::Array::ArrayGroup
#
##############################
package Bio::MAGE::Array::ArrayGroup;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: ArrayGroup.pm,v 1.7 2002/10/13 21:56:03 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Array::ArrayGroup

=head2 SYNOPSIS

  use Bio::MAGE::Array::ArrayGroup;

    # creating an empty instance
  my $arraygroup = Bio::MAGE::Array::ArrayGroup->new();

    # creating an already populated instance
  my $arraygroup = Bio::MAGE::Array::ArrayGroup->new(width=>$width_value,
			numArrays=>$numArrays_value,
			arraySpacingY=>$arraySpacingY_value,
			length=>$length_value,
			orientationMarkPosition=>$orientationMarkPosition_value,
			arraySpacingX=>$arraySpacingX_value,
			barcode=>$barcode_value,
			orientationMark=>$orientationMark_value,
			arrays=>$arrays_value,
			distanceUnit=>$distanceUnit_value,
			substrateType=>$substrateType_value,
			fiducials=>$fiducials_value);

    # setting and retrieving object attributes
  my $width_val = $arraygroup->width();
  $arraygroup->width($value);

  my $numArrays_val = $arraygroup->numArrays();
  $arraygroup->numArrays($value);

  my $arraySpacingY_val = $arraygroup->arraySpacingY();
  $arraygroup->arraySpacingY($value);

  my $length_val = $arraygroup->length();
  $arraygroup->length($value);

  my $orientationMarkPosition_val = $arraygroup->orientationMarkPosition();
  $arraygroup->orientationMarkPosition($value);

  my $arraySpacingX_val = $arraygroup->arraySpacingX();
  $arraygroup->arraySpacingX($value);

  my $barcode_val = $arraygroup->barcode();
  $arraygroup->barcode($value);

  my $orientationMark_val = $arraygroup->orientationMark();
  $arraygroup->orientationMark($value);

    # setting and retrieving object associations
  my $arrays_val = $arraygroup->arrays();
  $arraygroup->arrays($value);

  my $distanceUnit_val = $arraygroup->distanceUnit();
  $arraygroup->distanceUnit($value);

  my $substrateType_val = $arraygroup->substrateType();
  $arraygroup->substrateType($value);

  my $fiducials_val = $arraygroup->fiducials();
  $arraygroup->fiducials($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ArrayGroup> class:

An array package is a physical platform that contains one or more arrays that are separately addressable (e.g. several arrays that can be hybridized on a single microscope slide) or a virtual grouping together of arrays.

The array package that has been manufactured has information about where certain artifacts about the array are located for scanning and feature extraction purposes.



=cut


=head2 INHERITANCE


Bio::MAGE::Array::ArrayGroup has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Array::ArrayGroup->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * width

Sets the value of the width attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * numArrays

Sets the value of the numArrays attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * arraySpacingY

Sets the value of the arraySpacingY attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * length

Sets the value of the length attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * orientationMarkPosition

Sets the value of the orientationMarkPosition attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * arraySpacingX

Sets the value of the arraySpacingX attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * barcode

Sets the value of the barcode attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * orientationMark

Sets the value of the orientationMark attribute (from C<Bio::MAGE::Array::ArrayGroup>).


=item * arrays

Sets the value of the arrays association (from C<Bio::MAGE::Array::ArrayGroup>).


=item * distanceUnit

Sets the value of the distanceUnit association (from C<Bio::MAGE::Array::ArrayGroup>).


=item * substrateType

Sets the value of the substrateType association (from C<Bio::MAGE::Array::ArrayGroup>).


=item * fiducials

Sets the value of the fiducials association (from C<Bio::MAGE::Array::ArrayGroup>).


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

Returns the full class name for this class, Bio::MAGE::Array::ArrayGroup.

=cut

sub class_name {
  return q[Bio::MAGE::Array::ArrayGroup];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Array::ArrayGroup.

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
  my @list = ('width', 'numArrays', 'arraySpacingY', 'length', 'orientationMarkPosition', 'arraySpacingX', 'barcode', 'orientationMark');
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
  my @list = ('arrays', 'distanceUnit', 'substrateType', 'fiducials');
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

Bio::MAGE::Array::ArrayGroup: has the following attribute accessor methods:

=over


=item width

From the MAGE-OM documentation for the C<width> attribute:

The width of the platform



=over


=item $val = $arraygroup->setWidth($val)

The restricted setter method for the width attribute.

Input parameters: the value to which the width attribute will be set 

Return value: the current value of the width attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setWidth {
  my $self = shift;
  croak(__PACKAGE__ . "::setWidth: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setWidth: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__WIDTH} = $val;
}



=item $val = $arraygroup->getWidth()

The restricted getter method for the width attribute.

Input parameters: none

Return value: the current value of the width attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getWidth {
  my $self = shift;
  croak(__PACKAGE__ . "::getWidth: arguments passed to getter")
    if @_;
  return $self->{__WIDTH};
}




=back


=item numArrays

From the MAGE-OM documentation for the C<numArrays> attribute:

This attribute defines the number of arrays on a chip or a slide. 



=over


=item $val = $arraygroup->setNumArrays($val)

The restricted setter method for the numArrays attribute.

Input parameters: the value to which the numArrays attribute will be set 

Return value: the current value of the numArrays attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setNumArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::setNumArrays: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNumArrays: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__NUMARRAYS} = $val;
}



=item $val = $arraygroup->getNumArrays()

The restricted getter method for the numArrays attribute.

Input parameters: none

Return value: the current value of the numArrays attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNumArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::getNumArrays: arguments passed to getter")
    if @_;
  return $self->{__NUMARRAYS};
}




=back


=item arraySpacingY

From the MAGE-OM documentation for the C<arraySpacingY> attribute:

If there exist more than one array on a slide or a chip, then the spacing between the arrays is useful so that scanning / feature extraction software can crop images representing 1 unique bioassay. 



=over


=item $val = $arraygroup->setArraySpacingY($val)

The restricted setter method for the arraySpacingY attribute.

Input parameters: the value to which the arraySpacingY attribute will be set 

Return value: the current value of the arraySpacingY attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setArraySpacingY {
  my $self = shift;
  croak(__PACKAGE__ . "::setArraySpacingY: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArraySpacingY: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ARRAYSPACINGY} = $val;
}



=item $val = $arraygroup->getArraySpacingY()

The restricted getter method for the arraySpacingY attribute.

Input parameters: none

Return value: the current value of the arraySpacingY attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArraySpacingY {
  my $self = shift;
  croak(__PACKAGE__ . "::getArraySpacingY: arguments passed to getter")
    if @_;
  return $self->{__ARRAYSPACINGY};
}




=back


=item length

From the MAGE-OM documentation for the C<length> attribute:

The length of the platform.



=over


=item $val = $arraygroup->setLength($val)

The restricted setter method for the length attribute.

Input parameters: the value to which the length attribute will be set 

Return value: the current value of the length attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setLength {
  my $self = shift;
  croak(__PACKAGE__ . "::setLength: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setLength: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__LENGTH} = $val;
}



=item $val = $arraygroup->getLength()

The restricted getter method for the length attribute.

Input parameters: none

Return value: the current value of the length attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getLength {
  my $self = shift;
  croak(__PACKAGE__ . "::getLength: arguments passed to getter")
    if @_;
  return $self->{__LENGTH};
}




=back


=item orientationMarkPosition

From the MAGE-OM documentation for the C<orientationMarkPosition> attribute:

One of top, bottom, left or right.



=over


=item $val = $arraygroup->setOrientationMarkPosition($val)

The restricted setter method for the orientationMarkPosition attribute.

Input parameters: the value to which the orientationMarkPosition attribute will be set 

Return value: the current value of the orientationMarkPosition attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setOrientationMarkPosition {
  my $self = shift;
  croak(__PACKAGE__ . "::setOrientationMarkPosition: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setOrientationMarkPosition: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ORIENTATIONMARKPOSITION} = $val;
}



=item $val = $arraygroup->getOrientationMarkPosition()

The restricted getter method for the orientationMarkPosition attribute.

Input parameters: none

Return value: the current value of the orientationMarkPosition attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getOrientationMarkPosition {
  my $self = shift;
  croak(__PACKAGE__ . "::getOrientationMarkPosition: arguments passed to getter")
    if @_;
  return $self->{__ORIENTATIONMARKPOSITION};
}




=back


=item arraySpacingX

From the MAGE-OM documentation for the C<arraySpacingX> attribute:

If there exist more than one array on a slide or a chip, then the spacing between the arrays is useful so that scanning / feature extraction software can crop images representing 1 unique bioassay. 



=over


=item $val = $arraygroup->setArraySpacingX($val)

The restricted setter method for the arraySpacingX attribute.

Input parameters: the value to which the arraySpacingX attribute will be set 

Return value: the current value of the arraySpacingX attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setArraySpacingX {
  my $self = shift;
  croak(__PACKAGE__ . "::setArraySpacingX: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArraySpacingX: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ARRAYSPACINGX} = $val;
}



=item $val = $arraygroup->getArraySpacingX()

The restricted getter method for the arraySpacingX attribute.

Input parameters: none

Return value: the current value of the arraySpacingX attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArraySpacingX {
  my $self = shift;
  croak(__PACKAGE__ . "::getArraySpacingX: arguments passed to getter")
    if @_;
  return $self->{__ARRAYSPACINGX};
}




=back


=item barcode

From the MAGE-OM documentation for the C<barcode> attribute:

Identifier for the ArrayGroup.



=over


=item $val = $arraygroup->setBarcode($val)

The restricted setter method for the barcode attribute.

Input parameters: the value to which the barcode attribute will be set 

Return value: the current value of the barcode attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setBarcode {
  my $self = shift;
  croak(__PACKAGE__ . "::setBarcode: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setBarcode: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__BARCODE} = $val;
}



=item $val = $arraygroup->getBarcode()

The restricted getter method for the barcode attribute.

Input parameters: none

Return value: the current value of the barcode attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getBarcode {
  my $self = shift;
  croak(__PACKAGE__ . "::getBarcode: arguments passed to getter")
    if @_;
  return $self->{__BARCODE};
}




=back


=item orientationMark

From the MAGE-OM documentation for the C<orientationMark> attribute:

For a human to determine where the top left side of the array is, such as a barcode or frosted side of the glass, etc.



=over


=item $val = $arraygroup->setOrientationMark($val)

The restricted setter method for the orientationMark attribute.

Input parameters: the value to which the orientationMark attribute will be set 

Return value: the current value of the orientationMark attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setOrientationMark {
  my $self = shift;
  croak(__PACKAGE__ . "::setOrientationMark: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setOrientationMark: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ORIENTATIONMARK} = $val;
}



=item $val = $arraygroup->getOrientationMark()

The restricted getter method for the orientationMark attribute.

Input parameters: none

Return value: the current value of the orientationMark attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getOrientationMark {
  my $self = shift;
  croak(__PACKAGE__ . "::getOrientationMark: arguments passed to getter")
    if @_;
  return $self->{__ORIENTATIONMARK};
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
          'fiducials',
          bless( {
                   '__NAME' => 'fiducials',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Fiducial',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Association to the marks on the Array for alignment for the scanner.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'arrays',
          bless( {
                   '__NAME' => 'arrays',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1..N',
                   '__CLASS_NAME' => 'Array',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'substrateType',
          bless( {
                   '__NAME' => 'substrateType',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Commonly, arrays will be spotted on 1x3 glass microscope slides but there is nothing that says this must be the case.  This association is for scanners to inform them on the possible different formats of slides that can contain arrays.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'distanceUnit',
          bless( {
                   '__NAME' => 'distanceUnit',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'DistanceUnit',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'The unit of the measurement attributes.',
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

Bio::MAGE::Array::ArrayGroup: has the following association accessor methods:

=over


=item arrays


From the MAGE-OM documentation for the C<arrays> association:

Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. 



=over


=item $array_ref = $arraygroup->setArrays($array_ref)

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



=item $array_ref = $arraygroup->getArrays()

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



=item $arraygroup->addArrays(@vals)

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


=item distanceUnit


From the MAGE-OM documentation for the C<distanceUnit> association:

The unit of the measurement attributes.



=over


=item $val = $arraygroup->setDistanceUnit($val)

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



=item $val = $arraygroup->getDistanceUnit()

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


=item substrateType


From the MAGE-OM documentation for the C<substrateType> association:

Commonly, arrays will be spotted on 1x3 glass microscope slides but there is nothing that says this must be the case.  This association is for scanners to inform them on the possible different formats of slides that can contain arrays.



=over


=item $val = $arraygroup->setSubstrateType($val)

The restricted setter method for the substrateType association.

Input parameters: the value to which the substrateType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the substrateType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setSubstrateType {
  my $self = shift;
  croak(__PACKAGE__ . "::setSubstrateType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSubstrateType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setSubstrateType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__SUBSTRATETYPE} = $val;
}



=item $val = $arraygroup->getSubstrateType()

The restricted getter method for the substrateType association.

Input parameters: none

Return value: the current value of the substrateType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSubstrateType {
  my $self = shift;
  croak(__PACKAGE__ . "::getSubstrateType: arguments passed to getter")
    if @_;
  return $self->{__SUBSTRATETYPE};
}




=back


=item fiducials


From the MAGE-OM documentation for the C<fiducials> association:

Association to the marks on the Array for alignment for the scanner.



=over


=item $array_ref = $arraygroup->setFiducials($array_ref)

The restricted setter method for the fiducials association.

Input parameters: the value to which the fiducials association will be set : a reference to an array of objects of type C<Bio::MAGE::Array::Fiducial>

Return value: the current value of the fiducials association : a reference to an array of objects of type C<Bio::MAGE::Array::Fiducial>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Array::Fiducial> instances

=cut

sub setFiducials {
  my $self = shift;
  croak(__PACKAGE__ . "::setFiducials: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFiducials: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFiducials: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setFiducials: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Fiducial")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Fiducial');
  }

  return $self->{__FIDUCIALS} = $val;
}



=item $array_ref = $arraygroup->getFiducials()

The restricted getter method for the fiducials association.

Input parameters: none

Return value: the current value of the fiducials association : a reference to an array of objects of type C<Bio::MAGE::Array::Fiducial>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFiducials {
  my $self = shift;
  croak(__PACKAGE__ . "::getFiducials: arguments passed to getter")
    if @_;
  return $self->{__FIDUCIALS};
}



=item $arraygroup->addFiducials(@vals)

Because the fiducials association has list cardinality, it may store more
than one value. This method adds the current list of objects in the fiducials
association.

Input parameters: the list of values C<@vals> to add to the fiducials
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Array::Fiducial>

=cut

sub addFiducials {
  my $self = shift;
  croak(__PACKAGE__ . "::addFiducials: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFiducials: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Fiducial")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Fiducial');
  }

  push(@{$self->{__FIDUCIALS}},@vals);
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

