##############################
#
# Bio::MAGE::BioAssayData
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

package Bio::MAGE::BioAssayData;

use strict;
use Carp;
use Bio::MAGE::Base;
require Exporter;
use Tie::IxHash;

use Bio::MAGE::BioAssayData::BioAssayData;
use Bio::MAGE::BioAssayData::QuantitationTypeDimension;
use Bio::MAGE::BioAssayData::BioAssayMapping;
use Bio::MAGE::BioAssayData::DesignElementDimension;
use Bio::MAGE::BioAssayData::BioAssayDatum;
use Bio::MAGE::BioAssayData::DerivedBioAssayData;
use Bio::MAGE::BioAssayData::MeasuredBioAssayData;
use Bio::MAGE::BioAssayData::QuantitationTypeMapping;
use Bio::MAGE::BioAssayData::DesignElementMapping;
use Bio::MAGE::BioAssayData::BioDataCube;
use Bio::MAGE::BioAssayData::BioDataValues;
use Bio::MAGE::BioAssayData::BioDataTuples;
use Bio::MAGE::BioAssayData::BioAssayDimension;
use Bio::MAGE::BioAssayData::QuantitationTypeMap;
use Bio::MAGE::BioAssayData::Transformation;
use Bio::MAGE::BioAssayData::DesignElementMap;
use Bio::MAGE::BioAssayData::BioAssayMap;
use Bio::MAGE::BioAssayData::CompositeSequenceDimension;
use Bio::MAGE::BioAssayData::ReporterDimension;
use Bio::MAGE::BioAssayData::FeatureDimension;


use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS $__MAGEML_LISTS);

@ISA = qw(Bio::MAGE::Base Exporter);
$VERSION = 20020902.6;

sub initialize {
  my $self = shift;
  $self->bioassaydimension_list([]);
  $self->designelementdimension_list([]);
  $self->quantitationtypedimension_list([]);
  $self->bioassaymap_list([]);
  $self->quantitationtypemap_list([]);
  $self->bioassaydata_list([]);

  $self->mageml_lists([BioAssayDimension=>$self->bioassaydimension_list,
	DesignElementDimension=>$self->designelementdimension_list,
	QuantitationTypeDimension=>$self->quantitationtypedimension_list,
	BioAssayMap=>$self->bioassaymap_list,
	QuantitationTypeMap=>$self->quantitationtypemap_list,
	BioAssayData=>$self->bioassaydata_list]);
  $self->tagname(q[BioAssayData_package]);
  return 1;
}



=head1 NAME

Bio::MAGE::BioAssayData - Container module for classes in the MAGE BioAssayData package 

=head1 SYNOPSIS

  use Bio::MAGE::BioAssayData;

=head1 DESCRIPTION

This is a I<package> module that encapsulates a number of classes in
the Bio::MAGE hierarchy. These classes belong to the
BioAssayData package of the MAGE-OM object model.

=head1 CLASSES

The Bio::MAGE::BioAssayData module contains the following
Bio::MAGE classes:

=over


=item * BioAssayData


=item * QuantitationTypeDimension


=item * BioAssayMapping


=item * DesignElementDimension


=item * BioAssayDatum


=item * DerivedBioAssayData


=item * MeasuredBioAssayData


=item * QuantitationTypeMapping


=item * DesignElementMapping


=item * BioDataCube


=item * BioDataValues


=item * BioDataTuples


=item * BioAssayDimension


=item * QuantitationTypeMap


=item * Transformation


=item * DesignElementMap


=item * BioAssayMap


=item * CompositeSequenceDimension


=item * ReporterDimension


=item * FeatureDimension


=back



=head1 CLASS METHODS

=over

=item @class_list = Bio::MAGE::BioAssayData::classes();

This method returns a list of non-fully qualified class names
(i.e. they do not have 'Bio::MAGE::' as a prefix) in this package.

=cut

sub classes {
  return ('BioAssayData',
'QuantitationTypeDimension',
'BioAssayMapping',
'DesignElementDimension',
'BioAssayDatum',
'DerivedBioAssayData',
'MeasuredBioAssayData',
'QuantitationTypeMapping',
'DesignElementMapping',
'BioDataCube',
'BioDataValues',
'BioDataTuples',
'BioAssayDimension',
'QuantitationTypeMap',
'Transformation',
'DesignElementMap',
'BioAssayMap',
'CompositeSequenceDimension',
'ReporterDimension',
'FeatureDimension');
}

