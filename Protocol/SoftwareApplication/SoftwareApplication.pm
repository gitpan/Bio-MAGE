##############################
#
# Bio::MAGE::Protocol::SoftwareApplication
#
##############################
package Bio::MAGE::Protocol::SoftwareApplication;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::ParameterizableApplication;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Protocol::ParameterizableApplication Exporter);
$VERSION = q[$Id: SoftwareApplication.pm,v 1.4 2002/08/24 16:12:23 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Protocol::SoftwareApplication

=head2 SYNOPSIS

  use Bio::MAGE::Protocol::SoftwareApplication;

    # creating an empty instance
  my $softwareapplication = Bio::MAGE::Protocol::SoftwareApplication->new();

    # creating an already populated instance
  my $softwareapplication = Bio::MAGE::Protocol::SoftwareApplication->new(releaseDate=>$releaseDate_value,
			version=>$version_value,
			software=>$software_value);

    # setting and retrieving object attributes
  my $releaseDate_val = $softwareapplication->releaseDate();
  $softwareapplication->releaseDate($value);

  my $version_val = $softwareapplication->version();
  $softwareapplication->version($value);

    # setting and retrieving object associations
  my $software_val = $softwareapplication->software();
  $softwareapplication->software($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<SoftwareApplication> class:

The use of a piece of software with the requisite Parameters and ParameterValues.



=cut


=head2 INHERITANCE


Bio::MAGE::Protocol::SoftwareApplication has the following super classes

=over 


=item * Bio::MAGE::Protocol::ParameterizableApplication


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Protocol::SoftwareApplication->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * releaseDate

Sets the value of the releaseDate attribute (from C<Bio::MAGE::Protocol::SoftwareApplication>).


=item * version

Sets the value of the version attribute (from C<Bio::MAGE::Protocol::SoftwareApplication>).


=item * software

Sets the value of the software association (from C<Bio::MAGE::Protocol::SoftwareApplication>).


=item * parameterValues

Sets the value of the parameterValues association (from C<Bio::MAGE::Protocol::ParameterizableApplication>).


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

Returns the full class name for this class, Bio::MAGE::Protocol::SoftwareApplication.

=cut

sub class_name {
  return q[Bio::MAGE::Protocol::SoftwareApplication];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Protocol::SoftwareApplication.

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
  my @list = ('Bio::MAGE::Protocol::ParameterizableApplication');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('releaseDate', 'version');
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
  my @list = ('software');
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

Bio::MAGE::Protocol::SoftwareApplication: has the following attribute accessor methods:

=over


=item releaseDate

From the MAGE-OM documentation for the C<releaseDate> attribute:

When the software was released.



=over


=item $val = $softwareapplication->setReleaseDate($val)

The restricted setter method for the releaseDate attribute.

Input parameters: the value to which the releaseDate attribute will be set 

Return value: the current value of the releaseDate attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setReleaseDate {
  my $self = shift;
  croak(__PACKAGE__ . "::setReleaseDate: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setReleaseDate: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__RELEASEDATE} = $val;
}



=item $val = $softwareapplication->getReleaseDate()

The restricted getter method for the releaseDate attribute.

Input parameters: none

Return value: the current value of the releaseDate attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getReleaseDate {
  my $self = shift;
  croak(__PACKAGE__ . "::getReleaseDate: arguments passed to getter")
    if @_;
  return $self->{__RELEASEDATE};
}




=back


=item version

From the MAGE-OM documentation for the C<version> attribute:

The version of the software.



=over


=item $val = $softwareapplication->setVersion($val)

The restricted setter method for the version attribute.

Input parameters: the value to which the version attribute will be set 

Return value: the current value of the version attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setVersion {
  my $self = shift;
  croak(__PACKAGE__ . "::setVersion: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setVersion: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__VERSION} = $val;
}



=item $val = $softwareapplication->getVersion()

The restricted getter method for the version attribute.

Input parameters: none

Return value: the current value of the version attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getVersion {
  my $self = shift;
  croak(__PACKAGE__ . "::getVersion: arguments passed to getter")
    if @_;
  return $self->{__VERSION};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'software',
          bless( {
                   '__NAME' => 'software',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'Software',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The underlying software.',
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

Bio::MAGE::Protocol::SoftwareApplication: has the following association accessor methods:

=over


=item software


From the MAGE-OM documentation for the C<software> association:

The underlying software.



=over


=item $val = $softwareapplication->setSoftware($val)

The restricted setter method for the software association.

Input parameters: the value to which the software association will be set : an instance of type C<Bio::MAGE::Protocol::Software>.

Return value: the current value of the software association : an instance of type C<Bio::MAGE::Protocol::Software>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Protocol::Software>

=cut

sub setSoftware {
  my $self = shift;
  croak(__PACKAGE__ . "::setSoftware: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSoftware: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setSoftware: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::Software") unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::Software');
  return $self->{__SOFTWARE} = $val;
}



=item $val = $softwareapplication->getSoftware()

The restricted getter method for the software association.

Input parameters: none

Return value: the current value of the software association : an instance of type C<Bio::MAGE::Protocol::Software>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSoftware {
  my $self = shift;
  croak(__PACKAGE__ . "::getSoftware: arguments passed to getter")
    if @_;
  return $self->{__SOFTWARE};
}




=back

Associations Inherited from Bio::MAGE::Protocol::ParameterizableApplication


=item parameterValues


From the MAGE-OM documentation for the C<parameterValues> association:

The parameter values for this Parameterizable Application.



=over


=item $array_ref = $parameterizableapplication->setParameterValues($array_ref)

The restricted setter method for the parameterValues association.

Input parameters: the value to which the parameterValues association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::ParameterValue>

Return value: the current value of the parameterValues association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ParameterValue>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::ParameterValue> instances

=cut


=item $array_ref = $parameterizableapplication->getParameterValues()

The restricted getter method for the parameterValues association.

Input parameters: none

Return value: the current value of the parameterValues association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ParameterValue>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $parameterizableapplication->addParameterValues(@vals)

Because the parameterValues association has list cardinality, it may store more
than one value. This method adds the current list of objects in the parameterValues
association.

Input parameters: the list of values C<@vals> to add to the parameterValues
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::ParameterValue>

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

