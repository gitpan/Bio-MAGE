##############################
#
# Bio::MAGE::BioMaterial::BioMaterial
#
##############################
package Bio::MAGE::BioMaterial::BioMaterial;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: BioMaterial.pm,v 1.4 2002/08/24 16:12:17 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::BioMaterial::BioMaterial

=head2 SYNOPSIS

  use Bio::MAGE::BioMaterial::BioMaterial;

    # creating an empty instance
  my $biomaterial = Bio::MAGE::BioMaterial::BioMaterial->new();

    # creating an already populated instance
  my $biomaterial = Bio::MAGE::BioMaterial::BioMaterial->new(characteristics=>$characteristics_value,
			treatments=>$treatments_value,
			qualityControlStatistics=>$qualityControlStatistics_value,
			materialType=>$materialType_value);

    # setting and retrieving object associations
  my $characteristics_val = $biomaterial->characteristics();
  $biomaterial->characteristics($value);

  my $treatments_val = $biomaterial->treatments();
  $biomaterial->treatments($value);

  my $qualityControlStatistics_val = $biomaterial->qualityControlStatistics();
  $biomaterial->qualityControlStatistics($value);

  my $materialType_val = $biomaterial->materialType();
  $biomaterial->materialType($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<BioMaterial> class:

BioMaterial is an abstract class that represents the important substances such as cells, tissues, DNA, proteins, etc...  Biomaterials can be related to other biomaterial through a directed acyclic graph (represented by treatment(s)).



=cut


=head2 INHERITANCE


Bio::MAGE::BioMaterial::BioMaterial has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


Bio::MAGE::BioMaterial::BioMaterial has the following subclasses

=over 


=item * Bio::MAGE::BioMaterial::LabeledExtract


=item * Bio::MAGE::BioMaterial::BioSource


=item * Bio::MAGE::BioMaterial::BioSample


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::BioMaterial::BioMaterial->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * characteristics

Sets the value of the characteristics association (from C<Bio::MAGE::BioMaterial::BioMaterial>).


=item * treatments

Sets the value of the treatments association (from C<Bio::MAGE::BioMaterial::BioMaterial>).


=item * qualityControlStatistics

Sets the value of the qualityControlStatistics association (from C<Bio::MAGE::BioMaterial::BioMaterial>).


=item * materialType

Sets the value of the materialType association (from C<Bio::MAGE::BioMaterial::BioMaterial>).


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

Returns the full class name for this class, Bio::MAGE::BioMaterial::BioMaterial.

=cut

sub class_name {
  return q[Bio::MAGE::BioMaterial::BioMaterial];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::BioMaterial::BioMaterial.

=cut

sub package {
  return q[BioMaterial];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ('Bio::MAGE::BioMaterial::LabeledExtract', 'Bio::MAGE::BioMaterial::BioSource', 'Bio::MAGE::BioMaterial::BioSample');
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
  my @list = ('characteristics', 'treatments', 'qualityControlStatistics', 'materialType');
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

Bio::MAGE::BioMaterial::BioMaterial: has the following attribute accessor methods:

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
          'qualityControlStatistics',
          bless( {
                   '__NAME' => 'qualityControlStatistics',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'NameValueType',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Measures of the quality of the BioMaterial.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'characteristics',
          bless( {
                   '__NAME' => 'characteristics',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'Innate properties of the biosource, such as genotype, cultivar, tissue type, cell type, ploidy, etc.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'materialType',
          bless( {
                   '__NAME' => 'materialType',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'OntologyEntry',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The type of material used, i.e. rna, dna, lipid, phosphoprotein, etc.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'treatments',
          bless( {
                   '__NAME' => 'treatments',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Treatment',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'This association is one way from BioMaterial to Treatment.  From this a BioMaterial can discover the amount and type of BioMaterial that was part of the treatment that produced it.',
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

Bio::MAGE::BioMaterial::BioMaterial: has the following association accessor methods:

=over


=item characteristics


From the MAGE-OM documentation for the C<characteristics> association:

Innate properties of the biosource, such as genotype, cultivar, tissue type, cell type, ploidy, etc.



=over


=item $array_ref = $biomaterial->setCharacteristics($array_ref)

The restricted setter method for the characteristics association.

Input parameters: the value to which the characteristics association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Return value: the current value of the characteristics association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::OntologyEntry> instances

=cut

sub setCharacteristics {
  my $self = shift;
  croak(__PACKAGE__ . "::setCharacteristics: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setCharacteristics: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setCharacteristics: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setCharacteristics: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  return $self->{__CHARACTERISTICS} = $val;
}



=item $array_ref = $biomaterial->getCharacteristics()

The restricted getter method for the characteristics association.

Input parameters: none

Return value: the current value of the characteristics association : a reference to an array of objects of type C<Bio::MAGE::Description::OntologyEntry>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getCharacteristics {
  my $self = shift;
  croak(__PACKAGE__ . "::getCharacteristics: arguments passed to getter")
    if @_;
  return $self->{__CHARACTERISTICS};
}



=item $biomaterial->addCharacteristics(@vals)

Because the characteristics association has list cardinality, it may store more
than one value. This method adds the current list of objects in the characteristics
association.

Input parameters: the list of values C<@vals> to add to the characteristics
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub addCharacteristics {
  my $self = shift;
  croak(__PACKAGE__ . "::addCharacteristics: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addCharacteristics: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  }

  push(@{$self->{__CHARACTERISTICS}},@vals);
}



=back


=item treatments


From the MAGE-OM documentation for the C<treatments> association:

This association is one way from BioMaterial to Treatment.  From this a BioMaterial can discover the amount and type of BioMaterial that was part of the treatment that produced it.



=over


=item $array_ref = $biomaterial->setTreatments($array_ref)

The restricted setter method for the treatments association.

Input parameters: the value to which the treatments association will be set : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::Treatment>

Return value: the current value of the treatments association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::Treatment>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioMaterial::Treatment> instances

=cut

sub setTreatments {
  my $self = shift;
  croak(__PACKAGE__ . "::setTreatments: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setTreatments: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setTreatments: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setTreatments: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::Treatment")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::Treatment');
  }

  return $self->{__TREATMENTS} = $val;
}



=item $array_ref = $biomaterial->getTreatments()

The restricted getter method for the treatments association.

Input parameters: none

Return value: the current value of the treatments association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::Treatment>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getTreatments {
  my $self = shift;
  croak(__PACKAGE__ . "::getTreatments: arguments passed to getter")
    if @_;
  return $self->{__TREATMENTS};
}



=item $biomaterial->addTreatments(@vals)

Because the treatments association has list cardinality, it may store more
than one value. This method adds the current list of objects in the treatments
association.

Input parameters: the list of values C<@vals> to add to the treatments
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioMaterial::Treatment>

=cut

sub addTreatments {
  my $self = shift;
  croak(__PACKAGE__ . "::addTreatments: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addTreatments: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::Treatment")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::Treatment');
  }

  push(@{$self->{__TREATMENTS}},@vals);
}



=back


=item qualityControlStatistics


From the MAGE-OM documentation for the C<qualityControlStatistics> association:

Measures of the quality of the BioMaterial.



=over


=item $array_ref = $biomaterial->setQualityControlStatistics($array_ref)

The restricted setter method for the qualityControlStatistics association.

Input parameters: the value to which the qualityControlStatistics association will be set : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Return value: the current value of the qualityControlStatistics association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::NameValueType> instances

=cut

sub setQualityControlStatistics {
  my $self = shift;
  croak(__PACKAGE__ . "::setQualityControlStatistics: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setQualityControlStatistics: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setQualityControlStatistics: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setQualityControlStatistics: wrong type: " . ref($val) . " expected Bio::MAGE::NameValueType")
      unless UNIVERSAL::isa($val,'Bio::MAGE::NameValueType');
  }

  return $self->{__QUALITYCONTROLSTATISTICS} = $val;
}



=item $array_ref = $biomaterial->getQualityControlStatistics()

The restricted getter method for the qualityControlStatistics association.

Input parameters: none

Return value: the current value of the qualityControlStatistics association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getQualityControlStatistics {
  my $self = shift;
  croak(__PACKAGE__ . "::getQualityControlStatistics: arguments passed to getter")
    if @_;
  return $self->{__QUALITYCONTROLSTATISTICS};
}



=item $biomaterial->addQualityControlStatistics(@vals)

Because the qualityControlStatistics association has list cardinality, it may store more
than one value. This method adds the current list of objects in the qualityControlStatistics
association.

Input parameters: the list of values C<@vals> to add to the qualityControlStatistics
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::NameValueType>

=cut

sub addQualityControlStatistics {
  my $self = shift;
  croak(__PACKAGE__ . "::addQualityControlStatistics: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addQualityControlStatistics: wrong type: " . ref($val) . " expected Bio::MAGE::NameValueType")
      unless UNIVERSAL::isa($val,'Bio::MAGE::NameValueType');
  }

  push(@{$self->{__QUALITYCONTROLSTATISTICS}},@vals);
}



=back


=item materialType


From the MAGE-OM documentation for the C<materialType> association:

The type of material used, i.e. rna, dna, lipid, phosphoprotein, etc.



=over


=item $val = $biomaterial->setMaterialType($val)

The restricted setter method for the materialType association.

Input parameters: the value to which the materialType association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the materialType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setMaterialType {
  my $self = shift;
  croak(__PACKAGE__ . "::setMaterialType: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setMaterialType: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setMaterialType: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__MATERIALTYPE} = $val;
}



=item $val = $biomaterial->getMaterialType()

The restricted getter method for the materialType association.

Input parameters: none

Return value: the current value of the materialType association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getMaterialType {
  my $self = shift;
  croak(__PACKAGE__ . "::getMaterialType: arguments passed to getter")
    if @_;
  return $self->{__MATERIALTYPE};
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
  carp "Bio::MAGE::BioMaterial::BioMaterial::initialize: abstract base classes should not be instantiated";
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

