##############################
#
# Bio::MAGE::Experiment::ExperimentalFactor
#
##############################
package Bio::MAGE::Experiment::ExperimentalFactor;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: ExperimentalFactor.pm,v 1.5 2002/10/08 23:29:33 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Experiment::ExperimentalFactor

=head2 SYNOPSIS

  use Bio::MAGE::Experiment::ExperimentalFactor;

    # creating an empty instance
  my $experimentalfactor = Bio::MAGE::Experiment::ExperimentalFactor->new();

    # creating an already populated instance
  my $experimentalfactor = Bio::MAGE::Experiment::ExperimentalFactor->new(category=>$category_value,
			annotations=>$annotations_value,
			factorValues=>$factorValues_value);

    # setting and retrieving object associations
  my $category_val = $experimentalfactor->category();
  $experimentalfactor->category($value);

  my $annotations_val = $experimentalfactor->annotations();
  $experimentalfactor->annotations($value);

  my $factorValues_val = $experimentalfactor->factorValues();
  $experimentalfactor->factorValues($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ExperimentalFactor> class:

ExperimentFactors are the dependent variables of an experiment (e.g. time, glucose concentration, ...).



=cut


=head2 INHERITANCE


Bio::MAGE::Experiment::ExperimentalFactor has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Experiment::ExperimentalFactor->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * category

Sets the value of the category association (from C<Bio::MAGE::Experiment::ExperimentalFactor>).


=item * annotations

Sets the value of the annotations association (from C<Bio::MAGE::Experiment::ExperimentalFactor>).


=item * factorValues

Sets the value of the factorValues association (from C<Bio::MAGE::Experiment::ExperimentalFactor>).


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

Returns the full class name for this class, Bio::MAGE::Experiment::ExperimentalFactor.

=cut

sub class_name {
  return q[Bio::MAGE::Experiment::ExperimentalFactor];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Experiment::ExperimentalFactor.

=cut

sub package {
  return q[Experiment];
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
  my @list = ('category', 'annotations', 'factorValues');
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

Bio::MAGE::Experiment::ExperimentalFactor: has the following attribute accessor methods:

=over

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
          'category',
          bless( {
                   '__NAME' => 'category',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The category of an ExperimentalFactor could be biological (time, [glucose]) or a methodological factor (differing cDNA preparation protocols).',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'factorValues',
          bless( {
                   '__NAME' => 'factorValues',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'FactorValue',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The pairing of BioAssay FactorValues with the ExperimentDesign ExperimentFactor.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'annotations',
          bless( {
                   '__NAME' => 'annotations',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Allows describing additional information such as concentration of Tamoxafin with a CASRegistry #.',
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

Bio::MAGE::Experiment::ExperimentalFactor: has the following association accessor methods:

=over


=item category


From the MAGE-OM documentation for the C<category> association:

The category of an ExperimentalFactor could be biological (time, [glucose]) or a methodological factor (differing cDNA preparation protocols).



=over


=item $val = $experimentalfactor->setCategory($val)

The restricted setter method for the category association.

Input parameters: the value to which the category association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the category association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setCategory {
  my $self = shift;
  croak(__PACKAGE__ . "::setCategory: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCategory: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setCategory: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__CATEGORY} = $val;
}



=item $val = $experimentalfactor->getCategory()

The restricted getter method for the category association.

Input parameters: none

Return value: the current value of the category association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getCategory {
  my $self = shift;
  croak(__PACKAGE__ . "::getCategory: arguments passed to getter")
    if @_;
  return $self->{__CATEGORY};
}




=back


=item annotations


From the MAGE-OM documentation for the C<annotations> association:

Allows describing additional information such as concentration of Tamoxafin with a CASRegistry #.



=over


=item $array_ref = $experimentalfactor->setAnnotations($array_ref)

The restricted setter method for the annotations association.

Input parameters: the value to which the annotations association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the annotations association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut

sub setAnnotations {
  my $self = shift;
  croak(__PACKAGE__ . "::setAnnotations: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAnnotations: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setAnnotations: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setAnnotations: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  return $self->{__ANNOTATIONS} = $val;
}



=item $array_ref = $experimentalfactor->getAnnotations()

The restricted getter method for the annotations association.

Input parameters: none

Return value: the current value of the annotations association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAnnotations {
  my $self = shift;
  croak(__PACKAGE__ . "::getAnnotations: arguments passed to getter")
    if @_;
  return $self->{__ANNOTATIONS};
}



=item $experimentalfactor->addAnnotations(@vals)

Because the annotations association has list cardinality, it may store more
than one value. This method adds the current list of objects in the annotations
association.

Input parameters: the list of values C<@vals> to add to the annotations
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub addAnnotations {
  my $self = shift;
  croak(__PACKAGE__ . "::addAnnotations: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addAnnotations: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  push(@{$self->{__ANNOTATIONS}},@vals);
}



=back


=item factorValues


From the MAGE-OM documentation for the C<factorValues> association:

The pairing of BioAssay FactorValues with the ExperimentDesign ExperimentFactor.



=over


=item $array_ref = $experimentalfactor->setFactorValues($array_ref)

The restricted setter method for the factorValues association.

Input parameters: the value to which the factorValues association will be set : a reference to an array of objects of type C<Bio::MAGE::Experiment::FactorValue>

Return value: the current value of the factorValues association : a reference to an array of objects of type C<Bio::MAGE::Experiment::FactorValue>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Experiment::FactorValue> instances

=cut

sub setFactorValues {
  my $self = shift;
  croak(__PACKAGE__ . "::setFactorValues: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFactorValues: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFactorValues: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setFactorValues: wrong type: " . ref($val) . " expected Bio::MAGE::Experiment::FactorValue")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Experiment::FactorValue');
  }

  return $self->{__FACTORVALUES} = $val;
}



=item $array_ref = $experimentalfactor->getFactorValues()

The restricted getter method for the factorValues association.

Input parameters: none

Return value: the current value of the factorValues association : a reference to an array of objects of type C<Bio::MAGE::Experiment::FactorValue>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFactorValues {
  my $self = shift;
  croak(__PACKAGE__ . "::getFactorValues: arguments passed to getter")
    if @_;
  return $self->{__FACTORVALUES};
}



=item $experimentalfactor->addFactorValues(@vals)

Because the factorValues association has list cardinality, it may store more
than one value. This method adds the current list of objects in the factorValues
association.

Input parameters: the list of values C<@vals> to add to the factorValues
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Experiment::FactorValue>

=cut

sub addFactorValues {
  my $self = shift;
  croak(__PACKAGE__ . "::addFactorValues: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFactorValues: wrong type: " . ref($val) . " expected Bio::MAGE::Experiment::FactorValue")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Experiment::FactorValue');
  }

  push(@{$self->{__FACTORVALUES}},@vals);
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

