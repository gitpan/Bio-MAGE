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
$VERSION = q[$Id: Association.pm,v 1.1 2002/12/10 06:20:46 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Association

=head2 SYNOPSIS

  use Bio::MAGE::Association;

  # creating an empty instance
  my $association = Bio::MAGE::Association->new();

  # populating the instance in the constructor
  my $association = Bio::MAGE::Association->new(self=>$val1,other=>$val2);

  # setting and retrieving object attributes
  my $self = $association->self();
  $association->self($value);

  my $other = $association->other();
  $association->other($value);

=head2 DESCRIPTION

This class holds the two association ends for each UML
association. C<self> is the end nearest the class of interest, while
C<other> is the end furthest away. The ends are of type
C<Bio::MAGE::Association::End>.

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

sub self {
  my $self = shift;
  if (scalar @_) {
    $self->{__SELF} = shift;
  }
  return $self->{__SELF};
}

sub other {
  my $self = shift;
  if (scalar @_) {
    $self->{__OTHER} = shift;
  }
  return $self->{__OTHER};
}

##############################
#
# Bio::MAGE::Association::End
#
##############################
package Bio::MAGE::Association::End;

use strict;
use Carp;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter);
$VERSION = q[$Id: Association.pm,v 1.1 2002/12/10 06:20:46 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Association::End

=head2 SYNOPSIS

  use Bio::MAGE::Association::End;

  # creating an empty instance
  my $association = Bio::MAGE::Association::End->new();

  # populating the instance in the constructor
  my $association = Bio::MAGE::Association->new(name=>$val1,
						is_ref=>$val2,
						cardinality=>$val3,
						class_name=>$val4,
						documentation=>$val5,
						rank=>$val6,
						ordered=>$val7,
					       );

  # setting and retrieving object attributes
  my $name = $association->name();
  $association->name($value);

  my $is_ref = $association->is_ref();
  $association->is_ref($value);

  my $cardinality = $association->cardinality();
  $association->cardinality($value);

  my $class_name = $association->class_name();
  $association->class_name($value);

  my $documentation = $association->documentation();
  $association->documentation($value);

  my $rank = $association->rank();
  $association->rank($value);

  my $ordered = $association->ordered();
  $association->ordered($value);


=head2 DESCRIPTION

This class stores the information in a single UML association end.

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

sub documentation {
  my $self = shift;
  if (scalar @_) {
    $self->{__DOCUMENTATION} = shift;
  }
  return $self->{__DOCUMENTATION};
}

1;

