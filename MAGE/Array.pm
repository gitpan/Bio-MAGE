##############################
#
# Bio::MAGE::Array
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

package Bio::MAGE::Array;

use strict;
use Carp;
use Bio::MAGE::Base;
require Exporter;
use Tie::IxHash;

use Bio::MAGE::Array::Array;
use Bio::MAGE::Array::FeatureDefect;
use Bio::MAGE::Array::ArrayGroup;
use Bio::MAGE::Array::ArrayManufacture;
use Bio::MAGE::Array::ArrayManufactureDeviation;
use Bio::MAGE::Array::Fiducial;
use Bio::MAGE::Array::ManufactureLIMS;
use Bio::MAGE::Array::ManufactureLIMSBiomaterial;
use Bio::MAGE::Array::PositionDelta;
use Bio::MAGE::Array::ZoneDefect;


use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS $__MAGEML_LISTS);

@ISA = qw(Bio::MAGE::Base Exporter);
$VERSION = 20020902.6;

sub initialize {
  my $self = shift;
  $self->arraygroup_list([]);
  $self->array_list([]);
  $self->arraymanufacture_list([]);

  $self->mageml_lists([ArrayGroup=>$self->arraygroup_list,
	Array=>$self->array_list,
	ArrayManufacture=>$self->arraymanufacture_list]);
  $self->tagname(q[Array_package]);
  return 1;
}



=head1 NAME

Bio::MAGE::Array - Container module for classes in the MAGE Array package 

=head1 SYNOPSIS

  use Bio::MAGE::Array;

=head1 DESCRIPTION

This is a I<package> module that encapsulates a number of classes in
the Bio::MAGE hierarchy. These classes belong to the
Array package of the MAGE-OM object model.

=head1 CLASSES

The Bio::MAGE::Array module contains the following
Bio::MAGE classes:

=over


=item * Array


=item * FeatureDefect


=item * ArrayGroup


=item * ArrayManufacture


=item * ArrayManufactureDeviation


=item * Fiducial


=item * ManufactureLIMS


=item * ManufactureLIMSBiomaterial


=item * PositionDelta


=item * ZoneDefect


=back



=head1 CLASS METHODS

=over

=item @class_list = Bio::MAGE::Array::classes();

This method returns a list of non-fully qualified class names
(i.e. they do not have 'Bio::MAGE::' as a prefix) in this package.

=cut

sub classes {
  return ('Array',
'FeatureDefect',
'ArrayGroup',
'ArrayManufacture',
'ArrayManufactureDeviation',
'Fiducial',
'ManufactureLIMS',
'ManufactureLIMSBiomaterial',
'PositionDelta',
'ZoneDefect');
}

=item $obj_ref = Bio::MAGE::Array->new(%parameters)

=item $obj_ref_copy = $obj_ref->new()

The C<new()> method is the class constructor. If invoked with an
existing object instance, it is a copy constructor.

B<Return value>: It returns a reference to an object of class
C<Bio::MAGE::Array>.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut





=back

=head1 INSTANCE METHODS

=over

=cut

=item $array_ref = $array->getArrayGroup_list()

This method handles the list for the C<Bio::MAGE::Array::ArrayGroup> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getArrayGroup_list {
  my $self = shift;
  return $self->arraygroup_list();
}

=item $array->addArrayGroup(@vals)

This method is an interface for adding C<Bio::MAGE::Array::ArrayGroup> objects to
the C<arraygroup_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::Array::ArrayGroup>

=cut

sub addArrayGroup {
  my $self = shift;
  croak("Bio::MAGE::Array::addArrayGroup: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::Array::addArrayGroup: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ArrayGroup")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ArrayGroup');
  }

  push(@{$self->arraygroup_list},@_);
}

=item $array_ref = $array->getArray_list()

This method handles the list for the C<Bio::MAGE::Array::Array> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getArray_list {
  my $self = shift;
  return $self->array_list();
}

=item $array->addArray(@vals)

This method is an interface for adding C<Bio::MAGE::Array::Array> objects to
the C<array_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::Array::Array>

=cut

sub addArray {
  my $self = shift;
  croak("Bio::MAGE::Array::addArray: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::Array::addArray: wrong type: " . ref($val) . " expected Bio::MAGE::Array::Array")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::Array');
  }

  push(@{$self->array_list},@_);
}

=item $array_ref = $array->getArrayManufacture_list()

This method handles the list for the C<Bio::MAGE::Array::ArrayManufacture> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getArrayManufacture_list {
  my $self = shift;
  return $self->arraymanufacture_list();
}

=item $array->addArrayManufacture(@vals)

This method is an interface for adding C<Bio::MAGE::Array::ArrayManufacture> objects to
the C<arraymanufacture_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::Array::ArrayManufacture>

=cut

sub addArrayManufacture {
  my $self = shift;
  croak("Bio::MAGE::Array::addArrayManufacture: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::Array::addArrayManufacture: wrong type: " . ref($val) . " expected Bio::MAGE::Array::ArrayManufacture")
      unless UNIVERSAL::isa($val,'Bio::MAGE::Array::ArrayManufacture');
  }

  push(@{$self->arraymanufacture_list},@_);
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




=item $val = $array->arraygroup_list()

=item $val = $array->arraygroup_list($val)

This is the unified setter/getter method for the arraygroup_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the arraygroup_list
slot

Side effects: none

Exceptions: none

=cut

sub arraygroup_list {
  my $self = shift;
  if (@_) {
    $self->{__ARRAYGROUP_LIST} = shift;
  }
  return $self->{__ARRAYGROUP_LIST};
}

=item $val = $array->array_list()

=item $val = $array->array_list($val)

This is the unified setter/getter method for the array_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the array_list
slot

Side effects: none

Exceptions: none

=cut

sub array_list {
  my $self = shift;
  if (@_) {
    $self->{__ARRAY_LIST} = shift;
  }
  return $self->{__ARRAY_LIST};
}

=item $val = $array->arraymanufacture_list()

=item $val = $array->arraymanufacture_list($val)

This is the unified setter/getter method for the arraymanufacture_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the arraymanufacture_list
slot

Side effects: none

Exceptions: none

=cut

sub arraymanufacture_list {
  my $self = shift;
  if (@_) {
    $self->{__ARRAYMANUFACTURE_LIST} = shift;
  }
  return $self->{__ARRAYMANUFACTURE_LIST};
}

=item $val = $array->mageml_lists()

=item $val = $array->mageml_lists($val)

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

=item $val = $array->tagname()

=item $val = $array->tagname($val)

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
    if ($obj->isa("Bio::MAGE::Array::$class")) {
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

Jason E. Stewart (www.openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut


#
# End the module by returning a true value
#
1;

