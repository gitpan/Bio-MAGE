##############################
#
# Bio::MAGE::Association
#
##############################
package Bio::MAGE::Association;

use strict;
use Carp;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter);
$VERSION = q[$Id: Association.pm,v 1.1.1.1 2002/05/23 22:27:10 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Association

=head2 SYNOPSIS

  use Bio::MAGE::Association;

    # creating an empty instance
  my $association = Bio::MAGE::Association->new();

    # setting and retrieving object attributes
  my $name = $association->name();
  $association->name($value);

  my $is_ref = $association->is_ref();
  $association->is_ref($value);

  my $cardinality = $association->cardinality();
  $association->cardinality($value);

  my $class_name = $association->class_name();
  $association->class_name($value);

  my $description = $association->description();
  $association->description($value);


=head2 DESCRIPTION

=cut

sub new {
  my $class = shift;
  my $self = bless {}, $class;
  if (scalar @_) {
    my %args = @_;
    foreach my $key (keys %args) {
      no strict 'refs';
      $self->$key($args{$key});
    }
  }
  return $self;
}

sub cardinality {
  my $self = shift;
  if (scalar @_) {
    $self->{__CARDINALITY} = shift;
  }
  return $self->{__CARDINALITY};
}

sub rank {
  my $self = shift;
  if (scalar @_) {
    $self->{__RANK} = shift;
  }
  return $self->{__RANK};
}

sub ordered {
  my $self = shift;
  if (scalar @_) {
    $self->{__ORDERED} = shift;
  }
  return $self->{__ORDERED};
}

sub is_ref {
  my $self = shift;
  if (scalar @_) {
    $self->{__IS_REF} = shift;
  }
  return $self->{__IS_REF};
}

sub name {
  my $self = shift;
  if (scalar @_) {
    $self->{__NAME} = shift;
  }
  return $self->{__NAME};
}

sub class_name {
  my $self = shift;
  if (scalar @_) {
    $self->{__CLASS_NAME} = shift;
  }
  return $self->{__CLASS_NAME};
}

sub description {
  my $self = shift;
  if (scalar @_) {
    $self->{__DESCRIPTION} = shift;
  }
  return $self->{__DESCRIPTION};
}

1;
