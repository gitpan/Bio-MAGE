##############################
#
# Bio::MAGE::BioMaterial::Treatment
#
##############################
package Bio::MAGE::BioMaterial::Treatment;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::BioEvent::BioEvent;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::BioEvent::BioEvent Exporter);
$VERSION = q[$Id: Treatment.pm,v 1.4 2002/08/24 16:12:17 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::BioMaterial::Treatment

=head2 SYNOPSIS

  use Bio::MAGE::BioMaterial::Treatment;

    # creating an empty instance
  my $treatment = Bio::MAGE::BioMaterial::Treatment->new();

    # creating an already populated instance
  my $treatment = Bio::MAGE::BioMaterial::Treatment->new(order=>$order_value,
			sourceBioMaterialMeasurements=>$sourceBioMaterialMeasurements_value,
			action=>$action_value,
			actionMeasurement=>$actionMeasurement_value,
			compoundMeasurements=>$compoundMeasurements_value);

    # setting and retrieving object attributes
  my $order_val = $treatment->order();
  $treatment->order($value);

    # setting and retrieving object associations
  my $sourceBioMaterialMeasurements_val = $treatment->sourceBioMaterialMeasurements();
  $treatment->sourceBioMaterialMeasurements($value);

  my $action_val = $treatment->action();
  $treatment->action($value);

  my $actionMeasurement_val = $treatment->actionMeasurement();
  $treatment->actionMeasurement($value);

  my $compoundMeasurements_val = $treatment->compoundMeasurements();
  $treatment->compoundMeasurements($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Treatment> class:

The process by which a biomaterial is created (from source biomaterials).  Treatments have an order and an action.



=cut


=head2 INHERITANCE


Bio::MAGE::BioMaterial::Treatment has the following super classes

=over 


=item * Bio::MAGE::BioEvent::BioEvent


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::BioMaterial::Treatment->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * order

Sets the value of the order attribute (from C<Bio::MAGE::BioMaterial::Treatment>).


=item * sourceBioMaterialMeasurements

Sets the value of the sourceBioMaterialMeasurements association (from C<Bio::MAGE::BioMaterial::Treatment>).


=item * action

Sets the value of the action association (from C<Bio::MAGE::BioMaterial::Treatment>).


=item * actionMeasurement

Sets the value of the actionMeasurement association (from C<Bio::MAGE::BioMaterial::Treatment>).


=item * compoundMeasurements

Sets the value of the compoundMeasurements association (from C<Bio::MAGE::BioMaterial::Treatment>).


=item * protocolApplications

Sets the value of the protocolApplications association (from C<Bio::MAGE::BioEvent::BioEvent>).


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

Returns the full class name for this class, Bio::MAGE::BioMaterial::Treatment.

=cut

sub class_name {
  return q[Bio::MAGE::BioMaterial::Treatment];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::BioMaterial::Treatment.

=cut

sub package {
  return q[BioMaterial];
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
  my @list = ('Bio::MAGE::BioEvent::BioEvent');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('order');
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
  my @list = ('sourceBioMaterialMeasurements', 'action', 'actionMeasurement', 'compoundMeasurements');
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

Bio::MAGE::BioMaterial::Treatment: has the following attribute accessor methods:

=over


=item order

From the MAGE-OM documentation for the C<order> attribute:

The chronological order in which a treatment occurred (in relation to other treatments).  More than one treatment can have the same chronological order indicating that they happened (or were caused to happen) simultaneously.



=over


=item $val = $treatment->setOrder($val)

The restricted setter method for the order attribute.

Input parameters: the value to which the order attribute will be set 

Return value: the current value of the order attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setOrder {
  my $self = shift;
  croak(__PACKAGE__ . "::setOrder: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setOrder: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ORDER} = $val;
}



=item $val = $treatment->getOrder()

The restricted getter method for the order attribute.

Input parameters: none

Return value: the current value of the order attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getOrder {
  my $self = shift;
  croak(__PACKAGE__ . "::getOrder: arguments passed to getter")
    if @_;
  return $self->{__ORDER};
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
          'action',
          bless( {
                   '__NAME' => 'action',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The event that occurred (e.g. grow, wait, add, etc...).  The actions should be a recommended vocabulary',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'actionMeasurement',
          bless( {
                   '__NAME' => 'actionMeasurement',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'Measurement',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Measures events like duration, centrifuge speed, etc.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'compoundMeasurements',
          bless( {
                   '__NAME' => 'compoundMeasurements',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'CompoundMeasurement',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The compounds and their amounts used in the treatment.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'sourceBioMaterialMeasurements',
          bless( {
                   '__NAME' => 'sourceBioMaterialMeasurements',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BioMaterialMeasurement',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'The BioMaterials and the amounts used in the treatment',
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

Bio::MAGE::BioMaterial::Treatment: has the following association accessor methods:

=over


=item sourceBioMaterialMeasurements


From the MAGE-OM documentation for the C<sourceBioMaterialMeasurements> association:

The BioMaterials and the amounts used in the treatment



=over


=item $array_ref = $treatment->setSourceBioMaterialMeasurements($array_ref)

The restricted setter method for the sourceBioMaterialMeasurements association.

Input parameters: the value to which the sourceBioMaterialMeasurements association will be set : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::BioMaterialMeasurement>

Return value: the current value of the sourceBioMaterialMeasurements association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::BioMaterialMeasurement>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioMaterial::BioMaterialMeasurement> instances

=cut

sub setSourceBioMaterialMeasurements {
  my $self = shift;
  croak(__PACKAGE__ . "::setSourceBioMaterialMeasurements: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSourceBioMaterialMeasurements: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setSourceBioMaterialMeasurements: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setSourceBioMaterialMeasurements: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::BioMaterialMeasurement")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::BioMaterialMeasurement');
  }

  return $self->{__SOURCEBIOMATERIALMEASUREMENTS} = $val;
}



=item $array_ref = $treatment->getSourceBioMaterialMeasurements()

The restricted getter method for the sourceBioMaterialMeasurements association.

Input parameters: none

Return value: the current value of the sourceBioMaterialMeasurements association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::BioMaterialMeasurement>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSourceBioMaterialMeasurements {
  my $self = shift;
  croak(__PACKAGE__ . "::getSourceBioMaterialMeasurements: arguments passed to getter")
    if @_;
  return $self->{__SOURCEBIOMATERIALMEASUREMENTS};
}



=item $treatment->addSourceBioMaterialMeasurements(@vals)

Because the sourceBioMaterialMeasurements association has list cardinality, it may store more
than one value. This method adds the current list of objects in the sourceBioMaterialMeasurements
association.

Input parameters: the list of values C<@vals> to add to the sourceBioMaterialMeasurements
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioMaterial::BioMaterialMeasurement>

=cut

sub addSourceBioMaterialMeasurements {
  my $self = shift;
  croak(__PACKAGE__ . "::addSourceBioMaterialMeasurements: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addSourceBioMaterialMeasurements: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::BioMaterialMeasurement")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::BioMaterialMeasurement');
  }

  push(@{$self->{__SOURCEBIOMATERIALMEASUREMENTS}},@vals);
}



=back


=item action


From the MAGE-OM documentation for the C<action> association:

The event that occurred (e.g. grow, wait, add, etc...).  The actions should be a recommended vocabulary



=over


=item $val = $treatment->setAction($val)

The restricted setter method for the action association.

Input parameters: the value to which the action association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the action association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setAction {
  my $self = shift;
  croak(__PACKAGE__ . "::setAction: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAction: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setAction: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__ACTION} = $val;
}



=item $val = $treatment->getAction()

The restricted getter method for the action association.

Input parameters: none

Return value: the current value of the action association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAction {
  my $self = shift;
  croak(__PACKAGE__ . "::getAction: arguments passed to getter")
    if @_;
  return $self->{__ACTION};
}




=back


=item actionMeasurement


From the MAGE-OM documentation for the C<actionMeasurement> association:

Measures events like duration, centrifuge speed, etc.



=over


=item $val = $treatment->setActionMeasurement($val)

The restricted setter method for the actionMeasurement association.

Input parameters: the value to which the actionMeasurement association will be set : an instance of type C<Bio::MAGE::Measurement::Measurement>.

Return value: the current value of the actionMeasurement association : an instance of type C<Bio::MAGE::Measurement::Measurement>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Measurement::Measurement>

=cut

sub setActionMeasurement {
  my $self = shift;
  croak(__PACKAGE__ . "::setActionMeasurement: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setActionMeasurement: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setActionMeasurement: wrong type: " . ref($val) . " expected Bio::MAGE::Measurement::Measurement") unless UNIVERSAL::isa($val,'Bio::MAGE::Measurement::Measurement');
  return $self->{__ACTIONMEASUREMENT} = $val;
}



=item $val = $treatment->getActionMeasurement()

The restricted getter method for the actionMeasurement association.

Input parameters: none

Return value: the current value of the actionMeasurement association : an instance of type C<Bio::MAGE::Measurement::Measurement>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getActionMeasurement {
  my $self = shift;
  croak(__PACKAGE__ . "::getActionMeasurement: arguments passed to getter")
    if @_;
  return $self->{__ACTIONMEASUREMENT};
}




=back


=item compoundMeasurements


From the MAGE-OM documentation for the C<compoundMeasurements> association:

The compounds and their amounts used in the treatment.



=over


=item $array_ref = $treatment->setCompoundMeasurements($array_ref)

The restricted setter method for the compoundMeasurements association.

Input parameters: the value to which the compoundMeasurements association will be set : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::CompoundMeasurement>

Return value: the current value of the compoundMeasurements association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::CompoundMeasurement>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioMaterial::CompoundMeasurement> instances

=cut

sub setCompoundMeasurements {
  my $self = shift;
  croak(__PACKAGE__ . "::setCompoundMeasurements: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCompoundMeasurements: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setCompoundMeasurements: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setCompoundMeasurements: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::CompoundMeasurement")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::CompoundMeasurement');
  }

  return $self->{__COMPOUNDMEASUREMENTS} = $val;
}



=item $array_ref = $treatment->getCompoundMeasurements()

The restricted getter method for the compoundMeasurements association.

Input parameters: none

Return value: the current value of the compoundMeasurements association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::CompoundMeasurement>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getCompoundMeasurements {
  my $self = shift;
  croak(__PACKAGE__ . "::getCompoundMeasurements: arguments passed to getter")
    if @_;
  return $self->{__COMPOUNDMEASUREMENTS};
}



=item $treatment->addCompoundMeasurements(@vals)

Because the compoundMeasurements association has list cardinality, it may store more
than one value. This method adds the current list of objects in the compoundMeasurements
association.

Input parameters: the list of values C<@vals> to add to the compoundMeasurements
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioMaterial::CompoundMeasurement>

=cut

sub addCompoundMeasurements {
  my $self = shift;
  croak(__PACKAGE__ . "::addCompoundMeasurements: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addCompoundMeasurements: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::CompoundMeasurement")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::CompoundMeasurement');
  }

  push(@{$self->{__COMPOUNDMEASUREMENTS}},@vals);
}



=back

Associations Inherited from Bio::MAGE::BioEvent::BioEvent


=item protocolApplications


From the MAGE-OM documentation for the C<protocolApplications> association:

The applied protocols to the BioEvent.



=over


=item $array_ref = $bioevent->setProtocolApplications($array_ref)

The restricted setter method for the protocolApplications association.

Input parameters: the value to which the protocolApplications association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Return value: the current value of the protocolApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::ProtocolApplication> instances

=cut


=item $array_ref = $bioevent->getProtocolApplications()

The restricted getter method for the protocolApplications association.

Input parameters: none

Return value: the current value of the protocolApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $bioevent->addProtocolApplications(@vals)

Because the protocolApplications association has list cardinality, it may store more
than one value. This method adds the current list of objects in the protocolApplications
association.

Input parameters: the list of values C<@vals> to add to the protocolApplications
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Protocol::ProtocolApplication>

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

