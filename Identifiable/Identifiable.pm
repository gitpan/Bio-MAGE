##############################
#
# Bio::MAGE::Identifiable
#
##############################
package Bio::MAGE::Identifiable;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Describable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Describable Exporter);
$VERSION = q[$Id: Identifiable.pm,v 1.5 2002/08/24 16:12:21 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Identifiable

=head2 SYNOPSIS

  use Bio::MAGE::Identifiable;

    # creating an empty instance
  my $identifiable = Bio::MAGE::Identifiable->new();

    # creating an already populated instance
  my $identifiable = Bio::MAGE::Identifiable->new(identifier=>$identifier_value,
			name=>$name_value);

    # setting and retrieving object attributes
  my $identifier_val = $identifiable->identifier();
  $identifiable->identifier($value);

  my $name_val = $identifiable->name();
  $identifiable->name($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Identifiable> class:

An Identifiable class is one that has an unambiguous reference within the scope.  It also has a potentially ambiguous name.



=cut


=head2 INHERITANCE


Bio::MAGE::Identifiable has the following super classes

=over 


=item * Bio::MAGE::Describable


=back


Bio::MAGE::Identifiable has the following subclasses

=over 


=item * Bio::MAGE::BioMaterial::Compound


=item * Bio::MAGE::BioEvent::BioEvent


=item * Bio::MAGE::ArrayDesign::DesignElementGroup


=item * Bio::MAGE::QuantitationType::QuantitationType


=item * Bio::MAGE::ArrayDesign::Zone


=item * Bio::MAGE::BioAssayData::BioAssayDimension


=item * Bio::MAGE::BioAssayData::QuantitationTypeDimension


=item * Bio::MAGE::ArrayDesign::ArrayDesign


=item * Bio::MAGE::AuditAndSecurity::Contact


=item * Bio::MAGE::Experiment::FactorValue


=item * Bio::MAGE::BioAssayData::BioAssayData


=item * Bio::MAGE::Array::ArrayManufacture


=item * Bio::MAGE::DesignElement::DesignElement


=item * Bio::MAGE::BioAssayData::DesignElementDimension


=item * Bio::MAGE::Description::Database


=item * Bio::MAGE::Experiment::Experiment


=item * Bio::MAGE::Array::ArrayGroup


=item * Bio::MAGE::AuditAndSecurity::Security


=item * Bio::MAGE::BioAssay::Channel


=item * Bio::MAGE::Protocol::Parameterizable


=item * Bio::MAGE::AuditAndSecurity::SecurityGroup


=item * Bio::MAGE::Array::Array


=item * Bio::MAGE::BioAssay::Image


=item * Bio::MAGE::Protocol::Parameter


=item * Bio::MAGE::BioAssay::BioAssay


=item * Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster


=item * Bio::MAGE::Experiment::ExperimentalFactor


=item * Bio::MAGE::BioSequence::BioSequence


=item * Bio::MAGE::BioMaterial::BioMaterial


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Identifiable->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


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

Returns the full class name for this class, Bio::MAGE::Identifiable.

=cut

sub class_name {
  return q[Bio::MAGE::Identifiable];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Identifiable.

=cut

sub package {
  return q[MAGE];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ('Bio::MAGE::BioMaterial::Compound', 'Bio::MAGE::BioEvent::BioEvent', 'Bio::MAGE::ArrayDesign::DesignElementGroup', 'Bio::MAGE::QuantitationType::QuantitationType', 'Bio::MAGE::ArrayDesign::Zone', 'Bio::MAGE::BioAssayData::BioAssayDimension', 'Bio::MAGE::BioAssayData::QuantitationTypeDimension', 'Bio::MAGE::ArrayDesign::ArrayDesign', 'Bio::MAGE::AuditAndSecurity::Contact', 'Bio::MAGE::Experiment::FactorValue', 'Bio::MAGE::BioAssayData::BioAssayData', 'Bio::MAGE::Array::ArrayManufacture', 'Bio::MAGE::DesignElement::DesignElement', 'Bio::MAGE::BioAssayData::DesignElementDimension', 'Bio::MAGE::Description::Database', 'Bio::MAGE::Experiment::Experiment', 'Bio::MAGE::Array::ArrayGroup', 'Bio::MAGE::AuditAndSecurity::Security', 'Bio::MAGE::BioAssay::Channel', 'Bio::MAGE::Protocol::Parameterizable', 'Bio::MAGE::AuditAndSecurity::SecurityGroup', 'Bio::MAGE::Array::Array', 'Bio::MAGE::BioAssay::Image', 'Bio::MAGE::Protocol::Parameter', 'Bio::MAGE::BioAssay::BioAssay', 'Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster', 'Bio::MAGE::Experiment::ExperimentalFactor', 'Bio::MAGE::BioSequence::BioSequence', 'Bio::MAGE::BioMaterial::BioMaterial');
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
  my @list = ('identifier', 'name');
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
  my @list = ();
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

Bio::MAGE::Identifiable: has the following attribute accessor methods:

=over


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

sub setIdentifier {
  my $self = shift;
  croak(__PACKAGE__ . "::setIdentifier: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setIdentifier: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__IDENTIFIER} = $val;
}



=item $val = $identifiable->getIdentifier()

The restricted getter method for the identifier attribute.

Input parameters: none

Return value: the current value of the identifier attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getIdentifier {
  my $self = shift;
  croak(__PACKAGE__ . "::getIdentifier: arguments passed to getter")
    if @_;
  return $self->{__IDENTIFIER};
}




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

sub setName {
  my $self = shift;
  croak(__PACKAGE__ . "::setName: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setName: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__NAME} = $val;
}



=item $val = $identifiable->getName()

The restricted getter method for the name attribute.

Input parameters: none

Return value: the current value of the name attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getName {
  my $self = shift;
  croak(__PACKAGE__ . "::getName: arguments passed to getter")
    if @_;
  return $self->{__NAME};
}




=back



=back


=cut



sub initialize {
  carp "Bio::MAGE::Identifiable::initialize: abstract base classes should not be instantiated";
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