=item $obj_ref = Bio::MAGE::BioAssayData->new(%parameters)

=item $obj_ref_copy = $obj_ref->new()

The C<new()> method is the class constructor. If invoked with an
existing object instance, it is a copy constructor.

B<Return value>: It returns a reference to an object of class
C<Bio::MAGE::BioAssayData>.

B<Side effects>: It invokes the C<initialize()> method if it is defined
by the class.

=cut





=back

=head1 INSTANCE METHODS

=over

=cut

=item $array_ref = $bioassaydata->getBioAssayDimension_list()

This method handles the list for the C<Bio::MAGE::BioAssayData::BioAssayDimension> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioAssayDimension_list {
  my $self = shift;
  return $self->bioassaydimension_list();
}

=item $bioassaydata->addBioAssayDimension(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssayData::BioAssayDimension> objects to
the C<bioassaydimension_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssayData::BioAssayDimension>

=cut

sub addBioAssayDimension {
  my $self = shift;
  croak("Bio::MAGE::BioAssayData::addBioAssayDimension: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssayData::addBioAssayDimension: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::BioAssayDimension")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::BioAssayDimension');
  }

  push(@{$self->bioassaydimension_list},@_);
}

=item $array_ref = $bioassaydata->getDesignElementDimension_list()

This method handles the list for the C<Bio::MAGE::BioAssayData::DesignElementDimension> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getDesignElementDimension_list {
  my $self = shift;
  return $self->designelementdimension_list();
}

=item $bioassaydata->addDesignElementDimension(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssayData::DesignElementDimension> objects to
the C<designelementdimension_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssayData::DesignElementDimension>

=cut

sub addDesignElementDimension {
  my $self = shift;
  croak("Bio::MAGE::BioAssayData::addDesignElementDimension: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssayData::addDesignElementDimension: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::DesignElementDimension")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::DesignElementDimension');
  }

  push(@{$self->designelementdimension_list},@_);
}

=item $array_ref = $bioassaydata->getQuantitationTypeDimension_list()

This method handles the list for the C<Bio::MAGE::BioAssayData::QuantitationTypeDimension> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getQuantitationTypeDimension_list {
  my $self = shift;
  return $self->quantitationtypedimension_list();
}

=item $bioassaydata->addQuantitationTypeDimension(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssayData::QuantitationTypeDimension> objects to
the C<quantitationtypedimension_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssayData::QuantitationTypeDimension>

=cut

sub addQuantitationTypeDimension {
  my $self = shift;
  croak("Bio::MAGE::BioAssayData::addQuantitationTypeDimension: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssayData::addQuantitationTypeDimension: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::QuantitationTypeDimension")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::QuantitationTypeDimension');
  }

  push(@{$self->quantitationtypedimension_list},@_);
}

=item $array_ref = $bioassaydata->getBioAssayMap_list()

This method handles the list for the C<Bio::MAGE::BioAssayData::BioAssayMap> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioAssayMap_list {
  my $self = shift;
  return $self->bioassaymap_list();
}

=item $bioassaydata->addBioAssayMap(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssayData::BioAssayMap> objects to
the C<bioassaymap_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssayData::BioAssayMap>

=cut

sub addBioAssayMap {
  my $self = shift;
  croak("Bio::MAGE::BioAssayData::addBioAssayMap: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssayData::addBioAssayMap: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::BioAssayMap")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::BioAssayMap');
  }

  push(@{$self->bioassaymap_list},@_);
}

=item $array_ref = $bioassaydata->getQuantitationTypeMap_list()

This method handles the list for the C<Bio::MAGE::BioAssayData::QuantitationTypeMap> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getQuantitationTypeMap_list {
  my $self = shift;
  return $self->quantitationtypemap_list();
}

=item $bioassaydata->addQuantitationTypeMap(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssayData::QuantitationTypeMap> objects to
the C<quantitationtypemap_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssayData::QuantitationTypeMap>

=cut

sub addQuantitationTypeMap {
  my $self = shift;
  croak("Bio::MAGE::BioAssayData::addQuantitationTypeMap: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssayData::addQuantitationTypeMap: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::QuantitationTypeMap")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::QuantitationTypeMap');
  }

  push(@{$self->quantitationtypemap_list},@_);
}

=item $array_ref = $bioassaydata->getBioAssayData_list()

This method handles the list for the C<Bio::MAGE::BioAssayData::BioAssayData> class. It
returns a reference to an array of the class objects that have been
associated with the package instance.

