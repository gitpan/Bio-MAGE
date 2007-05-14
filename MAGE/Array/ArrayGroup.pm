##############################
#
# Bio::MAGE::Array::ArrayGroup
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



package Bio::MAGE::Array::ArrayGroup;
use strict;
use Carp;

use base qw(Bio::MAGE::Identifiable);

use Bio::MAGE::Association;

use vars qw($__ASSOCIATIONS
	    $__CLASS_NAME
	    $__PACKAGE_NAME
	    $__SUBCLASSES
	    $__SUPERCLASSES
	    $__ATTRIBUTE_NAMES
	    $__ASSOCIATION_NAMES
	   );

use constant ORIENTATIONMARKPOSITION_RIGHT => 'right';
use constant ORIENTATIONMARKPOSITION_TOP => 'top';
use constant ORIENTATIONMARKPOSITION_LEFT => 'left';
use constant ORIENTATIONMARKPOSITION_BOTTOM => 'bottom';

=head1 NAME

Bio::MAGE::Array::ArrayGroup - Class for the MAGE-OM API

=head1 SYNOPSIS

  use Bio::MAGE::Array::ArrayGroup

  # creating an empty instance
  my $arraygroup = Bio::MAGE::Array::ArrayGroup->new();

  # creating an instance with existing data
  my $arraygroup = Bio::MAGE::Array::ArrayGroup->new(
        width=>$width_val,
        numArrays=>$numarrays_val,
        arraySpacingY=>$arrayspacingy_val,
        orientationMarkPosition=>$orientationmarkposition_val,
        arraySpacingX=>$arrayspacingx_val,
        name=>$name_val,
        barcode=>$barcode_val,
        orientationMark=>$orientationmark_val,
        length=>$length_val,
        identifier=>$identifier_val,
        arrays=>\@array_list,
        substrateType=>$ontologyentry_ref,
        auditTrail=>\@audit_list,
        propertySets=>\@namevaluetype_list,
        fiducials=>\@fiducial_list,
        distanceUnit=>$distanceunit_ref,
        descriptions=>\@description_list,
        security=>$security_ref,
  );


  # 'width' attribute
  my $width_val = $arraygroup->width(); # getter
  $arraygroup->width($value); # setter

  # 'numArrays' attribute
  my $numArrays_val = $arraygroup->numArrays(); # getter
  $arraygroup->numArrays($value); # setter

  # 'arraySpacingY' attribute
  my $arraySpacingY_val = $arraygroup->arraySpacingY(); # getter
  $arraygroup->arraySpacingY($value); # setter

  # 'orientationMarkPosition' attribute
  my $orientationMarkPosition_val = $arraygroup->orientationMarkPosition(); # getter
  $arraygroup->orientationMarkPosition($value); # setter

  # 'arraySpacingX' attribute
  my $arraySpacingX_val = $arraygroup->arraySpacingX(); # getter
  $arraygroup->arraySpacingX($value); # setter

  # 'name' attribute
  my $name_val = $arraygroup->name(); # getter
  $arraygroup->name($value); # setter

  # 'barcode' attribute
  my $barcode_val = $arraygroup->barcode(); # getter
  $arraygroup->barcode($value); # setter

  # 'orientationMark' attribute
  my $orientationMark_val = $arraygroup->orientationMark(); # getter
  $arraygroup->orientationMark($value); # setter

  # 'length' attribute
  my $length_val = $arraygroup->length(); # getter
  $arraygroup->length($value); # setter

  # 'identifier' attribute
  my $identifier_val = $arraygroup->identifier(); # getter
  $arraygroup->identifier($value); # setter


  # 'arrays' association
  my $array_array_ref = $arraygroup->arrays(); # getter
  $arraygroup->arrays(\@array_list); # setter

  # 'substrateType' association
  my $ontologyentry_ref = $arraygroup->substrateType(); # getter
  $arraygroup->substrateType($ontologyentry_ref); # setter

  # 'auditTrail' association
  my $audit_array_ref = $arraygroup->auditTrail(); # getter
  $arraygroup->auditTrail(\@audit_list); # setter

  # 'propertySets' association
  my $namevaluetype_array_ref = $arraygroup->propertySets(); # getter
  $arraygroup->propertySets(\@namevaluetype_list); # setter

  # 'fiducials' association
  my $fiducial_array_ref = $arraygroup->fiducials(); # getter
  $arraygroup->fiducials(\@fiducial_list); # setter

  # 'distanceUnit' association
  my $distanceunit_ref = $arraygroup->distanceUnit(); # getter
  $arraygroup->distanceUnit($distanceunit_ref); # setter

  # 'descriptions' association
  my $description_array_ref = $arraygroup->descriptions(); # getter
  $arraygroup->descriptions(\@description_list); # setter

  # 'security' association
  my $security_ref = $arraygroup->security(); # getter
  $arraygroup->security($security_ref); # setter



