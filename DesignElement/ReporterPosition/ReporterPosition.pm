##############################
#
# Bio::MAGE::DesignElement::ReporterPosition
#
##############################
package Bio::MAGE::DesignElement::ReporterPosition;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::BioSequence::SequencePosition;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::BioSequence::SequencePosition Exporter);
$VERSION = q[$Id: ReporterPosition.pm,v 1.4 2002/08/24 16:12:20 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::DesignElement::ReporterPosition

=head2 SYNOPSIS

  use Bio::MAGE::DesignElement::ReporterPosition;

    # creating an empty instance
  my $reporterposition = Bio::MAGE::DesignElement::ReporterPosition->new();

    # creating an already populated instance
  my $reporterposition = Bio::MAGE::DesignElement::ReporterPosition->new(reporter=>$reporter_value,
			mismatchInformation=>$mismatchInformation_value);

    # setting and retrieving object associations
  my $reporter_val = $reporterposition->reporter();
  $reporterposition->reporter($value);

  my $mismatchInformation_val = $reporterposition->mismatchInformation();
  $reporterposition->mismatchInformation($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ReporterPosition> class:

The location in the composite target's sequence to which a source reporter maps.  The association to MismatchInformation allows the specification, usually for control purposes, of deviations from the CompositeSequence's BioMaterial.



=cut


=head2 INHERITANCE


Bio::MAGE::DesignElement::ReporterPosition has the following super classes

=over 


=item * Bio::MAGE::BioSequence::SequencePosition


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::DesignElement::ReporterPosition->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * reporter

Sets the value of the reporter association (from C<Bio::MAGE::DesignElement::ReporterPosition>).


=item * mismatchInformation

Sets the value of the mismatchInformation association (from C<Bio::MAGE::DesignElement::ReporterPosition>).


=item * start

Sets the value of the start attribute (from C<Bio::MAGE::BioSequence::SequencePosition>).


=item * end

Sets the value of the end attribute (from C<Bio::MAGE::BioSequence::SequencePosition>).


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

Returns the full class name for this class, Bio::MAGE::DesignElement::ReporterPosition.

=cut

sub class_name {
  return q[Bio::MAGE::DesignElement::ReporterPosition];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::DesignElement::ReporterPosition.

=cut

sub package {
  return q[DesignElement];
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
  my @list = ('Bio::MAGE::BioSequence::SequencePosition');
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
  my @list = ('reporter', 'mismatchInformation');
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

Bio::MAGE::DesignElement::ReporterPosition: has the following attribute accessor methods:

=over

Attributes Inherited from Bio::MAGE::BioSequence::SequencePosition


=item start

From the MAGE-OM documentation for the C<start> attribute:

The location of the base, for nucleotides, that the SeqFeature starts. 



=over


=item $val = $sequenceposition->setStart($val)

The restricted setter method for the start attribute.

Input parameters: the value to which the start attribute will be set 

Return value: the current value of the start attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $sequenceposition->getStart()

The restricted getter method for the start attribute.

Input parameters: none

Return value: the current value of the start attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back


=item end

From the MAGE-OM documentation for the C<end> attribute:

The location of the base, for nucleotides, that the SeqFeature ends.



=over


=item $val = $sequenceposition->setEnd($val)

The restricted setter method for the end attribute.

Input parameters: the value to which the end attribute will be set 

Return value: the current value of the end attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $sequenceposition->getEnd()

The restricted getter method for the end attribute.

Input parameters: none

Return value: the current value of the end attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'reporter',
          bless( {
                   '__NAME' => 'reporter',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'Reporter',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'A reporter that comprises part of a CompositeSequence.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'mismatchInformation',
          bless( {
                   '__NAME' => 'mismatchInformation',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'MismatchInformation',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Differences in how the reporter matches its compositeSequence\'s sequence.',
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

Bio::MAGE::DesignElement::ReporterPosition: has the following association accessor methods:

=over


=item reporter


From the MAGE-OM documentation for the C<reporter> association:

A reporter that comprises part of a CompositeSequence.



=over


=item $val = $reporterposition->setReporter($val)

The restricted setter method for the reporter association.

Input parameters: the value to which the reporter association will be set : an instance of type C<Bio::MAGE::DesignElement::Reporter>.

Return value: the current value of the reporter association : an instance of type C<Bio::MAGE::DesignElement::Reporter>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::DesignElement::Reporter>

=cut

sub setReporter {
  my $self = shift;
  croak(__PACKAGE__ . "::setReporter: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setReporter: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setReporter: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Reporter") unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Reporter');
  return $self->{__REPORTER} = $val;
}



=item $val = $reporterposition->getReporter()

The restricted getter method for the reporter association.

Input parameters: none

Return value: the current value of the reporter association : an instance of type C<Bio::MAGE::DesignElement::Reporter>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getReporter {
  my $self = shift;
  croak(__PACKAGE__ . "::getReporter: arguments passed to getter")
    if @_;
  return $self->{__REPORTER};
}




=back


=item mismatchInformation


From the MAGE-OM documentation for the C<mismatchInformation> association:

Differences in how the reporter matches its compositeSequence's sequence.



=over


=item $array_ref = $reporterposition->setMismatchInformation($array_ref)

The restricted setter method for the mismatchInformation association.

Input parameters: the value to which the mismatchInformation association will be set : a reference to an array of objects of type C<Bio::MAGE::DesignElement::MismatchInformation>

Return value: the current value of the mismatchInformation association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::MismatchInformation>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::DesignElement::MismatchInformation> instances

=cut

sub setMismatchInformation {
  my $self = shift;
  croak(__PACKAGE__ . "::setMismatchInformation: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setMismatchInformation: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setMismatchInformation: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setMismatchInformation: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::MismatchInformation")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::MismatchInformation');
  }

  return $self->{__MISMATCHINFORMATION} = $val;
}



=item $array_ref = $reporterposition->getMismatchInformation()

The restricted getter method for the mismatchInformation association.

Input parameters: none

Return value: the current value of the mismatchInformation association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::MismatchInformation>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getMismatchInformation {
  my $self = shift;
  croak(__PACKAGE__ . "::getMismatchInformation: arguments passed to getter")
    if @_;
  return $self->{__MISMATCHINFORMATION};
}



=item $reporterposition->addMismatchInformation(@vals)

Because the mismatchInformation association has list cardinality, it may store more
than one value. This method adds the current list of objects in the mismatchInformation
association.

Input parameters: the list of values C<@vals> to add to the mismatchInformation
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::DesignElement::MismatchInformation>

=cut

sub addMismatchInformation {
  my $self = shift;
  croak(__PACKAGE__ . "::addMismatchInformation: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addMismatchInformation: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::MismatchInformation")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::MismatchInformation');
  }

  push(@{$self->{__MISMATCHINFORMATION}},@vals);
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

