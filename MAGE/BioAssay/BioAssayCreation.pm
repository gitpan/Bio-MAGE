##############################
#
# Bio::MAGE::BioAssay::BioAssayCreation
#
##############################
# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2002 by:
#    * The MicroArray Gene Expression Database Society (MGED)
#    * Rosetta Inpharmatics
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

package Bio::MAGE::BioAssay::BioAssayCreation;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::BioEvent::BioEvent;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::BioEvent::BioEvent Exporter);
$VERSION = 20020902.6;

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::BioAssay::BioAssayCreation

=head2 SYNOPSIS

  use Bio::MAGE::BioAssay::BioAssayCreation;

    # creating an empty instance
  my $bioassaycreation = Bio::MAGE::BioAssay::BioAssayCreation->new();

    # creating an already populated instance
  my $bioassaycreation = Bio::MAGE::BioAssay::BioAssayCreation->new(array=>$array_value,
			physicalBioAssayTarget=>$physicalBioAssayTarget_value,
			sourceBioMaterialMeasurements=>$sourceBioMaterialMeasurements_value);

    # setting and retrieving object associations
  my $array_val = $bioassaycreation->array();
  $bioassaycreation->array($value);

  my $physicalBioAssayTarget_val = $bioassaycreation->physicalBioAssayTarget();
  $bioassaycreation->physicalBioAssayTarget($value);

  my $sourceBioMaterialMeasurements_val = $bioassaycreation->sourceBioMaterialMeasurements();
  $bioassaycreation->sourceBioMaterialMeasurements($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<BioAssayCreation> class:

The process by which an array and one or more biomaterials are combined to create a bioAssayCreation.



=cut


=head2 INHERITANCE


Bio::MAGE::BioAssay::BioAssayCreation has the following super classes

=over 


=item * Bio::MAGE::BioEvent::BioEvent


=back


Bio::MAGE::BioAssay::BioAssayCreation has the following subclasses

=over 


=item * Bio::MAGE::BioAssay::Hybridization


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::BioAssay::BioAssayCreation->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * array

Sets the value of the array association (this association was inherited
from class C<Bio::MAGE::BioAssay::BioAssayCreation>).

The value will be of type C<Array>.


=item * physicalBioAssayTarget

Sets the value of the physicalBioAssayTarget association (this association was inherited
from class C<Bio::MAGE::BioAssay::BioAssayCreation>).

The value will be of type C<PhysicalBioAssay>.


=item * sourceBioMaterialMeasurements

Sets the value of the sourceBioMaterialMeasurements association (this association was inherited
from class C<Bio::MAGE::BioAssay::BioAssayCreation>).

The value will be of type C<BioMaterialMeasurement>.


=item * protocolApplications

Sets the value of the protocolApplications association (this association was inherited
from class C<Bio::MAGE::BioEvent::BioEvent>).

The value will be of type C<ProtocolApplication>.


=item * identifier

Sets the value of the identifier attribute (this attribute was inherited
from class C<Bio::MAGE::Identifiable>).



=item * name

Sets the value of the name attribute (this attribute was inherited
from class C<Bio::MAGE::Identifiable>).



=item * descriptions

Sets the value of the descriptions association (this association was inherited
from class C<Bio::MAGE::Describable>).

The value will be of type C<Description>.


=item * security

Sets the value of the security association (this association was inherited
from class C<Bio::MAGE::Describable>).

The value will be of type C<Security>.


=item * auditTrail

Sets the value of the auditTrail association (this association was inherited
from class C<Bio::MAGE::Describable>).

The value will be of type C<Audit>.


=item * propertySets

Sets the value of the propertySets association (this association was inherited
from class C<Bio::MAGE::Extendable>).

The value will be of type C<NameValueType>.


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

Returns the full class name for this class, Bio::MAGE::BioAssay::BioAssayCreation.

=cut

sub class_name {
  return q[Bio::MAGE::BioAssay::BioAssayCreation];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::BioAssay::BioAssayCreation.

=cut

sub package {
  return q[BioAssay];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ('Bio::MAGE::BioAssay::Hybridization');
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
  my @list = ('array',
'physicalBioAssayTarget',
'sourceBioMaterialMeasurements');
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

Bio::MAGE::BioAssay::BioAssayCreation: has the following attribute accessor methods:

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
          'sourceBioMaterialMeasurements',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '1',
                                         '__CARDINALITY' => '0..N',
                                         '__DOCUMENTATION' => 'The BioSample and its amount used in the BioAssayCreation event.',
                                         '__NAME' => 'sourceBioMaterialMeasurements',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'BioMaterialMeasurement'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 0,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'The BioSample and its amount used in the BioAssayCreation event.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'BioAssayCreation'
                                      }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'array',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '2',
                                         '__CARDINALITY' => '1',
                                         '__DOCUMENTATION' => 'The array used in the BioAssayCreation event.',
                                         '__NAME' => 'array',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'Array'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 1,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '0..1',
                                        '__DOCUMENTATION' => 'The array used in the BioAssayCreation event.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'BioAssayCreation'
                                      }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'physicalBioAssayTarget',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 0,
                                         '__RANK' => '3',
                                         '__CARDINALITY' => '1',
                                         '__DOCUMENTATION' => 'The association between the BioAssayCreation event (typically Hybridization) and the PhysicalBioAssay and its annotation of this event.',
                                         '__NAME' => 'physicalBioAssayTarget',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'PhysicalBioAssay'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 1,
                                        '__RANK' => '2',
                                        '__CARDINALITY' => '0..1',
                                        '__DOCUMENTATION' => 'The association between the BioAssayCreation event (typically Hybridization) and the PhysicalBioAssay and its annotation of this event.',
                                        '__NAME' => 'bioAssayCreation',
                                        '__ORDERED' => 0,
                                        '__CLASS_NAME' => 'BioAssayCreation'
                                      }, 'Bio::MAGE::Association::End' )
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

