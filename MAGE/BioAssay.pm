##############################
#
# Bio::MAGE::BioAssay
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

package Bio::MAGE::BioAssay;

use strict;
use Carp;
use Bio::MAGE::Base;
require Exporter;
use Tie::IxHash;

use Bio::MAGE::BioAssay::PhysicalBioAssay;
use Bio::MAGE::BioAssay::DerivedBioAssay;
use Bio::MAGE::BioAssay::Image;
use Bio::MAGE::BioAssay::BioAssay;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::BioAssay::MeasuredBioAssay;
use Bio::MAGE::BioAssay::BioAssayCreation;
use Bio::MAGE::BioAssay::FeatureExtraction;
use Bio::MAGE::BioAssay::Hybridization;
use Bio::MAGE::BioAssay::ImageAcquisition;
use Bio::MAGE::BioAssay::BioAssayTreatment;


use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS $__MAGEML_LISTS);

@ISA = qw(Bio::MAGE::Base Exporter);
$VERSION = q[$Id: BioAssay.pm,v 1.1 2002/12/10 06:20:46 jason_e_stewart Exp $];

sub initialize {
  my $self = shift;
  $self->channel_list([]);
  $self->bioassay_list([]);

  $self->mageml_lists([Channel=>$self->channel_list,
	BioAssay=>$self->bioassay_list]);
  $self->tagname(q[BioAssay_package]);
  return 1;
}



=head1 NAME

Bio::MAGE::BioAssay - Container module for classes in the MAGE BioAssay package 

=head1 SYNOPSIS

  use Bio::MAGE::BioAssay;

=head1 DESCRIPTION

This is a I<package> module that encapsulates a number of classes in
the Bio::MAGE hierarchy. These classes belong to the
BioAssay package of the MAGE-OM object model.

=head1 CLASSES

The Bio::MAGE::BioAssay module contains the following
Bio::MAGE classes:

=over


=item * PhysicalBioAssay


=item * DerivedBioAssay


=item * Image


=item * BioAssay


=item * Channel


=item * MeasuredBioAssay


=item * BioAssayCreation


=item * FeatureExtraction


=item * Hybridization


=item * ImageAcquisition


=item * BioAssayTreatment


=back



=head1 CLASS METHODS

=over

=item @class_list = Bio::MAGE::BioAssay::classes();

This method returns a list of non-fully qualified class names
(i.e. they do not have 'Bio::MAGE::' as a prefix) in this package.

=cut

sub classes {
  return ('PhysicalBioAssay', 'DerivedBioAssay', 'Image', 'BioAssay', 'Channel', 'MeasuredBioAssay', 'BioAssayCreation', 'FeatureExtraction', 'Hybridization', 'ImageAcquisition', 'BioAssayTreatment');
}

=item $obj_ref = Bio::MAGE::BioAssay->new(%parameters)

=item $obj_ref_copy = $obj_ref->new()

The C<new()> method is the class constructor. If invoked with an
existing object instance, it is a copy constructor.

B<Return value>: It returns a reference to an object of class
C<Bio::MAGE::BioAssay>.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut





=back

=head1 INSTANCE METHODS

=over

=cut

=item $array_ref = $bioassay->getChannel_list()

This method handles the list for the C<Bio::MAGE::BioAssay::Channel> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getChannel_list {
  my $self = shift;
  return $self->channel_list();
}

=item $bioassay->addChannel(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssay::Channel> objects to
the C<channel_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssay::Channel>

=cut

sub addChannel {
  my $self = shift;
  croak("Bio::MAGE::BioAssay::addChannel: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssay::addChannel: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssay::Channel")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssay::Channel');
  }

  push(@{$self->channel_list},@_);
}

=item $array_ref = $bioassay->getBioAssay_list()

This method handles the list for the C<Bio::MAGE::BioAssay::BioAssay> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioAssay_list {
  my $self = shift;
  return $self->bioassay_list();
}

=item $bioassay->addBioAssay(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssay::BioAssay> objects to
the C<bioassay_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssay::BioAssay>

=cut

sub addBioAssay {
  my $self = shift;
  croak("Bio::MAGE::BioAssay::addBioAssay: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssay::addBioAssay: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssay::BioAssay")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssay::BioAssay');
  }

  push(@{$self->bioassay_list},@_);
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




=item $val = $bioassay->channel_list()

=item $val = $bioassay->channel_list($val)

This is the unified setter/getter method for the channel_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the channel_list
slot

Side effects: none

Exceptions: none

=cut

sub channel_list {
  my $self = shift;
  if (@_) {
    $self->{__CHANNEL_LIST} = shift;
  }
  return $self->{__CHANNEL_LIST};
}

=item $val = $bioassay->bioassay_list()

=item $val = $bioassay->bioassay_list($val)

This is the unified setter/getter method for the bioassay_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the bioassay_list
slot

Side effects: none

Exceptions: none

=cut

sub bioassay_list {
  my $self = shift;
  if (@_) {
    $self->{__BIOASSAY_LIST} = shift;
  }
  return $self->{__BIOASSAY_LIST};
}

=item $val = $bioassay->mageml_lists()

=item $val = $bioassay->mageml_lists($val)

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

=item $val = $bioassay->tagname()

=item $val = $bioassay->tagname($val)

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
    if ($obj->isa("Bio::MAGE::BioAssay::$class")) {
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

