##############################
#
# Bio::MAGE::DesignElement::Reporter
#
##############################
package Bio::MAGE::DesignElement::Reporter;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::DesignElement::DesignElement;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::DesignElement::DesignElement Exporter);
$VERSION = q[$Id: Reporter.pm,v 1.7 2002/10/13 21:56:09 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::DesignElement::Reporter

=head2 SYNOPSIS

  use Bio::MAGE::DesignElement::Reporter;

    # creating an empty instance
  my $reporter = Bio::MAGE::DesignElement::Reporter->new();

    # creating an already populated instance
  my $reporter = Bio::MAGE::DesignElement::Reporter->new(warningType=>$warningType_value,
			failTypes=>$failTypes_value,
			immobilizedCharacteristics=>$immobilizedCharacteristics_value,
			featureReporterMaps=>$featureReporterMaps_value);

    # setting and retrieving object associations
  my $warningType_val = $reporter->warningType();
  $reporter->warningType($value);

  my $failTypes_val = $reporter->failTypes();
  $reporter->failTypes($value);

  my $immobilizedCharacteristics_val = $reporter->immobilizedCharacteristics();
  $reporter->immobilizedCharacteristics($value);

  my $featureReporterMaps_val = $reporter->featureReporterMaps();
  $reporter->featureReporterMaps($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Reporter> class:

A Design Element that represents some biological material (clone, oligo, etc.) on an array which will report on some biosequence or biosequences.  The derived data from the measured data of its Features represents the presence or absence of the biosequence or biosequences it is reporting on in the BioAssay.

Reporters are Identifiable and several Features on the same array can be mapped to the same reporter as can Features from a different ArrayDesign.  The granularity of the Reporters independence is dependent on the technology and the intent of the ArrayDesign.  Oligos using mature technologies can in general be assumed to be safely replicated on many features where as with PCR Products there might be the desire for quality assurence to make reporters one to one with features and use the mappings to CompositeSequences for replication purposes.



=cut


=head2 INHERITANCE


Bio::MAGE::DesignElement::Reporter has the following super classes

=over 


=item * Bio::MAGE::DesignElement::DesignElement


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::DesignElement::Reporter->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * warningType

Sets the value of the warningType association (from C<Bio::MAGE::DesignElement::Reporter>).


=item * failTypes

Sets the value of the failTypes association (from C<Bio::MAGE::DesignElement::Reporter>).


=item * immobilizedCharacteristics

Sets the value of the immobilizedCharacteristics association (from C<Bio::MAGE::DesignElement::Reporter>).


=item * featureReporterMaps

Sets the value of the featureReporterMaps association (from C<Bio::MAGE::DesignElement::Reporter>).


=item * controlType

Sets the value of the controlType association (from C<Bio::MAGE::DesignElement::DesignElement>).


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

Returns the full class name for this class, Bio::MAGE::DesignElement::Reporter.

=cut

sub class_name {
  return q[Bio::MAGE::DesignElement::Reporter];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::DesignElement::Reporter.

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
  my @list = ('Bio::MAGE::DesignElement::DesignElement');
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
  my @list = ('warningType', 'failTypes', 'immobilizedCharacteristics', 'featureReporterMaps');
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

Bio::MAGE::DesignElement::Reporter: has the following attribute accessor methods:

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
          'immobilizedCharacteristics',
          bless( {
                   '__NAME' => 'immobilizedCharacteristics',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BioSequence',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The sequence annotation on the BioMaterial this reporter represents.  Typically the sequences will be an Oligo Sequence, Clone or PCR Primer.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'warningType',
          bless( {
                   '__NAME' => 'warningType',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Similar to failType but indicates a warning rather than a failure.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'failTypes',
          bless( {
                   '__NAME' => 'failTypes',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'If at some time the reporter is determined to be failed this indicts the failure (doesn\'t report on what it was intended to report on, etc.)',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'featureReporterMaps',
          bless( {
                   '__NAME' => 'featureReporterMaps',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'FeatureReporterMap',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'Associates features with their reporter.',
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

Bio::MAGE::DesignElement::Reporter: has the following association accessor methods:

=over


=item warningType


From the MAGE-OM documentation for the C<warningType> association:

Similar to failType but indicates a warning rather than a failure.



=over


=item $val = $reporter->setWarningType($val)

The restricted setter method for the warningType association.

Input parameters: the value to which the warningType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the warningType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setWarningType {
  my $self = shift;
  croak(__PACKAGE__ . "::setWarningType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setWarningType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setWarningType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__WARNINGTYPE} = $val;
}



=item $val = $reporter->getWarningType()

The restricted getter method for the warningType association.

Input parameters: none

Return value: the current value of the warningType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getWarningType {
  my $self = shift;
  croak(__PACKAGE__ . "::getWarningType: arguments passed to getter")
    if @_;
  return $self->{__WARNINGTYPE};
}




=back


=item failTypes


From the MAGE-OM documentation for the C<failTypes> association:

If at some time the reporter is determined to be failed this indicts the failure (doesn't report on what it was intended to report on, etc.)



=over


=item $array_ref = $reporter->setFailTypes($array_ref)

The restricted setter method for the failTypes association.

Input parameters: the value to which the failTypes association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the failTypes association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut

sub setFailTypes {
  my $self = shift;
  croak(__PACKAGE__ . "::setFailTypes: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFailTypes: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFailTypes: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setFailTypes: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  return $self->{__FAILTYPES} = $val;
}



=item $array_ref = $reporter->getFailTypes()

The restricted getter method for the failTypes association.

Input parameters: none

Return value: the current value of the failTypes association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFailTypes {
  my $self = shift;
  croak(__PACKAGE__ . "::getFailTypes: arguments passed to getter")
    if @_;
  return $self->{__FAILTYPES};
}



=item $reporter->addFailTypes(@vals)

Because the failTypes association has list cardinality, it may store more
than one value. This method adds the current list of objects in the failTypes
association.

Input parameters: the list of values C<@vals> to add to the failTypes
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub addFailTypes {
  my $self = shift;
  croak(__PACKAGE__ . "::addFailTypes: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFailTypes: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  push(@{$self->{__FAILTYPES}},@vals);
}



=back


=item immobilizedCharacteristics


From the MAGE-OM documentation for the C<immobilizedCharacteristics> association:

The sequence annotation on the BioMaterial this reporter represents.  Typically the sequences will be an Oligo Sequence, Clone or PCR Primer.



=over


=item $array_ref = $reporter->setImmobilizedCharacteristics($array_ref)

The restricted setter method for the immobilizedCharacteristics association.

Input parameters: the value to which the immobilizedCharacteristics association will be set : a reference to an array of objects of type C<Bio::MAGE::BioSequence::BioSequence>

Return value: the current value of the immobilizedCharacteristics association : a reference to an array of objects of type C<Bio::MAGE::BioSequence::BioSequence>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioSequence::BioSequence> instances

=cut

sub setImmobilizedCharacteristics {
  my $self = shift;
  croak(__PACKAGE__ . "::setImmobilizedCharacteristics: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setImmobilizedCharacteristics: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setImmobilizedCharacteristics: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setImmobilizedCharacteristics: wrong type: " . ref($val) . " expected Bio::MAGE::BioSequence::BioSequence")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioSequence::BioSequence');
  }

  return $self->{__IMMOBILIZEDCHARACTERISTICS} = $val;
}



=item $array_ref = $reporter->getImmobilizedCharacteristics()

The restricted getter method for the immobilizedCharacteristics association.

Input parameters: none

Return value: the current value of the immobilizedCharacteristics association : a reference to an array of objects of type C<Bio::MAGE::BioSequence::BioSequence>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getImmobilizedCharacteristics {
  my $self = shift;
  croak(__PACKAGE__ . "::getImmobilizedCharacteristics: arguments passed to getter")
    if @_;
  return $self->{__IMMOBILIZEDCHARACTERISTICS};
}



=item $reporter->addImmobilizedCharacteristics(@vals)

Because the immobilizedCharacteristics association has list cardinality, it may store more
than one value. This method adds the current list of objects in the immobilizedCharacteristics
association.

Input parameters: the list of values C<@vals> to add to the immobilizedCharacteristics
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioSequence::BioSequence>

=cut

sub addImmobilizedCharacteristics {
  my $self = shift;
  croak(__PACKAGE__ . "::addImmobilizedCharacteristics: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addImmobilizedCharacteristics: wrong type: " . ref($val) . " expected Bio::MAGE::BioSequence::BioSequence")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioSequence::BioSequence');
  }

  push(@{$self->{__IMMOBILIZEDCHARACTERISTICS}},@vals);
}



=back


=item featureReporterMaps


From the MAGE-OM documentation for the C<featureReporterMaps> association:

Associates features with their reporter.



=over


=item $array_ref = $reporter->setFeatureReporterMaps($array_ref)

The restricted setter method for the featureReporterMaps association.

Input parameters: the value to which the featureReporterMaps association will be set : a reference to an array of objects of type C<Bio::MAGE::DesignElement::FeatureReporterMap>

Return value: the current value of the featureReporterMaps association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::FeatureReporterMap>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::DesignElement::FeatureReporterMap> instances

=cut

sub setFeatureReporterMaps {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeatureReporterMaps: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeatureReporterMaps: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setFeatureReporterMaps: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setFeatureReporterMaps: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::FeatureReporterMap")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::FeatureReporterMap');
  }

  return $self->{__FEATUREREPORTERMAPS} = $val;
}



=item $array_ref = $reporter->getFeatureReporterMaps()

The restricted getter method for the featureReporterMaps association.

Input parameters: none

Return value: the current value of the featureReporterMaps association : a reference to an array of objects of type C<Bio::MAGE::DesignElement::FeatureReporterMap>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeatureReporterMaps {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeatureReporterMaps: arguments passed to getter")
    if @_;
  return $self->{__FEATUREREPORTERMAPS};
}



=item $reporter->addFeatureReporterMaps(@vals)

Because the featureReporterMaps association has list cardinality, it may store more
than one value. This method adds the current list of objects in the featureReporterMaps
association.

Input parameters: the list of values C<@vals> to add to the featureReporterMaps
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::DesignElement::FeatureReporterMap>

=cut

sub addFeatureReporterMaps {
  my $self = shift;
  croak(__PACKAGE__ . "::addFeatureReporterMaps: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addFeatureReporterMaps: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::FeatureReporterMap")
      unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::FeatureReporterMap');
  }

  push(@{$self->{__FEATUREREPORTERMAPS}},@vals);
}



=back

Associations Inherited from Bio::MAGE::DesignElement::DesignElement


=item controlType


From the MAGE-OM documentation for the C<controlType> association:

If the design element represents a control, the type of control it is (normalization, deletion, negative, positive, etc.)



=over


=item $val = $designelement->setControlType($val)

The restricted setter method for the controlType association.

Input parameters: the value to which the controlType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the controlType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut


=item $val = $designelement->getControlType()

The restricted getter method for the controlType association.

Input parameters: none

Return value: the current value of the controlType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

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

