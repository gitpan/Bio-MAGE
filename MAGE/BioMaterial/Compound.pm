##############################
#
# Bio::MAGE::BioMaterial::Compound
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

package Bio::MAGE::BioMaterial::Compound;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = 20020902.6;

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::BioMaterial::Compound

=head2 SYNOPSIS

  use Bio::MAGE::BioMaterial::Compound;

    # creating an empty instance
  my $compound = Bio::MAGE::BioMaterial::Compound->new();

    # creating an already populated instance
  my $compound = Bio::MAGE::BioMaterial::Compound->new(isSolvent=>$isSolvent_value,
			merckIndex=>$merckIndex_value,
			componentCompounds=>$componentCompounds_value,
			externalLIMS=>$externalLIMS_value);

    # setting and retrieving object attributes
  my $isSolvent_val = $compound->isSolvent();
  $compound->isSolvent($value);

    # setting and retrieving object associations
  my $merckIndex_val = $compound->merckIndex();
  $compound->merckIndex($value);

  my $componentCompounds_val = $compound->componentCompounds();
  $compound->componentCompounds($value);

  my $externalLIMS_val = $compound->externalLIMS();
  $compound->externalLIMS($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Compound> class:

A Compound can be a simple compound such as SDS (sodium dodecyl sulfate).  It may also be made of other Compounds in proportions using CompoundMeasurements to enumerate the Compounds and their amounts such as LB (Luria Broth) Media.



=cut


=head2 INHERITANCE


Bio::MAGE::BioMaterial::Compound has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::BioMaterial::Compound->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * isSolvent

Sets the value of the isSolvent attribute (this attribute was inherited
from class C<Bio::MAGE::BioMaterial::Compound>).



=item * merckIndex

Sets the value of the merckIndex association (this association was inherited
from class C<Bio::MAGE::BioMaterial::Compound>).

The value will be of type C<OntologyEntry>.


=item * componentCompounds

Sets the value of the componentCompounds association (this association was inherited
from class C<Bio::MAGE::BioMaterial::Compound>).

The value will be of type C<CompoundMeasurement>.


=item * externalLIMS

Sets the value of the externalLIMS association (this association was inherited
from class C<Bio::MAGE::BioMaterial::Compound>).

The value will be of type C<DatabaseEntry>.


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

Returns the full class name for this class, Bio::MAGE::BioMaterial::Compound.

=cut

sub class_name {
  return q[Bio::MAGE::BioMaterial::Compound];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::BioMaterial::Compound.

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
  my @list = ('Bio::MAGE::Identifiable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('isSolvent');
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
  my @list = ('merckIndex',
'componentCompounds',
'externalLIMS');
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

Bio::MAGE::BioMaterial::Compound: has the following attribute accessor methods:

=over


=item isSolvent

From the MAGE-OM documentation for the C<isSolvent> attribute:

A Compound may be a special case Solvent.



=over


=item $val = $compound->setIsSolvent($val)

The restricted setter method for the isSolvent attribute.

Input parameters: the value to which the isSolvent attribute will be set 

Return value: the current value of the isSolvent attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setIsSolvent {
  my $self = shift;
  croak(__PACKAGE__ . "::setIsSolvent: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setIsSolvent: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__ISSOLVENT} = $val;
}



=item $val = $compound->getIsSolvent()

The restricted getter method for the isSolvent attribute.

Input parameters: none

Return value: the current value of the isSolvent attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getIsSolvent {
  my $self = shift;
  croak(__PACKAGE__ . "::getIsSolvent: arguments passed to getter")
    if @_;
  return $self->{__ISSOLVENT};
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
          'merckIndex',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '1',
                                         '__CARDINALITY' => '0..1',
                                         '__DOCUMENTATION' => 'The Merck Index of this Compound.',
                                         '__NAME' => 'merckIndex',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'OntologyEntry'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 0,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'The Merck Index of this Compound.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'Compound'
                                      }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'componentCompounds',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '2',
                                         '__CARDINALITY' => '0..N',
                                         '__DOCUMENTATION' => 'The Compounds and their amounts used to create this Compound.',
                                         '__NAME' => 'componentCompounds',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'CompoundMeasurement'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 0,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'The Compounds and their amounts used to create this Compound.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'Compound'
                                      }, 'Bio::MAGE::Association::End' )
                 }, 'Bio::MAGE::Association' ),
          'externalLIMS',
          bless( {
                   '__OTHER' => bless( {
                                         '__IS_REF' => 1,
                                         '__RANK' => '3',
                                         '__CARDINALITY' => '0..1',
                                         '__DOCUMENTATION' => 'Reference to an entry in an external LIMS data source.',
                                         '__NAME' => 'externalLIMS',
                                         '__ORDERED' => 0,
                                         '__CLASS_NAME' => 'DatabaseEntry'
                                       }, 'Bio::MAGE::Association::End' ),
                   '__SELF' => bless( {
                                        '__IS_REF' => 0,
                                        '__RANK' => undef,
                                        '__CARDINALITY' => '1',
                                        '__DOCUMENTATION' => 'Reference to an entry in an external LIMS data source.',
                                        '__NAME' => undef,
                                        '__ORDERED' => undef,
                                        '__CLASS_NAME' => 'Compound'
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

Bio::MAGE::BioMaterial::Compound: has the following association accessor methods:

=over


=item merckIndex


From the MAGE-OM documentation for the C<merckIndex> association:

The Merck Index of this Compound.



=over


=item $val = $compound->setMerckIndex($val)

The restricted setter method for the merckIndex association.

Input parameters: the value to which the merckIndex association will be set : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Return value: the current value of the merckIndex association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::OntologyEntry>

=cut

sub setMerckIndex {
  my $self = shift;
  croak(__PACKAGE__ . "::setMerckIndex: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setMerckIndex: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setMerckIndex: wrong type: " . ref($val) . " expected Bio::MAGE::Description::OntologyEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::OntologyEntry');
  return $self->{__MERCKINDEX} = $val;
}



=item $val = $compound->getMerckIndex()

The restricted getter method for the merckIndex association.

Input parameters: none

Return value: the current value of the merckIndex association : an instance of type C<Bio::MAGE::Description::OntologyEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getMerckIndex {
  my $self = shift;
  croak(__PACKAGE__ . "::getMerckIndex: arguments passed to getter")
    if @_;
  return $self->{__MERCKINDEX};
}




=back


=item componentCompounds


From the MAGE-OM documentation for the C<componentCompounds> association:

The Compounds and their amounts used to create this Compound.



=over


=item $array_ref = $compound->setComponentCompounds($array_ref)

The restricted setter method for the componentCompounds association.

Input parameters: the value to which the componentCompounds association will be set : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::CompoundMeasurement>

Return value: the current value of the componentCompounds association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::CompoundMeasurement>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioMaterial::CompoundMeasurement> instances

=cut

sub setComponentCompounds {
  my $self = shift;
  croak(__PACKAGE__ . "::setComponentCompounds: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setComponentCompounds: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setComponentCompounds: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setComponentCompounds: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::CompoundMeasurement")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::CompoundMeasurement');
  }

  return $self->{__COMPONENTCOMPOUNDS} = $val;
}



=item $array_ref = $compound->getComponentCompounds()

The restricted getter method for the componentCompounds association.

Input parameters: none

Return value: the current value of the componentCompounds association : a reference to an array of objects of type C<Bio::MAGE::BioMaterial::CompoundMeasurement>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getComponentCompounds {
  my $self = shift;
  croak(__PACKAGE__ . "::getComponentCompounds: arguments passed to getter")
    if @_;
  return $self->{__COMPONENTCOMPOUNDS};
}



=item $compound->addComponentCompounds(@vals)

Because the componentCompounds association has list cardinality, it may store more
than one value. This method adds the current list of objects in the componentCompounds
association.

Input parameters: the list of values C<@vals> to add to the componentCompounds
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioMaterial::CompoundMeasurement>

=cut

sub addComponentCompounds {
  my $self = shift;
  croak(__PACKAGE__ . "::addComponentCompounds: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addComponentCompounds: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::CompoundMeasurement")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::CompoundMeasurement');
  }

  push(@{$self->{__COMPONENTCOMPOUNDS}},@vals);
}



=back


=item externalLIMS


From the MAGE-OM documentation for the C<externalLIMS> association:

Reference to an entry in an external LIMS data source.



=over


=item $val = $compound->setExternalLIMS($val)

The restricted setter method for the externalLIMS association.

Input parameters: the value to which the externalLIMS association will be set : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Return value: the current value of the externalLIMS association : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::DatabaseEntry>

=cut

sub setExternalLIMS {
  my $self = shift;
  croak(__PACKAGE__ . "::setExternalLIMS: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExternalLIMS: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setExternalLIMS: wrong type: " . ref($val) . " expected Bio::MAGE::Description::DatabaseEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::DatabaseEntry');
  return $self->{__EXTERNALLIMS} = $val;
}



=item $val = $compound->getExternalLIMS()

The restricted getter method for the externalLIMS association.

Input parameters: none

Return value: the current value of the externalLIMS association : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExternalLIMS {
  my $self = shift;
  croak(__PACKAGE__ . "::getExternalLIMS: arguments passed to getter")
    if @_;
  return $self->{__EXTERNALLIMS};
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

Jason E. Stewart (www.openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut

#
# End the module by returning a true value
#
1;

