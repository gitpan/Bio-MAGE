##############################
#
# Bio::MAGE::ArrayDesign::PhysicalArrayDesign
#
##############################
package Bio::MAGE::ArrayDesign::PhysicalArrayDesign;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::ArrayDesign::ArrayDesign;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::ArrayDesign::ArrayDesign Exporter);
$VERSION = q[$Id: PhysicalArrayDesign.pm,v 1.4 2002/08/24 16:12:12 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::ArrayDesign::PhysicalArrayDesign

=head2 SYNOPSIS

  use Bio::MAGE::ArrayDesign::PhysicalArrayDesign;

    # creating an empty instance
  my $physicalarraydesign = Bio::MAGE::ArrayDesign::PhysicalArrayDesign->new();

    # creating an already populated instance
  my $physicalarraydesign = Bio::MAGE::ArrayDesign::PhysicalArrayDesign->new(zoneGroups=>$zoneGroups_value,
			surfaceType=>$surfaceType_value);

    # setting and retrieving object associations
  my $zoneGroups_val = $physicalarraydesign->zoneGroups();
  $physicalarraydesign->zoneGroups($value);

  my $surfaceType_val = $physicalarraydesign->surfaceType();
  $physicalarraydesign->surfaceType($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<PhysicalArrayDesign> class:

A design that is expected to be used to manufacture physical arrays.



=cut


=head2 INHERITANCE


Bio::MAGE::ArrayDesign::PhysicalArrayDesign has the following super classes

=over 


=item * Bio::MAGE::ArrayDesign::ArrayDesign


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::ArrayDesign::PhysicalArrayDesign->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * zoneGroups

Sets the value of the zoneGroups association (from C<Bio::MAGE::ArrayDesign::PhysicalArrayDesign>).


=item * surfaceType

Sets the value of the surfaceType association (from C<Bio::MAGE::ArrayDesign::PhysicalArrayDesign>).


=item * version

Sets the value of the version attribute (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * numberOfFeatures

Sets the value of the numberOfFeatures attribute (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * protocolApplications

Sets the value of the protocolApplications association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * compositeGroups

Sets the value of the compositeGroups association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * designProviders

Sets the value of the designProviders association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * reporterGroups

Sets the value of the reporterGroups association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * featureGroups

Sets the value of the featureGroups association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


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

Returns the full class name for this class, Bio::MAGE::ArrayDesign::PhysicalArrayDesign.

=cut

sub class_name {
  return q[Bio::MAGE::ArrayDesign::PhysicalArrayDesign];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::ArrayDesign::PhysicalArrayDesign.

=cut

sub package {
  return q[ArrayDesign];
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
  my @list = ('Bio::MAGE::ArrayDesign::ArrayDesign');
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
  my @list = ('zoneGroups', 'surfaceType');
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

Bio::MAGE::ArrayDesign::PhysicalArrayDesign: has the following attribute accessor methods:

=over

Attributes Inherited from Bio::MAGE::ArrayDesign::ArrayDesign


=item version

From the MAGE-OM documentation for the C<version> attribute:

The version of this design.



=over


=item $val = $arraydesign->setVersion($val)

The restricted setter method for the version attribute.

Input parameters: the value to which the version attribute will be set 

Return value: the current value of the version attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $arraydesign->getVersion()

The restricted getter method for the version attribute.

Input parameters: none

Return value: the current value of the version attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back


=item numberOfFeatures

From the MAGE-OM documentation for the C<numberOfFeatures> attribute:

The number of features for this array



=over


=item $val = $arraydesign->setNumberOfFeatures($val)

The restricted setter method for the numberOfFeatures attribute.

Input parameters: the value to which the numberOfFeatures attribute will be set 

Return value: the current value of the numberOfFeatures attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $arraydesign->getNumberOfFeatures()

The restricted getter method for the numberOfFeatures attribute.

Input parameters: none

Return value: the current value of the numberOfFeatures attribute 

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
          'surfaceType',
          bless( {
                   '__NAME' => 'surfaceType',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The type of surface from a controlled vocabulary that would include terms such as non-absorptive, absorptive, etc.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'zoneGroups',
          bless( {
                   '__NAME' => 'zoneGroups',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'ZoneGroup',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'In the case where the array design is specified by one or more zones, allows specifying where those zones are located.',
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

Bio::MAGE::ArrayDesign::PhysicalArrayDesign: has the following association accessor methods:

=over


=item zoneGroups


From the MAGE-OM documentation for the C<zoneGroups> association:

In the case where the array design is specified by one or more zones, allows specifying where those zones are located.



=over


=item $array_ref = $physicalarraydesign->setZoneGroups($array_ref)

The restricted setter method for the zoneGroups association.

Input parameters: the value to which the zoneGroups association will be set : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::ZoneGroup>

Return value: the current value of the zoneGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::ZoneGroup>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::ArrayDesign::ZoneGroup> instances

=cut

sub setZoneGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::setZoneGroups: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setZoneGroups: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setZoneGroups: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setZoneGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::ZoneGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::ZoneGroup');
  }

  return $self->{__ZONEGROUPS} = $val;
}



=item $array_ref = $physicalarraydesign->getZoneGroups()

The restricted getter method for the zoneGroups association.

Input parameters: none

Return value: the current value of the zoneGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::ZoneGroup>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getZoneGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::getZoneGroups: arguments passed to getter")
    if @_;
  return $self->{__ZONEGROUPS};
}



=item $physicalarraydesign->addZoneGroups(@vals)

Because the zoneGroups association has list cardinality, it may store more
than one value. This method adds the current list of objects in the zoneGroups
association.

Input parameters: the list of values C<@vals> to add to the zoneGroups
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::ArrayDesign::ZoneGroup>

=cut

sub addZoneGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::addZoneGroups: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addZoneGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::ZoneGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::ZoneGroup');
  }

  push(@{$self->{__ZONEGROUPS}},@vals);
}



=back


=item surfaceType


From the MAGE-OM documentation for the C<surfaceType> association:

The type of surface from a controlled vocabulary that would include terms such as non-absorptive, absorptive, etc.



=over


=item $val = $physicalarraydesign->setSurfaceType($val)

The restricted setter method for the surfaceType association.

Input parameters: the value to which the surfaceType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the surfaceType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setSurfaceType {
  my $self = shift;
  croak(__PACKAGE__ . "::setSurfaceType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setSurfaceType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setSurfaceType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__SURFACETYPE} = $val;
}



=item $val = $physicalarraydesign->getSurfaceType()

The restricted getter method for the surfaceType association.

Input parameters: none

Return value: the current value of the surfaceType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getSurfaceType {
  my $self = shift;
  croak(__PACKAGE__ . "::getSurfaceType: arguments passed to getter")
    if @_;
  return $self->{__SURFACETYPE};
}




=back

Associations Inherited from Bio::MAGE::ArrayDesign::ArrayDesign


=item protocolApplications


From the MAGE-OM documentation for the C<protocolApplications> association:

Describes the application of any protocols, such as the methodology used to pick oligos, in the design of the array.



=over


=item $array_ref = $arraydesign->setProtocolApplications($array_ref)

The restricted setter method for the protocolApplications association.

Input parameters: the value to which the protocolApplications association will be set : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Return value: the current value of the protocolApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Protocol::ProtocolApplication> instances

=cut


=item $array_ref = $arraydesign->getProtocolApplications()

The restricted getter method for the protocolApplications association.

Input parameters: none

Return value: the current value of the protocolApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $arraydesign->addProtocolApplications(@vals)

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


=item compositeGroups


From the MAGE-OM documentation for the C<compositeGroups> association:

The grouping of like CompositeSequence together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple CompositeGroups to segregate the technology types.



=over


=item $array_ref = $arraydesign->setCompositeGroups($array_ref)

The restricted setter method for the compositeGroups association.

Input parameters: the value to which the compositeGroups association will be set : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::CompositeGroup>

Return value: the current value of the compositeGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::CompositeGroup>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::ArrayDesign::CompositeGroup> instances

=cut


=item $array_ref = $arraydesign->getCompositeGroups()

The restricted getter method for the compositeGroups association.

Input parameters: none

Return value: the current value of the compositeGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::CompositeGroup>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $arraydesign->addCompositeGroups(@vals)

Because the compositeGroups association has list cardinality, it may store more
than one value. This method adds the current list of objects in the compositeGroups
association.

Input parameters: the list of values C<@vals> to add to the compositeGroups
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::ArrayDesign::CompositeGroup>

=cut



=back


=item designProviders


From the MAGE-OM documentation for the C<designProviders> association:

The primary contact for information on the array design



=over


=item $array_ref = $arraydesign->setDesignProviders($array_ref)

The restricted setter method for the designProviders association.

Input parameters: the value to which the designProviders association will be set : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Return value: the current value of the designProviders association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::AuditAndSecurity::Contact> instances

=cut


=item $array_ref = $arraydesign->getDesignProviders()

The restricted getter method for the designProviders association.

Input parameters: none

Return value: the current value of the designProviders association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $arraydesign->addDesignProviders(@vals)

Because the designProviders association has list cardinality, it may store more
than one value. This method adds the current list of objects in the designProviders
association.

Input parameters: the list of values C<@vals> to add to the designProviders
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::AuditAndSecurity::Contact>

=cut



=back


=item reporterGroups


From the MAGE-OM documentation for the C<reporterGroups> association:

The grouping of like Reporter together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple ReporterGroups to segregate the technology types.



=over


=item $array_ref = $arraydesign->setReporterGroups($array_ref)

The restricted setter method for the reporterGroups association.

Input parameters: the value to which the reporterGroups association will be set : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::ReporterGroup>

Return value: the current value of the reporterGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::ReporterGroup>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::ArrayDesign::ReporterGroup> instances

=cut


=item $array_ref = $arraydesign->getReporterGroups()

The restricted getter method for the reporterGroups association.

Input parameters: none

Return value: the current value of the reporterGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::ReporterGroup>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $arraydesign->addReporterGroups(@vals)

Because the reporterGroups association has list cardinality, it may store more
than one value. This method adds the current list of objects in the reporterGroups
association.

Input parameters: the list of values C<@vals> to add to the reporterGroups
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::ArrayDesign::ReporterGroup>

=cut



=back


=item featureGroups


From the MAGE-OM documentation for the C<featureGroups> association:

The grouping of like Features together.  Typically for a physical array design, this will be a single grouping of features whose type might be PCR Product or Oligo.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple FeatureGroups to segregate the technology types.



=over


=item $array_ref = $arraydesign->setFeatureGroups($array_ref)

The restricted setter method for the featureGroups association.

Input parameters: the value to which the featureGroups association will be set : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::FeatureGroup>

Return value: the current value of the featureGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::FeatureGroup>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::ArrayDesign::FeatureGroup> instances

=cut


=item $array_ref = $arraydesign->getFeatureGroups()

The restricted getter method for the featureGroups association.

Input parameters: none

Return value: the current value of the featureGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::FeatureGroup>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $arraydesign->addFeatureGroups(@vals)

Because the featureGroups association has list cardinality, it may store more
than one value. This method adds the current list of objects in the featureGroups
association.

Input parameters: the list of values C<@vals> to add to the featureGroups
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::ArrayDesign::FeatureGroup>

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

