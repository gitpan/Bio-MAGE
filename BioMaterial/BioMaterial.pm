##############################
#
# Bio::MAGE::BioMaterial
#
##############################
package Bio::MAGE::BioMaterial;

use strict;
use Carp;
use Bio::MAGE::Base;
require Exporter;
use Tie::IxHash;

use Bio::MAGE::BioMaterial::BioSource;
use Bio::MAGE::BioMaterial::BioMaterial;
use Bio::MAGE::BioMaterial::LabeledExtract;
use Bio::MAGE::BioMaterial::BioSample;
use Bio::MAGE::BioMaterial::Compound;
use Bio::MAGE::BioMaterial::CompoundMeasurement;
use Bio::MAGE::BioMaterial::BioMaterialMeasurement;
use Bio::MAGE::BioMaterial::Treatment;


use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS $__MAGEML_LISTS);

@ISA = qw(Bio::MAGE::Base Exporter);
$VERSION = q[$Id: BioMaterial.pm,v 1.8 2002/10/13 21:56:04 jason_e_stewart Exp $];

sub initialize {
  my $self = shift;
  $self->compound_list([]);
  $self->biomaterial_list([]);

  $self->mageml_lists([Compound=>$self->compound_list,
	BioMaterial=>$self->biomaterial_list]);
  $self->tagname(q[BioMaterial_package]);
  return 1;
}



=head1 NAME

Bio::MAGE::BioMaterial - Container module for classes in the MAGE BioMaterial package 

=head1 SYNOPSIS

  use Bio::MAGE::BioMaterial;

=head1 DESCRIPTION

This is a I<package> module that encapsulates a number of classes in
the Bio::MAGE hierarchy. These classes belong to the
BioMaterial package of the MAGE-OM object model.

=head1 CLASSES

The Bio::MAGE::BioMaterial module contains the following
Bio::MAGE classes:

=over


=item * BioSource


=item * BioMaterial


=item * LabeledExtract


=item * BioSample


=item * Compound


=item * CompoundMeasurement


=item * BioMaterialMeasurement


=item * Treatment


=back



=head1 CLASS METHODS

=over

=item @class_list = Bio::MAGE::BioMaterial::classes();

This method returns a list of non-fully qualified class names
(i.e. they do not have 'Bio::MAGE::' as a prefix) in this package.

=cut

sub classes {
  return ('BioSource', 'BioMaterial', 'LabeledExtract', 'BioSample', 'Compound', 'CompoundMeasurement', 'BioMaterialMeasurement', 'Treatment');
}

=item $obj_ref = Bio::MAGE::BioMaterial->new(%parameters)

=item $obj_ref_copy = $obj_ref->new()

The C<new()> method is the class constructor. If invoked with an
existing object instance, it is a copy constructor.

B<Return value>: It returns a reference to an object of class
C<Bio::MAGE::BioMaterial>.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut





=back

=head1 INSTANCE METHODS

=over

=cut

=item $array_ref = $biomaterial->getCompound_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x1048b7e8)::Compound> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getCompound_list {
  my $self = shift;
  return $self->compound_list();
}

=item $array_ref = $biomaterial->getBioMaterial_list()

This method handles the list for the C<Bio::MAGE::ARRAY(0x1048b7e8)::BioMaterial> class. It returns a reference to an array of the
class objects of that type associated with this package object.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioMaterial_list {
  my $self = shift;
  return $self->biomaterial_list();
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




=item $val = $biomaterial->compound_list()

=item $val = $biomaterial->compound_list($val)

This is the unified setter/getter method for the compound_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the compound_list
slot

Side effects: none

Exceptions: none

=cut

sub compound_list {
  my $self = shift;
  if (@_) {
    $self->{__COMPOUND_LIST} = shift;
  }
  return $self->{__COMPOUND_LIST};
}

=item $val = $biomaterial->biomaterial_list()

=item $val = $biomaterial->biomaterial_list($val)

This is the unified setter/getter method for the biomaterial_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the biomaterial_list
slot

Side effects: none

Exceptions: none

=cut

sub biomaterial_list {
  my $self = shift;
  if (@_) {
    $self->{__BIOMATERIAL_LIST} = shift;
  }
  return $self->{__BIOMATERIAL_LIST};
}

=item $val = $biomaterial->mageml_lists()

=item $val = $biomaterial->mageml_lists($val)

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

=item $val = $biomaterial->tagname()

=item $val = $biomaterial->tagname($val)

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
    if ($obj->isa("Bio::MAGE::BioMaterial::$class")) {
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

