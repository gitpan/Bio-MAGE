##############################
#
# Bio::MAGE::AuditAndSecurity::Contact
#
##############################
package Bio::MAGE::AuditAndSecurity::Contact;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: Contact.pm,v 1.5 2002/08/24 16:12:13 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::AuditAndSecurity::Contact

=head2 SYNOPSIS

  use Bio::MAGE::AuditAndSecurity::Contact;

    # creating an empty instance
  my $contact = Bio::MAGE::AuditAndSecurity::Contact->new();

    # creating an already populated instance
  my $contact = Bio::MAGE::AuditAndSecurity::Contact->new(email=>$email_value,
			URI=>$URI_value,
			fax=>$fax_value,
			tollFreePhone=>$tollFreePhone_value,
			address=>$address_value,
			phone=>$phone_value,
			roles=>$roles_value);

    # setting and retrieving object attributes
  my $email_val = $contact->email();
  $contact->email($value);

  my $URI_val = $contact->URI();
  $contact->URI($value);

  my $fax_val = $contact->fax();
  $contact->fax($value);

  my $tollFreePhone_val = $contact->tollFreePhone();
  $contact->tollFreePhone($value);

  my $address_val = $contact->address();
  $contact->address($value);

  my $phone_val = $contact->phone();
  $contact->phone($value);

    # setting and retrieving object associations
  my $roles_val = $contact->roles();
  $contact->roles($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Contact> class:

A contact is either a person or an organization.



=cut


=head2 INHERITANCE


Bio::MAGE::AuditAndSecurity::Contact has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


Bio::MAGE::AuditAndSecurity::Contact has the following subclasses

=over 


=item * Bio::MAGE::AuditAndSecurity::Organization


=item * Bio::MAGE::AuditAndSecurity::Person


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::AuditAndSecurity::Contact->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * email

Sets the value of the email attribute (from C<Bio::MAGE::AuditAndSecurity::Contact>).


=item * URI

Sets the value of the URI attribute (from C<Bio::MAGE::AuditAndSecurity::Contact>).


=item * fax

Sets the value of the fax attribute (from C<Bio::MAGE::AuditAndSecurity::Contact>).


=item * tollFreePhone

Sets the value of the tollFreePhone attribute (from C<Bio::MAGE::AuditAndSecurity::Contact>).


=item * address

Sets the value of the address attribute (from C<Bio::MAGE::AuditAndSecurity::Contact>).


=item * phone

Sets the value of the phone attribute (from C<Bio::MAGE::AuditAndSecurity::Contact>).


=item * roles

Sets the value of the roles association (from C<Bio::MAGE::AuditAndSecurity::Contact>).


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

Returns the full class name for this class, Bio::MAGE::AuditAndSecurity::Contact.

=cut

sub class_name {
  return q[Bio::MAGE::AuditAndSecurity::Contact];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::AuditAndSecurity::Contact.

=cut

sub package {
  return q[AuditAndSecurity];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ('Bio::MAGE::AuditAndSecurity::Organization', 'Bio::MAGE::AuditAndSecurity::Person');
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
  my @list = ('email', 'URI', 'fax', 'tollFreePhone', 'address', 'phone');
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
  my @list = ('roles');
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

Bio::MAGE::AuditAndSecurity::Contact: has the following attribute accessor methods:

=over


=item email

Methods for the email attribute.

=over


=item $val = $contact->setEmail($val)

The restricted setter method for the email attribute.

Input parameters: the value to which the email attribute will be set 

Return value: the current value of the email attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setEmail {
  my $self = shift;
  croak(__PACKAGE__ . "::setEmail: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setEmail: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__EMAIL} = $val;
}



=item $val = $contact->getEmail()

The restricted getter method for the email attribute.

Input parameters: none

Return value: the current value of the email attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getEmail {
  my $self = shift;
  croak(__PACKAGE__ . "::getEmail: arguments passed to getter")
    if @_;
  return $self->{__EMAIL};
}




=back


=item URI

Methods for the URI attribute.

=over


=item $val = $contact->setURI($val)

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



=item $val = $contact->getURI()

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


=item fax

Methods for the fax attribute.

=over


=item $val = $contact->setFax($val)

The restricted setter method for the fax attribute.

Input parameters: the value to which the fax attribute will be set 

Return value: the current value of the fax attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setFax {
  my $self = shift;
  croak(__PACKAGE__ . "::setFax: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFax: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__FAX} = $val;
}



=item $val = $contact->getFax()

The restricted getter method for the fax attribute.

Input parameters: none

Return value: the current value of the fax attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFax {
  my $self = shift;
  croak(__PACKAGE__ . "::getFax: arguments passed to getter")
    if @_;
  return $self->{__FAX};
}




=back


=item tollFreePhone

Methods for the tollFreePhone attribute.

=over


=item $val = $contact->setTollFreePhone($val)

The restricted setter method for the tollFreePhone attribute.

Input parameters: the value to which the tollFreePhone attribute will be set 

Return value: the current value of the tollFreePhone attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setTollFreePhone {
  my $self = shift;
  croak(__PACKAGE__ . "::setTollFreePhone: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setTollFreePhone: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__TOLLFREEPHONE} = $val;
}



=item $val = $contact->getTollFreePhone()

The restricted getter method for the tollFreePhone attribute.

Input parameters: none

Return value: the current value of the tollFreePhone attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getTollFreePhone {
  my $self = shift;
  croak(__PACKAGE__ . "::getTollFreePhone: arguments passed to getter")
    if @_;
  return $self->{__TOLLFREEPHONE};
}




=back


=item address

Methods for the address attribute.

=over


=item $val = $contact->setAddress($val)

The restricted setter method for the address attribute.

Input parameters: the value to which the address attribute will be set 

Return value: the current value of the address attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setAddress {
  my $self = shift;
  croak(__PACKAGE__ . "::setAddress: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAddress: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ADDRESS} = $val;
}



=item $val = $contact->getAddress()

The restricted getter method for the address attribute.

Input parameters: none

Return value: the current value of the address attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAddress {
  my $self = shift;
  croak(__PACKAGE__ . "::getAddress: arguments passed to getter")
    if @_;
  return $self->{__ADDRESS};
}




=back


=item phone

Methods for the phone attribute.

=over


=item $val = $contact->setPhone($val)

The restricted setter method for the phone attribute.

Input parameters: the value to which the phone attribute will be set 

Return value: the current value of the phone attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setPhone {
  my $self = shift;
  croak(__PACKAGE__ . "::setPhone: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPhone: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__PHONE} = $val;
}



=item $val = $contact->getPhone()

The restricted getter method for the phone attribute.

Input parameters: none

Return value: the current value of the phone attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPhone {
  my $self = shift;
  croak(__PACKAGE__ . "::getPhone: arguments passed to getter")
    if @_;
  return $self->{__PHONE};
}




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
          'roles',
          bless( {
                   '__NAME' => 'roles',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The roles (lab equipment sales, contractor, etc.) the contact fills.',
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

Bio::MAGE::AuditAndSecurity::Contact: has the following association accessor methods:

=over


=item roles


From the MAGE-OM documentation for the C<roles> association:

The roles (lab equipment sales, contractor, etc.) the contact fills.



=over


=item $array_ref = $contact->setRoles($array_ref)

The restricted setter method for the roles association.

Input parameters: the value to which the roles association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the roles association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut

sub setRoles {
  my $self = shift;
  croak(__PACKAGE__ . "::setRoles: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setRoles: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setRoles: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setRoles: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  return $self->{__ROLES} = $val;
}



=item $array_ref = $contact->getRoles()

The restricted getter method for the roles association.

Input parameters: none

Return value: the current value of the roles association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getRoles {
  my $self = shift;
  croak(__PACKAGE__ . "::getRoles: arguments passed to getter")
    if @_;
  return $self->{__ROLES};
}



=item $contact->addRoles(@vals)

Because the roles association has list cardinality, it may store more
than one value. This method adds the current list of objects in the roles
association.

Input parameters: the list of values C<@vals> to add to the roles
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub addRoles {
  my $self = shift;
  croak(__PACKAGE__ . "::addRoles: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addRoles: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  push(@{$self->{__ROLES}},@vals);
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
  carp "Bio::MAGE::AuditAndSecurity::Contact::initialize: abstract base classes should not be instantiated";
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

