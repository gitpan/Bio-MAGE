##############################
#
# Bio::MAGE::Description::Description
#
##############################
package Bio::MAGE::Description::Description;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Describable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Describable Exporter);
$VERSION = q[$Id: Description.pm,v 1.4 2002/08/24 16:12:19 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Description::Description

=head2 SYNOPSIS

  use Bio::MAGE::Description::Description;

    # creating an empty instance
  my $description = Bio::MAGE::Description::Description->new();

    # creating an already populated instance
  my $description = Bio::MAGE::Description::Description->new(URI=>$URI_value,
			text=>$text_value,
			databaseReferences=>$databaseReferences_value,
			externalReference=>$externalReference_value,
			bibliographicReferences=>$bibliographicReferences_value,
			annotations=>$annotations_value);

    # setting and retrieving object attributes
  my $URI_val = $description->URI();
  $description->URI($value);

  my $text_val = $description->text();
  $description->text($value);

    # setting and retrieving object associations
  my $databaseReferences_val = $description->databaseReferences();
  $description->databaseReferences($value);

  my $externalReference_val = $description->externalReference();
  $description->externalReference($value);

  my $bibliographicReferences_val = $description->bibliographicReferences();
  $description->bibliographicReferences($value);

  my $annotations_val = $description->annotations();
  $description->annotations($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Description> class:

A free text description of an object.



=cut


=head2 INHERITANCE


Bio::MAGE::Description::Description has the following super classes

=over 


=item * Bio::MAGE::Describable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Description::Description->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * URI

Sets the value of the URI attribute (from C<Bio::MAGE::Description::Description>).


=item * text

Sets the value of the text attribute (from C<Bio::MAGE::Description::Description>).


=item * databaseReferences

Sets the value of the databaseReferences association (from C<Bio::MAGE::Description::Description>).


=item * externalReference

Sets the value of the externalReference association (from C<Bio::MAGE::Description::Description>).


=item * bibliographicReferences

Sets the value of the bibliographicReferences association (from C<Bio::MAGE::Description::Description>).


=item * annotations

Sets the value of the annotations association (from C<Bio::MAGE::Description::Description>).


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

Returns the full class name for this class, Bio::MAGE::Description::Description.

=cut

sub class_name {
  return q[Bio::MAGE::Description::Description];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Description::Description.

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
  my @list = ('Bio::MAGE::Describable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('URI', 'text');
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
  my @list = ('databaseReferences', 'externalReference', 'bibliographicReferences', 'annotations');
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

Bio::MAGE::Description::Description: has the following attribute accessor methods:

=over


=item URI

From the MAGE-OM documentation for the C<URI> attribute:

A reference to the location and type of an outside resource.



=over


=item $val = $description->setURI($val)

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



=item $val = $description->getURI()

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


=item text

From the MAGE-OM documentation for the C<text> attribute:

The description.



=over


=item $val = $description->setText($val)

The restricted setter method for the text attribute.

Input parameters: the value to which the text attribute will be set 

Return value: the current value of the text attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setText {
  my $self = shift;
  croak(__PACKAGE__ . "::setText: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setText: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__TEXT} = $val;
}



=item $val = $description->getText()

The restricted getter method for the text attribute.

Input parameters: none

Return value: the current value of the text attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getText {
  my $self = shift;
  croak(__PACKAGE__ . "::getText: arguments passed to getter")
    if @_;
  return $self->{__TEXT};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'externalReference',
          bless( {
                   '__NAME' => 'externalReference',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'ExternalReference',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Specifies where the described instance was originally obtained from.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'annotations',
          bless( {
                   '__NAME' => 'annotations',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Allows specification of ontology entries related to the instance being described.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'databaseReferences',
          bless( {
                   '__NAME' => 'databaseReferences',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'DatabaseEntry',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'References to entries in databases.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'bibliographicReferences',
          bless( {
                   '__NAME' => 'bibliographicReferences',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BibliographicReference',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'References to existing literature.',
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

Bio::MAGE::Description::Description: has the following association accessor methods:

=over


=item databaseReferences


From the MAGE-OM documentation for the C<databaseReferences> association:

References to entries in databases.



=over


=item $array_ref = $description->setDatabaseReferences($array_ref)

The restricted setter method for the databaseReferences association.

Input parameters: the value to which the databaseReferences association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::DatabaseEntry>

Return value: the current value of the databaseReferences association : a reference to an array of objects of type C<Bio::MAGE::Description::DatabaseEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::DatabaseEntry> instances

=cut

sub setDatabaseReferences {
  my $self = shift;
  croak(__PACKAGE__ . "::setDatabaseReferences: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDatabaseReferences: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setDatabaseReferences: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setDatabaseReferences: wrong type: " . ref($val) . " expected Bio::MAGE::Description::DatabaseEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::DatabaseEntry');
  }

  return $self->{__DATABASEREFERENCES} = $val;
}



=item $array_ref = $description->getDatabaseReferences()

The restricted getter method for the databaseReferences association.

Input parameters: none

Return value: the current value of the databaseReferences association : a reference to an array of objects of type C<Bio::MAGE::Description::DatabaseEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDatabaseReferences {
  my $self = shift;
  croak(__PACKAGE__ . "::getDatabaseReferences: arguments passed to getter")
    if @_;
  return $self->{__DATABASEREFERENCES};
}



=item $description->addDatabaseReferences(@vals)

Because the databaseReferences association has list cardinality, it may store more
than one value. This method adds the current list of objects in the databaseReferences
association.

Input parameters: the list of values C<@vals> to add to the databaseReferences
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::DatabaseEntry>

=cut

sub addDatabaseReferences {
  my $self = shift;
  croak(__PACKAGE__ . "::addDatabaseReferences: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addDatabaseReferences: wrong type: " . ref($val) . " expected Bio::MAGE::Description::DatabaseEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::DatabaseEntry');
  }

  push(@{$self->{__DATABASEREFERENCES}},@vals);
}



=back


=item externalReference


From the MAGE-OM documentation for the C<externalReference> association:

Specifies where the described instance was originally obtained from.



=over


=item $val = $description->setExternalReference($val)

The restricted setter method for the externalReference association.

Input parameters: the value to which the externalReference association will be set : an instance of type C<Bio::MAGE::Description::ExternalReference>.

Return value: the current value of the externalReference association : an instance of type C<Bio::MAGE::Description::ExternalReference>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::ExternalReference>

=cut

sub setExternalReference {
  my $self = shift;
  croak(__PACKAGE__ . "::setExternalReference: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExternalReference: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setExternalReference: wrong type: " . ref($val) . " expected Bio::MAGE::Description::ExternalReference") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::ExternalReference');
  return $self->{__EXTERNALREFERENCE} = $val;
}



=item $val = $description->getExternalReference()

The restricted getter method for the externalReference association.

Input parameters: none

Return value: the current value of the externalReference association : an instance of type C<Bio::MAGE::Description::ExternalReference>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExternalReference {
  my $self = shift;
  croak(__PACKAGE__ . "::getExternalReference: arguments passed to getter")
    if @_;
  return $self->{__EXTERNALREFERENCE};
}




=back


=item bibliographicReferences


From the MAGE-OM documentation for the C<bibliographicReferences> association:

References to existing literature.



=over


=item $array_ref = $description->setBibliographicReferences($array_ref)

The restricted setter method for the bibliographicReferences association.

Input parameters: the value to which the bibliographicReferences association will be set : a reference to an array of objects of type C<Bio::MAGE::BQS::BibliographicReference>

Return value: the current value of the bibliographicReferences association : a reference to an array of objects of type C<Bio::MAGE::BQS::BibliographicReference>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BQS::BibliographicReference> instances

=cut

sub setBibliographicReferences {
  my $self = shift;
  croak(__PACKAGE__ . "::setBibliographicReferences: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setBibliographicReferences: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setBibliographicReferences: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setBibliographicReferences: wrong type: " . ref($val) . " expected Bio::MAGE::BQS::BibliographicReference")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BQS::BibliographicReference');
  }

  return $self->{__BIBLIOGRAPHICREFERENCES} = $val;
}



=item $array_ref = $description->getBibliographicReferences()

The restricted getter method for the bibliographicReferences association.

Input parameters: none

Return value: the current value of the bibliographicReferences association : a reference to an array of objects of type C<Bio::MAGE::BQS::BibliographicReference>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getBibliographicReferences {
  my $self = shift;
  croak(__PACKAGE__ . "::getBibliographicReferences: arguments passed to getter")
    if @_;
  return $self->{__BIBLIOGRAPHICREFERENCES};
}



=item $description->addBibliographicReferences(@vals)

Because the bibliographicReferences association has list cardinality, it may store more
than one value. This method adds the current list of objects in the bibliographicReferences
association.

Input parameters: the list of values C<@vals> to add to the bibliographicReferences
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BQS::BibliographicReference>

=cut

sub addBibliographicReferences {
  my $self = shift;
  croak(__PACKAGE__ . "::addBibliographicReferences: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addBibliographicReferences: wrong type: " . ref($val) . " expected Bio::MAGE::BQS::BibliographicReference")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BQS::BibliographicReference');
  }

  push(@{$self->{__BIBLIOGRAPHICREFERENCES}},@vals);
}



=back


=item annotations


From the MAGE-OM documentation for the C<annotations> association:

Allows specification of ontology entries related to the instance being described.



=over


=item $array_ref = $description->setAnnotations($array_ref)

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



=item $array_ref = $description->getAnnotations()

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



=item $description->addAnnotations(@vals)

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

