##############################
#
# Bio::MAGE::ArrayDesign::Zone
#
##############################
package Bio::MAGE::ArrayDesign::Zone;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: Zone.pm,v 1.4 2002/08/24 16:12:12 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::ArrayDesign::Zone

=head2 SYNOPSIS

  use Bio::MAGE::ArrayDesign::Zone;

    # creating an empty instance
  my $zone = Bio::MAGE::ArrayDesign::Zone->new();

    # creating an already populated instance
  my $zone = Bio::MAGE::ArrayDesign::Zone->new(lowerRightY=>$lowerRightY_value,
			lowerRightX=>$lowerRightX_value,
			upperLeftX=>$upperLeftX_value,
			upperLeftY=>$upperLeftY_value,
			row=>$row_value,
			column=>$column_value,
			distanceUnit=>$distanceUnit_value);

    # setting and retrieving object attributes
  my $lowerRightY_val = $zone->lowerRightY();
  $zone->lowerRightY($value);

  my $lowerRightX_val = $zone->lowerRightX();
  $zone->lowerRightX($value);

  my $upperLeftX_val = $zone->upperLeftX();
  $zone->upperLeftX($value);

  my $upperLeftY_val = $zone->upperLeftY();
  $zone->upperLeftY($value);

  my $row_val = $zone->row();
  $zone->row($value);

  my $column_val = $zone->column();
  $zone->column($value);

    # setting and retrieving object associations
  my $distanceUnit_val = $zone->distanceUnit();
  $zone->distanceUnit($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Zone> class:

Specifies the location of a zone on an array.



=cut


=head2 INHERITANCE


Bio::MAGE::ArrayDesign::Zone has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::ArrayDesign::Zone->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * lowerRightY

Sets the value of the lowerRightY attribute (from C<Bio::MAGE::ArrayDesign::Zone>).


=item * lowerRightX

Sets the value of the lowerRightX attribute (from C<Bio::MAGE::ArrayDesign::Zone>).


=item * upperLeftX

Sets the value of the upperLeftX attribute (from C<Bio::MAGE::ArrayDesign::Zone>).


=item * upperLeftY

Sets the value of the upperLeftY attribute (from C<Bio::MAGE::ArrayDesign::Zone>).


=item * row

Sets the value of the row attribute (from C<Bio::MAGE::ArrayDesign::Zone>).


=item * column

Sets the value of the column attribute (from C<Bio::MAGE::ArrayDesign::Zone>).


=item * distanceUnit

Sets the value of the distanceUnit association (from C<Bio::MAGE::ArrayDesign::Zone>).


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

Returns the full class name for this class, Bio::MAGE::ArrayDesign::Zone.

=cut

sub class_name {
  return q[Bio::MAGE::ArrayDesign::Zone];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::ArrayDesign::Zone.

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
  my @list = ('Bio::MAGE::Identifiable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('lowerRightY', 'lowerRightX', 'upperLeftX', 'upperLeftY', 'row', 'column');
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
  my @list = ('distanceUnit');
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

Bio::MAGE::ArrayDesign::Zone: has the following attribute accessor methods:

=over


=item lowerRightY

From the MAGE-OM documentation for the C<lowerRightY> attribute:

Boundary horizontal lower right position relative to (0,0).



=over


=item $val = $zone->setLowerRightY($val)

The restricted setter method for the lowerRightY attribute.

Input parameters: the value to which the lowerRightY attribute will be set 

Return value: the current value of the lowerRightY attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setLowerRightY {
  my $self = shift;
  croak(__PACKAGE__ . "::setLowerRightY: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setLowerRightY: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__LOWERRIGHTY} = $val;
}



=item $val = $zone->getLowerRightY()

The restricted getter method for the lowerRightY attribute.

Input parameters: none

Return value: the current value of the lowerRightY attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getLowerRightY {
  my $self = shift;
  croak(__PACKAGE__ . "::getLowerRightY: arguments passed to getter")
    if @_;
  return $self->{__LOWERRIGHTY};
}




=back


=item lowerRightX

From the MAGE-OM documentation for the C<lowerRightX> attribute:

Boundary vertical lower right position relative to (0,0).



=over


=item $val = $zone->setLowerRightX($val)

The restricted setter method for the lowerRightX attribute.

Input parameters: the value to which the lowerRightX attribute will be set 

Return value: the current value of the lowerRightX attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setLowerRightX {
  my $self = shift;
  croak(__PACKAGE__ . "::setLowerRightX: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setLowerRightX: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__LOWERRIGHTX} = $val;
}



=item $val = $zone->getLowerRightX()

The restricted getter method for the lowerRightX attribute.

Input parameters: none

Return value: the current value of the lowerRightX attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getLowerRightX {
  my $self = shift;
  croak(__PACKAGE__ . "::getLowerRightX: arguments passed to getter")
    if @_;
  return $self->{__LOWERRIGHTX};
}




=back


=item upperLeftX

From the MAGE-OM documentation for the C<upperLeftX> attribute:

Boundary vertical upper left position relative to (0,0).



=over


=item $val = $zone->setUpperLeftX($val)

The restricted setter method for the upperLeftX attribute.

Input parameters: the value to which the upperLeftX attribute will be set 

Return value: the current value of the upperLeftX attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setUpperLeftX {
  my $self = shift;
  croak(__PACKAGE__ . "::setUpperLeftX: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setUpperLeftX: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__UPPERLEFTX} = $val;
}



=item $val = $zone->getUpperLeftX()

The restricted getter method for the upperLeftX attribute.

Input parameters: none

Return value: the current value of the upperLeftX attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getUpperLeftX {
  my $self = shift;
  croak(__PACKAGE__ . "::getUpperLeftX: arguments passed to getter")
    if @_;
  return $self->{__UPPERLEFTX};
}




=back


=item upperLeftY

From the MAGE-OM documentation for the C<upperLeftY> attribute:

Boundary horizontal upper left position relative to (0,0).



=over


=item $val = $zone->setUpperLeftY($val)

The restricted setter method for the upperLeftY attribute.

Input parameters: the value to which the upperLeftY attribute will be set 

Return value: the current value of the upperLeftY attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setUpperLeftY {
  my $self = shift;
  croak(__PACKAGE__ . "::setUpperLeftY: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setUpperLeftY: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__UPPERLEFTY} = $val;
}



=item $val = $zone->getUpperLeftY()

The restricted getter method for the upperLeftY attribute.

Input parameters: none

Return value: the current value of the upperLeftY attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getUpperLeftY {
  my $self = shift;
  croak(__PACKAGE__ . "::getUpperLeftY: arguments passed to getter")
    if @_;
  return $self->{__UPPERLEFTY};
}




=back


=item row

From the MAGE-OM documentation for the C<row> attribute:

row position in the ZoneGroup



=over


=item $val = $zone->setRow($val)

The restricted setter method for the row attribute.

Input parameters: the value to which the row attribute will be set 

Return value: the current value of the row attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setRow {
  my $self = shift;
  croak(__PACKAGE__ . "::setRow: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setRow: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ROW} = $val;
}



=item $val = $zone->getRow()

The restricted getter method for the row attribute.

Input parameters: none

Return value: the current value of the row attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getRow {
  my $self = shift;
  croak(__PACKAGE__ . "::getRow: arguments passed to getter")
    if @_;
  return $self->{__ROW};
}




=back


=item column

From the MAGE-OM documentation for the C<column> attribute:

column position in the ZoneGroup.



=over


=item $val = $zone->setColumn($val)

The restricted setter method for the column attribute.

Input parameters: the value to which the column attribute will be set 

Return value: the current value of the column attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setColumn {
  my $self = shift;
  croak(__PACKAGE__ . "::setColumn: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setColumn: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__COLUMN} = $val;
}



=item $val = $zone->getColumn()

The restricted getter method for the column attribute.

Input parameters: none

Return value: the current value of the column attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getColumn {
  my $self = shift;
  croak(__PACKAGE__ . "::getColumn: arguments passed to getter")
    if @_;
  return $self->{__COLUMN};
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
          'distanceUnit',
          bless( {
                   '__NAME' => 'distanceUnit',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'DistanceUnit',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Unit for the Zone attributes.',
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

Bio::MAGE::ArrayDesign::Zone: has the following association accessor methods:

=over


=item distanceUnit


From the MAGE-OM documentation for the C<distanceUnit> association:

Unit for the Zone attributes.



=over


=item $val = $zone->setDistanceUnit($val)

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



=item $val = $zone->getDistanceUnit()

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

