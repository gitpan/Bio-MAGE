##############################
#
# Bio::MAGE::AuditAndSecurity
#
##############################
package Bio::MAGE::AuditAndSecurity;

use strict;
use Carp;
use Bio::MAGE::Base;
require Exporter;
use Tie::IxHash;

use Bio::MAGE::AuditAndSecurity::Person;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Organization;
use Bio::MAGE::AuditAndSecurity::SecurityGroup;
use Bio::MAGE::AuditAndSecurity::Contact;


use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS $__MAGEML_LISTS);

@ISA = qw(Bio::MAGE::Base Exporter);
$VERSION = q[$Id: AuditAndSecurity.pm,v 1.8 2002/10/13 21:56:03 jason_e_stewart Exp $];

sub initialize {
  my $self = shift;
  $self->contact_list([]);
  $self->securitygroup_list([]);
  $self->security_list([]);

  $self->mageml_lists([Contact=>$self->contact_list,
	SecurityGroup=>$self->securitygroup_list,
	Security=>$self->security_list]);
  $self->tagname(q[AuditAndSecurity_package]);
  return 1;
}



=head1 NAME

Bio::MAGE::AuditAndSecurity - Container module for classes in the MAGE AuditAndSecurity package 

=head1 SYNOPSIS

  use Bio::MAGE::AuditAndSecurity;

=head1 DESCRIPTION

This is a I<package> module that encapsulates a number of classes in
the Bio::MAGE hierarchy. These classes belong to the
AuditAndSecurity package of the MAGE-OM object model.

=head1 CLASSES

The Bio::MAGE::AuditAndSecurity module contains the following
Bio::MAGE classes:

=over


=item * Person


=item * Security


=item * Audit


=item * Organization


=item * SecurityGroup


=item * Contact


=back



=head1 CLASS METHODS

=over

=item @class_list = Bio::MAGE::AuditAndSecurity::classes();

This method returns a list of non-fully qualified class names
(i.e. they do not have 'Bio::MAGE::' as a prefix) in this package.

=cut

sub classes {
  return ('Person', 'Security', 'Audit', 'Organization', 'SecurityGroup', 'Contact');
}

=item $obj_ref = Bio::MAGE::AuditAndSecurity->new(%parameters)

=item $obj_ref_copy = $obj_ref->new()

The C<new()> method is the class constructor. If invoked with an
existing object instance, it is a copy constructor.

B<Return value>: It returns a reference to an object of class
C<Bio::MAGE::AuditAndSecurity>.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut





=back

=head1 INSTANCE METHODS

=over

=cut

=item $array_ref = $auditandsecurity->getContact_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x1048b758)::Contact> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getContact_list {
  my $self = shift;
  return $self->contact_list();
}

=item $array_ref = $auditandsecurity->getSecurityGroup_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x1048b758)::SecurityGroup> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getSecurityGroup_list {
  my $self = shift;
  return $self->securitygroup_list();
}

=item $array_ref = $auditandsecurity->getSecurity_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x1048b758)::Security> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getSecurity_list {
  my $self = shift;
  return $self->security_list();
}



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




=item $val = $auditandsecurity->contact_list()

=item $val = $auditandsecurity->contact_list($val)

This is the unified setter/getter method for the contact_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the contact_list
slot

Side effects: none

Exceptions: none

=cut

sub contact_list {
  my $self = shift;
  if (@_) {
    $self->{__CONTACT_LIST} = shift;
  }
  return $self->{__CONTACT_LIST};
}

=item $val = $auditandsecurity->securitygroup_list()

=item $val = $auditandsecurity->securitygroup_list($val)

This is the unified setter/getter method for the securitygroup_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the securitygroup_list
slot

Side effects: none

Exceptions: none

=cut

sub securitygroup_list {
  my $self = shift;
  if (@_) {
    $self->{__SECURITYGROUP_LIST} = shift;
  }
  return $self->{__SECURITYGROUP_LIST};
}

=item $val = $auditandsecurity->security_list()

=item $val = $auditandsecurity->security_list($val)

This is the unified setter/getter method for the security_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the security_list
slot

Side effects: none

Exceptions: none

=cut

sub security_list {
  my $self = shift;
  if (@_) {
    $self->{__SECURITY_LIST} = shift;
  }
  return $self->{__SECURITY_LIST};
}

=item $val = $auditandsecurity->mageml_lists()

=item $val = $auditandsecurity->mageml_lists($val)

This is the unified setter/getter method for the mageml_lists slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the mageml_lists
slot

Side effects: none

Exceptions: none

=cut

sub mageml_lists {
  my $self = shift;
  if (@_) {
    $self->{__MAGEML_LISTS} = shift;
  }
  return $self->{__MAGEML_LISTS};
}

=item $val = $auditandsecurity->tagname()

=item $val = $auditandsecurity->tagname($val)

This is the unified setter/getter method for the tagname slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the tagname
slot

Side effects: none

Exceptions: none

=cut

sub tagname {
  my $self = shift;
  if (@_) {
    $self->{__TAGNAME} = shift;
  }
  return $self->{__TAGNAME};
}




=back

=cut

sub register {
  my ($self,$obj) = @_;

  # should we have the identifier checking code here??
  my %mageml_lists = @{$self->mageml_lists()};
  my $list_ref;
  foreach my $class (keys %mageml_lists) {
    if ($obj->isa("Bio::MAGE::AuditAndSecurity::$class")) {
      $list_ref = $mageml_lists{$class};
      last;
    }
  }
  return unless defined $list_ref;
  push(@{$list_ref}, $obj);
}

sub obj2mageml {
  my ($self,$writer) = @_;

  my $empty = 0;
  my $tag = $self->tagname();
  $writer->write_start_tag($tag,$empty);

  # we use IxHash because we need to preserve insertion order
  tie my %list_hash, 'Tie::IxHash', @{$self->mageml_lists()};
  foreach my $list_name (keys %list_hash) {
    if (scalar @{$list_hash{$list_name}}) {
      my $tag = $list_name . '_assnlist';
      $writer->write_start_tag($tag,$empty);
      foreach my $obj (@{$list_hash{$list_name}}) {
	# this may seem a little odd, but the writer knows how to write out 
	# the objects. Create a subclass of $OPTIONS{namespace}::XMLWriter to 
	# modify the output of the obj2mageml process
	$writer->obj2mageml($obj);
      }
      $writer->write_end_tag($tag);
    }
  }

  # and we're done
  $writer->write_end_tag($tag);

}


###############################################################################
# obj2database
###############################################################################
sub obj2database {
  my ($self,$writer) = @_;

  my $empty = 0;
  my $tag = $self->tagname();
  #$writer->write_start_tag($tag,$empty);

  # we use IxHash because we need to preserve insertion order
  tie my %list_hash, 'Tie::IxHash', @{$self->mageml_lists()};
  foreach my $list_name (keys %list_hash) {
    if (scalar @{$list_hash{$list_name}}) {
      my $tag = $list_name . '_assnlist';
      #$writer->write_start_tag($tag,$empty);
      foreach my $obj (@{$list_hash{$list_name}}) {
	# this may seem a little odd, but the writer knows how to write out
	# the objects. Create a subclass of Bio::MAGE::XMLWriter to
	# modify the output of the obj2mageml process
	$writer->obj2database($obj);
      }
      #$writer->write_end_tag($tag);
    }
  }

  # and we're done
  #$writer->write_end_tag($tag);

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

