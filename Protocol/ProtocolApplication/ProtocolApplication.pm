##############################
#
# Bio::MAGE::Protocol::ProtocolApplication
#
##############################
package Bio::MAGE::Protocol::ProtocolApplication;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Protocol::ParameterizableApplication;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Protocol::ParameterizableApplication Exporter);
$VERSION = q[$Id: ProtocolApplication.pm,v 1.4 2002/08/24 16:12:22 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Protocol::ProtocolApplication

=head2 SYNOPSIS

  use Bio::MAGE::Protocol::ProtocolApplication;

    # creating an empty instance
  my $protocolapplication = Bio::MAGE::Protocol::ProtocolApplication->new();

    # creating an already populated instance
  my $protocolapplication = Bio::MAGE::Protocol::ProtocolApplication->new(activityDate=>$activityDate_value,
			hardwareApplications=>$hardwareApplications_value,
			protocol=>$protocol_value,
			softwareApplications=>$softwareApplications_value,
			performers=>$performers_value);

    # setting and retrieving object attributes
  my $activityDate_val = $protocolapplication->activityDate();
  $protocolapplication->activityDate($value);

    # setting and retrieving object associations
  my $hardwareApplications_val = $protocolapplication->hardwareApplications();
  $protocolapplication->hardwareApplications($value);

  my $protocol_val = $protocolapplication->protocol();
  $protocolapplication->protocol($value);

  my $softwareApplications_val = $protocolapplication->softwareApplications();
  $protocolapplication->softwareApplications($value);

  my $performers_val = $protocolapplication->performers();
  $protocolapplication->performers($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ProtocolApplication> class:

The use of a protocol with the requisite Parameters and ParameterValues.



=cut


=head2 INHERITANCE


Bio::MAGE::Protocol::ProtocolApplication has the following super classes

=over 


=item * Bio::MAGE::Protocol::ParameterizableApplication


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Protocol::ProtocolApplication->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * activityDate

Sets the value of the activityDate attribute (from C<Bio::MAGE::Protocol::ProtocolApplication>).


=item * hardwareApplications

Sets the value of the hardwareApplications association (from C<Bio::MAGE::Protocol::ProtocolApplication>).


=item * protocol

Sets the value of the protocol association (from C<Bio::MAGE::Protocol::ProtocolApplication>).


=item * softwareApplications

Sets the value of the softwareApplications association (from C<Bio::MAGE::Protocol::ProtocolApplication>).


=item * performers

Sets the value of the performers association (from C<Bio::MAGE::Protocol::ProtocolApplication>).


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

Returns the full class name for this class, Bio::MAGE::Protocol::ProtocolApplication.

=cut

sub class_name {
  return q[Bio::MAGE::Protocol::ProtocolApplication];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Protocol::ProtocolApplication.

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
  my @list = ('activityDate');
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
  my @list = ('hardwareApplications', 'protocol', 'softwareApplications', 'performers');
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

Bio::MAGE::Protocol::ProtocolApplication: has the following attribute accessor methods:

=over


=item activityDate

From the MAGE-OM documentation for the C<activityDate> attribute:

When the protocol was applied.



=over


=item $val = $protocolapplication->setActivityDate($val)

The restricted setter method for the activityDate attribute.

Input parameters: the value to which the activityDate attribute will be set 

Return value: the current value of the activityDate attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setActivityDate {
  my $self = shift;
  croak(__PACKAGE__ . "::setActivityDate: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setActivityDate: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ACTIVITYDATE} = $val;
}



=item $val = $protocolapplication->getActivityDate()

The restricted getter method for the activityDate attribute.

Input parameters: none

Return value: the current value of the activityDate attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getActivityDate {
  my $self = shift;
  croak(__PACKAGE__ . "::getActivityDate: arguments passed to getter")
    if @_;
  return $self->{__ACTIVITYDATE};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'hardwareApplications',
          bless( {
                   '__NAME' => 'hardwareApplications',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'HardwareApplication',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The use of hardware for the application of the protocol.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'softwareApplications',
          bless( {
                   '__NAME' => 'softwareApplications',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'SoftwareApplication',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The use of software for the application of the protocol.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'performers',
          bless( {
                   '__NAME' => 'performers',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Person',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The people who performed the protocol.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'protocol',
          bless( {
                   '__NAME' => 'protocol',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'Protocol',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'The protocol that is being used.',
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

Bio::MAGE::Protocol::ProtocolApplication: has the following association accessor methods:

=over


=item hardwareApplications


From the MAGE-OM documentation for the C<hardwareApplications> association:

The use of hardware for the application of the protocol.



=over


=item $array_ref = $protocolapplication->setHardwareApplications($array_ref)

The restricted setter method for the hardwareApplications association.

Input parameters: the value to which the hardwareApplications association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::HardwareApplication>

Return value: the current value of the hardwareApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::HardwareApplication>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::HardwareApplication> instances

=cut

sub setHardwareApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::setHardwareApplications: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setHardwareApplications: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setHardwareApplications: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setHardwareApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::HardwareApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::HardwareApplication');
  }

  return $self->{__HARDWAREAPPLICATIONS} = $val;
}



=item $array_ref = $protocolapplication->getHardwareApplications()

The restricted getter method for the hardwareApplications association.

Input parameters: none

Return value: the current value of the hardwareApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::HardwareApplication>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getHardwareApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::getHardwareApplications: arguments passed to getter")
    if @_;
  return $self->{__HARDWAREAPPLICATIONS};
}



=item $protocolapplication->addHardwareApplications(@vals)

Because the hardwareApplications association has list cardinality, it may store more
than one value. This method adds the current list of objects in the hardwareApplications
association.

Input parameters: the list of values C<@vals> to add to the hardwareApplications
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::HardwareApplication>

=cut

sub addHardwareApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::addHardwareApplications: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addHardwareApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::HardwareApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::HardwareApplication');
  }

  push(@{$self->{__HARDWAREAPPLICATIONS}},@vals);
}



=back


=item protocol


From the MAGE-OM documentation for the C<protocol> association:

The protocol that is being used.



=over


=item $val = $protocolapplication->setProtocol($val)

The restricted setter method for the protocol association.

Input parameters: the value to which the protocol association will be set : an instance of type C<Bio::MAGE::Protocol::Protocol>.

Return value: the current value of the protocol association : an instance of type C<Bio::MAGE::Protocol::Protocol>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Protocol::Protocol>

=cut

sub setProtocol {
  my $self = shift;
  croak(__PACKAGE__ . "::setProtocol: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setProtocol: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setProtocol: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::Protocol") unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::Protocol');
  return $self->{__PROTOCOL} = $val;
}



=item $val = $protocolapplication->getProtocol()

The restricted getter method for the protocol association.

Input parameters: none

Return value: the current value of the protocol association : an instance of type C<Bio::MAGE::Protocol::Protocol>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getProtocol {
  my $self = shift;
  croak(__PACKAGE__ . "::getProtocol: arguments passed to getter")
    if @_;
  return $self->{__PROTOCOL};
}




=back


=item softwareApplications


From the MAGE-OM documentation for the C<softwareApplications> association:

The use of software for the application of the protocol.



=over


=item $array_ref = $protocolapplication->setSoftwareApplications($array_ref)

The restricted setter method for the softwareApplications association.

Input parameters: the value to which the softwareApplications association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::SoftwareApplication>

Return value: the current value of the softwareApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::SoftwareApplication>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::SoftwareApplication> instances

=cut

sub setSoftwareApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::setSoftwareApplications: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSoftwareApplications: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setSoftwareApplications: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setSoftwareApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::SoftwareApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::SoftwareApplication');
  }

  return $self->{__SOFTWAREAPPLICATIONS} = $val;
}



=item $array_ref = $protocolapplication->getSoftwareApplications()

The restricted getter method for the softwareApplications association.

Input parameters: none

Return value: the current value of the softwareApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::SoftwareApplication>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSoftwareApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::getSoftwareApplications: arguments passed to getter")
    if @_;
  return $self->{__SOFTWAREAPPLICATIONS};
}



=item $protocolapplication->addSoftwareApplications(@vals)

Because the softwareApplications association has list cardinality, it may store more
than one value. This method adds the current list of objects in the softwareApplications
association.

Input parameters: the list of values C<@vals> to add to the softwareApplications
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::SoftwareApplication>

=cut

sub addSoftwareApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::addSoftwareApplications: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addSoftwareApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::SoftwareApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::SoftwareApplication');
  }

  push(@{$self->{__SOFTWAREAPPLICATIONS}},@vals);
}



=back


=item performers


From the MAGE-OM documentation for the C<performers> association:

The people who performed the protocol.



=over


=item $array_ref = $protocolapplication->setPerformers($array_ref)

The restricted setter method for the performers association.

Input parameters: the value to which the performers association will be set : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Person>

Return value: the current value of the performers association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Person>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::AuditAndSecurity::Person> instances

=cut

sub setPerformers {
  my $self = shift;
  croak(__PACKAGE__ . "::setPerformers: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPerformers: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setPerformers: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setPerformers: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Person")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Person');
  }

  return $self->{__PERFORMERS} = $val;
}



=item $array_ref = $protocolapplication->getPerformers()

The restricted getter method for the performers association.

Input parameters: none

Return value: the current value of the performers association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Person>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPerformers {
  my $self = shift;
  croak(__PACKAGE__ . "::getPerformers: arguments passed to getter")
    if @_;
  return $self->{__PERFORMERS};
}



=item $protocolapplication->addPerformers(@vals)

Because the performers association has list cardinality, it may store more
than one value. This method adds the current list of objects in the performers
association.

Input parameters: the list of values C<@vals> to add to the performers
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::AuditAndSecurity::Person>

=cut

sub addPerformers {
  my $self = shift;
  croak(__PACKAGE__ . "::addPerformers: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addPerformers: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Person")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Person');
  }

  push(@{$self->{__PERFORMERS}},@vals);
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

