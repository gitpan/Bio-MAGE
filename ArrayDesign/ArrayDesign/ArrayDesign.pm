##############################
#
# Bio::MAGE::ArrayDesign::ArrayDesign
#
##############################
package Bio::MAGE::ArrayDesign::ArrayDesign;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: ArrayDesign.pm,v 1.4 2002/08/24 16:12:12 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::ArrayDesign::ArrayDesign

=head2 SYNOPSIS

  use Bio::MAGE::ArrayDesign::ArrayDesign;

    # creating an empty instance
  my $arraydesign = Bio::MAGE::ArrayDesign::ArrayDesign->new();

    # creating an already populated instance
  my $arraydesign = Bio::MAGE::ArrayDesign::ArrayDesign->new(numberOfFeatures=>$numberOfFeatures_value,
			version=>$version_value,
			reporterGroups=>$reporterGroups_value,
			protocolApplications=>$protocolApplications_value,
			featureGroups=>$featureGroups_value,
			compositeGroups=>$compositeGroups_value,
			designProviders=>$designProviders_value);

    # setting and retrieving object attributes
  my $numberOfFeatures_val = $arraydesign->numberOfFeatures();
  $arraydesign->numberOfFeatures($value);

  my $version_val = $arraydesign->version();
  $arraydesign->version($value);

    # setting and retrieving object associations
  my $reporterGroups_val = $arraydesign->reporterGroups();
  $arraydesign->reporterGroups($value);

  my $protocolApplications_val = $arraydesign->protocolApplications();
  $arraydesign->protocolApplications($value);

  my $featureGroups_val = $arraydesign->featureGroups();
  $arraydesign->featureGroups($value);

  my $compositeGroups_val = $arraydesign->compositeGroups();
  $arraydesign->compositeGroups($value);

  my $designProviders_val = $arraydesign->designProviders();
  $arraydesign->designProviders($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ArrayDesign> class:

Describes the design of an gene expression layout.  In some cases this might be virtual and, for instance, represent the output from analysis software at the composite level without reporters or features.



=cut


=head2 INHERITANCE


Bio::MAGE::ArrayDesign::ArrayDesign has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


Bio::MAGE::ArrayDesign::ArrayDesign has the following subclasses

=over 


=item * Bio::MAGE::ArrayDesign::PhysicalArrayDesign


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::ArrayDesign::ArrayDesign->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * numberOfFeatures

Sets the value of the numberOfFeatures attribute (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * version

Sets the value of the version attribute (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * reporterGroups

Sets the value of the reporterGroups association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * protocolApplications

Sets the value of the protocolApplications association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * featureGroups

Sets the value of the featureGroups association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * compositeGroups

Sets the value of the compositeGroups association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


=item * designProviders

Sets the value of the designProviders association (from C<Bio::MAGE::ArrayDesign::ArrayDesign>).


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

Returns the full class name for this class, Bio::MAGE::ArrayDesign::ArrayDesign.

=cut

sub class_name {
  return q[Bio::MAGE::ArrayDesign::ArrayDesign];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::ArrayDesign::ArrayDesign.

=cut

sub package {
  return q[ArrayDesign];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ('Bio::MAGE::ArrayDesign::PhysicalArrayDesign');
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
  my @list = ('numberOfFeatures', 'version');
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
  my @list = ('reporterGroups', 'protocolApplications', 'featureGroups', 'compositeGroups', 'designProviders');
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

Bio::MAGE::ArrayDesign::ArrayDesign: has the following attribute accessor methods:

=over


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

sub setNumberOfFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::setNumberOfFeatures: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNumberOfFeatures: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__NUMBEROFFEATURES} = $val;
}



=item $val = $arraydesign->getNumberOfFeatures()

The restricted getter method for the numberOfFeatures attribute.

Input parameters: none

Return value: the current value of the numberOfFeatures attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNumberOfFeatures {
  my $self = shift;
  croak(__PACKAGE__ . "::getNumberOfFeatures: arguments passed to getter")
    if @_;
  return $self->{__NUMBEROFFEATURES};
}




=back


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

sub setVersion {
  my $self = shift;
  croak(__PACKAGE__ . "::setVersion: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setVersion: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__VERSION} = $val;
}



=item $val = $arraydesign->getVersion()

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
          'protocolApplications',
          bless( {
                   '__NAME' => 'protocolApplications',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'ProtocolApplication',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Describes the application of any protocols, such as the methodology used to pick oligos, in the design of the array.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'featureGroups',
          bless( {
                   '__NAME' => 'featureGroups',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'FeatureGroup',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The grouping of like Features together.  Typically for a physical array design, this will be a single grouping of features whose type might be PCR Product or Oligo.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple FeatureGroups to segregate the technology types.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'reporterGroups',
          bless( {
                   '__NAME' => 'reporterGroups',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'ReporterGroup',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The grouping of like Reporter together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple ReporterGroups to segregate the technology types.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'compositeGroups',
          bless( {
                   '__NAME' => 'compositeGroups',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'CompositeGroup',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'The grouping of like CompositeSequence together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple CompositeGroups to segregate the technology types.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'designProviders',
          bless( {
                   '__NAME' => 'designProviders',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Contact',
                   '__RANK' => '5',
                   '__DESCRIPTION' => 'The primary contact for information on the array design',
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

Bio::MAGE::ArrayDesign::ArrayDesign: has the following association accessor methods:

=over


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

sub setReporterGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::setReporterGroups: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setReporterGroups: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setReporterGroups: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setReporterGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::ReporterGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::ReporterGroup');
  }

  return $self->{__REPORTERGROUPS} = $val;
}



=item $array_ref = $arraydesign->getReporterGroups()

The restricted getter method for the reporterGroups association.

Input parameters: none

Return value: the current value of the reporterGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::ReporterGroup>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getReporterGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::getReporterGroups: arguments passed to getter")
    if @_;
  return $self->{__REPORTERGROUPS};
}



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

sub addReporterGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::addReporterGroups: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addReporterGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::ReporterGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::ReporterGroup');
  }

  push(@{$self->{__REPORTERGROUPS}},@vals);
}



=back


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

sub setProtocolApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::setProtocolApplications: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setProtocolApplications: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setProtocolApplications: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setProtocolApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::ProtocolApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::ProtocolApplication');
  }

  return $self->{__PROTOCOLAPPLICATIONS} = $val;
}



=item $array_ref = $arraydesign->getProtocolApplications()

The restricted getter method for the protocolApplications association.

Input parameters: none

Return value: the current value of the protocolApplications association : a reference to an array of objects of type C<Bio::MAGE::Protocol::ProtocolApplication>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getProtocolApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::getProtocolApplications: arguments passed to getter")
    if @_;
  return $self->{__PROTOCOLAPPLICATIONS};
}



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

sub addProtocolApplications {
  my $self = shift;
  croak(__PACKAGE__ . "::addProtocolApplications: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addProtocolApplications: wrong type: " . ref($val) . " expected Bio::MAGE::Protocol::ProtocolApplication")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Protocol::ProtocolApplication');
  }

  push(@{$self->{__PROTOCOLAPPLICATIONS}},@vals);
}



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

sub setFeatureGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureGroups: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureGroups: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFeatureGroups: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setFeatureGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::FeatureGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::FeatureGroup');
  }

  return $self->{__FEATUREGROUPS} = $val;
}



=item $array_ref = $arraydesign->getFeatureGroups()

The restricted getter method for the featureGroups association.

Input parameters: none

Return value: the current value of the featureGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::FeatureGroup>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureGroups: arguments passed to getter")
    if @_;
  return $self->{__FEATUREGROUPS};
}



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

sub addFeatureGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::addFeatureGroups: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFeatureGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::FeatureGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::FeatureGroup');
  }

  push(@{$self->{__FEATUREGROUPS}},@vals);
}



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

