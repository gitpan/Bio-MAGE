##############################
#
# Bio::MAGE::Array::FeatureDefect
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

package Bio::MAGE::Array::FeatureDefect;

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


=head1 Bio::MAGE::Array::FeatureDefect

=head2 SYNOPSIS

  use Bio::MAGE::Array::FeatureDefect;

    # creating an empty instance
  my $featuredefect = Bio::MAGE::Array::FeatureDefect->new();

    # creating an already populated instance
  my $featuredefect = Bio::MAGE::Array::FeatureDefect->new(feature=>$feature_value,
			defectType=>$defectType_value,
			positionDelta=>$positionDelta_value);

    # setting and retrieving object associations
  my $feature_val = $featuredefect->feature();
  $featuredefect->feature($value);

  my $defectType_val = $featuredefect->defectType();
  $featuredefect->defectType($value);

  my $positionDelta_val = $featuredefect->positionDelta();
  $featuredefect->positionDelta($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<FeatureDefect> class:

Stores the defect information for a feature.



=cut


=head2 INHERITANCE


Bio::MAGE::Array::FeatureDefect has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Array::FeatureDefect->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * feature

Sets the value of the feature association (this association was inherited
from class C<Bio::MAGE::Array::FeatureDefect>).

The value will be of type C<Feature>.


=item * defectType

Sets the value of the defectType association (this association was inherited
from class C<Bio::MAGE::Array::FeatureDefect>).

The value will be of type C<OntologyEntry>.


=item * positionDelta

Sets the value of the positionDelta association (this association was inherited
from class C<Bio::MAGE::Array::FeatureDefect>).

The value will be of type C<PositionDelta>.


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

Returns the full class name for this class, Bio::MAGE::Array::FeatureDefect.

=cut

sub class_name {
  return q[Bio::MAGE::Array::FeatureDefect];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Array::FeatureDefect.

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
  my @list = ('Bio::MAGE::Extendable');
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
  my @list = ('feature',
'defectType',
'positionDelta');
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

Bio::MAGE::Array::FeatureDefect: has the following attribute accessor methods:

=over



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'defectType',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '1',
                                         '__CARDINALITY' => '1',
                                         '__DOCUMENTATION' => 'Indicates the type of defect (e.g. a missing feature or a moved feature).',
                                         '__NAME' => 'defectType',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'OntologyEntry'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 0,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'Indicates the type of defect (e.g. a missing feature or a moved feature).',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'FeatureDefect'
                                      }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'positionDelta',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '2',
                                         '__CARDINALITY' => '0..1',
                                         '__DOCUMENTATION' => 'How the feature deviates in position from the ArrayDesign.',
                                         '__NAME' => 'positionDelta',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'PositionDelta'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 0,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'How the feature deviates in position from the ArrayDesign.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'FeatureDefect'
                                      }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'feature',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '3',
                                         '__CARDINALITY' => '1',
                                         '__DOCUMENTATION' => 'The feature that was manufactured defectively.',
                                         '__NAME' => 'feature',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'Feature'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 1,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '0..N',
                                        '__DOCUMENTATION' => 'The feature that was manufactured defectively.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'FeatureDefect'
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

Bio::MAGE::Array::FeatureDefect: has the following association accessor methods:

=over


=item feature


From the MAGE-OM documentation for the C<feature> association:

The feature that was manufactured defectively.



=over


=item $val = $featuredefect->setFeature($val)

The restricted setter method for the feature association.

Input parameters: the value to which the feature association will be set : an instance of type C<Bio::MAGE::DesignElement::Feature>.

Return value: the current value of the feature association : an instance of type C<Bio::MAGE::DesignElement::Feature>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::DesignElement::Feature>

=cut

sub setFeature {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeature: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeature: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setFeature: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature") unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  return $self->{__FEATURE} = $val;
}



=item $val = $featuredefect->getFeature()

The restricted getter method for the feature association.

Input parameters: none

Return value: the current value of the feature association : an instance of type C<Bio::MAGE::DesignElement::Feature>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeature {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeature: arguments passed to getter")
    if @_;
  return $self->{__FEATURE};
}




=back


=item defectType


From the MAGE-OM documentation for the C<defectType> association:

Indicates the type of defect (e.g. a missing feature or a moved feature).



=over


=item $val = $featuredefect->setDefectType($val)

The restricted setter method for the defectType association.

Input parameters: the value to which the defectType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the defectType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setDefectType {
  my $self = shift;
  croak(__PACKAGE__ . "::setDefectType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDefectType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setDefectType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__DEFECTTYPE} = $val;
}



=item $val = $featuredefect->getDefectType()

The restricted getter method for the defectType association.

Input parameters: none

Return value: the current value of the defectType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDefectType {
  my $self = shift;
  croak(__PACKAGE__ . "::getDefectType: arguments passed to getter")
    if @_;
  return $self->{__DEFECTTYPE};
}




=back


=item positionDelta


From the MAGE-OM documentation for the C<positionDelta> association:

How the feature deviates in position from the ArrayDesign.



=over


=item $val = $featuredefect->setPositionDelta($val)

The restricted setter method for the positionDelta association.

Input parameters: the value to which the positionDelta association will be set : an instance of type C<Bio::MAGE::Array::PositionDelta>.

Return value: the current value of the positionDelta association : an instance of type C<Bio::MAGE::Array::PositionDelta>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Array::PositionDelta>

=cut

sub setPositionDelta {
  my $self = shift;
  croak(__PACKAGE__ . "::setPositionDelta: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPositionDelta: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setPositionDelta: wrong type: " . ref($val) . " expected Bio::MAGE::Array::PositionDelta") unless UNIVERSAL::isa($val,'Bio::MAGE::Array::PositionDelta');
  return $self->{__POSITIONDELTA} = $val;
}



=item $val = $featuredefect->getPositionDelta()

The restricted getter method for the positionDelta association.

Input parameters: none

Return value: the current value of the positionDelta association : an instance of type C<Bio::MAGE::Array::PositionDelta>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPositionDelta {
  my $self = shift;
  croak(__PACKAGE__ . "::getPositionDelta: arguments passed to getter")
    if @_;
  return $self->{__POSITIONDELTA};
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