=head1 DESCRIPTION

From the MAGE-OM documentation for the C<ArrayGroup> class:

An array package is a physical platform that contains one or more arrays that are separately addressable (e.g. several arrays that can be hybridized on a single microscope slide) or a virtual grouping together of arrays.

The array package that has been manufactured has information about where certain artifacts about the array are located for scanning and feature extraction purposes.



=cut

=head1 INHERITANCE


Bio::MAGE::Array::ArrayGroup has the following superclasses:

=over


=item * Bio::MAGE::Identifiable


=back



=cut

BEGIN {
  $__CLASS_NAME        = q[Bio::MAGE::Array::ArrayGroup];
  $__PACKAGE_NAME      = q[Array];
  $__SUBCLASSES        = [];
  $__SUPERCLASSES      = ['Bio::MAGE::Identifiable'];
  $__ATTRIBUTE_NAMES   = ['width', 'numArrays', 'arraySpacingY', 'orientationMarkPosition', 'arraySpacingX', 'name', 'barcode', 'orientationMark', 'length', 'identifier'];
  $__ASSOCIATION_NAMES = ['arrays', 'auditTrail', 'substrateType', 'propertySets', 'fiducials', 'descriptions', 'distanceUnit', 'security'];
  $__ASSOCIATIONS      = [
          'fiducials',
          bless( {
                   '__SELF' => bless( {
                                        '__NAME' => undef,
                                        '__IS_REF' => 0,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'Association to the marks on the Array for alignment for the scanner.',
                                        '__CLASS_NAME' => 'ArrayGroup',
                                        '__RANK' => undef,
                                        '__ORDERED' => undef
                                      }, 'Bio::MAGE::Association::End' ),
                   '__OTHER' => bless( {
                                         '__NAME' => 'fiducials',
                                         '__IS_REF' => 1,
                                         '__CARDINALITY' => '0..N',
                                         '__DOCUMENTATION' => 'Association to the marks on the Array for alignment for the scanner.',
                                         '__CLASS_NAME' => 'Fiducial',
                                         '__RANK' => '1',
                                         '__ORDERED' => 0
                                       }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'arrays',
          bless( {
                   '__SELF' => bless( {
                                        '__NAME' => 'arrayGroup',
                                        '__IS_REF' => 1,
                                        '__CARDINALITY' => '0..1',
                                        '__DOCUMENTATION' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                                        '__CLASS_NAME' => 'ArrayGroup',
                                        '__RANK' => '3',
                                        '__ORDERED' => 0
                                      }, 'Bio::MAGE::Association::End' ),
                   '__OTHER' => bless( {
                                         '__NAME' => 'arrays',
                                         '__IS_REF' => 1,
                                         '__CARDINALITY' => '1..N',
                                         '__DOCUMENTATION' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                                         '__CLASS_NAME' => 'Array',
                                         '__RANK' => '2',
                                         '__ORDERED' => 0
                                       }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'substrateType',
          bless( {
                   '__SELF' => bless( {
                                        '__NAME' => undef,
                                        '__IS_REF' => 0,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'Commonly, arrays will be spotted on 1x3 glass microscope slides but there is nothing that says this must be the case.  This association is for scanners to inform them on the possible different formats of slides that can contain arrays.',
                                        '__CLASS_NAME' => 'ArrayGroup',
                                        '__RANK' => undef,
                                        '__ORDERED' => undef
                                      }, 'Bio::MAGE::Association::End' ),
                   '__OTHER' => bless( {
                                         '__NAME' => 'substrateType',
                                         '__IS_REF' => 1,
                                         '__CARDINALITY' => '0..1',
                                         '__DOCUMENTATION' => 'Commonly, arrays will be spotted on 1x3 glass microscope slides but there is nothing that says this must be the case.  This association is for scanners to inform them on the possible different formats of slides that can contain arrays.',
                                         '__CLASS_NAME' => 'OntologyEntry',
                                         '__RANK' => '3',
                                         '__ORDERED' => 0
                                       }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'distanceUnit',
          bless( {
                   '__SELF' => bless( {
                                        '__NAME' => undef,
                                        '__IS_REF' => 0,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'The unit of the measurement attributes.',
                                        '__CLASS_NAME' => 'ArrayGroup',
                                        '__RANK' => undef,
                                        '__ORDERED' => undef
                                      }, 'Bio::MAGE::Association::End' ),
                   '__OTHER' => bless( {
                                         '__NAME' => 'distanceUnit',
                                         '__IS_REF' => 1,
                                         '__CARDINALITY' => '0..1',
                                         '__DOCUMENTATION' => 'The unit of the measurement attributes.',
                                         '__CLASS_NAME' => 'DistanceUnit',
                                         '__RANK' => '4',
                                         '__ORDERED' => 0
                                       }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' )
        ]

}

=head1 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Array::ArrayGroup->methodname() syntax.

=over

=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over

=item * width

Sets the value of the C<width> attribute

=item * numArrays

Sets the value of the C<numArrays> attribute

=item * arraySpacingY

Sets the value of the C<arraySpacingY> attribute

=item * orientationMarkPosition

Sets the value of the C<orientationMarkPosition> attribute

=item * arraySpacingX

Sets the value of the C<arraySpacingX> attribute

=item * name

Sets the value of the C<name> attribute (this attribute was inherited from class C<Bio::MAGE::Identifiable>).


=item * barcode

Sets the value of the C<barcode> attribute

=item * orientationMark

Sets the value of the C<orientationMark> attribute

=item * length

Sets the value of the C<length> attribute

=item * identifier

Sets the value of the C<identifier> attribute (this attribute was inherited from class C<Bio::MAGE::Identifiable>).



=item * arrays

Sets the value of the C<arrays> association

The value must be of type: array of C<Bio::MAGE::Array::Array>.


=item * auditTrail

Sets the value of the C<auditTrail> association (this association was inherited from class C<Bio::MAGE::Describable>).


The value must be of type: array of C<Bio::MAGE::AuditAndSecurity::Audit>.


=item * substrateType

Sets the value of the C<substrateType> association

The value must be of type: instance of C<Bio::MAGE::Description::OntologyEntry>.


=item * propertySets

Sets the value of the C<propertySets> association (this association was inherited from class C<Bio::MAGE::Extendable>).


The value must be of type: array of C<Bio::MAGE::NameValueType>.


=item * fiducials

Sets the value of the C<fiducials> association

The value must be of type: array of C<Bio::MAGE::Array::Fiducial>.


=item * descriptions

Sets the value of the C<descriptions> association (this association was inherited from class C<Bio::MAGE::Describable>).


The value must be of type: array of C<Bio::MAGE::Description::Description>.


=item * distanceUnit

Sets the value of the C<distanceUnit> association

The value must be of type: instance of C<Bio::MAGE::Measurement::DistanceUnit>.


=item * security

Sets the value of the C<security> association (this association was inherited from class C<Bio::MAGE::Describable>).


The value must be of type: instance of C<Bio::MAGE::AuditAndSecurity::Security>.


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

C<Bio::MAGE::Array::ArrayGroup> has the following attribute accessor methods:

=over


=item width

Methods for the C<width> attribute.


From the MAGE-OM documentation:

The width of the platform


=over


=item $val = $arraygroup->setWidth($val)

The restricted setter method for the C<width> attribute.


Input parameters: the value to which the C<width> attribute will be set 

Return value: the current value of the C<width> attribute 

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

The restricted getter method for the C<width> attribute.

Input parameters: none

Return value: the current value of the C<width> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getWidth {
  my $self = shift;
  croak(__PACKAGE__ . "::getWidth: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__WIDTH};
}





=back


=item numArrays

Methods for the C<numArrays> attribute.


From the MAGE-OM documentation:

This attribute defines the number of arrays on a chip or a slide. 


=over


=item $val = $arraygroup->setNumArrays($val)

The restricted setter method for the C<numArrays> attribute.


Input parameters: the value to which the C<numArrays> attribute will be set 

Return value: the current value of the C<numArrays> attribute 

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

The restricted getter method for the C<numArrays> attribute.

Input parameters: none

Return value: the current value of the C<numArrays> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getNumArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::getNumArrays: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__NUMARRAYS};
}





=back


=item arraySpacingY

Methods for the C<arraySpacingY> attribute.


From the MAGE-OM documentation:

If there exist more than one array on a slide or a chip, then the spacing between the arrays is useful so that scanning / feature extraction software can crop images representing 1 unique bioassay. 


=over


=item $val = $arraygroup->setArraySpacingY($val)

The restricted setter method for the C<arraySpacingY> attribute.


Input parameters: the value to which the C<arraySpacingY> attribute will be set 

Return value: the current value of the C<arraySpacingY> attribute 

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

The restricted getter method for the C<arraySpacingY> attribute.

Input parameters: none

Return value: the current value of the C<arraySpacingY> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getArraySpacingY {
  my $self = shift;
  croak(__PACKAGE__ . "::getArraySpacingY: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__ARRAYSPACINGY};
}





=back


=item orientationMarkPosition

Methods for the C<orientationMarkPosition> attribute.


From the MAGE-OM documentation:

One of top, bottom, left or right.


=over


=item $val = $arraygroup->setOrientationMarkPosition($val)

The restricted setter method for the C<orientationMarkPosition> attribute.

C<orientationMarkPosition> is an B<enumerated> attribute - it can only be set to C<undef> or one of the following values: top bottom left right


Input parameters: the value to which the C<orientationMarkPosition> attribute will be set 

Return value: the current value of the C<orientationMarkPosition> attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$val> is not one of the accepted enumeration values: top bottom left right

=cut


sub setOrientationMarkPosition {
  my $self = shift;
  croak(__PACKAGE__ . "::setOrientationMarkPosition: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setOrientationMarkPosition: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setOrientationMarkPosition: expected one of enum values : top bottom left right, got $val")
    unless (not defined $val) or (grep {$val eq $_} qw(top bottom left right));

  return $self->{__ORIENTATIONMARKPOSITION} = $val;
}


=item $val = $arraygroup->getOrientationMarkPosition()

The restricted getter method for the C<orientationMarkPosition> attribute.

Input parameters: none

Return value: the current value of the C<orientationMarkPosition> attribute : an instance of type C<top bottom left right>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getOrientationMarkPosition {
  my $self = shift;
  croak(__PACKAGE__ . "::getOrientationMarkPosition: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__ORIENTATIONMARKPOSITION};
}





=back


=item arraySpacingX

Methods for the C<arraySpacingX> attribute.


From the MAGE-OM documentation:

If there exist more than one array on a slide or a chip, then the spacing between the arrays is useful so that scanning / feature extraction software can crop images representing 1 unique bioassay. 


=over


=item $val = $arraygroup->setArraySpacingX($val)

The restricted setter method for the C<arraySpacingX> attribute.


Input parameters: the value to which the C<arraySpacingX> attribute will be set 

Return value: the current value of the C<arraySpacingX> attribute 

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

The restricted getter method for the C<arraySpacingX> attribute.

Input parameters: none

Return value: the current value of the C<arraySpacingX> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getArraySpacingX {
  my $self = shift;
  croak(__PACKAGE__ . "::getArraySpacingX: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__ARRAYSPACINGX};
}





=back


=item name

Methods for the C<name> attribute.


From the MAGE-OM documentation:

The potentially ambiguous common identifier.


=over


=item $val = $arraygroup->setName($val)

The restricted setter method for the C<name> attribute.


Input parameters: the value to which the C<name> attribute will be set 

Return value: the current value of the C<name> attribute 

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


=item $val = $arraygroup->getName()

The restricted getter method for the C<name> attribute.

Input parameters: none

Return value: the current value of the C<name> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getName {
  my $self = shift;
  croak(__PACKAGE__ . "::getName: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__NAME};
}





=back


=item barcode

Methods for the C<barcode> attribute.


From the MAGE-OM documentation:

Identifier for the ArrayGroup.


=over


=item $val = $arraygroup->setBarcode($val)

The restricted setter method for the C<barcode> attribute.


Input parameters: the value to which the C<barcode> attribute will be set 

Return value: the current value of the C<barcode> attribute 

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

The restricted getter method for the C<barcode> attribute.

Input parameters: none

Return value: the current value of the C<barcode> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getBarcode {
  my $self = shift;
  croak(__PACKAGE__ . "::getBarcode: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__BARCODE};
}





=back


=item orientationMark

Methods for the C<orientationMark> attribute.


From the MAGE-OM documentation:

For a human to determine where the top left side of the array is, such as a barcode or frosted side of the glass, etc.


=over


=item $val = $arraygroup->setOrientationMark($val)

The restricted setter method for the C<orientationMark> attribute.


Input parameters: the value to which the C<orientationMark> attribute will be set 

Return value: the current value of the C<orientationMark> attribute 

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

The restricted getter method for the C<orientationMark> attribute.

Input parameters: none

Return value: the current value of the C<orientationMark> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getOrientationMark {
  my $self = shift;
  croak(__PACKAGE__ . "::getOrientationMark: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__ORIENTATIONMARK};
}





=back


=item length

Methods for the C<length> attribute.


From the MAGE-OM documentation:

The length of the platform.


=over


=item $val = $arraygroup->setLength($val)

The restricted setter method for the C<length> attribute.


Input parameters: the value to which the C<length> attribute will be set 

Return value: the current value of the C<length> attribute 

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

The restricted getter method for the C<length> attribute.

Input parameters: none

Return value: the current value of the C<length> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getLength {
  my $self = shift;
  croak(__PACKAGE__ . "::getLength: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__LENGTH};
}





=back


=item identifier

Methods for the C<identifier> attribute.


From the MAGE-OM documentation:

An identifier is an unambiguous string that is unique within the scope (i.e. a document, a set of related documents, or a repository) of its use.


=over


=item $val = $arraygroup->setIdentifier($val)

The restricted setter method for the C<identifier> attribute.


Input parameters: the value to which the C<identifier> attribute will be set 

Return value: the current value of the C<identifier> attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified

=cut


sub setIdentifier {
  my $self = shift;
  croak(__PACKAGE__ . "::setIdentifier: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setIdentifier: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__IDENTIFIER} = $val;
}


=item $val = $arraygroup->getIdentifier()

The restricted getter method for the C<identifier> attribute.

Input parameters: none

Return value: the current value of the C<identifier> attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getIdentifier {
  my $self = shift;
  croak(__PACKAGE__ . "::getIdentifier: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__IDENTIFIER};
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

Bio::MAGE::Array::ArrayGroup has the following association accessor methods:

=over


=item arrays

Methods for the C<arrays> association.


From the MAGE-OM documentation:

Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. 


=over


=item $array_ref = $arraygroup->setArrays($array_ref)

The restricted setter method for the C<arrays> association.


Input parameters: the value to which the C<arrays> association will be set : a reference to an array of objects of type C<Bio::MAGE::Array::Array>

Return value: the current value of the C<arrays> association : a reference to an array of objects of type C<Bio::MAGE::Array::Array>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$array_ref> is not a reference to an array class C<Bio::MAGE::Array::Array> instances

=cut


sub setArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::setArrays: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArrays: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setArrays: expected array reference, got $self")
    unless (not defined $val) or UNIVERSAL::isa($val,'ARRAY');
  if (defined $val) {
    foreach my $val_ent (@{$val}) {
      croak(__PACKAGE__ . "::setArrays: wrong type: " . ref($val_ent) . " expected Bio::MAGE::Array::Array")
        unless UNIVERSAL::isa($val_ent,'Bio::MAGE::Array::Array');
    }
  }

  return $self->{__ARRAYS} = $val;
}


=item $array_ref = $arraygroup->getArrays()

The restricted getter method for the C<arrays> association.

Input parameters: none

Return value: the current value of the C<arrays> association : a reference to an array of objects of type C<Bio::MAGE::Array::Array>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::getArrays: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__ARRAYS};
}




=item $val = $arraygroup->addArrays(@vals)

Because the arrays association has list cardinality, it may store more
than one value. This method adds the current list of objects in the arrays association.

Input parameters: the list of values C<@vals> to add to the arrays association. B<NOTE>: submitting a single value is permitted.

Return value: the number of items stored in the slot B<after> adding C<@vals>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Array::Array>

=cut


sub addArrays {
  my $self = shift;
  croak(__PACKAGE__ . "::addArrays: no arguments passed to adder")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addArrays: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Array")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Array');
  }

  return push(@{$self->{__ARRAYS}},@vals);
}





=back


=item auditTrail

Methods for the C<auditTrail> association.


From the MAGE-OM documentation:

A list of Audit instances that track changes to the instance of Describable.


=over


=item $array_ref = $arraygroup->setAuditTrail($array_ref)

The restricted setter method for the C<auditTrail> association.


Input parameters: the value to which the C<auditTrail> association will be set : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Return value: the current value of the C<auditTrail> association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$array_ref> is not a reference to an array class C<Bio::MAGE::AuditAndSecurity::Audit> instances

=cut


sub setAuditTrail {
  my $self = shift;
  croak(__PACKAGE__ . "::setAuditTrail: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAuditTrail: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setAuditTrail: expected array reference, got $self")
    unless (not defined $val) or UNIVERSAL::isa($val,'ARRAY');
  if (defined $val) {
    foreach my $val_ent (@{$val}) {
      croak(__PACKAGE__ . "::setAuditTrail: wrong type: " . ref($val_ent) . " expected Bio::MAGE::AuditAndSecurity::Audit")
        unless UNIVERSAL::isa($val_ent,'Bio::MAGE::AuditAndSecurity::Audit');
    }
  }

  return $self->{__AUDITTRAIL} = $val;
}


=item $array_ref = $arraygroup->getAuditTrail()

The restricted getter method for the C<auditTrail> association.

Input parameters: none

Return value: the current value of the C<auditTrail> association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getAuditTrail {
  my $self = shift;
  croak(__PACKAGE__ . "::getAuditTrail: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__AUDITTRAIL};
}




=item $val = $arraygroup->addAuditTrail(@vals)

Because the auditTrail association has list cardinality, it may store more
than one value. This method adds the current list of objects in the auditTrail association.

Input parameters: the list of values C<@vals> to add to the auditTrail association. B<NOTE>: submitting a single value is permitted.

Return value: the number of items stored in the slot B<after> adding C<@vals>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::AuditAndSecurity::Audit>

=cut


sub addAuditTrail {
  my $self = shift;
  croak(__PACKAGE__ . "::addAuditTrail: no arguments passed to adder")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addAuditTrail: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Audit")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Audit');
  }

  return push(@{$self->{__AUDITTRAIL}},@vals);
}





=back


=item substrateType

Methods for the C<substrateType> association.


From the MAGE-OM documentation:

Commonly, arrays will be spotted on 1x3 glass microscope slides but there is nothing that says this must be the case.  This association is for scanners to inform them on the possible different formats of slides that can contain arrays.


=over


=item $val = $arraygroup->setSubstrateType($val)

The restricted setter method for the C<substrateType> association.


Input parameters: the value to which the C<substrateType> association will be set : one of the accepted enumerated values.

Return value: the current value of the C<substrateType> association : one of the accepted enumerated values.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$val> is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut


sub setSubstrateType {
  my $self = shift;
  croak(__PACKAGE__ . "::setSubstrateType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSubstrateType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setSubstrateType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless (not defined $val) or UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__SUBSTRATETYPE} = $val;
}


=item $val = $arraygroup->getSubstrateType()

The restricted getter method for the C<substrateType> association.

Input parameters: none

Return value: the current value of the C<substrateType> association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getSubstrateType {
  my $self = shift;
  croak(__PACKAGE__ . "::getSubstrateType: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__SUBSTRATETYPE};
}





=back


=item propertySets

Methods for the C<propertySets> association.


From the MAGE-OM documentation:

Allows specification of name/value pairs.  Meant to primarily help in-house, pipeline processing of instances by providing a place for values that aren't part of the specification proper.


=over


=item $array_ref = $arraygroup->setPropertySets($array_ref)

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


=item $array_ref = $arraygroup->getPropertySets()

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




=item $val = $arraygroup->addPropertySets(@vals)

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


=item fiducials

Methods for the C<fiducials> association.


From the MAGE-OM documentation:

Association to the marks on the Array for alignment for the scanner.


=over


=item $array_ref = $arraygroup->setFiducials($array_ref)

The restricted setter method for the C<fiducials> association.


Input parameters: the value to which the C<fiducials> association will be set : a reference to an array of objects of type C<Bio::MAGE::Array::Fiducial>

Return value: the current value of the C<fiducials> association : a reference to an array of objects of type C<Bio::MAGE::Array::Fiducial>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$array_ref> is not a reference to an array class C<Bio::MAGE::Array::Fiducial> instances

=cut


sub setFiducials {
  my $self = shift;
  croak(__PACKAGE__ . "::setFiducials: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFiducials: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFiducials: expected array reference, got $self")
    unless (not defined $val) or UNIVERSAL::isa($val,'ARRAY');
  if (defined $val) {
    foreach my $val_ent (@{$val}) {
      croak(__PACKAGE__ . "::setFiducials: wrong type: " . ref($val_ent) . " expected Bio::MAGE::Array::Fiducial")
        unless UNIVERSAL::isa($val_ent,'Bio::MAGE::Array::Fiducial');
    }
  }

  return $self->{__FIDUCIALS} = $val;
}


=item $array_ref = $arraygroup->getFiducials()

The restricted getter method for the C<fiducials> association.

Input parameters: none

Return value: the current value of the C<fiducials> association : a reference to an array of objects of type C<Bio::MAGE::Array::Fiducial>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getFiducials {
  my $self = shift;
  croak(__PACKAGE__ . "::getFiducials: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__FIDUCIALS};
}




=item $val = $arraygroup->addFiducials(@vals)

Because the fiducials association has list cardinality, it may store more
than one value. This method adds the current list of objects in the fiducials association.

Input parameters: the list of values C<@vals> to add to the fiducials association. B<NOTE>: submitting a single value is permitted.

Return value: the number of items stored in the slot B<after> adding C<@vals>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Array::Fiducial>

=cut


sub addFiducials {
  my $self = shift;
  croak(__PACKAGE__ . "::addFiducials: no arguments passed to adder")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFiducials: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Fiducial")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Fiducial');
  }

  return push(@{$self->{__FIDUCIALS}},@vals);
}





=back


=item descriptions

Methods for the C<descriptions> association.


From the MAGE-OM documentation:

Free hand text descriptions.  Makes available the associations of Description to an instance of Describable.


=over


=item $array_ref = $arraygroup->setDescriptions($array_ref)

The restricted setter method for the C<descriptions> association.


Input parameters: the value to which the C<descriptions> association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Return value: the current value of the C<descriptions> association : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$array_ref> is not a reference to an array class C<Bio::MAGE::Description::Description> instances

=cut


sub setDescriptions {
  my $self = shift;
  croak(__PACKAGE__ . "::setDescriptions: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDescriptions: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setDescriptions: expected array reference, got $self")
    unless (not defined $val) or UNIVERSAL::isa($val,'ARRAY');
  if (defined $val) {
    foreach my $val_ent (@{$val}) {
      croak(__PACKAGE__ . "::setDescriptions: wrong type: " . ref($val_ent) . " expected Bio::MAGE::Description::Description")
        unless UNIVERSAL::isa($val_ent,'Bio::MAGE::Description::Description');
    }
  }

  return $self->{__DESCRIPTIONS} = $val;
}


=item $array_ref = $arraygroup->getDescriptions()

The restricted getter method for the C<descriptions> association.

Input parameters: none

Return value: the current value of the C<descriptions> association : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getDescriptions {
  my $self = shift;
  croak(__PACKAGE__ . "::getDescriptions: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__DESCRIPTIONS};
}




=item $val = $arraygroup->addDescriptions(@vals)

Because the descriptions association has list cardinality, it may store more
than one value. This method adds the current list of objects in the descriptions association.

Input parameters: the list of values C<@vals> to add to the descriptions association. B<NOTE>: submitting a single value is permitted.

Return value: the number of items stored in the slot B<after> adding C<@vals>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::Description>

=cut


sub addDescriptions {
  my $self = shift;
  croak(__PACKAGE__ . "::addDescriptions: no arguments passed to adder")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addDescriptions: wrong type: " . ref($val) . " expected Bio::MAGE::Description::Description")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::Description');
  }

  return push(@{$self->{__DESCRIPTIONS}},@vals);
}





=back


=item distanceUnit

Methods for the C<distanceUnit> association.


From the MAGE-OM documentation:

The unit of the measurement attributes.


=over


=item $val = $arraygroup->setDistanceUnit($val)

The restricted setter method for the C<distanceUnit> association.


Input parameters: the value to which the C<distanceUnit> association will be set : one of the accepted enumerated values.

Return value: the current value of the C<distanceUnit> association : one of the accepted enumerated values.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$val> is not an instance of class C<Bio::MAGE::Measurement::DistanceUnit>

=cut


sub setDistanceUnit {
  my $self = shift;
  croak(__PACKAGE__ . "::setDistanceUnit: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDistanceUnit: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setDistanceUnit: wrong type: " . ref($val) . " expected Bio::MAGE::Measurement::DistanceUnit") unless (not defined $val) or UNIVERSAL::isa($val,'Bio::MAGE::Measurement::DistanceUnit');
  return $self->{__DISTANCEUNIT} = $val;
}


=item $val = $arraygroup->getDistanceUnit()

The restricted getter method for the C<distanceUnit> association.

Input parameters: none

Return value: the current value of the C<distanceUnit> association : an instance of type C<Bio::MAGE::Measurement::DistanceUnit>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getDistanceUnit {
  my $self = shift;
  croak(__PACKAGE__ . "::getDistanceUnit: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__DISTANCEUNIT};
}





=back


=item security

Methods for the C<security> association.


From the MAGE-OM documentation:

Information on the security for the instance of the class.


=over


=item $val = $arraygroup->setSecurity($val)

The restricted setter method for the C<security> association.


Input parameters: the value to which the C<security> association will be set : one of the accepted enumerated values.

Return value: the current value of the C<security> association : one of the accepted enumerated values.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified, or if C<$val> is not an instance of class C<Bio::MAGE::AuditAndSecurity::Security>

=cut


sub setSecurity {
  my $self = shift;
  croak(__PACKAGE__ . "::setSecurity: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSecurity: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setSecurity: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Security") unless (not defined $val) or UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Security');
  return $self->{__SECURITY} = $val;
}


=item $val = $arraygroup->getSecurity()

The restricted getter method for the C<security> association.

Input parameters: none

Return value: the current value of the C<security> association : an instance of type C<Bio::MAGE::AuditAndSecurity::Security>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


sub getSecurity {
  my $self = shift;
  croak(__PACKAGE__ . "::getSecurity: arguments passed to getter")
    if @_;
  my $val = shift;
  return $self->{__SECURITY};
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

