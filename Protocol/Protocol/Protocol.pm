##############################
#
# Bio::MAGE::Protocol::Protocol
#
##############################
package Bio::MAGE::Protocol::Protocol;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::Parameterizable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Protocol::Parameterizable Exporter);
$VERSION = q[$Id: Protocol.pm,v 1.4 2002/08/24 16:12:22 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Protocol::Protocol

=head2 SYNOPSIS

  use Bio::MAGE::Protocol::Protocol;

    # creating an empty instance
  my $protocol = Bio::MAGE::Protocol::Protocol->new();

    # creating an already populated instance
  my $protocol = Bio::MAGE::Protocol::Protocol->new(text=>$text_value,
			title=>$title_value,
			hardwares=>$hardwares_value,
			softwares=>$softwares_value,
			type=>$type_value);

    # setting and retrieving object attributes
  my $text_val = $protocol->text();
  $protocol->text($value);

  my $title_val = $protocol->title();
  $protocol->title($value);

    # setting and retrieving object associations
  my $hardwares_val = $protocol->hardwares();
  $protocol->hardwares($value);

  my $softwares_val = $protocol->softwares();
  $protocol->softwares($value);

  my $type_val = $protocol->type();
  $protocol->type($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Protocol> class:

A Protocol is a parameterizable description of a method.  ProtocolApplication is used to specify the ParameterValues of it's Protocol's Parameters.



=cut


=head2 INHERITANCE


Bio::MAGE::Protocol::Protocol has the following super classes

=over 


=item * Bio::MAGE::Protocol::Parameterizable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Protocol::Protocol->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * text

Sets the value of the text attribute (from C<Bio::MAGE::Protocol::Protocol>).


=item * title

Sets the value of the title attribute (from C<Bio::MAGE::Protocol::Protocol>).


=item * hardwares

Sets the value of the hardwares association (from C<Bio::MAGE::Protocol::Protocol>).


=item * softwares

Sets the value of the softwares association (from C<Bio::MAGE::Protocol::Protocol>).


=item * type

Sets the value of the type association (from C<Bio::MAGE::Protocol::Protocol>).


=item * URI

Sets the value of the URI attribute (from C<Bio::MAGE::Protocol::Parameterizable>).


=item * parameterTypes

Sets the value of the parameterTypes association (from C<Bio::MAGE::Protocol::Parameterizable>).


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

Returns the full class name for this class, Bio::MAGE::Protocol::Protocol.

=cut

sub class_name {
  return q[Bio::MAGE::Protocol::Protocol];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Protocol::Protocol.

=cut

sub package {
  return q[Protocol];
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
  my @list = ('Bio::MAGE::Protocol::Parameterizable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('text', 'title');
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
  my @list = ('hardwares', 'softwares', 'type');
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

Bio::MAGE::Protocol::Protocol: has the following attribute accessor methods:

=over


=item text

From the MAGE-OM documentation for the C<text> attribute:

The text description of the Protocol.



=over


=item $val = $protocol->setText($val)

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



=item $val = $protocol->getText()

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


=item title

From the MAGE-OM documentation for the C<title> attribute:

The title of the Protocol



=over


=item $val = $protocol->setTitle($val)

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



=item $val = $protocol->getTitle()

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

Attributes Inherited from Bio::MAGE::Protocol::Parameterizable


=item URI

From the MAGE-OM documentation for the C<URI> attribute:

Where an instantiated Parameterizable is located.



=over


=item $val = $parameterizable->setURI($val)

The restricted setter method for the URI attribute.

Input parameters: the value to which the URI attribute will be set 

Return value: the current value of the URI attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $parameterizable->getURI()

The restricted getter method for the URI attribute.

Input parameters: none

Return value: the current value of the URI attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



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
          'type',
          bless( {
                   '__NAME' => 'type',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The type of a Protocol,  a user should provide/use a recommended vocabulary.  Examples of types include:  RNA extraction, array washing, etc...',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'hardwares',
          bless( {
                   '__NAME' => 'hardwares',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Hardware',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Hardware used by this protocol.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'softwares',
          bless( {
                   '__NAME' => 'softwares',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Software',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Software used by this Protocol.',
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

Bio::MAGE::Protocol::Protocol: has the following association accessor methods:

=over


=item hardwares


From the MAGE-OM documentation for the C<hardwares> association:

Hardware used by this protocol.



=over


=item $array_ref = $protocol->setHardwares($array_ref)

The restricted setter method for the hardwares association.

Input parameters: the value to which the hardwares association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::Hardware>

Return value: the current value of the hardwares association : a reference to an array of objects of type C<Bio::MAGE::Protocol::Hardware>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::Hardware> instances

=cut

sub setHardwares {
  my $self = shift;
  croak(__PACKAGE__ . "::setHardwares: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setHardwares: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setHardwares: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setHardwares: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::Hardware")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::Hardware');
  }

  return $self->{__HARDWARES} = $val;
}



=item $array_ref = $protocol->getHardwares()

The restricted getter method for the hardwares association.

Input parameters: none

Return value: the current value of the hardwares association : a reference to an array of objects of type C<Bio::MAGE::Protocol::Hardware>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getHardwares {
  my $self = shift;
  croak(__PACKAGE__ . "::getHardwares: arguments passed to getter")
    if @_;
  return $self->{__HARDWARES};
}



=item $protocol->addHardwares(@vals)

Because the hardwares association has list cardinality, it may store more
than one value. This method adds the current list of objects in the hardwares
association.

Input parameters: the list of values C<@vals> to add to the hardwares
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::Hardware>

=cut

sub addHardwares {
  my $self = shift;
  croak(__PACKAGE__ . "::addHardwares: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addHardwares: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::Hardware")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::Hardware');
  }

  push(@{$self->{__HARDWARES}},@vals);
}



=back


=item softwares


From the MAGE-OM documentation for the C<softwares> association:

Software used by this Protocol.



=over


=item $array_ref = $protocol->setSoftwares($array_ref)

The restricted setter method for the softwares association.

Input parameters: the value to which the softwares association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::Software>

Return value: the current value of the softwares association : a reference to an array of objects of type C<Bio::MAGE::Protocol::Software>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::Software> instances

=cut

sub setSoftwares {
  my $self = shift;
  croak(__PACKAGE__ . "::setSoftwares: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSoftwares: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setSoftwares: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setSoftwares: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::Software")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::Software');
  }

  return $self->{__SOFTWARES} = $val;
}



=item $array_ref = $protocol->getSoftwares()

The restricted getter method for the softwares association.

Input parameters: none

Return value: the current value of the softwares association : a reference to an array of objects of type C<Bio::MAGE::Protocol::Software>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSoftwares {
  my $self = shift;
  croak(__PACKAGE__ . "::getSoftwares: arguments passed to getter")
    if @_;
  return $self->{__SOFTWARES};
}



=item $protocol->addSoftwares(@vals)

Because the softwares association has list cardinality, it may store more
than one value. This method adds the current list of objects in the softwares
association.

Input parameters: the list of values C<@vals> to add to the softwares
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::Software>

=cut

sub addSoftwares {
  my $self = shift;
  croak(__PACKAGE__ . "::addSoftwares: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addSoftwares: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::Software")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::Software');
  }

  push(@{$self->{__SOFTWARES}},@vals);
}



=back


=item type


From the MAGE-OM documentation for the C<type> association:

The type of a Protocol,  a user should provide/use a recommended vocabulary.  Examples of types include:  RNA extraction, array washing, etc...



=over


=item $val = $protocol->setType($val)

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



=item $val = $protocol->getType()

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

Associations Inherited from Bio::MAGE::Protocol::Parameterizable


=item parameterTypes


From the MAGE-OM documentation for the C<parameterTypes> association:

The description of the parameters for the Parameterizable class instance.



=over


=item $array_ref = $parameterizable->setParameterTypes($array_ref)

The restricted setter method for the parameterTypes association.

Input parameters: the value to which the parameterTypes association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::Parameter>

Return value: the current value of the parameterTypes association : a reference to an array of objects of type C<Bio::MAGE::Protocol::Parameter>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::Parameter> instances

=cut


=item $array_ref = $parameterizable->getParameterTypes()

The restricted getter method for the parameterTypes association.

Input parameters: none

Return value: the current value of the parameterTypes association : a reference to an array of objects of type C<Bio::MAGE::Protocol::Parameter>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $parameterizable->addParameterTypes(@vals)

Because the parameterTypes association has list cardinality, it may store more
than one value. This method adds the current list of objects in the parameterTypes
association.

Input parameters: the list of values C<@vals> to add to the parameterTypes
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::Parameter>

=cut



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

