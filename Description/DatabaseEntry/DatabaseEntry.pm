##############################
#
# Bio::MAGE::Description::DatabaseEntry
#
##############################
package Bio::MAGE::Description::DatabaseEntry;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = q[$Id: DatabaseEntry.pm,v 1.4 2002/08/24 16:12:19 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Description::DatabaseEntry

=head2 SYNOPSIS

  use Bio::MAGE::Description::DatabaseEntry;

    # creating an empty instance
  my $databaseentry = Bio::MAGE::Description::DatabaseEntry->new();

    # creating an already populated instance
  my $databaseentry = Bio::MAGE::Description::DatabaseEntry->new(URI=>$URI_value,
			accession=>$accession_value,
			accessionVersion=>$accessionVersion_value,
			database=>$database_value,
			type=>$type_value);

    # setting and retrieving object attributes
  my $URI_val = $databaseentry->URI();
  $databaseentry->URI($value);

  my $accession_val = $databaseentry->accession();
  $databaseentry->accession($value);

  my $accessionVersion_val = $databaseentry->accessionVersion();
  $databaseentry->accessionVersion($value);

    # setting and retrieving object associations
  my $database_val = $databaseentry->database();
  $databaseentry->database($value);

  my $type_val = $databaseentry->type();
  $databaseentry->type($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<DatabaseEntry> class:

A reference to a record in a database.



=cut


=head2 INHERITANCE


Bio::MAGE::Description::DatabaseEntry has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Description::DatabaseEntry->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * URI

Sets the value of the URI attribute (from C<Bio::MAGE::Description::DatabaseEntry>).


=item * accession

Sets the value of the accession attribute (from C<Bio::MAGE::Description::DatabaseEntry>).


=item * accessionVersion

Sets the value of the accessionVersion attribute (from C<Bio::MAGE::Description::DatabaseEntry>).


=item * database

Sets the value of the database association (from C<Bio::MAGE::Description::DatabaseEntry>).


=item * type

Sets the value of the type association (from C<Bio::MAGE::Description::DatabaseEntry>).


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

Returns the full class name for this class, Bio::MAGE::Description::DatabaseEntry.

=cut

sub class_name {
  return q[Bio::MAGE::Description::DatabaseEntry];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Description::DatabaseEntry.

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
  my @list = ('URI', 'accession', 'accessionVersion');
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
  my @list = ('database', 'type');
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

Bio::MAGE::Description::DatabaseEntry: has the following attribute accessor methods:

=over


=item URI

From the MAGE-OM documentation for the C<URI> attribute:

The location of the record.



=over


=item $val = $databaseentry->setURI($val)

The restricted setter method for the URI attribute.

Input parameters: the value to which the URI attribute will be set 

Return value: the current value of the URI attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setURI {
  my $self = shift;
  croak(__PACKAGE__ . "::setURI: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setURI: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__URI} = $val;
}



=item $val = $databaseentry->getURI()

The restricted getter method for the URI attribute.

Input parameters: none

Return value: the current value of the URI attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getURI {
  my $self = shift;
  croak(__PACKAGE__ . "::getURI: arguments passed to getter")
    if @_;
  return $self->{__URI};
}




=back


=item accession

From the MAGE-OM documentation for the C<accession> attribute:

The identifier used to look up the record.



=over


=item $val = $databaseentry->setAccession($val)

The restricted setter method for the accession attribute.

Input parameters: the value to which the accession attribute will be set 

Return value: the current value of the accession attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setAccession {
  my $self = shift;
  croak(__PACKAGE__ . "::setAccession: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAccession: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ACCESSION} = $val;
}



=item $val = $databaseentry->getAccession()

The restricted getter method for the accession attribute.

Input parameters: none

Return value: the current value of the accession attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAccession {
  my $self = shift;
  croak(__PACKAGE__ . "::getAccession: arguments passed to getter")
    if @_;
  return $self->{__ACCESSION};
}




=back


=item accessionVersion

From the MAGE-OM documentation for the C<accessionVersion> attribute:

The appropriate version of the accession (if applicable).



=over


=item $val = $databaseentry->setAccessionVersion($val)

The restricted setter method for the accessionVersion attribute.

Input parameters: the value to which the accessionVersion attribute will be set 

Return value: the current value of the accessionVersion attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setAccessionVersion {
  my $self = shift;
  croak(__PACKAGE__ . "::setAccessionVersion: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAccessionVersion: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ACCESSIONVERSION} = $val;
}



=item $val = $databaseentry->getAccessionVersion()

The restricted getter method for the accessionVersion attribute.

Input parameters: none

Return value: the current value of the accessionVersion attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAccessionVersion {
  my $self = shift;
  croak(__PACKAGE__ . "::getAccessionVersion: arguments passed to getter")
    if @_;
  return $self->{__ACCESSIONVERSION};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'type',
          bless( {
                   '__NAME' => 'type',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The type of record (e.g. a protein in SwissProt, or a yeast strain in SGD).',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'database',
          bless( {
                   '__NAME' => 'database',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'Database',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Reference to the database where the DataEntry instance can be found.',
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

Bio::MAGE::Description::DatabaseEntry: has the following association accessor methods:

=over


=item database


From the MAGE-OM documentation for the C<database> association:

Reference to the database where the DataEntry instance can be found.



=over


=item $val = $databaseentry->setDatabase($val)

The restricted setter method for the database association.

Input parameters: the value to which the database association will be set : an instance of type C<Bio::MAGE::Description::Database>.

Return value: the current value of the database association : an instance of type C<Bio::MAGE::Description::Database>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::Database>

=cut

sub setDatabase {
  my $self = shift;
  croak(__PACKAGE__ . "::setDatabase: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDatabase: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setDatabase: wrong type: " . ref($val) . " expected Bio::MAGE::Description::Database") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::Database');
  return $self->{__DATABASE} = $val;
}



=item $val = $databaseentry->getDatabase()

The restricted getter method for the database association.

Input parameters: none

Return value: the current value of the database association : an instance of type C<Bio::MAGE::Description::Database>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDatabase {
  my $self = shift;
  croak(__PACKAGE__ . "::getDatabase: arguments passed to getter")
    if @_;
  return $self->{__DATABASE};
}




=back


=item type


From the MAGE-OM documentation for the C<type> association:

The type of record (e.g. a protein in SwissProt, or a yeast strain in SGD).



=over


=item $val = $databaseentry->setType($val)

The restricted setter method for the type association.

Input parameters: the value to which the type association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the type association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setType {
  my $self = shift;
  croak(__PACKAGE__ . "::setType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__TYPE} = $val;
}



=item $val = $databaseentry->getType()

The restricted getter method for the type association.

Input parameters: none

Return value: the current value of the type association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getType {
  my $self = shift;
  croak(__PACKAGE__ . "::getType: arguments passed to getter")
    if @_;
  return $self->{__TYPE};
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