This is useful when retrieving data from parsed MAGE-ML file.

=cut

sub getBioAssayData_list {
  my $self = shift;
  return $self->bioassaydata_list();
}

=item $bioassaydata->addBioAssayData(@vals)

This method is an interface for adding C<Bio::MAGE::BioAssayData::BioAssayData> objects to
the C<bioassaydata_list> list. It is generally used by generic methods such
as those in the XMLWriter.

Input parameters: the list of values C<@vals> to add to the owner
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not a subclass of class C<Bio::MAGE::BioAssayData::BioAssayData>

=cut

sub addBioAssayData {
  my $self = shift;
  croak("Bio::MAGE::BioAssayData::addBioAssayData: no arguments passed to setter")
    unless scalar @_;
  foreach my $val (@_) {
    croak("Bio::MAGE::BioAssayData::addBioAssayData: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::BioAssayData")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::BioAssayData');
  }

  push(@{$self->bioassaydata_list},@_);
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




=item $val = $bioassaydata->bioassaydimension_list()

=item $val = $bioassaydata->bioassaydimension_list($val)

This is the unified setter/getter method for the bioassaydimension_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the bioassaydimension_list
slot

Side effects: none

Exceptions: none

=cut

sub bioassaydimension_list {
  my $self = shift;
  if (@_) {
    $self->{__BIOASSAYDIMENSION_LIST} = shift;
  }
  return $self->{__BIOASSAYDIMENSION_LIST};
}

=item $val = $bioassaydata->designelementdimension_list()

=item $val = $bioassaydata->designelementdimension_list($val)

This is the unified setter/getter method for the designelementdimension_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the designelementdimension_list
slot

Side effects: none

Exceptions: none

=cut

sub designelementdimension_list {
  my $self = shift;
  if (@_) {
    $self->{__DESIGNELEMENTDIMENSION_LIST} = shift;
  }
  return $self->{__DESIGNELEMENTDIMENSION_LIST};
}

=item $val = $bioassaydata->quantitationtypedimension_list()

=item $val = $bioassaydata->quantitationtypedimension_list($val)

This is the unified setter/getter method for the quantitationtypedimension_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the quantitationtypedimension_list
slot

Side effects: none

Exceptions: none

=cut

sub quantitationtypedimension_list {
  my $self = shift;
  if (@_) {
    $self->{__QUANTITATIONTYPEDIMENSION_LIST} = shift;
  }
  return $self->{__QUANTITATIONTYPEDIMENSION_LIST};
}

=item $val = $bioassaydata->bioassaymap_list()

=item $val = $bioassaydata->bioassaymap_list($val)

This is the unified setter/getter method for the bioassaymap_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the bioassaymap_list
slot

Side effects: none

Exceptions: none

=cut

sub bioassaymap_list {
  my $self = shift;
  if (@_) {
    $self->{__BIOASSAYMAP_LIST} = shift;
  }
  return $self->{__BIOASSAYMAP_LIST};
}

=item $val = $bioassaydata->quantitationtypemap_list()

=item $val = $bioassaydata->quantitationtypemap_list($val)

This is the unified setter/getter method for the quantitationtypemap_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the quantitationtypemap_list
slot

Side effects: none

Exceptions: none

=cut

sub quantitationtypemap_list {
  my $self = shift;
  if (@_) {
    $self->{__QUANTITATIONTYPEMAP_LIST} = shift;
  }
  return $self->{__QUANTITATIONTYPEMAP_LIST};
}

=item $val = $bioassaydata->bioassaydata_list()

=item $val = $bioassaydata->bioassaydata_list($val)

This is the unified setter/getter method for the bioassaydata_list slot. If
C<$val> is specified, the setter method is invoked, with no
parameters, the getter method is invoked.

Input parameters: the optional C<$val> will invoke the setter method.

Return value: for both setter and getter the current value of the bioassaydata_list
slot

Side effects: none

Exceptions: none

=cut

sub bioassaydata_list {
  my $self = shift;
  if (@_) {
    $self->{__BIOASSAYDATA_LIST} = shift;
  }
  return $self->{__BIOASSAYDATA_LIST};
}

=item $val = $bioassaydata->mageml_lists()

=item $val = $bioassaydata->mageml_lists($val)

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

=item $val = $bioassaydata->tagname()

=item $val = $bioassaydata->tagname($val)

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
    if ($obj->isa("Bio::MAGE::BioAssayData::$class")) {
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