sub setCompositeGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::setCompositeGroups: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCompositeGroups: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setCompositeGroups: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setCompositeGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::CompositeGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::CompositeGroup');
  }

  return $self->{__COMPOSITEGROUPS} = $val;
}



=item $array_ref = $arraydesign->getCompositeGroups()

The restricted getter method for the compositeGroups association.

Input parameters: none

Return value: the current value of the compositeGroups association : a reference to an array of objects of type C<Bio::MAGE::ArrayDesign::CompositeGroup>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getCompositeGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::getCompositeGroups: arguments passed to getter")
    if @_;
  return $self->{__COMPOSITEGROUPS};
}



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

sub addCompositeGroups {
  my $self = shift;
  croak(__PACKAGE__ . "::addCompositeGroups: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addCompositeGroups: wrong type: " . ref($val) . " expected Bio::MAGE::ArrayDesign::CompositeGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::ArrayDesign::CompositeGroup');
  }

  push(@{$self->{__COMPOSITEGROUPS}},@vals);
}



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

sub setDesignProviders {
  my $self = shift;
  croak(__PACKAGE__ . "::setDesignProviders: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDesignProviders: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setDesignProviders: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setDesignProviders: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Contact")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Contact');
  }

  return $self->{__DESIGNPROVIDERS} = $val;
}



=item $array_ref = $arraydesign->getDesignProviders()

The restricted getter method for the designProviders association.

Input parameters: none

Return value: the current value of the designProviders association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDesignProviders {
  my $self = shift;
  croak(__PACKAGE__ . "::getDesignProviders: arguments passed to getter")
    if @_;
  return $self->{__DESIGNPROVIDERS};
}



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

sub addDesignProviders {
  my $self = shift;
  croak(__PACKAGE__ . "::addDesignProviders: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addDesignProviders: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Contact")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Contact');
  }

  push(@{$self->{__DESIGNPROVIDERS}},@vals);
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

