##############################
#
# Bio::MAGE::BQS::BibliographicReference
#
##############################
package Bio::MAGE::BQS::BibliographicReference;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Describable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Describable Exporter);
$VERSION = q[$Id: BibliographicReference.pm,v 1.7 2002/10/13 21:56:04 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::BQS::BibliographicReference

=head2 SYNOPSIS

  use Bio::MAGE::BQS::BibliographicReference;

    # creating an empty instance
  my $bibliographicreference = Bio::MAGE::BQS::BibliographicReference->new();

    # creating an already populated instance
  my $bibliographicreference = Bio::MAGE::BQS::BibliographicReference->new(authors=>$authors_value,
			URI=>$URI_value,
			volume=>$volume_value,
			issue=>$issue_value,
			editor=>$editor_value,
			title=>$title_value,
			publication=>$publication_value,
			publisher=>$publisher_value,
			year=>$year_value,
			pages=>$pages_value,
			parameters=>$parameters_value);

    # setting and retrieving object attributes
  my $authors_val = $bibliographicreference->authors();
  $bibliographicreference->authors($value);

  my $URI_val = $bibliographicreference->URI();
  $bibliographicreference->URI($value);

  my $volume_val = $bibliographicreference->volume();
  $bibliographicreference->volume($value);

  my $issue_val = $bibliographicreference->issue();
  $bibliographicreference->issue($value);

  my $editor_val = $bibliographicreference->editor();
  $bibliographicreference->editor($value);

  my $title_val = $bibliographicreference->title();
  $bibliographicreference->title($value);

  my $publication_val = $bibliographicreference->publication();
  $bibliographicreference->publication($value);

  my $publisher_val = $bibliographicreference->publisher();
  $bibliographicreference->publisher($value);

  my $year_val = $bibliographicreference->year();
  $bibliographicreference->year($value);

  my $pages_val = $bibliographicreference->pages();
  $bibliographicreference->pages($value);

    # setting and retrieving object associations
  my $parameters_val = $bibliographicreference->parameters();
  $bibliographicreference->parameters($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<BibliographicReference> class:

Attributes for the most common criteria and association with OntologyEntry allows criteria to be specified for searching for a Bibliographic reference.




=cut


=head2 INHERITANCE


Bio::MAGE::BQS::BibliographicReference has the following super classes

=over 


=item * Bio::MAGE::Describable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::BQS::BibliographicReference->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * authors

Sets the value of the authors attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * URI

Sets the value of the URI attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * volume

Sets the value of the volume attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * issue

Sets the value of the issue attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * editor

Sets the value of the editor attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * title

Sets the value of the title attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * publication

Sets the value of the publication attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * publisher

Sets the value of the publisher attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * year

Sets the value of the year attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * pages

Sets the value of the pages attribute (from C<Bio::MAGE::BQS::BibliographicReference>).


=item * parameters

Sets the value of the parameters association (from C<Bio::MAGE::BQS::BibliographicReference>).


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

Returns the full class name for this class, Bio::MAGE::BQS::BibliographicReference.

=cut

sub class_name {
  return q[Bio::MAGE::BQS::BibliographicReference];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::BQS::BibliographicReference.

=cut

sub package {
  return q[BQS];
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
  my @list = ('authors', 'URI', 'volume', 'issue', 'editor', 'title', 'publication', 'publisher', 'year', 'pages');
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
  my @list = ('parameters');
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

Bio::MAGE::BQS::BibliographicReference: has the following attribute accessor methods:

=over


=item authors

Methods for the authors attribute.

=over


=item $val = $bibliographicreference->setAuthors($val)

The restricted setter method for the authors attribute.

Input parameters: the value to which the authors attribute will be set 

Return value: the current value of the authors attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setAuthors {
  my $self = shift;
  croak(__PACKAGE__ . "::setAuthors: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAuthors: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__AUTHORS} = $val;
}



=item $val = $bibliographicreference->getAuthors()

The restricted getter method for the authors attribute.

Input parameters: none

Return value: the current value of the authors attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAuthors {
  my $self = shift;
  croak(__PACKAGE__ . "::getAuthors: arguments passed to getter")
    if @_;
  return $self->{__AUTHORS};
}




=back


=item URI

Methods for the URI attribute.

=over


=item $val = $bibliographicreference->setURI($val)

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



=item $val = $bibliographicreference->getURI()

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


=item volume

Methods for the volume attribute.

=over


=item $val = $bibliographicreference->setVolume($val)

The restricted setter method for the volume attribute.

Input parameters: the value to which the volume attribute will be set 

Return value: the current value of the volume attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setVolume {
  my $self = shift;
  croak(__PACKAGE__ . "::setVolume: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setVolume: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__VOLUME} = $val;
}



=item $val = $bibliographicreference->getVolume()

The restricted getter method for the volume attribute.

Input parameters: none

Return value: the current value of the volume attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getVolume {
  my $self = shift;
  croak(__PACKAGE__ . "::getVolume: arguments passed to getter")
    if @_;
  return $self->{__VOLUME};
}




=back


=item issue

Methods for the issue attribute.

=over


=item $val = $bibliographicreference->setIssue($val)

The restricted setter method for the issue attribute.

Input parameters: the value to which the issue attribute will be set 

Return value: the current value of the issue attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setIssue {
  my $self = shift;
  croak(__PACKAGE__ . "::setIssue: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setIssue: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ISSUE} = $val;
}



=item $val = $bibliographicreference->getIssue()

The restricted getter method for the issue attribute.

Input parameters: none

Return value: the current value of the issue attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getIssue {
  my $self = shift;
  croak(__PACKAGE__ . "::getIssue: arguments passed to getter")
    if @_;
  return $self->{__ISSUE};
}




=back


=item editor

Methods for the editor attribute.

=over


=item $val = $bibliographicreference->setEditor($val)

The restricted setter method for the editor attribute.

Input parameters: the value to which the editor attribute will be set 

Return value: the current value of the editor attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setEditor {
  my $self = shift;
  croak(__PACKAGE__ . "::setEditor: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setEditor: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__EDITOR} = $val;
}



=item $val = $bibliographicreference->getEditor()

The restricted getter method for the editor attribute.

Input parameters: none

Return value: the current value of the editor attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getEditor {
  my $self = shift;
  croak(__PACKAGE__ . "::getEditor: arguments passed to getter")
    if @_;
  return $self->{__EDITOR};
}




=back


=item title

Methods for the title attribute.

=over


=item $val = $bibliographicreference->setTitle($val)

The restricted setter method for the title attribute.

Input parameters: the value to which the title attribute will be set 

Return value: the current value of the title attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setTitle {
  my $self = shift;
  croak(__PACKAGE__ . "::setTitle: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setTitle: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__TITLE} = $val;
}



=item $val = $bibliographicreference->getTitle()

The restricted getter method for the title attribute.

Input parameters: none

Return value: the current value of the title attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getTitle {
  my $self = shift;
  croak(__PACKAGE__ . "::getTitle: arguments passed to getter")
    if @_;
  return $self->{__TITLE};
}




=back


=item publication

Methods for the publication attribute.

=over


=item $val = $bibliographicreference->setPublication($val)

The restricted setter method for the publication attribute.

Input parameters: the value to which the publication attribute will be set 

Return value: the current value of the publication attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setPublication {
  my $self = shift;
  croak(__PACKAGE__ . "::setPublication: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPublication: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__PUBLICATION} = $val;
}



=item $val = $bibliographicreference->getPublication()

The restricted getter method for the publication attribute.

Input parameters: none

Return value: the current value of the publication attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPublication {
  my $self = shift;
  croak(__PACKAGE__ . "::getPublication: arguments passed to getter")
    if @_;
  return $self->{__PUBLICATION};
}




=back


=item publisher

Methods for the publisher attribute.

=over


=item $val = $bibliographicreference->setPublisher($val)

The restricted setter method for the publisher attribute.

Input parameters: the value to which the publisher attribute will be set 

Return value: the current value of the publisher attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setPublisher {
  my $self = shift;
  croak(__PACKAGE__ . "::setPublisher: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPublisher: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__PUBLISHER} = $val;
}



=item $val = $bibliographicreference->getPublisher()

The restricted getter method for the publisher attribute.

Input parameters: none

Return value: the current value of the publisher attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPublisher {
  my $self = shift;
  croak(__PACKAGE__ . "::getPublisher: arguments passed to getter")
    if @_;
  return $self->{__PUBLISHER};
}




=back


=item year

Methods for the year attribute.

=over


=item $val = $bibliographicreference->setYear($val)

The restricted setter method for the year attribute.

Input parameters: the value to which the year attribute will be set 

Return value: the current value of the year attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setYear {
  my $self = shift;
  croak(__PACKAGE__ . "::setYear: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setYear: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__YEAR} = $val;
}



=item $val = $bibliographicreference->getYear()

The restricted getter method for the year attribute.

Input parameters: none

Return value: the current value of the year attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getYear {
  my $self = shift;
  croak(__PACKAGE__ . "::getYear: arguments passed to getter")
    if @_;
  return $self->{__YEAR};
}




=back


=item pages

Methods for the pages attribute.

=over


=item $val = $bibliographicreference->setPages($val)

The restricted setter method for the pages attribute.

Input parameters: the value to which the pages attribute will be set 

Return value: the current value of the pages attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setPages {
  my $self = shift;
  croak(__PACKAGE__ . "::setPages: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPages: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__PAGES} = $val;
}



=item $val = $bibliographicreference->getPages()

The restricted getter method for the pages attribute.

Input parameters: none

Return value: the current value of the pages attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPages {
  my $self = shift;
  croak(__PACKAGE__ . "::getPages: arguments passed to getter")
    if @_;
  return $self->{__PAGES};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'parameters',
          bless( {
                   '__NAME' => 'parameters',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Criteria that can be used to look up the reference in a repository.',
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

Bio::MAGE::BQS::BibliographicReference: has the following association accessor methods:

=over


=item parameters


From the MAGE-OM documentation for the C<parameters> association:

Criteria that can be used to look up the reference in a repository.



=over


=item $array_ref = $bibliographicreference->setParameters($array_ref)

The restricted setter method for the parameters association.

Input parameters: the value to which the parameters association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the parameters association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut

sub setParameters {
  my $self = shift;
  croak(__PACKAGE__ . "::setParameters: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setParameters: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setParameters: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setParameters: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  return $self->{__PARAMETERS} = $val;
}



=item $array_ref = $bibliographicreference->getParameters()

The restricted getter method for the parameters association.

Input parameters: none

Return value: the current value of the parameters association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getParameters {
  my $self = shift;
  croak(__PACKAGE__ . "::getParameters: arguments passed to getter")
    if @_;
  return $self->{__PARAMETERS};
}



=item $bibliographicreference->addParameters(@vals)

Because the parameters association has list cardinality, it may store more
than one value. This method adds the current list of objects in the parameters
association.

Input parameters: the list of values C<@vals> to add to the parameters
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub addParameters {
  my $self = shift;
  croak(__PACKAGE__ . "::addParameters: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addParameters: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  push(@{$self->{__PARAMETERS}},@vals);
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

