##############################
#
# Bio::MAGE::DesignElement::CompositeCompositeMap
#
##############################
package Bio::MAGE::DesignElement::CompositeCompositeMap;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssayData::DesignElementMap;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::BioAssayData::DesignElementMap Exporter);
$VERSION = q[$Id: CompositeCompositeMap.pm,v 1.4 2002/08/24 16:12:19 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::DesignElement::CompositeCompositeMap

=head2 SYNOPSIS

  use Bio::MAGE::DesignElement::CompositeCompositeMap;

    # creating an empty instance
  my $compositecompositemap = Bio::MAGE::DesignElement::CompositeCompositeMap->new();

    # creating an already populated instance
  my $compositecompositemap = Bio::MAGE::DesignElement::CompositeCompositeMap->new(compositeSequence=>$compositeSequence_value,
			compositePositionSources=>$compositePositionSources_value);

    # setting and retrieving object associations
  my $compositeSequence_val = $compositecompositemap->compositeSequence();
  $compositecompositemap->compositeSequence($value);

  my $compositePositionSources_val = $compositecompositemap->compositePositionSources();
  $compositecompositemap->compositePositionSources($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<CompositeCompositeMap> class:

A CompositeCompositeMap is the description of how source CompositeSequences are transformed into a target CompositeSequence.   For instance, several CompositeSequences could represent different sequence regions for a Gene and could be mapped to different CompositeSequences, each representing a different splice variant for that Gene.



=cut


=head2 INHERITANCE


Bio::MAGE::DesignElement::CompositeCompositeMap has the following super classes

=over 


=item * Bio::MAGE::BioAssayData::DesignElementMap


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::DesignElement::CompositeCompositeMap->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * compositeSequence

Sets the value of the compositeSequence association (from C<Bio::MAGE::DesignElement::CompositeCompositeMap>).


=item * compositePositionSources

Sets the value of the compositePositionSources association (from C<Bio::MAGE::DesignElement::CompositeCompositeMap>).


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

Returns the full class name for this class, Bio::MAGE::DesignElement::CompositeCompositeMap.

=cut

sub class_name {
  return q[Bio::MAGE::DesignElement::CompositeCompositeMap];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::DesignElement::CompositeCompositeMap.

=cut

sub package {
  return q[DesignElement];
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
  my @list = ('Bio::MAGE::BioAssayData::DesignElementMap');
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
  my @list = ('compositeSequence', 'compositePositionSources');
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

Bio::MAGE::DesignElement::CompositeCompositeMap: has the following attribute accessor methods:

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
          'compositeSequence',
          bless( {
                   '__NAME' => 'compositeSequence',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'CompositeSequence',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'A map to the compositeSequences that compose this CompositeSequence.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'compositePositionSources',
          bless( {
                   '__NAME' => 'compositePositionSources',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1..N',
                   '__CLASS_NAME' => 'CompositePosition',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Association to the CompositeSequences that compose this CompositeSequence and where those CompositeSequences occur.',
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

Bio::MAGE::DesignElement::CompositeCompositeMap: has the following association accessor methods:

=over


=item compositeSequence


From the MAGE-OM documentation for the C<compositeSequence> association:

A map to the compositeSequences that compose this CompositeSequence.



=over


=item $val = $compositecompositemap->setCompositeSequence($val)

The restricted setter method for the compositeSequence association.

Input parameters: the value to which the compositeSequence association will be set : an instance of type C<Bio::MAGE::DesignElement::CompositeSequence>.

Return value: the current value of the compositeSequence association : an instance of type C<Bio::MAGE::DesignElement::CompositeSequence>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::DesignElement::CompositeSequence>

=cut

sub setCompositeSequence {
  my $self = shift;
  croak(__PACKAGE__ . "::setCompositeSequence: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCompositeSequence: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setCompositeSequence: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::CompositeSequence") unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::CompositeSequence');
  return $self->{__COMPOSITESEQUENCE} = $val;
}



=item $val = $compositecompositemap->getCompositeSequence()

The restricted getter method for the compositeSequence association.

Input parameters: none

Return value: the current value of the compositeSequence association : an instance of type C<Bio::MAGE::DesignElement::CompositeSequence>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getCompositeSequence {
  my $self = shift;
  croak(__PACKAGE__ . "::getCompositeSequence: arguments passed to getter")
    if @_;
  return $self->{__COMPOSITESEQUENCE};
}




=back


=item compositePositionSources


From the MAGE-OM documentation for the C<compositePositionSources> association:

Association to the CompositeSequences that compose this CompositeSequence and where those CompositeSequences occur.



=over


=item $array_ref = $compositecompositemap->setCompositePositionSources($array_ref)

The restricted setter method for the compositePositionSources association.

Input parameters: the value to which the compositePositionSources association will be set : a reference to an array of objects of type C<Bio::MAGE::DesignElement::CompositePosition>

Return value: the current value of the compositePositionSources association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::CompositePosition>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::DesignElement::CompositePosition> instances

=cut

sub setCompositePositionSources {
  my $self = shift;
  croak(__PACKAGE__ . "::setCompositePositionSources: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCompositePositionSources: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setCompositePositionSources: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setCompositePositionSources: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::CompositePosition")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::CompositePosition');
  }

  return $self->{__COMPOSITEPOSITIONSOURCES} = $val;
}



=item $array_ref = $compositecompositemap->getCompositePositionSources()

The restricted getter method for the compositePositionSources association.

Input parameters: none

Return value: the current value of the compositePositionSources association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::CompositePosition>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getCompositePositionSources {
  my $self = shift;
  croak(__PACKAGE__ . "::getCompositePositionSources: arguments passed to getter")
    if @_;
  return $self->{__COMPOSITEPOSITIONSOURCES};
}



=item $compositecompositemap->addCompositePositionSources(@vals)

Because the compositePositionSources association has list cardinality, it may store more
than one value. This method adds the current list of objects in the compositePositionSources
association.

Input parameters: the list of values C<@vals> to add to the compositePositionSources
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::DesignElement::CompositePosition>

=cut

sub addCompositePositionSources {
  my $self = shift;
  croak(__PACKAGE__ . "::addCompositePositionSources: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addCompositePositionSources: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::CompositePosition")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::CompositePosition');
  }

  push(@{$self->{__COMPOSITEPOSITIONSOURCES}},@vals);
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

