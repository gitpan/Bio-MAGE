##############################
#
# Bio::MAGE::DesignElement
#
##############################
package Bio::MAGE::DesignElement;

use strict;
use Carp;
use Bio::MAGE::Base;
require Exporter;
use Tie::IxHash;

use Bio::MAGE::DesignElement::DesignElement;
use Bio::MAGE::DesignElement::Position;
use Bio::MAGE::DesignElement::Reporter;
use Bio::MAGE::DesignElement::ReporterPosition;
use Bio::MAGE::DesignElement::CompositePosition;
use Bio::MAGE::DesignElement::CompositeSequence;
use Bio::MAGE::DesignElement::Feature;
use Bio::MAGE::DesignElement::MismatchInformation;
use Bio::MAGE::DesignElement::FeatureInformation;
use Bio::MAGE::DesignElement::CompositeCompositeMap;
use Bio::MAGE::DesignElement::FeatureReporterMap;
use Bio::MAGE::DesignElement::ReporterCompositeMap;
use Bio::MAGE::DesignElement::FeatureLocation;


use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS $__MAGEML_LISTS);

@ISA = qw(Bio::MAGE::Base Exporter);
$VERSION = q[$Id: DesignElement.pm,v 1.8 2002/10/13 21:56:06 jason_e_stewart Exp $];

sub initialize {
  my $self = shift;
  $self->compositesequence_list([]);
  $self->reporter_list([]);
  $self->compositecompositemap_list([]);
  $self->reportercompositemap_list([]);
  $self->featurereportermap_list([]);

  $self->mageml_lists([CompositeSequence=>$self->compositesequence_list,
	Reporter=>$self->reporter_list,
	CompositeCompositeMap=>$self->compositecompositemap_list,
	ReporterCompositeMap=>$self->reportercompositemap_list,
	FeatureReporterMap=>$self->featurereportermap_list]);
  $self->tagname(q[DesignElement_package]);
  return 1;
}



=head1 NAME

Bio::MAGE::DesignElement - Container module for classes in the MAGE DesignElement package 

=head1 SYNOPSIS

  use Bio::MAGE::DesignElement;

=head1 DESCRIPTION

This is a I<package> module that encapsulates a number of classes in
the Bio::MAGE hierarchy. These classes belong to the
DesignElement package of the MAGE-OM object model.

=head1 CLASSES

The Bio::MAGE::DesignElement module contains the following
Bio::MAGE classes:

=over


=item * DesignElement


=item * Position


=item * Reporter


=item * ReporterPosition


=item * CompositePosition


=item * CompositeSequence


=item * Feature


=item * MismatchInformation


=item * FeatureInformation


=item * CompositeCompositeMap


=item * FeatureReporterMap


=item * ReporterCompositeMap


=item * FeatureLocation


=back



=head1 CLASS METHODS

=over

=item @class_list = Bio::MAGE::DesignElement::classes();

This method returns a list of non-fully qualified class names
(i.e. they do not have 'Bio::MAGE::' as a prefix) in this package.

=cut

sub classes {
  return ('DesignElement', 'Position', 'Reporter', 'ReporterPosition', 'CompositePosition', 'CompositeSequence', 'Feature', 'MismatchInformation', 'FeatureInformation', 'CompositeCompositeMap', 'FeatureReporterMap', 'ReporterCompositeMap', 'FeatureLocation');
}

=item $obj_ref = Bio::MAGE::DesignElement->new(%parameters)

=item $obj_ref_copy = $obj_ref->new()

The C<new()> method is the class constructor. If invoked with an
existing object instance, it is a copy constructor.

B<Return value>: It returns a reference to an object of class
C<Bio::MAGE::DesignElement>.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut





=back

=head1 INSTANCE METHODS

=over

=cut

=item $array_ref = $designelement->getCompositeSequence_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x10495518)::CompositeSequence> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getCompositeSequence_list {
  my $self = shift;
  return $self->compositesequence_list();
}

=item $array_ref = $designelement->getReporter_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x10495518)::Reporter> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getReporter_list {
  my $self = shift;
  return $self->reporter_list();
}

=item $array_ref = $designelement->getCompositeCompositeMap_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x10495518)::CompositeCompositeMap> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getCompositeCompositeMap_list {
  my $self = shift;
  return $self->compositecompositemap_list();
}

=item $array_ref = $designelement->getReporterCompositeMap_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x10495518)::ReporterCompositeMap> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getReporterCompositeMap_list {
  my $self = shift;
  return $self->reportercompositemap_list();
}

=item $array_ref = $designelement->getFeatureReporterMap_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x10495518)::FeatureReporterMap> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getFeatureReporterMap_list {
  my $self = shift;
  return $self->featurereportermap_list();
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




=item $val = $designelement->compositesequence_list()

=item $val = $designelement->compositesequence_list($val)

This is the unified setter/getter method for the compositesequence_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the compositesequence_list
slot

Side effects: none

Exceptions: none

=cut

sub compositesequence_list {
  my $self = shift;
  if (@_) {
    $self->{__COMPOSITESEQUENCE_LIST} = shift;
  }
  return $self->{__COMPOSITESEQUENCE_LIST};
}

=item $val = $designelement->reporter_list()

=item $val = $designelement->reporter_list($val)

This is the unified setter/getter method for the reporter_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the reporter_list
slot

Side effects: none

Exceptions: none

=cut

sub reporter_list {
  my $self = shift;
  if (@_) {
    $self->{__REPORTER_LIST} = shift;
  }
  return $self->{__REPORTER_LIST};
}

=item $val = $designelement->compositecompositemap_list()

=item $val = $designelement->compositecompositemap_list($val)

This is the unified setter/getter method for the compositecompositemap_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the compositecompositemap_list
slot

Side effects: none

Exceptions: none

=cut

sub compositecompositemap_list {
  my $self = shift;
  if (@_) {
    $self->{__COMPOSITECOMPOSITEMAP_LIST} = shift;
  }
  return $self->{__COMPOSITECOMPOSITEMAP_LIST};
}

=item $val = $designelement->reportercompositemap_list()

=item $val = $designelement->reportercompositemap_list($val)

This is the unified setter/getter method for the reportercompositemap_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the reportercompositemap_list
slot

Side effects: none

Exceptions: none

=cut

sub reportercompositemap_list {
  my $self = shift;
  if (@_) {
    $self->{__REPORTERCOMPOSITEMAP_LIST} = shift;
  }
  return $self->{__REPORTERCOMPOSITEMAP_LIST};
}

=item $val = $designelement->featurereportermap_list()

=item $val = $designelement->featurereportermap_list($val)

This is the unified setter/getter method for the featurereportermap_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the featurereportermap_list
slot

Side effects: none

Exceptions: none

=cut

sub featurereportermap_list {
  my $self = shift;
  if (@_) {
    $self->{__FEATUREREPORTERMAP_LIST} = shift;
  }
  return $self->{__FEATUREREPORTERMAP_LIST};
}

=item $val = $designelement->mageml_lists()

=item $val = $designelement->mageml_lists($val)

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

=item $val = $designelement->tagname()

=item $val = $designelement->tagname($val)

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
    if ($obj->isa("Bio::MAGE::DesignElement::$class")) {
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

