##############################
#
# Bio::MAGE::Array::ManufactureLIMS
#
##############################
package Bio::MAGE::Array::ManufactureLIMS;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Describable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Describable Exporter);
$VERSION = q[$Id: ManufactureLIMS.pm,v 1.4 2002/08/24 16:12:11 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Array::ManufactureLIMS

=head2 SYNOPSIS

  use Bio::MAGE::Array::ManufactureLIMS;

    # creating an empty instance
  my $manufacturelims = Bio::MAGE::Array::ManufactureLIMS->new();

    # creating an already populated instance
  my $manufacturelims = Bio::MAGE::Array::ManufactureLIMS->new(quality=>$quality_value,
			feature=>$feature_value,
			identifierLIMS=>$identifierLIMS_value,
			bioMaterial=>$bioMaterial_value);

    # setting and retrieving object attributes
  my $quality_val = $manufacturelims->quality();
  $manufacturelims->quality($value);

    # setting and retrieving object associations
  my $feature_val = $manufacturelims->feature();
  $manufacturelims->feature($value);

  my $identifierLIMS_val = $manufacturelims->identifierLIMS();
  $manufacturelims->identifierLIMS($value);

  my $bioMaterial_val = $manufacturelims->bioMaterial();
  $manufacturelims->bioMaterial($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ManufactureLIMS> class:

Information on the physical production of arrays within the laboratory.



=cut


=head2 INHERITANCE


Bio::MAGE::Array::ManufactureLIMS has the following super classes

=over 


=item * Bio::MAGE::Describable


=back


Bio::MAGE::Array::ManufactureLIMS has the following subclasses

=over 


=item * Bio::MAGE::Array::ManufactureLIMSBiomaterial


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Array::ManufactureLIMS->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * quality

Sets the value of the quality attribute (from C<Bio::MAGE::Array::ManufactureLIMS>).


=item * feature

Sets the value of the feature association (from C<Bio::MAGE::Array::ManufactureLIMS>).


=item * identifierLIMS

Sets the value of the identifierLIMS association (from C<Bio::MAGE::Array::ManufactureLIMS>).


=item * bioMaterial

Sets the value of the bioMaterial association (from C<Bio::MAGE::Array::ManufactureLIMS>).


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

Returns the full class name for this class, Bio::MAGE::Array::ManufactureLIMS.

=cut

sub class_name {
  return q[Bio::MAGE::Array::ManufactureLIMS];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Array::ManufactureLIMS.

=cut

sub package {
  return q[Array];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ('Bio::MAGE::Array::ManufactureLIMSBiomaterial');
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
  my @list = ('quality');
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
  my @list = ('feature', 'identifierLIMS', 'bioMaterial');
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

Bio::MAGE::Array::ManufactureLIMS: has the following attribute accessor methods:

=over


=item quality

From the MAGE-OM documentation for the C<quality> attribute:

A brief description of the quality of the array manufacture process.



=over


=item $val = $manufacturelims->setQuality($val)

The restricted setter method for the quality attribute.

Input parameters: the value to which the quality attribute will be set 

Return value: the current value of the quality attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setQuality {
  my $self = shift;
  croak(__PACKAGE__ . "::setQuality: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setQuality: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__QUALITY} = $val;
}



=item $val = $manufacturelims->getQuality()

The restricted getter method for the quality attribute.

Input parameters: none

Return value: the current value of the quality attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getQuality {
  my $self = shift;
  croak(__PACKAGE__ . "::getQuality: arguments passed to getter")
    if @_;
  return $self->{__QUALITY};
}




=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'feature',
          bless( {
                   '__NAME' => 'feature',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'Feature',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The feature whose LIMS information is being described.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'bioMaterial',
          bless( {
                   '__NAME' => 'bioMaterial',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'BioMaterial',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The BioMaterial used for the feature.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'identifierLIMS',
          bless( {
                   '__NAME' => 'identifierLIMS',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..1',
                   '__CLASS_NAME' => 'DatabaseEntry',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Association to a LIMS data source for further information on the manufacturing process.',
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

Bio::MAGE::Array::ManufactureLIMS: has the following association accessor methods:

=over


=item feature


From the MAGE-OM documentation for the C<feature> association:

The feature whose LIMS information is being described.



=over


=item $val = $manufacturelims->setFeature($val)

The restricted setter method for the feature association.

Input parameters: the value to which the feature association will be set : an instance of type C<Bio::MAGE::DesignElement::Feature>.

Return value: the current value of the feature association : an instance of type C<Bio::MAGE::DesignElement::Feature>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::DesignElement::Feature>

=cut

sub setFeature {
  my $self = shift;
  croak(__PACKAGE__ . "::setFeature: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setFeature: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setFeature: wrong type: " . ref($val) . " expected Bio::MAGE::DesignElement::Feature") unless UNIVERSAL::isa($val,'Bio::MAGE::DesignElement::Feature');
  return $self->{__FEATURE} = $val;
}



=item $val = $manufacturelims->getFeature()

The restricted getter method for the feature association.

Input parameters: none

Return value: the current value of the feature association : an instance of type C<Bio::MAGE::DesignElement::Feature>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getFeature {
  my $self = shift;
  croak(__PACKAGE__ . "::getFeature: arguments passed to getter")
    if @_;
  return $self->{__FEATURE};
}




=back


=item identifierLIMS


From the MAGE-OM documentation for the C<identifierLIMS> association:

Association to a LIMS data source for further information on the manufacturing process.



=over


=item $val = $manufacturelims->setIdentifierLIMS($val)

The restricted setter method for the identifierLIMS association.

Input parameters: the value to which the identifierLIMS association will be set : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Return value: the current value of the identifierLIMS association : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Description::DatabaseEntry>

=cut

sub setIdentifierLIMS {
  my $self = shift;
  croak(__PACKAGE__ . "::setIdentifierLIMS: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setIdentifierLIMS: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setIdentifierLIMS: wrong type: " . ref($val) . " expected Bio::MAGE::Description::DatabaseEntry") unless UNIVERSAL::isa($val,'Bio::MAGE::Description::DatabaseEntry');
  return $self->{__IDENTIFIERLIMS} = $val;
}



=item $val = $manufacturelims->getIdentifierLIMS()

The restricted getter method for the identifierLIMS association.

Input parameters: none

Return value: the current value of the identifierLIMS association : an instance of type C<Bio::MAGE::Description::DatabaseEntry>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getIdentifierLIMS {
  my $self = shift;
  croak(__PACKAGE__ . "::getIdentifierLIMS: arguments passed to getter")
    if @_;
  return $self->{__IDENTIFIERLIMS};
}




=back


=item bioMaterial


From the MAGE-OM documentation for the C<bioMaterial> association:

The BioMaterial used for the feature.



=over


=item $val = $manufacturelims->setBioMaterial($val)

The restricted setter method for the bioMaterial association.

Input parameters: the value to which the bioMaterial association will be set : an instance of type C<Bio::MAGE::BioMaterial::BioMaterial>.

Return value: the current value of the bioMaterial association : an instance of type C<Bio::MAGE::BioMaterial::BioMaterial>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::BioMaterial::BioMaterial>

=cut

sub setBioMaterial {
  my $self = shift;
  croak(__PACKAGE__ . "::setBioMaterial: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setBioMaterial: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setBioMaterial: wrong type: " . ref($val) . " expected Bio::MAGE::BioMaterial::BioMaterial") unless UNIVERSAL::isa($val,'Bio::MAGE::BioMaterial::BioMaterial');
  return $self->{__BIOMATERIAL} = $val;
}



=item $val = $manufacturelims->getBioMaterial()

The restricted getter method for the bioMaterial association.

Input parameters: none

Return value: the current value of the bioMaterial association : an instance of type C<Bio::MAGE::BioMaterial::BioMaterial>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getBioMaterial {
  my $self = shift;
  croak(__PACKAGE__ . "::getBioMaterial: arguments passed to getter")
    if @_;
  return $self->{__BIOMATERIAL};
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