Bio::MAGE::BioAssay::BioAssayCreation: has the following association accessor methods:

=over


=item array


From the MAGE-OM documentation for the C<array> association:

The array used in the BioAssayCreation event.



=over


=item $val = $bioassaycreation->setArray($val)

The restricted setter method for the array association.

Input parameters: the value to which the array association will be set : an instance of type C<Bio::MAGE::Array::Array>.

Return value: the current value of the array association : an instance of type C<Bio::MAGE::Array::Array>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Array::Array>

=cut

sub setArray {
  my $self = shift;
  croak(__PACKAGE__ . "::setArray: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setArray: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setArray: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Array") unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Array');
  return $self->{__ARRAY} = $val;
}



=item $val = $bioassaycreation->getArray()

The restricted getter method for the array association.

Input parameters: none

Return value: the current value of the array association : an instance of type C<Bio::MAGE::Array::Array>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getArray {
  my $self = shift;
  croak(__PACKAGE__ . "::getArray: arguments passed to getter")
    if @_;
  return $self->{__ARRAY};
}




=back


=item physicalBioAssayTarget


From the MAGE-OM documentation for the C<physicalBioAssayTarget> association:

The association between the BioAssayCreation event (typically Hybridization) and the PhysicalBioAssay and its annotation of this event.



=over


=item $val = $bioassaycreation->setPhysicalBioAssayTarget($val)

The restricted setter method for the physicalBioAssayTarget association.

Input parameters: the value to which the physicalBioAssayTarget association will be set : an instance of type C<Bio::MAGE::BioAssay::PhysicalBioAssay>.

Return value: the current value of the physicalBioAssayTarget association : an instance of type C<Bio::MAGE::BioAssay::PhysicalBioAssay>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::BioAssay::PhysicalBioAssay>

=cut

sub setPhysicalBioAssayTarget {
  my $self = shift;
  croak(__PACKAGE__ . "::setPhysicalBioAssayTarget: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setPhysicalBioAssayTarget: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setPhysicalBioAssayTarget: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssay::PhysicalBioAssay") unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssay::PhysicalBioAssay');
  return $self->{__PHYSICALBIOASSAYTARGET} = $val;
}



=item $val = $bioassaycreation->getPhysicalBioAssayTarget()

The restricted getter method for the physicalBioAssayTarget association.

Input parameters: none

Return value: the current value of the physicalBioAssayTarget association : an instance of type C<Bio::MAGE::BioAssay::PhysicalBioAssay>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getPhysicalBioAssayTarget {
  my $self = shift;
  croak(__PACKAGE__ . "::getPhysicalBioAssayTarget: arguments passed to getter")
    if @_;
  return $self->{__PHYSICALBIOASSAYTARGET};
}




=back


=item sourceBioMaterialMeasurements


From the MAGE-OM documentation for the C<sourceBioMaterialMeasurements> association:

The BioSample and its amount used in the BioAssayCreation event.



=over


=item $array_ref = $bioassaycreation->setSourceBioMaterialMeasurements($array_ref)

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



=item $array_ref = $bioassaycreation->getSourceBioMaterialMeasurements()

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



=item $bioassaycreation->addSourceBioMaterialMeasurements(@vals)

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

Jason E. Stewart (www.openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut

#
# End the module by returning a true value
#
1;
