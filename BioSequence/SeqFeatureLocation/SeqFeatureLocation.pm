##############################
#
# Bio::MAGE::BioSequence::SeqFeatureLocation
#
##############################
package Bio::MAGE::BioSequence::SeqFeatureLocation;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = q[$Id: SeqFeatureLocation.pm,v 1.4 2002/08/24 16:12:18 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::BioSequence::SeqFeatureLocation

=head2 SYNOPSIS

  use Bio::MAGE::BioSequence::SeqFeatureLocation;

    # creating an empty instance
  my $seqfeaturelocation = Bio::MAGE::BioSequence::SeqFeatureLocation->new();

    # creating an already populated instance
  my $seqfeaturelocation = Bio::MAGE::BioSequence::SeqFeatureLocation->new(strandType=>$strandType_value,
			coordinate=>$coordinate_value,
			subregions=>$subregions_value);

    # setting and retrieving object attributes
  my $strandType_val = $seqfeaturelocation->strandType();
  $seqfeaturelocation->strandType($value);

    # setting and retrieving object associations
  my $coordinate_val = $seqfeaturelocation->coordinate();
  $seqfeaturelocation->coordinate($value);

  my $subregions_val = $seqfeaturelocation->subregions();
  $seqfeaturelocation->subregions($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<SeqFeatureLocation> class:

The location of the SeqFeature annotation.



=cut


=head2 INHERITANCE


Bio::MAGE::BioSequence::SeqFeatureLocation has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::BioSequence::SeqFeatureLocation->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * strandType

Sets the value of the strandType attribute (from C<Bio::MAGE::BioSequence::SeqFeatureLocation>).


=item * coordinate

Sets the value of the coordinate association (from C<Bio::MAGE::BioSequence::SeqFeatureLocation>).


=item * subregions

Sets the value of the subregions association (from C<Bio::MAGE::BioSequence::SeqFeatureLocation>).


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

Returns the full class name for this class, Bio::MAGE::BioSequence::SeqFeatureLocation.

=cut

sub class_name {
  return q[Bio::MAGE::BioSequence::SeqFeatureLocation];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::BioSequence::SeqFeatureLocation.

=cut

sub package {
  return q[BioSequence];
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
  my @list = ('strandType');
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
  my @list = ('coordinate', 'subregions');
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

Bio::MAGE::BioSequence::SeqFeatureLocation: has the following attribute accessor methods:

=over


=item strandType

From the MAGE-OM documentation for the C<strandType> attribute:

Indicates the direction and/or type of the SeqFeature, i.e. whether it is in the 5' or 3' direction, is double stranded, etc.



=over


=item $val = $seqfeaturelocation->setStrandType($val)

The restricted setter method for the strandType attribute.

Input parameters: the value to which the strandType attribute will be set 

Return value: the current value of the strandType attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setStrandType {
  my $self = shift;
  croak(__PACKAGE__ . "::setStrandType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setStrandType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__STRANDTYPE} = $val;
}



=item $val = $seqfeaturelocation->getStrandType()

The restricted getter method for the strandType attribute.

Input parameters: none

Return value: the current value of the strandType attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getStrandType {
  my $self = shift;
  croak(__PACKAGE__ . "::getStrandType: arguments passed to getter")
    if @_;
  return $self->{__STRANDTYPE};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'subregions',
          bless( {
                   '__NAME' => 'subregions',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'SeqFeatureLocation',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Regions within the SeqFeature.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'coordinate',
          bless( {
                   '__NAME' => 'coordinate',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'SequencePosition',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'At which base pairs or amino acid this SeqFeature begins and ends.',
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

Bio::MAGE::BioSequence::SeqFeatureLocation: has the following association accessor methods:

=over


=item coordinate


From the MAGE-OM documentation for the C<coordinate> association:

At which base pairs or amino acid this SeqFeature begins and ends.



=over


=item $val = $seqfeaturelocation->setCoordinate($val)

The restricted setter method for the coordinate association.

Input parameters: the value to which the coordinate association will be set : an instance of type C<Bio::MAGE::BioSequence::SequencePosition>.

Return value: the current value of the coordinate association : an instance of type C<Bio::MAGE::BioSequence::SequencePosition>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::BioSequence::SequencePosition>

=cut

sub setCoordinate {
  my $self = shift;
  croak(__PACKAGE__ . "::setCoordinate: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCoordinate: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setCoordinate: wrong type: " . ref($val) . " expected Bio::MAGE::BioSequence::SequencePosition") unless UNIVERSAL::isa($val,'Bio::MAGE::BioSequence::SequencePosition');
  return $self->{__COORDINATE} = $val;
}



=item $val = $seqfeaturelocation->getCoordinate()

The restricted getter method for the coordinate association.

Input parameters: none

Return value: the current value of the coordinate association : an instance of type C<Bio::MAGE::BioSequence::SequencePosition>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getCoordinate {
  my $self = shift;
  croak(__PACKAGE__ . "::getCoordinate: arguments passed to getter")
    if @_;
  return $self->{__COORDINATE};
}




=back


=item subregions


From the MAGE-OM documentation for the C<subregions> association:

Regions within the SeqFeature.



=over


=item $array_ref = $seqfeaturelocation->setSubregions($array_ref)

The restricted setter method for the subregions association.

Input parameters: the value to which the subregions association will be set : a reference to an array of objects of type C<Bio::MAGE::BioSequence::SeqFeatureLocation>

Return value: the current value of the subregions association : a reference to an array of objects of type C<Bio::MAGE::BioSequence::SeqFeatureLocation>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioSequence::SeqFeatureLocation> instances

=cut

sub setSubregions {
  my $self = shift;
  croak(__PACKAGE__ . "::setSubregions: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSubregions: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setSubregions: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setSubregions: wrong type: " . ref($val) . " expected Bio::MAGE::BioSequence::SeqFeatureLocation")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioSequence::SeqFeatureLocation');
  }

  return $self->{__SUBREGIONS} = $val;
}



=item $array_ref = $seqfeaturelocation->getSubregions()

The restricted getter method for the subregions association.

Input parameters: none

Return value: the current value of the subregions association : a reference to an array of objects of type C<Bio::MAGE::BioSequence::SeqFeatureLocation>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSubregions {
  my $self = shift;
  croak(__PACKAGE__ . "::getSubregions: arguments passed to getter")
    if @_;
  return $self->{__SUBREGIONS};
}



=item $seqfeaturelocation->addSubregions(@vals)

Because the subregions association has list cardinality, it may store more
than one value. This method adds the current list of objects in the subregions
association.

Input parameters: the list of values C<@vals> to add to the subregions
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioSequence::SeqFeatureLocation>

=cut

sub addSubregions {
  my $self = shift;
  croak(__PACKAGE__ . "::addSubregions: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addSubregions: wrong type: " . ref($val) . " expected Bio::MAGE::BioSequence::SeqFeatureLocation")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioSequence::SeqFeatureLocation');
  }

  push(@{$self->{__SUBREGIONS}},@vals);
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

Jason E. Stewart (jason@openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut

#
# End the module by returning a true value
#
1;

