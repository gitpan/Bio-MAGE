##############################
#
# Bio::MAGE::Description::ExternalReference
#
##############################
package Bio::MAGE::Description::ExternalReference;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Extendable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Extendable Exporter);
$VERSION = q[$Id: ExternalReference.pm,v 1.4 2002/08/24 16:12:19 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Description::ExternalReference

=head2 SYNOPSIS

  use Bio::MAGE::Description::ExternalReference;

    # creating an empty instance
  my $externalreference = Bio::MAGE::Description::ExternalReference->new();

    # creating an already populated instance
  my $externalreference = Bio::MAGE::Description::ExternalReference->new(exportedFromDB=>$exportedFromDB_value,
			exportName=>$exportName_value,
			exportID=>$exportID_value,
			exportedFromServer=>$exportedFromServer_value);

    # setting and retrieving object attributes
  my $exportedFromDB_val = $externalreference->exportedFromDB();
  $externalreference->exportedFromDB($value);

  my $exportName_val = $externalreference->exportName();
  $externalreference->exportName($value);

  my $exportID_val = $externalreference->exportID();
  $externalreference->exportID($value);

  my $exportedFromServer_val = $externalreference->exportedFromServer();
  $externalreference->exportedFromServer($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<ExternalReference> class:

A reference to the originating source for the object.



=cut


=head2 INHERITANCE


Bio::MAGE::Description::ExternalReference has the following super classes

=over 


=item * Bio::MAGE::Extendable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Description::ExternalReference->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * exportedFromDB

Sets the value of the exportedFromDB attribute (from C<Bio::MAGE::Description::ExternalReference>).


=item * exportName

Sets the value of the exportName attribute (from C<Bio::MAGE::Description::ExternalReference>).


=item * exportID

Sets the value of the exportID attribute (from C<Bio::MAGE::Description::ExternalReference>).


=item * exportedFromServer

Sets the value of the exportedFromServer attribute (from C<Bio::MAGE::Description::ExternalReference>).


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

Returns the full class name for this class, Bio::MAGE::Description::ExternalReference.

=cut

sub class_name {
  return q[Bio::MAGE::Description::ExternalReference];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Description::ExternalReference.

=cut

sub package {
  return q[Description];
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
  my @list = ('Bio::MAGE::Extendable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ('exportedFromDB', 'exportName', 'exportID', 'exportedFromServer');
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

Bio::MAGE::Description::ExternalReference: has the following attribute accessor methods:

=over


=item exportedFromDB

From the MAGE-OM documentation for the C<exportedFromDB> attribute:

Name of the database, if applicable, that the object was exported from.



=over


=item $val = $externalreference->setExportedFromDB($val)

The restricted setter method for the exportedFromDB attribute.

Input parameters: the value to which the exportedFromDB attribute will be set 

Return value: the current value of the exportedFromDB attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setExportedFromDB {
  my $self = shift;
  croak(__PACKAGE__ . "::setExportedFromDB: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExportedFromDB: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__EXPORTEDFROMDB} = $val;
}



=item $val = $externalreference->getExportedFromDB()

The restricted getter method for the exportedFromDB attribute.

Input parameters: none

Return value: the current value of the exportedFromDB attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExportedFromDB {
  my $self = shift;
  croak(__PACKAGE__ . "::getExportedFromDB: arguments passed to getter")
    if @_;
  return $self->{__EXPORTEDFROMDB};
}




=back


=item exportName

From the MAGE-OM documentation for the C<exportName> attribute:

The name of the object at the originating source.



=over


=item $val = $externalreference->setExportName($val)

The restricted setter method for the exportName attribute.

Input parameters: the value to which the exportName attribute will be set 

Return value: the current value of the exportName attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setExportName {
  my $self = shift;
  croak(__PACKAGE__ . "::setExportName: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExportName: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__EXPORTNAME} = $val;
}



=item $val = $externalreference->getExportName()

The restricted getter method for the exportName attribute.

Input parameters: none

Return value: the current value of the exportName attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExportName {
  my $self = shift;
  croak(__PACKAGE__ . "::getExportName: arguments passed to getter")
    if @_;
  return $self->{__EXPORTNAME};
}




=back


=item exportID

From the MAGE-OM documentation for the C<exportID> attribute:

The identifier of the object at the originating source.



=over


=item $val = $externalreference->setExportID($val)

The restricted setter method for the exportID attribute.

Input parameters: the value to which the exportID attribute will be set 

Return value: the current value of the exportID attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setExportID {
  my $self = shift;
  croak(__PACKAGE__ . "::setExportID: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExportID: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__EXPORTID} = $val;
}



=item $val = $externalreference->getExportID()

The restricted getter method for the exportID attribute.

Input parameters: none

Return value: the current value of the exportID attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExportID {
  my $self = shift;
  croak(__PACKAGE__ . "::getExportID: arguments passed to getter")
    if @_;
  return $self->{__EXPORTID};
}




=back


=item exportedFromServer

From the MAGE-OM documentation for the C<exportedFromServer> attribute:

The originating server for the object, a network address or common name.



=over


=item $val = $externalreference->setExportedFromServer($val)

The restricted setter method for the exportedFromServer attribute.

Input parameters: the value to which the exportedFromServer attribute will be set 

Return value: the current value of the exportedFromServer attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut

sub setExportedFromServer {
  my $self = shift;
  croak(__PACKAGE__ . "::setExportedFromServer: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExportedFromServer: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  
  return $self->{__EXPORTEDFROMSERVER} = $val;
}



=item $val = $externalreference->getExportedFromServer()

The restricted getter method for the exportedFromServer attribute.

Input parameters: none

Return value: the current value of the exportedFromServer attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExportedFromServer {
  my $self = shift;
  croak(__PACKAGE__ . "::getExportedFromServer: arguments passed to getter")
    if @_;
  return $self->{__EXPORTEDFROMSERVER};
}




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

