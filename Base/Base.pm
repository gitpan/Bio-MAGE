##############################
#
# Bio::MAGE::Base
#
##############################
package Bio::MAGE::Base;

use strict;
use Carp;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter);
$VERSION = q[$Id: Base.pm,v 1.3 2002/06/17 21:11:35 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Base

=head2 SYNOPSIS

  use Bio::MAGE::Base;

    # creating an empty instance
  my $array = Bio::MAGE::Base->new();

=head2 DESCRIPTION

The base-class for all other Bio::MAGE classes

=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Base->methodname() syntax.


=item new()

=cut

sub new {
  my $class = shift;
  my $obj;
  if (ref($class)) {
    # copy an existing object
    $obj = $class;
    $class = ref($class);
  }
  my $self = bless {}, $class;
  if (defined $obj) {
    $self->set_slots([$obj->get_slot_names],
                     [$obj->get_slots($obj->get_slot_names)],
                    );
  } else {
    $self->set_slots(@_) if @_;
  }
  my $rc = $self->initialize;
  return undef if $rc == -1;
  return $self;
}


=item $obj->set_slots(%parameters)

=item $obj->set_slots(\@name_list, \@value_list)

The C<set_slots()> method is used to set a number of slots at the same
time. It has two different invocation methods. The first takes a named
parameter list, and the second takes two array references.

B<Return value>: none

B<Side effects>: will call C<croak()> if a slot_name is used that the class
does not define.

=cut

sub set_slots {
  my $self = shift;
  my %slots;
  if (ref($_[0])) {
    my @slot_names = @{shift()};
    my @slot_values = @{shift()};
    @slots{@slot_names} = @slot_values;
  } else {
    %slots = @_;
  }
  while (my ($slot_name,$slot_val) = each %slots) {
    $self->set_slot($slot_name,$slot_val);
  }
}


=item $obj->get_slots(@name_list)

The C<get_slots()> method is used to get the values of a number of
slots at the same time.

B<Return value>: a list of instance objects

B<Side effects>: none

=cut

sub get_slots {
  my ($self, @slot_names) = @_;
  my @return;
  foreach my $slot (@slot_names) {
    push(@return,$self->get_slot($slot));
  }
  return @return;
}


=item $val = $obj->set_slot($name,$val)

The C<set_slot()> method sets the slot C<$name> to the value C<$val>

B<Return value>: the new value of the slot, i.e. C<$val>

B<Side effects>: none

=cut

sub set_slot {
  my ($self, $slot_name, $slot_val) = @_;
  my $method = 'set' . ucfirst($slot_name);
  unless ($self->can($method)) {
    unless ($self->can($slot_name)) {
      croak(__PACKAGE__ . "::set_slot: slot $slot_name doesn't exist");
    }
    # this is a class slot, not an attribute or association. They still
    # use the confusing polymorphic setter/getter methods.
    $method = $slot_name;
  }
  {
    no strict 'refs';
    # invoke the setter directly to gain type checking
    return $self->$method($slot_val);
  }
}


=item $val = $obj->get_slot($name)

The C<get_slot()> method is used to get the values of a number of
slots at the same time.

B<Return value>: a single slot value, or undef if the slot has not been
initialized.

B<Side effects>: none

=cut

sub get_slot {
  my ($self, $slot_name) = @_;
  my $method = 'get' . ucfirst($slot_name);
  unless ($self->can($method)) {
    unless ($self->can($slot_name)) {
      croak(__PACKAGE__ . "::get_slot: slot $slot_name doesn't exist");
    }
    # this is a class slot, not an attribute or association. They still
    # use the confusing polymorphic setter/getter methods.
    $method = $slot_name;
  }
  {
    no strict 'refs';
    # invoke the getter directly
    return $self->$method();
  }
}


=item @names = $obj->get_slot_names()

The C<get_slot_names()> method is used to retrieve the name of all
slots defined for a given object.

B<Return value>: a single slot value, or undef if the slot has not been
initialized.

B<Side effects>: none

=cut

sub get_slot_names {
  my ($self) = @_;
  return $self->{__SLOT_NAMES};
}


sub initialize {
  return 1;
}

=head1 IMPLEMENTATION DETAILS

This class is hand-written

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

