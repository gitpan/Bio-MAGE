##############################
#
# Bio::MAGE::BioAssay::DerivedBioAssay
#
##############################
package Bio::MAGE::BioAssay::DerivedBioAssay;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::BioAssay;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::BioAssay::BioAssay Exporter);
$VERSION = q[$Id: DerivedBioAssay.pm,v 1.4 2002/08/24 16:12:14 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::BioAssay::DerivedBioAssay

=head2 SYNOPSIS

  use Bio::MAGE::BioAssay::DerivedBioAssay;

    # creating an empty instance
  my $derivedbioassay = Bio::MAGE::BioAssay::DerivedBioAssay->new();

    # creating an already populated instance
  my $derivedbioassay = Bio::MAGE::BioAssay::DerivedBioAssay->new(derivedBioAssayMap=>$derivedBioAssayMap_value,
			type=>$type_value,
			derivedBioAssayData=>$derivedBioAssayData_value);

    # setting and retrieving object associations
  my $derivedBioAssayMap_val = $derivedbioassay->derivedBioAssayMap();
  $derivedbioassay->derivedBioAssayMap($value);

  my $type_val = $derivedbioassay->type();
  $derivedbioassay->type($value);

  my $derivedBioAssayData_val = $derivedbioassay->derivedBioAssayData();
  $derivedbioassay->derivedBioAssayData($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<DerivedBioAssay> class:

A BioAssay that is created by the Transformation BioEvent from one or more MeasuredBioAssays or DerivedBioAssays.



=cut


=head2 INHERITANCE


Bio::MAGE::BioAssay::DerivedBioAssay has the following super classes

=over 


=item * Bio::MAGE::BioAssay::BioAssay


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::BioAssay::DerivedBioAssay->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * derivedBioAssayMap

Sets the value of the derivedBioAssayMap association (from C<Bio::MAGE::BioAssay::DerivedBioAssay>).


=item * type

Sets the value of the type association (from C<Bio::MAGE::BioAssay::DerivedBioAssay>).


=item * derivedBioAssayData

Sets the value of the derivedBioAssayData association (from C<Bio::MAGE::BioAssay::DerivedBioAssay>).


=item * channels

Sets the value of the channels association (from C<Bio::MAGE::BioAssay::BioAssay>).


=item * bioAssayFactorValues

Sets the value of the bioAssayFactorValues association (from C<Bio::MAGE::BioAssay::BioAssay>).


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

Returns the full class name for this class, Bio::MAGE::BioAssay::DerivedBioAssay.

=cut

sub class_name {
  return q[Bio::MAGE::BioAssay::DerivedBioAssay];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::BioAssay::DerivedBioAssay.

=cut

sub package {
  return q[BioAssay];
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
  my @list = ('Bio::MAGE::BioAssay::BioAssay');
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
  my @list = ('derivedBioAssayMap', 'type', 'derivedBioAssayData');
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

Bio::MAGE::BioAssay::DerivedBioAssay: has the following attribute accessor methods:

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
          'type',
          bless( {
                   '__NAME' => 'type',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The derivation type, for instance collapsed spot replicate, ratio, averaged intensity, bioassay replicates, etc.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'derivedBioAssayData',
          bless( {
                   '__NAME' => 'derivedBioAssayData',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'DerivedBioAssayData',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The data associated with the DerivedBioAssay.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'derivedBioAssayMap',
          bless( {
                   '__NAME' => 'derivedBioAssayMap',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BioAssayMap',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The DerivedBioAssay that is produced by the sources of the BioAssayMap.',
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

Bio::MAGE::BioAssay::DerivedBioAssay: has the following association accessor methods:

=over


=item derivedBioAssayMap


From the MAGE-OM documentation for the C<derivedBioAssayMap> association:

The DerivedBioAssay that is produced by the sources of the BioAssayMap.



=over


=item $array_ref = $derivedbioassay->setDerivedBioAssayMap($array_ref)

The restricted setter method for the derivedBioAssayMap association.

Input parameters: the value to which the derivedBioAssayMap association will be set : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::BioAssayMap>

Return value: the current value of the derivedBioAssayMap association : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::BioAssayMap>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioAssayData::BioAssayMap> instances

=cut

sub setDerivedBioAssayMap {
  my $self = shift;
  croak(__PACKAGE__ . "::setDerivedBioAssayMap: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDerivedBioAssayMap: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setDerivedBioAssayMap: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setDerivedBioAssayMap: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::BioAssayMap")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::BioAssayMap');
  }

  return $self->{__DERIVEDBIOASSAYMAP} = $val;
}



=item $array_ref = $derivedbioassay->getDerivedBioAssayMap()

The restricted getter method for the derivedBioAssayMap association.

Input parameters: none

Return value: the current value of the derivedBioAssayMap association : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::BioAssayMap>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDerivedBioAssayMap {
  my $self = shift;
  croak(__PACKAGE__ . "::getDerivedBioAssayMap: arguments passed to getter")
    if @_;
  return $self->{__DERIVEDBIOASSAYMAP};
}



=item $derivedbioassay->addDerivedBioAssayMap(@vals)

Because the derivedBioAssayMap association has list cardinality, it may store more
than one value. This method adds the current list of objects in the derivedBioAssayMap
association.

Input parameters: the list of values C<@vals> to add to the derivedBioAssayMap
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioAssayData::BioAssayMap>

=cut

sub addDerivedBioAssayMap {
  my $self = shift;
  croak(__PACKAGE__ . "::addDerivedBioAssayMap: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addDerivedBioAssayMap: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::BioAssayMap")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::BioAssayMap');
  }

  push(@{$self->{__DERIVEDBIOASSAYMAP}},@vals);
}



=back


=item type


From the MAGE-OM documentation for the C<type> association:

The derivation type, for instance collapsed spot replicate, ratio, averaged intensity, bioassay replicates, etc.



=over


=item $val = $derivedbioassay->setType($val)

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



=item $val = $derivedbioassay->getType()

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


=item derivedBioAssayData


From the MAGE-OM documentation for the C<derivedBioAssayData> association:

The data associated with the DerivedBioAssay.



=over


=item $array_ref = $derivedbioassay->setDerivedBioAssayData($array_ref)

The restricted setter method for the derivedBioAssayData association.

Input parameters: the value to which the derivedBioAssayData association will be set : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::DerivedBioAssayData>

Return value: the current value of the derivedBioAssayData association : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::DerivedBioAssayData>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioAssayData::DerivedBioAssayData> instances

=cut

sub setDerivedBioAssayData {
  my $self = shift;
  croak(__PACKAGE__ . "::setDerivedBioAssayData: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setDerivedBioAssayData: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setDerivedBioAssayData: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setDerivedBioAssayData: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::DerivedBioAssayData")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::DerivedBioAssayData');
  }

  return $self->{__DERIVEDBIOASSAYDATA} = $val;
}



=item $array_ref = $derivedbioassay->getDerivedBioAssayData()

The restricted getter method for the derivedBioAssayData association.

Input parameters: none

Return value: the current value of the derivedBioAssayData association : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::DerivedBioAssayData>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getDerivedBioAssayData {
  my $self = shift;
  croak(__PACKAGE__ . "::getDerivedBioAssayData: arguments passed to getter")
    if @_;
  return $self->{__DERIVEDBIOASSAYDATA};
}



=item $derivedbioassay->addDerivedBioAssayData(@vals)

Because the derivedBioAssayData association has list cardinality, it may store more
than one value. This method adds the current list of objects in the derivedBioAssayData
association.

Input parameters: the list of values C<@vals> to add to the derivedBioAssayData
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioAssayData::DerivedBioAssayData>

=cut

sub addDerivedBioAssayData {
  my $self = shift;
  croak(__PACKAGE__ . "::addDerivedBioAssayData: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addDerivedBioAssayData: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::DerivedBioAssayData")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::DerivedBioAssayData');
  }

  push(@{$self->{__DERIVEDBIOASSAYDATA}},@vals);
}



=back

Associations Inherited from Bio::MAGE::BioAssay::BioAssay


=item channels


From the MAGE-OM documentation for the C<channels> association:

Channels can be non-null for all subclasses.  For instance, collapsing across replicate features will create a DerivedBioAssay that will potentially reference channels.



=over


=item $array_ref = $bioassay->setChannels($array_ref)

The restricted setter method for the channels association.

Input parameters: the value to which the channels association will be set : a reference to an array of objects of type C<Bio::MAGE::BioAssay::Channel>

Return value: the current value of the channels association : a reference to an array of objects of type C<Bio::MAGE::BioAssay::Channel>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioAssay::Channel> instances

=cut


=item $array_ref = $bioassay->getChannels()

The restricted getter method for the channels association.

Input parameters: none

Return value: the current value of the channels association : a reference to an array of objects of type C<Bio::MAGE::BioAssay::Channel>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $bioassay->addChannels(@vals)

Because the channels association has list cardinality, it may store more
than one value. This method adds the current list of objects in the channels
association.

Input parameters: the list of values C<@vals> to add to the channels
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioAssay::Channel>

=cut



=back


=item bioAssayFactorValues


From the MAGE-OM documentation for the C<bioAssayFactorValues> association:

The values that this BioAssay is associated with for the experiment.



=over


=item $array_ref = $bioassay->setBioAssayFactorValues($array_ref)

The restricted setter method for the bioAssayFactorValues association.

Input parameters: the value to which the bioAssayFactorValues association will be set : a reference to an array of objects of type C<Bio::MAGE::Experiment::FactorValue>

Return value: the current value of the bioAssayFactorValues association : a reference to an array of objects of type C<Bio::MAGE::Experiment::FactorValue>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Experiment::FactorValue> instances

=cut


=item $array_ref = $bioassay->getBioAssayFactorValues()

The restricted getter method for the bioAssayFactorValues association.

Input parameters: none

Return value: the current value of the bioAssayFactorValues association : a reference to an array of objects of type C<Bio::MAGE::Experiment::FactorValue>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $bioassay->addBioAssayFactorValues(@vals)

Because the bioAssayFactorValues association has list cardinality, it may store more
than one value. This method adds the current list of objects in the bioAssayFactorValues
association.

Input parameters: the list of values C<@vals> to add to the bioAssayFactorValues
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Experiment::FactorValue>

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

