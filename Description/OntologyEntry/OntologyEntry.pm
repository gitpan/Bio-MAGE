##############################
#
# Bio::MAGE::Description::OntologyEntry
#
##############################
package Bio::MAGE::Description::OntologyEntry;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = q[$Id: OntologyEntry.pm,v 1.7 2002/10/13 21:56:05 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Description::OntologyEntry

=head2 SYNOPSIS

  use Bio::MAGE::Description::OntologyEntry;

    # creating an empty instance
  my $ontologyentry = Bio::MAGE::Description::OntologyEntry->new();

    # creating an already populated instance
  my $ontologyentry = Bio::MAGE::Description::OntologyEntry->new(value=>$value_value,
			description=>$description_value,
			category=>$category_value,
			associations=>$associations_value,
			ontologyReference=>$ontologyReference_value);

    # setting and retrieving object attributes
  my $value_val = $ontologyentry->value();
  $ontologyentry->value($value);

  my $description_val = $ontologyentry->description();
  $ontologyentry->description($value);

  my $category_val = $ontologyentry->category();
  $ontologyentry->category($value);

    # setting and retrieving object associations
  my $associations_val = $ontologyentry->associations();
  $ontologyentry->associations($value);

  my $ontologyReference_val = $ontologyentry->ontologyReference();
  $ontologyentry->ontologyReference($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<OntologyEntry> class:

A single entry from an ontology or a controlled vocabulary.  For instance, category could be 'species name', value could be 'homo sapiens' and ontology would  be taxonomy database, NCBI.



=cut


=head2 INHERITANCE


Bio::MAGE::Description::OntologyEntry has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Description::OntologyEntry->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * value

Sets the value of the value attribute (from C<Bio::MAGE::Description::OntologyEntry>).


=item * description

Sets the value of the description attribute (from C<Bio::MAGE::Description::OntologyEntry>).


=item * category

Sets the value of the category attribute (from C<Bio::MAGE::Description::OntologyEntry>).


=item * associations

Sets the value of the associations association (from C<Bio::MAGE::Description::OntologyEntry>).


=item * ontologyReference

Sets the value of the ontologyReference association (from C<Bio::MAGE::Description::OntologyEntry>).


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

Returns the full class name for this class, Bio::MAGE::Description::OntologyEntry.

=cut

sub class_name {
  return q[Bio::MAGE::Description::OntologyEntry];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Description::OntologyEntry.

=cut

sub package {
  return q[Description];
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
  my @list = ('value', 'description', 'category');
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
  my @list = ('associations', 'ontologyReference');
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

Bio::MAGE::Description::OntologyEntry: has the following attribute accessor methods:

=over


=item value

From the MAGE-OM documentation for the C<value> attribute:

The value for this entry in this category.  



=over


=item $val = $ontologyentry->setValue($val)

The restricted setter method for the value attribute.

Input parameters: the value to which the value attribute will be set 

Return value: the current value of the value attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setValue {
  my $self = shift;
  croak(__PACKAGE__ . "::setValue: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setValue: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__VALUE} = $val;
}



=item $val = $ontologyentry->getValue()

The restricted getter method for the value attribute.

Input parameters: none

Return value: the current value of the value attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getValue {
  my $self = shift;
  croak(__PACKAGE__ . "::getValue: arguments passed to getter")
    if @_;
  return $self->{__VALUE};
}




=back


=item description

From the MAGE-OM documentation for the C<description> attribute:

The description of the meaning for this entry.



=over


=item $val = $ontologyentry->setDescription($val)

The restricted setter method for the description attribute.

Input parameters: the value to which the description attribute will be set 

Return value: the current value of the description attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::setDescription: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDescription: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__DESCRIPTION} = $val;
}



=item $val = $ontologyentry->getDescription()

The restricted getter method for the description attribute.

Input parameters: none

Return value: the current value of the description attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::getDescription: arguments passed to getter")
    if @_;
  return $self->{__DESCRIPTION};
}




=back


=item category

From the MAGE-OM documentation for the C<category> attribute:

The category to which this entry belongs.



=over


=item $val = $ontologyentry->setCategory($val)

The restricted setter method for the category attribute.

Input parameters: the value to which the category attribute will be set 

Return value: the current value of the category attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setCategory {
  my $self = shift;
  croak(__PACKAGE__ . "::setCategory: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCategory: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__CATEGORY} = $val;
}



=item $val = $ontologyentry->getCategory()

The restricted getter method for the category attribute.

Input parameters: none

Return value: the current value of the category attribute 

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



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'ontologyReference',
          bless( {
                   '__NAME' => 'ontologyReference',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'DatabaseEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Many ontology entries will not yet have formalized ontologies.  In those cases, they will not have a database reference to the ontology.

In the future it is highly encouraged that these ontologies be developed and ontologyEntry be subclassed from DatabaseReference.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'associations',
          bless( {
                   '__NAME' => 'associations',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Allows an instance of an OntologyEntry to be further qualified.',
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

Bio::MAGE::Description::OntologyEntry: has the following association accessor methods:

=over


=item associations


From the MAGE-OM documentation for the C<associations> association:

Allows an instance of an OntologyEntry to be further qualified.



=over


=item $array_ref = $ontologyentry->setAssociations($array_ref)

The restricted setter method for the associations association.

Input parameters: the value to which the associations association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the associations association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut

sub setAssociations {
  my $self = shift;
  croak(__PACKAGE__ . "::setAssociations: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAssociations: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setAssociations: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setAssociations: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  return $self->{__ASSOCIATIONS} = $val;
}



=item $array_ref = $ontologyentry->getAssociations()

The restricted getter method for the associations association.

Input parameters: none

Return value: the current value of the associations association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAssociations {
  my $self = shift;
  croak(__PACKAGE__ . "::getAssociations: arguments passed to getter")
    if @_;
  return $self->{__ASSOCIATIONS};
}



=item $ontologyentry->addAssociations(@vals)

Because the associations association has list cardinality, it may store more
than one value. This method adds the current list of objects in the associations
association.

Input parameters: the list of values C<@vals> to add to the associations
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub addAssociations {
  my $self = shift;
  croak(__PACKAGE__ . "::addAssociations: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addAssociations: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  push(@{$self->{__ASSOCIATIONS}},@vals);
}



=back


=item ontologyReference


From the MAGE-OM documentation for the C<ontologyReference> association:

Many ontology entries will not yet have formalized ontologies.  In those cases, they will not have a database reference to the ontology.

In the future it is highly encouraged that these ontologies be developed and ontologyEntry be subclassed from DatabaseReference.



=over


=item $val = $ontologyentry->setOntologyReference($val)

The restricted setter method for the ontologyReference association.

Input parameters: the value to which the ontologyReference association will be set : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Return value: the current value of the ontologyReference association : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::DatabaseEntry>

=cut

sub setOntologyReference {
  my $self = shift;
  croak(__PACKAGE__ . "::setOntologyReference: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setOntologyReference: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setOntologyReference: wrong type: " . ref($val) . " expected Bio::MAGE::Description::DatabaseEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::DatabaseEntry');
  return $self->{__ONTOLOGYREFERENCE} = $val;
}



=item $val = $ontologyentry->getOntologyReference()

The restricted getter method for the ontologyReference association.

Input parameters: none

Return value: the current value of the ontologyReference association : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getOntologyReference {
  my $self = shift;
  croak(__PACKAGE__ . "::getOntologyReference: arguments passed to getter")
    if @_;
  return $self->{__ONTOLOGYREFERENCE};
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

