##############################
#
# Bio::MAGE::ArrayDesign::ZoneLayout
#
##############################
# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2002 by:
#    * The MicroArray Gene Expression Database Society (MGED)
#    * Rosetta Inpharmatics
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

package Bio::MAGE::ArrayDesign::ZoneLayout;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = 20020902.6;

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::ArrayDesign::ZoneLayout

=head2 SYNOPSIS

  use Bio::MAGE::ArrayDesign::ZoneLayout;

    # creating an empty instance
  my $zonelayout = Bio::MAGE::ArrayDesign::ZoneLayout->new();

    # creating an already populated instance
  my $zonelayout = Bio::MAGE::ArrayDesign::ZoneLayout->new(numFeaturesPerCol=>$numFeaturesPerCol_value,
			spacingBetweenCols=>$spacingBetweenCols_value,
			spacingBetweenRows=>$spacingBetweenRows_value,
			numFeaturesPerRow=>$numFeaturesPerRow_value,
			distanceUnit=>$distanceUnit_value);

    # setting and retrieving object attributes
  my $numFeaturesPerCol_val = $zonelayout->numFeaturesPerCol();
  $zonelayout->numFeaturesPerCol($value);

  my $spacingBetweenCols_val = $zonelayout->spacingBetweenCols();
  $zonelayout->spacingBetweenCols($value);

  my $spacingBetweenRows_val = $zonelayout->spacingBetweenRows();
  $zonelayout->spacingBetweenRows($value);

  my $numFeaturesPerRow_val = $zonelayout->numFeaturesPerRow();
  $zonelayout->numFeaturesPerRow($value);

    # setting and retrieving object associations
  my $distanceUnit_val = $zonelayout->distanceUnit();
  $zonelayout->distanceUnit($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ZoneLayout> class:

Specifies the layout of features in a rectangular grid.



=cut


=head2 INHERITANCE


Bio::MAGE::ArrayDesign::ZoneLayout has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::ArrayDesign::ZoneLayout->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * numFeaturesPerCol

Sets the value of the numFeaturesPerCol attribute (this attribute was inherited
from class C<Bio::MAGE::ArrayDesign::ZoneLayout>).



=item * spacingBetweenCols

Sets the value of the spacingBetweenCols attribute (this attribute was inherited
from class C<Bio::MAGE::ArrayDesign::ZoneLayout>).



=item * spacingBetweenRows

Sets the value of the spacingBetweenRows attribute (this attribute was inherited
from class C<Bio::MAGE::ArrayDesign::ZoneLayout>).



=item * numFeaturesPerRow

Sets the value of the numFeaturesPerRow attribute (this attribute was inherited
from class C<Bio::MAGE::ArrayDesign::ZoneLayout>).



=item * distanceUnit

Sets the value of the distanceUnit association (this association was inherited
from class C<Bio::MAGE::ArrayDesign::ZoneLayout>).

The value will be of type C<DistanceUnit>.


=item * propertySets

Sets the value of the propertySets association (this association was inherited
from class C<Bio::MAGE::Extendable>).

The value will be of type C<NameValueType>.


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

Returns the full class name for this class, Bio::MAGE::ArrayDesign::ZoneLayout.

=cut

sub class_name {
  return q[Bio::MAGE::ArrayDesign::ZoneLayout];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::ArrayDesign::ZoneLayout.

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
  my @list = ('Bio::MAGE::Extendable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('numFeaturesPerCol',
'spacingBetweenCols',
'spacingBetweenRows',
'numFeaturesPerRow');
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

Bio::MAGE::ArrayDesign::ZoneLayout: has the following attribute accessor methods:

=over


=item numFeaturesPerCol

From the MAGE-OM documentation for the C<numFeaturesPerCol> attribute:

The number of features from top to bottom of the grid.



=over


=item $val = $zonelayout->setNumFeaturesPerCol($val)

The restricted setter method for the numFeaturesPerCol attribute.

Input parameters: the value to which the numFeaturesPerCol attribute will be set 

Return value: the current value of the numFeaturesPerCol attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setNumFeaturesPerCol {
  my $self = shift;
  croak(__PACKAGE__ . "::setNumFeaturesPerCol: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNumFeaturesPerCol: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__NUMFEATURESPERCOL} = $val;
}



=item $val = $zonelayout->getNumFeaturesPerCol()

The restricted getter method for the numFeaturesPerCol attribute.

Input parameters: none

Return value: the current value of the numFeaturesPerCol attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNumFeaturesPerCol {
  my $self = shift;
  croak(__PACKAGE__ . "::getNumFeaturesPerCol: arguments passed to getter")
    if @_;
  return $self->{__NUMFEATURESPERCOL};
}




=back


=item spacingBetweenCols

From the MAGE-OM documentation for the C<spacingBetweenCols> attribute:

Spacing between the columns.



=over


=item $val = $zonelayout->setSpacingBetweenCols($val)

The restricted setter method for the spacingBetweenCols attribute.

Input parameters: the value to which the spacingBetweenCols attribute will be set 

Return value: the current value of the spacingBetweenCols attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setSpacingBetweenCols {
  my $self = shift;
  croak(__PACKAGE__ . "::setSpacingBetweenCols: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSpacingBetweenCols: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__SPACINGBETWEENCOLS} = $val;
}



=item $val = $zonelayout->getSpacingBetweenCols()

The restricted getter method for the spacingBetweenCols attribute.

Input parameters: none

Return value: the current value of the spacingBetweenCols attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSpacingBetweenCols {
  my $self = shift;
  croak(__PACKAGE__ . "::getSpacingBetweenCols: arguments passed to getter")
    if @_;
  return $self->{__SPACINGBETWEENCOLS};
}




=back


=item spacingBetweenRows

From the MAGE-OM documentation for the C<spacingBetweenRows> attribute:

Spacing between the rows.



=over


=item $val = $zonelayout->setSpacingBetweenRows($val)

The restricted setter method for the spacingBetweenRows attribute.

Input parameters: the value to which the spacingBetweenRows attribute will be set 

Return value: the current value of the spacingBetweenRows attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setSpacingBetweenRows {
  my $self = shift;
  croak(__PACKAGE__ . "::setSpacingBetweenRows: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSpacingBetweenRows: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__SPACINGBETWEENROWS} = $val;
}



=item $val = $zonelayout->getSpacingBetweenRows()

The restricted getter method for the spacingBetweenRows attribute.

Input parameters: none

Return value: the current value of the spacingBetweenRows attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSpacingBetweenRows {
  my $self = shift;
  croak(__PACKAGE__ . "::getSpacingBetweenRows: arguments passed to getter")
    if @_;
  return $self->{__SPACINGBETWEENROWS};
}




=back


=item numFeaturesPerRow

From the MAGE-OM documentation for the C<numFeaturesPerRow> attribute:

The number of features from left to right.



=over


=item $val = $zonelayout->setNumFeaturesPerRow($val)

The restricted setter method for the numFeaturesPerRow attribute.

Input parameters: the value to which the numFeaturesPerRow attribute will be set 

Return value: the current value of the numFeaturesPerRow attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setNumFeaturesPerRow {
  my $self = shift;
  croak(__PACKAGE__ . "::setNumFeaturesPerRow: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNumFeaturesPerRow: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__NUMFEATURESPERROW} = $val;
}



=item $val = $zonelayout->getNumFeaturesPerRow()

The restricted getter method for the numFeaturesPerRow attribute.

Input parameters: none

Return value: the current value of the numFeaturesPerRow attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNumFeaturesPerRow {
  my $self = shift;
  croak(__PACKAGE__ . "::getNumFeaturesPerRow: arguments passed to getter")
    if @_;
  return $self->{__NUMFEATURESPERROW};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'distanceUnit',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '1',
                                         '__CARDINALITY' => '0..1',
                                         '__DOCUMENTATION' => 'Unit of the ZoneLayout attributes.',
                                         '__NAME' => 'distanceUnit',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'DistanceUnit'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 0,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'Unit of the ZoneLayout attributes.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'ZoneLayout'
                                      }, 'Bio::MAGE::Association::End' )
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

Bio::MAGE::ArrayDesign::ZoneLayout: has the following association accessor methods:

=over


=item distanceUnit


From the MAGE-OM documentation for the C<distanceUnit> association:

Unit of the ZoneLayout attributes.



=over


=item $val = $zonelayout->setDistanceUnit($val)

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



=item $val = $zonelayout->getDistanceUnit()

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

Jason E. Stewart (www.openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut

#
# End the module by returning a true value
#
1;

