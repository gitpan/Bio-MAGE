##############################
#
# Bio::MAGE::Experiment::ExperimentDesign
#
##############################
package Bio::MAGE::Experiment::ExperimentDesign;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Describable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Describable Exporter);
$VERSION = q[$Id: ExperimentDesign.pm,v 1.4 2002/08/24 16:12:21 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Experiment::ExperimentDesign

=head2 SYNOPSIS

  use Bio::MAGE::Experiment::ExperimentDesign;

    # creating an empty instance
  my $experimentdesign = Bio::MAGE::Experiment::ExperimentDesign->new();

    # creating an already populated instance
  my $experimentdesign = Bio::MAGE::Experiment::ExperimentDesign->new(replicateDescription=>$replicateDescription_value,
			types=>$types_value,
			experimentalFactors=>$experimentalFactors_value,
			qualityControlDescription=>$qualityControlDescription_value,
			topLevelBioAssays=>$topLevelBioAssays_value,
			normalizationDescription=>$normalizationDescription_value);

    # setting and retrieving object associations
  my $replicateDescription_val = $experimentdesign->replicateDescription();
  $experimentdesign->replicateDescription($value);

  my $types_val = $experimentdesign->types();
  $experimentdesign->types($value);

  my $experimentalFactors_val = $experimentdesign->experimentalFactors();
  $experimentdesign->experimentalFactors($value);

  my $qualityControlDescription_val = $experimentdesign->qualityControlDescription();
  $experimentdesign->qualityControlDescription($value);

  my $topLevelBioAssays_val = $experimentdesign->topLevelBioAssays();
  $experimentdesign->topLevelBioAssays($value);

  my $normalizationDescription_val = $experimentdesign->normalizationDescription();
  $experimentdesign->normalizationDescription($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ExperimentDesign> class:

The ExperimentDesign is the description and collection of ExperimentalFactors and the hierarchy of BioAssays to which they pertain.



=cut


=head2 INHERITANCE


Bio::MAGE::Experiment::ExperimentDesign has the following super classes

=over 


=item * Bio::MAGE::Describable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Experiment::ExperimentDesign->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * replicateDescription

Sets the value of the replicateDescription association (from C<Bio::MAGE::Experiment::ExperimentDesign>).


=item * types

Sets the value of the types association (from C<Bio::MAGE::Experiment::ExperimentDesign>).


=item * experimentalFactors

Sets the value of the experimentalFactors association (from C<Bio::MAGE::Experiment::ExperimentDesign>).


=item * qualityControlDescription

Sets the value of the qualityControlDescription association (from C<Bio::MAGE::Experiment::ExperimentDesign>).


=item * topLevelBioAssays

Sets the value of the topLevelBioAssays association (from C<Bio::MAGE::Experiment::ExperimentDesign>).


=item * normalizationDescription

Sets the value of the normalizationDescription association (from C<Bio::MAGE::Experiment::ExperimentDesign>).


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

Returns the full class name for this class, Bio::MAGE::Experiment::ExperimentDesign.

=cut

sub class_name {
  return q[Bio::MAGE::Experiment::ExperimentDesign];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Experiment::ExperimentDesign.

=cut

sub package {
  return q[Experiment];
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
  my @list = ('replicateDescription', 'types', 'experimentalFactors', 'qualityControlDescription', 'topLevelBioAssays', 'normalizationDescription');
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

Bio::MAGE::Experiment::ExperimentDesign: has the following attribute accessor methods:

=over



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'types',
          bless( {
                   '__NAME' => 'types',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Classification of an experiment.  For example \'normal vs. diseased\', \'treated vs. untreated\', \'time course\', \'tiling\', etc.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'topLevelBioAssays',
          bless( {
                   '__NAME' => 'topLevelBioAssays',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BioAssay',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The organization of the BioAssays as specified by the ExperimentDesign (TimeCourse, Dosage, etc.)',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'experimentalFactors',
          bless( {
                   '__NAME' => 'experimentalFactors',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'ExperimentalFactor',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The description of the factors (TimeCourse, Dosage, etc.) that group the BioAssays.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'qualityControlDescription',
          bless( {
                   '__NAME' => 'qualityControlDescription',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'Description',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'Description of the quality control aspects of the Experiment.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'normalizationDescription',
          bless( {
                   '__NAME' => 'normalizationDescription',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'Description',
                   '__RANK' => '5',
                   '__DESCRIPTION' => 'Description of the normalization strategy of the Experiment.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'replicateDescription',
          bless( {
                   '__NAME' => 'replicateDescription',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'Description',
                   '__RANK' => '6',
                   '__DESCRIPTION' => 'Description of the replicate strategy of the Experiment.',
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

Bio::MAGE::Experiment::ExperimentDesign: has the following association accessor methods:

=over


=item replicateDescription


From the MAGE-OM documentation for the C<replicateDescription> association:

Description of the replicate strategy of the Experiment.



=over


=item $val = $experimentdesign->setReplicateDescription($val)

The restricted setter method for the replicateDescription association.

Input parameters: the value to which the replicateDescription association will be set : an instance of type C<Bio::MAGE::Description::Description>.

Return value: the current value of the replicateDescription association : an instance of type C<Bio::MAGE::Description::Description>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::Description>

=cut

sub setReplicateDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::setReplicateDescription: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setReplicateDescription: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setReplicateDescription: wrong type: " . ref($val) . " expected Bio::MAGE::Description::Description") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::Description');
  return $self->{__REPLICATEDESCRIPTION} = $val;
}



=item $val = $experimentdesign->getReplicateDescription()

The restricted getter method for the replicateDescription association.

Input parameters: none

Return value: the current value of the replicateDescription association : an instance of type C<Bio::MAGE::Description::Description>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getReplicateDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::getReplicateDescription: arguments passed to getter")
    if @_;
  return $self->{__REPLICATEDESCRIPTION};
}




=back


=item types


From the MAGE-OM documentation for the C<types> association:

Classification of an experiment.  For example 'normal vs. diseased', 'treated vs. untreated', 'time course', 'tiling', etc.



=over


=item $array_ref = $experimentdesign->setTypes($array_ref)

The restricted setter method for the types association.

Input parameters: the value to which the types association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the types association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut

sub setTypes {
  my $self = shift;
  croak(__PACKAGE__ . "::setTypes: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setTypes: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setTypes: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setTypes: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  return $self->{__TYPES} = $val;
}



=item $array_ref = $experimentdesign->getTypes()

The restricted getter method for the types association.

Input parameters: none

Return value: the current value of the types association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getTypes {
  my $self = shift;
  croak(__PACKAGE__ . "::getTypes: arguments passed to getter")
    if @_;
  return $self->{__TYPES};
}



=item $experimentdesign->addTypes(@vals)

Because the types association has list cardinality, it may store more
than one value. This method adds the current list of objects in the types
association.

Input parameters: the list of values C<@vals> to add to the types
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub addTypes {
  my $self = shift;
  croak(__PACKAGE__ . "::addTypes: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addTypes: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  push(@{$self->{__TYPES}},@vals);
}



=back


=item experimentalFactors


From the MAGE-OM documentation for the C<experimentalFactors> association:

The description of the factors (TimeCourse, Dosage, etc.) that group the BioAssays.



=over


=item $array_ref = $experimentdesign->setExperimentalFactors($array_ref)

The restricted setter method for the experimentalFactors association.

Input parameters: the value to which the experimentalFactors association will be set : a reference to an array of objects of type C<Bio::MAGE::Experiment::ExperimentalFactor>

Return value: the current value of the experimentalFactors association : a reference to an array of objects of type C<Bio::MAGE::Experiment::ExperimentalFactor>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Experiment::ExperimentalFactor> instances

=cut

sub setExperimentalFactors {
  my $self = shift;
  croak(__PACKAGE__ . "::setExperimentalFactors: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExperimentalFactors: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setExperimentalFactors: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setExperimentalFactors: wrong type: " . ref($val) . " expected Bio::MAGE::Experiment::ExperimentalFactor")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Experiment::ExperimentalFactor');
  }

  return $self->{__EXPERIMENTALFACTORS} = $val;
}



=item $array_ref = $experimentdesign->getExperimentalFactors()

The restricted getter method for the experimentalFactors association.

Input parameters: none

Return value: the current value of the experimentalFactors association : a reference to an array of objects of type C<Bio::MAGE::Experiment::ExperimentalFactor>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExperimentalFactors {
  my $self = shift;
  croak(__PACKAGE__ . "::getExperimentalFactors: arguments passed to getter")
    if @_;
  return $self->{__EXPERIMENTALFACTORS};
}



=item $experimentdesign->addExperimentalFactors(@vals)

Because the experimentalFactors association has list cardinality, it may store more
than one value. This method adds the current list of objects in the experimentalFactors
association.

Input parameters: the list of values C<@vals> to add to the experimentalFactors
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Experiment::ExperimentalFactor>

=cut

sub addExperimentalFactors {
  my $self = shift;
  croak(__PACKAGE__ . "::addExperimentalFactors: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addExperimentalFactors: wrong type: " . ref($val) . " expected Bio::MAGE::Experiment::ExperimentalFactor")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Experiment::ExperimentalFactor');
  }

  push(@{$self->{__EXPERIMENTALFACTORS}},@vals);
}



=back


=item qualityControlDescription


From the MAGE-OM documentation for the C<qualityControlDescription> association:

Description of the quality control aspects of the Experiment.



=over


=item $val = $experimentdesign->setQualityControlDescription($val)

The restricted setter method for the qualityControlDescription association.

Input parameters: the value to which the qualityControlDescription association will be set : an instance of type C<Bio::MAGE::Description::Description>.

Return value: the current value of the qualityControlDescription association : an instance of type C<Bio::MAGE::Description::Description>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::Description>

=cut

sub setQualityControlDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::setQualityControlDescription: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setQualityControlDescription: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setQualityControlDescription: wrong type: " . ref($val) . " expected Bio::MAGE::Description::Description") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::Description');
  return $self->{__QUALITYCONTROLDESCRIPTION} = $val;
}



=item $val = $experimentdesign->getQualityControlDescription()

The restricted getter method for the qualityControlDescription association.

Input parameters: none

Return value: the current value of the qualityControlDescription association : an instance of type C<Bio::MAGE::Description::Description>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getQualityControlDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::getQualityControlDescription: arguments passed to getter")
    if @_;
  return $self->{__QUALITYCONTROLDESCRIPTION};
}




=back


=item topLevelBioAssays


From the MAGE-OM documentation for the C<topLevelBioAssays> association:

The organization of the BioAssays as specified by the ExperimentDesign (TimeCourse, Dosage, etc.)



=over


=item $array_ref = $experimentdesign->setTopLevelBioAssays($array_ref)

The restricted setter method for the topLevelBioAssays association.

Input parameters: the value to which the topLevelBioAssays association will be set : a reference to an array of objects of type C<Bio::MAGE::BioAssay::BioAssay>

Return value: the current value of the topLevelBioAssays association : a reference to an array of objects of type C<Bio::MAGE::BioAssay::BioAssay>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioAssay::BioAssay> instances

=cut

sub setTopLevelBioAssays {
  my $self = shift;
  croak(__PACKAGE__ . "::setTopLevelBioAssays: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setTopLevelBioAssays: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setTopLevelBioAssays: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setTopLevelBioAssays: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssay::BioAssay")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssay::BioAssay');
  }

  return $self->{__TOPLEVELBIOASSAYS} = $val;
}



=item $array_ref = $experimentdesign->getTopLevelBioAssays()

The restricted getter method for the topLevelBioAssays association.

Input parameters: none

Return value: the current value of the topLevelBioAssays association : a reference to an array of objects of type C<Bio::MAGE::BioAssay::BioAssay>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getTopLevelBioAssays {
  my $self = shift;
  croak(__PACKAGE__ . "::getTopLevelBioAssays: arguments passed to getter")
    if @_;
  return $self->{__TOPLEVELBIOASSAYS};
}



=item $experimentdesign->addTopLevelBioAssays(@vals)

Because the topLevelBioAssays association has list cardinality, it may store more
than one value. This method adds the current list of objects in the topLevelBioAssays
association.

Input parameters: the list of values C<@vals> to add to the topLevelBioAssays
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioAssay::BioAssay>

=cut

sub addTopLevelBioAssays {
  my $self = shift;
  croak(__PACKAGE__ . "::addTopLevelBioAssays: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addTopLevelBioAssays: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssay::BioAssay")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssay::BioAssay');
  }

  push(@{$self->{__TOPLEVELBIOASSAYS}},@vals);
}



=back


=item normalizationDescription


From the MAGE-OM documentation for the C<normalizationDescription> association:

Description of the normalization strategy of the Experiment.



=over


=item $val = $experimentdesign->setNormalizationDescription($val)

The restricted setter method for the normalizationDescription association.

Input parameters: the value to which the normalizationDescription association will be set : an instance of type C<Bio::MAGE::Description::Description>.

Return value: the current value of the normalizationDescription association : an instance of type C<Bio::MAGE::Description::Description>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::Description>

=cut

sub setNormalizationDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::setNormalizationDescription: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNormalizationDescription: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setNormalizationDescription: wrong type: " . ref($val) . " expected Bio::MAGE::Description::Description") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::Description');
  return $self->{__NORMALIZATIONDESCRIPTION} = $val;
}



=item $val = $experimentdesign->getNormalizationDescription()

The restricted getter method for the normalizationDescription association.

Input parameters: none

Return value: the current value of the normalizationDescription association : an instance of type C<Bio::MAGE::Description::Description>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNormalizationDescription {
  my $self = shift;
  croak(__PACKAGE__ . "::getNormalizationDescription: arguments passed to getter")
    if @_;
  return $self->{__NORMALIZATIONDESCRIPTION};
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

