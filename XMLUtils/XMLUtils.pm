#
# Bio::MAGE::XMLUtils.pm
#   a module for importing and exporting MAGE-ML
#
package Bio::MAGE::XMLWriter;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK $DEBUG);
use Carp;
use Bio::MAGE;
use Bio::MAGE::Base;
use XML::Xerces;
require Exporter;

=head1 NAME

Bio::MAGE::XMLWriter - a module for exporting MAGE-ML

=head1 SYNOPSIS

  use Bio::MAGE::XMLWriter;

  my $writer = Bio::MAGE::XMLWriter->new(@args);
  my $fh = \*STDOUT;
  $writer->obj2mageml($fh,@object_list);

=head1 DESCRIPTION

Methods for transforming information from a MAGE-OM objects into
MAGE-ML.

=cut

@ISA = qw(Bio::MAGE::Base Exporter);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw(obj2mageml);

$DEBUG = 1;


sub indent_level {
  my $self = shift;
  if (@_) {
    $self->{__INDENT_LEVEL} = shift;
  }
  return $self->{__INDENT_LEVEL};
}

sub indent_increment {
  my $self = shift;
  if (@_) {
    $self->{__INDENT_INCREMENT} = shift;
  }
  return $self->{__INDENT_INCREMENT};
}

sub attrs_on_one_line {
  my $self = shift;
  if (@_) {
    $self->{__ATTRS_ON_ONE_LINE} = shift;
  }
  return $self->{__ATTRS_ON_ONE_LINE};
}

sub attr_indent {
  my $self = shift;
  if (@_) {
    $self->{__ATTR_INDENT} = shift;
  }
  return $self->{__ATTR_INDENT};
}

sub collapse_tag {
  my $self = shift;
  if (@_) {
    $self->{__COLLAPSE_TAG} = shift;
  }
  return $self->{__COLLAPSE_TAG};
}

sub encoding {
  my $self = shift;
  if (@_) {
    $self->{__ENCODING} = shift;
  }
  return $self->{__ENCODING};
}

sub public_id {
  my $self = shift;
  if (@_) {
    $self->{__PUBLIC_ID} = shift;
  }
  return $self->{__PUBLIC_ID};
}

sub system_id {
  my $self = shift;
  if (@_) {
    $self->{__SYSTEM_ID} = shift;
  }
  return $self->{__SYSTEM_ID};
}

sub generate_identifier {
  my $self = shift;
  if (@_) {
    $self->{__GENERATE_IDENTIFIER} = shift;
  }
  return $self->{__GENERATE_IDENTIFIER};
}

sub generate_new_identifiers {
  my $self = shift;
  if (@_) {
    $self->{__GENERATE_NEW_IDENTIFIERS} = shift;
  }
  return $self->{__GENERATE_NEW_IDENTIFIERS};
}

sub external_data {
  my $self = shift;
  if (@_) {
    $self->{__EXTERNAL_DATA} = shift;
  }
  return $self->{__EXTERNAL_DATA};
}


sub fh {
  my $self = shift;
  if (@_) {
    $self->{__FH} = shift;
  }
  return $self->{__FH};
}

sub identifier {
  my $self = shift;
  if (@_) {
    $self->{__IDENTIFIER} = shift;
  }
  return $self->{__IDENTIFIER};
}

sub initialize {
  my ($self) = shift;
  $self->indent_increment(2);
  $self->indent_level(0);
  $self->external_data(0)
    unless defined $self->external_data();
  $self->encoding('ISO-8859-1')
    unless defined $self->encoding();
  $self->system_id('MAGE-ML.dtd')
    unless defined $self->system_id();
  $self->generate_identifier(sub {$self->identifier_generatation(shift)})
    unless defined $self->generate_identifier();
  $self->generate_new_identifiers(0)
    unless defined $self->generate_new_identifiers();
}

sub incr_indent {
  my $self = shift;
  $self->indent_level($self->indent_level + $self->indent_increment);
}

sub decr_indent {
  my $self = shift;
  $self->indent_level($self->indent_level - $self->indent_increment);
}

=head1 METHODS

=item write($MAGE_object);

C<write()> prints the objects contained in $MAGE_object as MAGE-ML to
the file handle used by the writer.

=cut

sub write {
  my ($self,$top_level_obj) = @_;
  die "Bio::MAGE::XMLWriter::write: must specify a file handle for output"
    unless defined $self->fh();

  # handle the basics
  $self->write_xml_decl();
  $self->write_doctype();

  $top_level_obj->obj2mageml($self);
}

sub write_xml_decl {
  my $self = shift;
  my $fh = $self->fh();
  my $encoding = $self->encoding();
  print $fh <<"MAGEML";
<?xml version="1.0" encoding="$encoding" standalone="no"?>
MAGEML
}

sub write_doctype {
  my $self = shift;
  my $public_id = $self->public_id();
  my $PUBLIC;
  if (defined $public_id) {
    $PUBLIC = qq[PUBLIC "$public_id"];
  } else {
    $PUBLIC = '';
  }
  my $system_id = $self->system_id();
  my $SYSTEM = qq[SYSTEM "$system_id"];
  my $fh = $self->fh();
  print $fh <<"MAGEML";
<!DOCTYPE MAGE-ML $PUBLIC $SYSTEM>
MAGEML
}

sub write_start_tag {
  my ($self,$tag,$empty,%attrs) = @_;
  my $indent = ' ' x $self->indent_level();
  my $fh = $self->fh();
  my (@attrs);
  foreach my $attribute_name (keys %attrs) {
    push(@attrs,qq[$attribute_name="$attrs{$attribute_name}"]);
  }
  my ($attrs,$attr_indent);
  if ($self->attrs_on_one_line()) {
    $attrs = join(' ',@attrs);
  } else {
    $attr_indent = $self->attr_indent();
    $attr_indent = length($tag) + 2
      unless defined $attr_indent;
    $attr_indent = ' ' x $attr_indent . $indent;
    $attrs = join("\n$attr_indent",@attrs);
  }
  if ($attrs) {
    print $fh "$indent<$tag $attrs";
  } else {
    # don't print the space after the tag because Eric said so
    print $fh "$indent<$tag";
  }
  if ($empty) {
    print $fh '/>';
  } else {
    print $fh '>';
  }
  print $fh "\n" unless $self->collapse_tag();
  $self->incr_indent()
    unless $empty;
}

sub write_end_tag {
  my ($self,$tag) = @_;
  $self->decr_indent();
  my $indent = ' ' x $self->indent_level();
  my $fh = $self->fh();
  print $fh "$indent</$tag>\n";
}

# we purposefully avoid copying the text, since it may be BIG
sub write_text {
  my $self = shift;
  my $fh = $self->fh();
  print $fh $_[0];
}

#
# Helper methods
#

sub identifier_generation {
  my ($self,$obj) = @_;
  my $known_identifiers = $self->identifiers();
  return if exists $known_identifiers->{$obj->getIdentifier};

  # stringify the object: Bio::MAGE::Identifiable=SCALAR(0x10379980)
  my $identifier = $obj;
  # strip of the leading class qualifiers: Identifiable=SCALAR(0x10379980)
  $identifier =~ s/^Bio::MAGE:://;
  # convert the '=' to a colon: Identifiable:SCALAR(0x10379980)
  $identifier =~ tr/=/:/;
  # remove the SCALAR: Identifiable:10379980
  $identifier =~ s/SCALAR\(0x(.*)\)/$1/;
  $obj->setIdentifier($identifier);
}

sub obj2mageml_ref {
  my ($self,$obj) = @_;

  # create the <*_ref> tag
  my $tag = $obj->class_name();
  $tag =~ s/.+:://;
  $tag .= '_ref';

  # we create the empty tag with only the identifier
  my $empty = 1;
  $self->write_start_tag($tag,$empty,identifier=>$obj->getIdentifier());
}

sub flatten {
  my ($self,$list) = @_;
  my @list;
  foreach my $item (@{$list}) {
    if (ref($item) eq 'ARRAY') {
      push(@list,$self->flatten($item));
    } else {
      push(@list,$item);
    }
  }
  return join("\t",@list);
}

sub external_file_id {
  my $self = shift;
  my $num = $self->external_data();
  $num++;
  $self->external_data($num);
  return "external-data-$num.txt";
}

sub write_bio_data_tuples($obj) {
  my ($self,$obj) = @_;

  # has no attributes

  # the tag name is the name of the class
  my $tag = $obj->class_name();
  $tag =~ s/.+:://;
  $self->write_start_tag($tag,my $empty = 0);

  # make the data structure
  my %data;
  my %des;
  my %bas;
  my %qts;
  foreach my $datum (@{$obj->getBioAssayTupleData()}) {
    my $de = $datum->getDesignElement();
    my $ba = $datum->getBioAssay();
    my $qt = $datum->getQuantitationType();

    my $ba_id = $ba->getIdentifier();
    my $qt_id = $qt->getIdentifier();
    my $de_id = $de->getIdentifier();

    # store the datum object
    $data{$ba_id}->{$de_id}{$qt_id} = $datum;

    # store the design element obj
    $des{$de_id} = $de;
    # store the quantitation type obj
    $qts{$qt_id} = $qt;
    # store the bioassay obj
    $bas{$ba_id} = $ba;
  }

  # write the container tag
  $tag = 'BioAssayTuples_assnlist';
  $self->write_start_tag($tag,my $empty = 0);
  # write the XML
  foreach my $ba (keys %data) {
    # write the BioAssayTuple container tag
    my $bat_tag = 'BioAssayTuple';
    $self->write_start_tag($bat_tag,my $empty = 0);

    # write the container tag
    my $tag = 'BioAssay_assnref';
    $self->write_start_tag($tag,my $empty = 0);

    # write the BioAssay ref object
    my $ba_obj = $bas{$ba};#bioassay
    $self->obj2mageml_ref($ba_obj);

    # end the BioAssay_ref container tag
    $self->write_end_tag($tag);

    # write the container tag
    $tag = 'DesignElementTuples_assnlist';
    $self->write_start_tag($tag,my $empty = 0);
    foreach my $de (keys %{$data{$ba}}) {
      # write the DesignElementTuple container tag
      my $det_tag = 'DesignElementTuple';
      $self->write_start_tag($det_tag,my $empty = 0);

      my $tag = 'DesignElement_assnref';
      # write the container tag
      $self->write_start_tag($tag,my $empty = 0);

      # write the DesignElement ref object
      my $de_obj = $des{$de};		#design element
      $self->obj2mageml_ref($de_obj);

      # end the DesignElement ref container tag
      $self->write_end_tag($tag);

      # write the container tag
      $tag = 'QuantitationTypeTuples_assnlist';
      $self->write_start_tag($tag,my $empty = 0);
      foreach my $qt (keys %{$data{$ba}->{$de}}) {
	# write the QuantitationTypeTuple container tag
	my $qtt_tag = 'QuantitationTypeTuple';
	$self->write_start_tag($qtt_tag,my $empty = 0);

	my $tag = 'QuantitationType_assnref';
	# write the container tag
	$self->write_start_tag($tag,my $empty = 0);

	# write the QuantitationType ref object
	my $ba_obj = $qts{$qt};		#quantitation type
	$self->obj2mageml_ref($ba_obj);

	# end the Quantitation Type ref container tag
	$self->write_end_tag($tag);

	# write the datum container tag
	my $datum_tag = 'Datum_assn';
	$self->write_start_tag($datum_tag,my $empty = 0);

	# write the datum tag
	$tag = 'Datum';
	my $value = $data{$ba}->{$de}{$qt}->getValue();
	die "no $value for BioAssay: ", $ba,
	  ", DesignElement: ", $de,
	    ", QuantitationType: ", $qt,
	  unless defined $value;
	my %attrs = (value=>$value);
	$self->write_start_tag($tag,my $empty = 1,%attrs);

	# end the Datum container tag
	$self->write_end_tag($datum_tag);

	# end the QuantitationTypeTuple container tag
	$self->write_end_tag($qtt_tag);
      }
      # end the QuantitationTypeTuples_list container tag
      $self->write_end_tag($tag);

      # end the DesignElementTuple container tag
      $self->write_end_tag($det_tag);
    }
    # end the DesignElementTuples_list container tag
    $self->write_end_tag($tag);

    # end the BioAssayTuple container tag
    $self->write_end_tag($bat_tag);
  }
  # end the BioAssayTuples_list container tag
  $self->write_end_tag($tag);

  # end the BioDataTuples tag
  $self->write_end_tag('BioDataTuples');
}

sub obj2mageml {
  my ($self,$obj) = @_;

  if ($obj->isa("Bio::MAGE::BioAssayData::BioDataTuples")) {
    return $self->write_bio_data_tuples($obj);
  }

  # all attributes are gathered into a hash
  my %attributes;
  my $data;
  foreach my $attribute ($obj->attribute_methods()) {
    my $attribute_val;
    {
      no strict 'refs';
      my $getter_method = 'get'.ucfirst($attribute);
      $attribute_val = $obj->$getter_method();
      if (defined $attribute_val) {
	if ($attribute eq 'cube') {
	  $data = $self->flatten($attribute_val);
	  next;
	}
	$attribute_val =~ s/\&/&amp;/g;
	$attribute_val =~ s/\"/&quot;/g;
	$attribute_val =~ s/\'/&apos;/g;
	$attribute_val =~ s/\>/&gt;/g;
	$attribute_val =~ s/\</&lt;/g;
	$attributes{$attribute} = $attribute_val;
      }
    }
  }
  # the tag name is the name of the class
  my $tag = $obj->class_name();
  $tag =~ s/.+:://;

  # we create the start tag, with the object attributes represented as
  # element attributes. If the object has no associations we make it
  # an empty element - this is to avoid XML validation errors
  my $empty = not scalar $obj->associations();
  $self->write_start_tag($tag,$empty,%attributes);

  # associations are handled as sub-elements of the current element
  # and we use the association meta-data to instruct how to represent
  # each association
  #
  # We use the IxHash module because the associations are ordered
  # in the same order the DTD expects to receive them, and IxHash
  # preserves insertion order
  tie my %assns_hash, 'Tie::IxHash', $obj->associations();
  foreach my $association (keys %assns_hash) {
    my $association_obj;
    {
      no strict 'refs';
      my $getter_method = 'get'.ucfirst($association);
      $association_obj = $obj->$getter_method();
    }
    if (defined $association_obj) {

      # we first create the container tag with the proper prefix
      my $prefix;
      my $is_ref = $assns_hash{$association}->is_ref();
      if ($is_ref) {
	$prefix = '_assnref';
      } else {
	$prefix = '_assn';
      }
      my @association_objects;
      my $cardinality = $assns_hash{$association}->cardinality();
      if (($cardinality eq Bio::MAGE->CARD_1_TO_N) ||
	  ($cardinality eq Bio::MAGE->CARD_0_TO_N)) {
	$prefix .= 'list';
	@association_objects = @{$association_obj};
      } else {
	@association_objects = ($association_obj);	
      }
      my $container_tag = ucfirst("$association$prefix");
      # container tags must not be empty
      $self->write_start_tag("$container_tag",my $cont_empty=0);

      # now we fill in the container with the object(s)
      foreach $association_obj (@association_objects) {
	if ($is_ref) {
	  $self->obj2mageml_ref($association_obj)
	} else {
	  $self->obj2mageml($association_obj);
	}
      }
      # now end the container tag
      $self->write_end_tag("$container_tag");
    }
  }
  if (defined $data) {
    if ($self->external_data()) {
      my %attributes;
      $attributes{filenameURI} = $self->external_file_id();
      my $tag = 'DataExternal_assn';
      $self->write_start_tag($tag,my $empty=0);
      # we need to make it external
      {
	my $tag = 'DataExternal';
	$self->write_start_tag($tag,my $empty=1,%attributes);

	open(DATA, ">$attributes{filenameURI}")
	  or die "Couldn't open $attributes{filenameURI} for writing";
	print DATA $data;
	close(DATA);
      }
      $self->write_end_tag($tag);
    } else {
      # we make it internal
      my $tag = 'DataInternal_assn';
      $self->write_start_tag($tag,0);
      {
	my $tag = 'DataInternal';
	$self->write_start_tag($tag,0);
	my $fh = $self->fh();
	print $fh "<![CDATA[$data]]>";
	$self->write_end_tag($tag);
      }
      $self->write_end_tag($tag);
    }
  }
  # now end the current element
  $self->write_end_tag($tag)
    unless $empty;
}

sub is_object {
  my ($self,$obj) = @_;
  my $ref = ref($obj);
  return $ref
    && $ref ne 'ARRAY'
    && $ref ne 'SCALAR'
    && $ref ne 'HASH'
    && $ref ne 'CODE'
    && $ref ne 'GLOB'
    && $ref ne 'REF';
}

sub is_bio_mage_object {
  my ($self,$obj) = @_;
  return $self->is_object($obj)
    && ref($obj) =~ /^Bio::MAGE/;
}

#
# Bio::MAGE::XMLReader
#   a class for converting MAGE-ML into Perl objects
#   originally written by Eric Deutsch. Converted into a class
#   by Jason E. Stewart.
#
package Bio::MAGE::XMLReader;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK $DEBUG);
use Carp;
use XML::Xerces;
require Exporter;

use Data::Dumper;
use Benchmark;
use Bio::MAGE qw(:ALL);
use Bio::MAGE::Base;
use Carp;

=head1 NAME

Bio::MAGE::XMLReader - a module for exporting MAGE-ML

=head1 SYNOPSIS

  use Bio::MAGE::XMLReader;

  my $reader = Bio::MAGE::XMLReader->new(handler=>$handler,
					 sax1=>$sax1,
					 verbose=>$verbose,
					 log_file=>\*STDERR,
					);

  # set the sax1 attribute
  $reader->sax1($bool);

  # get the current value
  $value = $reader->sax1();

  # set the content/document handler - this method is provided for completeness
  # the value should be set in the call to the constructor to be effective
  $reader->handler($HANDLER);

  # get the current handler
  $handler = $reader->handler();

  # set the attribute
  $reader->verbose($integer);

  # get the current value
  $value = $reader->verbose();

  # set the attribute
  $reader->log_file($filename);

  # get the current value
  $value = $reader->log_file();

  my $fh = \*STDOUT;
  my $mage = $reader->read($file_name);

=head1 DESCRIPTION

Methods for transforming information from a MAGE-OM objects into
MAGE-ML.

=cut

@ISA = qw(Bio::MAGE::Base Exporter);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();

$DEBUG = 1;

###############################################################################
#
# Description : mageml_reader.pl is a MAGE-ML test reader.
#      It reads in a MAGE-ML document, instantiating the objects for
#      the # MAGE-OM class as they are read in.  Lots of diagnostic
#      information # is printed if --verbose is set.  In a final step,
#      a MAGE-ML document # is printed to STDOUT based on all the
#      information read in.  The # result should be (nearly) identical
#      to the XML read in when # everything is working properly.
#
# Search for flags:
#   - FIXME for known bugs/shortcomings
#   - DUBIOUS for things that are probably okay but could lead
#       to future problems.
#
###############################################################################

=head2 ATTRIBUTE METHODS

These methods have a polymorphic setter/getter method that sets an
attribute which affects the parsing of MAGE-ML. If given a value, the
method will save the value to the attribute, if invoked with no
argument it will return the current value of the attribute.

These attributes can all be set in the call to the constructor using
the named parameter style.

=over

=item sax1

This attribute determines whether a SAX1 parser and DocumentHandler or
a SAX2XMLReader and a ContentHandler will be used for parsing. The
default is to use a SAX2 parser.

=cut

sub sax1 {
  my $self = shift;
  if (@_) {
    $self->{__SAX1} = shift;
  }
  return $self->{__SAX1};
}

=item handler

If an application needs a custom handler it can set this attribute in
the call to the constructor. It is advised that the object use inherit
either from Bio::MAGE::ContentHandler (if using SAX2) or
Bio::MAGE::DocumentHandler if using SAX1. In particular, whatever
class is used, it needs to implement the following methods:

=over

=item * verbose

called with the integer parameter that specifies the desired level of
output

=item * log_file

called with the file handle to which ouput should be sent

=item * init

called during the constructor for any needed work

=back


=cut

sub handler {
  my $self = shift;
  if (@_) {
    $self->{__HANDLER} = shift;
  }
  return $self->{__HANDLER};
}

=item verbose

This attribute determines the desired level of output during the
parse. The default is no output. A positive value increases the amount
of information.

=cut

sub verbose {
  my $self = shift;
  if (@_) {
    $self->{__VERBOSE} = shift;
  }
  return $self->{__VERBOSE};
}

=item log_file

This attribute specifies a file handle to which parse output will be
directed. It is only needed if verbose is positive.

=cut

sub log_file {
  my $self = shift;
  if (@_) {
    $self->{__LOG_FILE} = shift;
  }
  return $self->{__LOG_FILE};
}

=pod


=back


=head2 INSTANCE METHODS

=over

=item $self->read($file_name)

This method will open the MAGE-ML file specified by $file_name and if
the C<handler> attribute is not set, it will create either a SAX2
parser or a SAX1 parser (depending on the value of the C <sax1>
attribute) and parse the file. 

C<read()> can read from STDIN by specifying '-' as the filename. This
enables you to handle compressed XML files:

  gzip -dc file.xml.gz | read.pl [options]

=cut

sub read {
  my ($self,$file) = @_;

  unless ($file eq '-') {
    croak "File '$file' does not exist!\n"
      unless (-f $file);
  }

  my $parser = $self->init();
  my $HANDLER = $self->handler();
  my $LOG = $self->log_file();
  my $VERBOSE = $self->verbose();

  #### Actually do the file parsing and loading
  if ($file eq '-') {
    $parser->parse (XML::Xerces::StdInInputSource->new());
  } else {
    my ($path) = $file =~ m|(.*/)|;
    $HANDLER->dir($path)
      if defined $path;
    $parser->parse (XML::Xerces::LocalFileInputSource->new($file));
  }

  #### Try to process any remaining unhandled objects.  These are
  #### most likely to be references encountered before the
  #### definition of that referenced object, but they might be dangling
  #### references which are permitted with the hope that some other
  #### entity can provide the needed information at some later time.
  ####
  #### Deutsch says: I'm not really thrilled with this way of doing things.
  #### It's a legacy from v1 of this code.  Couldn't we just check before
  #### instantiating an object to see if its identifier is already on the
  #### unhandled list and if so, don't even bother calling new() but rather
  #### flesh out the stub object into what it's really supposed to be?
  #### Deutsch continues: Maybe that wouldn't be any easier... leave it
  #### for now.  DUBIOUS.
  ####
  #### Will this even work if there are multiple unresolved references
  #### of the same type?  FIXME if not or remove this comment.
  print $LOG <<LOG if ($VERBOSE);
-----------------------------------------------\
Looking for any unresolved references:
LOG

  foreach my $identifier (keys %{$HANDLER->unhandled}) {

    print $LOG "Looking for unhandled: $identifier\n"
      if ($VERBOSE);

    my $array_ref = $HANDLER->unhandled->{$identifier};

    #### Each item in unhandled is a two-element array containing the
    #### object and method that needs to be called to make the association
    foreach my $obj_array_ref (@{$array_ref}) {

      #### Obtain the object and method
      my ($method,$object,$class) = @{$obj_array_ref};

      #### If there now is an object with this identifier, make the link
      if (exists $HANDLER->{ID}->{$class}->{$identifier}) {
	print $LOG "There now is corresponding object: $identifier\n"
	  if ($VERBOSE);
	no strict 'refs';

	#### If the place where the reference is supposed to be is in fact
	#### an array, this must be an array of references instead, so deal
	#### with that.  This may be a performance hit if there are thousands
	#### of objects in the array, but it works for now.  DUBIOUS
	my $getter_method = 'get'.ucfirst($method);
	if (ref($object->$getter_method()) eq 'ARRAY') {
	  #### So loop of each element in the array
	  my $list = $object->$getter_method();
	  for (my $i=0;$i<scalar @{$list};$i++) {
	    #### When we find the identifier, make the link
	    if ($list->[$i]->getIdentifier() eq $identifier) {
	      $list->[$i] = $HANDLER->{ID}->{$class}->{$identifier};
	    }
	  }

	  #### Otherwise it's just a single reference so make the link directly
	} else {
	  $method = 'set'.ucfirst($method);
	  $object->$method($HANDLER->{ID}->{$class}->{$identifier});
	}

	#### Delete the identifier from the unhandled list
	delete $HANDLER->unhandled->{$identifier};


	#### Otherwise this identifier must not be in the document which
	#### is allowed.  It may mean that the data are just stored someplace
	#### else, or that it could indicate a mistake.
      } else {
	my $class_name = $object->class_name();
	print STDERR "WARNING: There is an unresolved ".
	  "$method '$identifier'\n" if ($VERBOSE);
      }

    }

  }



  #### If we're verbose mode, print $LOG out a good bit of information
  #### about what's sitting in the HANDLER hash
  if ($VERBOSE) {
    print $LOG "\n-------------------------------------------------\n";
    my ($key,$value);
    my ($key2,$value2);

    #### Print $LOG out all the items in the HANDLER hash
    print $LOG "HANDLER:\n";
    while (($key,$value) = each %{$HANDLER}) {
      print $LOG "HANDLER->{$key} = $value:\n";
    }

    print $LOG "\n";
    #### Loop over the various items in the HANDLER hash
    #### and print $LOG out details about them
    while (($key,$value) = each %{$HANDLER}) {
      print $LOG "HANDLER->{$key}:\n";

      if ($key eq "ID" or $key eq "UNHANDLED" or $key eq "PACKAGES") {
	while (($key2,$value2) = each %{$HANDLER->{$key}}) {
	  print $LOG "  $key2 = $value2\n";
	}
      } elsif ($key eq "OBJ_STACK" or $key eq "ASSN_STACK") {
	foreach $key2 (@{$HANDLER->{$key}}) {
	  print $LOG "  $key2\n";
	}
      } elsif ($key eq "MAGE" || $key eq 'CLASS2FULLCLASS') {
	#### Skip this one
      } else {
	foreach $key2 (@{$HANDLER->{$key}}) {
	  print $LOG "  $key2\n";
	}
      }

    }

  }


  #### Obtain the MAGE object from the HANDLER
  my $mage = $HANDLER->{MAGE};


  #### If there was no MAGE object defined, compain noisily but press on
  unless ($mage) {
    croak <<ERR;
ERROR: This MAGE-ML document has no top <MAGE-ML> tag! 
This should never happen.  complain to your MAGE-ML provider.
For now, I will pretend there was one with an identifier 'MISSING'.
ERR
  }


  #### Loop over each of the non-standard items in the HANDLER
  #### (which are objects without parents that still need to be registered
  #### in the current scheme DUBIOUS see above) and assume that they
  #### need to be registered
  while ( my ($key,$value) = each %{$HANDLER}) {
    if ($key ne "UNHANDLED" && $key ne "ID" && $key ne "OBJ_STACK" &&
	$key ne "ASSN_STACK" && $key ne "MAGE" &&
        $key ne "PACKAGE_STACK" && $key ne "PACKAGES" &&
        $key ne "DIR" && 
        $key ne "CLASS2FULLCLASS" && $key ne 'VERBOSE') {
      print $LOG "Adding to MAGE:  HANDLER->{$key} = $value->[0]:\n" if ($VERBOSE);
      #### Uncommented because they must already be Indentifiable
      #### at this point? DUBIOUS
      #if ($value->[0]->isa('Bio::MAGE::Identifiable')) {
      $mage->add_objects($value);
      #}

    }
  }
  return $mage;
}

sub init {
  my $self = shift;

  my $HANDLER;
  my $parser;
  if ($self->sax1) {
    $parser = XML::Xerces::SAXParser->new();
    $parser->setValidationScheme($XML::Xerces::SAXParser::Val_Always);
    $parser->setDoNamespaces(0);
    $parser->setDoSchema(0);
    if (defined $self->handler()) {
      $HANDLER = $self->handler();
    } else {
      $HANDLER = Bio::MAGE::DocumentHandler->new();
      $self->handler($HANDLER);
    }
    $parser->setDocumentHandler($HANDLER);
  } else {
    $parser = XML::Xerces::XMLReaderFactory::createXMLReader();
    $parser->setFeature("http://xml.org/sax/features/namespaces", 0);
    $parser->setFeature("http://xml.org/sax/features/validation", 1);
    $parser->setFeature("http://apache.org/xml/features/validation/dynamic", 0);
    if (defined $self->handler()) {
      $HANDLER = $self->handler();
    } else {
      $HANDLER = Bio::MAGE::ContentHandler->new();
      $self->handler($HANDLER);
    }
    $parser->setContentHandler($HANDLER);
  }
  $HANDLER->init();
  if ($self->verbose) {
    $HANDLER->verbose(1);
    $HANDLER->log_file($self->log_file);
  }

  my $error_handler = XML::Xerces::PerlErrorHandler->new();
  $parser->setErrorHandler($error_handler);

  return $parser;
}

=pod

=back

=cut

###############################################################################
# Bio::MAGE::Handler package: Callbacks to process elements as they come
#                    from the SAX or SAX2 parser
###############################################################################
package Bio::MAGE::Handler;
use vars qw($COUNT);
use strict;

$COUNT = 0;

###############################################################################
# new: initialize the content handler
###############################################################################
sub init {
  my $self = shift;
  $self->object_stack([]);
  $self->assn_stack([]);
  $self->package_stack([]);
  $self->unhandled({});
  $self->packages({});
  $self->verbose(0)
    unless defined $self->verbose;
}

sub verbose {
  my $self = shift;
  if (scalar @_) {
    $self->{VERBOSE} = shift;
  }
  return $self->{VERBOSE};
}

sub dir {
  my $self = shift;
  if (scalar @_) {
    $self->{DIR} = shift;
  }
  return $self->{DIR};
}

sub log_file {
  my $self = shift;
  if (scalar @_) {
    $self->{LOG_FILE} = shift;
  }
  return $self->{LOG_FILE};
}

###############################################################################
# object_stack: setter/getter for the stack on which objects are placed
###############################################################################
sub object_stack {
  my $self = shift;
  #### If an argument was supplied (should be an array ref), set it
  if (scalar @_) {
    $self->{OBJ_STACK} = shift;
  }
  #### Return a reference to the stack
  return $self->{OBJ_STACK};
}


###############################################################################
# assn_stack: setter/getter for the stack on which associations are placed
###############################################################################
sub assn_stack {
  my $self = shift;
  #### If an argument was supplied (should be an array ref), set it
  if (scalar @_) {
    $self->{ASSN_STACK} = shift;
  }
  #### Return a reference to the stack
  return $self->{ASSN_STACK};
}


###############################################################################
# package_stack: setter/getter for the stack on which packages are placed
###############################################################################
sub package_stack {
  my $self = shift;
  #### If an argument was supplied (should be an array ref), set it
  if (scalar @_) {
    $self->{PACKAGE_STACK} = shift;
  }
  #### Return a reference to the stack
  return $self->{PACKAGE_STACK};
}


###############################################################################
# unhandled: setter/getter for the hash into which unhandled references
#            are placed
###############################################################################
sub unhandled {
  my $self = shift;
  #### If an argument was supplied (should be a hash ref), set it
  if (scalar @_) {
    $self->{UNHANDLED} = shift;
  }
  #### Return a reference to the hash
  return $self->{UNHANDLED};
}


###############################################################################
# packages: setter/getter for the hash into which packages are placed.
#           This hash is probably superfluous?
###############################################################################
sub packages {
  my $self = shift;
  #### If an argument was supplied (should be a hash ref), set it
  if (scalar @_) {
    $self->{PACKAGES} = shift;
  }
  #### Return a reference to the hash
  return $self->{PACKAGES};
}


###############################################################################
# handle_ref
###############################################################################
sub handle_ref {
  my ($self,$class,$identifier) = @_;

  #### Determine the full class name from the class
  my $full_class_name = $self->{CLASS2FULLCLASS}->{$class};

  #### Try to obtain the object that is referenced
  my $obj = $self->{ID}->{$full_class_name}->{$identifier};

  #### If the referenced object doesn't exist, then create a new object
  #### with that name with the hope that we'll find it later in the document,
  #### and if we don't, we'll still be left with an empty object of the
  #### appropriate type
  unless (defined $obj) {
    #### Get the object expecting resolution
    my $expecting_obj = $self->object_stack->[-1];

    #### Get the name of the container
    my $method = lcfirst($self->assn_stack()->[-1]->{assn_name}) ||
      die "ASSN_STACK doesn't have $identifier on top!";

    #### return a reference to an otherwise empty object with just the
    #### correct identifier and suitably obtuse name
    $obj =  $full_class_name->new(identifier=>$identifier,
      name=>"Unresolved $class Reference");

    #### Push it on the unhandled list so that we know what all the problem
    #### references are for later resolution or reporting
    push(@{$self->unhandled->{$identifier}},
      [$method,$expecting_obj,$full_class_name]);
  }

  #### Return the object
  return $obj;
}


###############################################################################
# get_quantitation_type_dimension
###############################################################################
sub get_quantitation_type_dimension {
  my ($self) = @_;
  my $bioassay = $self->object_stack->[-2];
  die "Expected BioAssayData but got: $bioassay"
    unless $bioassay->isa('Bio::MAGE::BioAssayData::BioAssayData');
  return scalar @{$bioassay->getQuantitationTypeDimension->getQuantitationTypes()};
}


###############################################################################
# get_design_element_dimension
###############################################################################
sub get_design_element_dimension {
  my ($self) = @_;
  my $bioassay = $self->object_stack->[-2];
  die "Expected BioAssayData but got: $bioassay"
    unless $bioassay->isa('Bio::MAGE::BioAssayData::BioAssayData');
  return scalar @{$bioassay->getDesignElementDimension->getContainedFeatures()};
}


###############################################################################
# get_bioassay_dimension
###############################################################################
sub get_bioassay_dimension {
  my ($self) = @_;
  my $bioassay = $self->object_stack->[-2];
  die "Expected BioAssayData but got: $bioassay"
    unless $bioassay->isa('Bio::MAGE::BioAssayData::BioAssayData');
  return scalar @{$bioassay->getBioAssayDimension->getBioAssays()};
}


###############################################################################
# get_cube
###############################################################################
sub get_cube {
  my ($self,$order,$string) = @_;
  my %index;
  $index{B} = $self->get_bioassay_dimension();
  $index{Q} = $self->get_quantitation_type_dimension();
  $index{D} = $self->get_design_element_dimension();
  my ($a,$b,$c) = split('', $order);
  my ($i_lim,$j_lim,$k_lim);
  $i_lim = $index{$a};
  $j_lim = $index{$b};
  $k_lim = $index{$c};
  my @bad;
  $string =~ s/\n/\t/g;
  my @list = split("\t",$string);
  for (my $i=0;$i<$i_lim;$i++) {
    my $ded = [];
    for (my $j=0;$j<$j_lim;$j++) {
      my $qtd = [];
      for (my $k=0;$k<$k_lim;$k++) {
	my $item = shift(@list);
	$item =~ s/&space;/ /g;
	push(@{$qtd},$item);
      }
      push(@{$ded},$qtd);
    }
    push(@bad,$ded);
  }
  return \@bad;
}


###############################################################################
# start_element: SAX callback function for handling a XML start element
###############################################################################
sub start_element {
  my ($self,$localname,$attrs) = @_;

  #### Dereference the attributes hash
  my %attrs = %{$attrs};
  my $LOG = $self->log_file();
  my $VERBOSE = $self->verbose();

  #### Special handling for DataInternal or DataExternal
  my $filename_uri;
  if ($localname eq 'DataInternal') {
    $self->{DATA} = '';
    return;

  } elsif ($localname eq 'DataExternal') {
    # we had to wait until we had pushed the tag onto the object stack
    if ($attrs{filenameURI}) {
      local $/;			# enable slurp mode
      my $file;
      $file = $self->dir() . '/' if $self->dir;
      $file .= $attrs{filenameURI};
      open(DATA, $file)
	or die "Couldn't open $file for reading";
      my $data = <DATA>;	# slurp whole file
      my $bio_data_cube = $self->object_stack->[-1];
      die "Expected a Bio::MAGE::BioAssayData::BioDataCube but got $bio_data_cube"
	unless $bio_data_cube->isa('Bio::MAGE::BioAssayData::BioDataCube');
      $bio_data_cube->setCube($self->get_cube($attrs{order},$data));
    }
    return;
  } elsif (scalar @{$self->object_stack} and
	   UNIVERSAL::isa($self->object_stack->[-1],
			  'Bio::MAGE::BioAssayData::BioDataTuples')) {
    # Handle BioDataTuples

    # if we're a <*_ref>, keep track of the element
    if ($localname =~ /_ref/) {
      #### Determine the name of the referenced class
      my $refclass = $localname;
      $refclass =~ s/_ref$//;
      my $refinstance = $self->handle_ref($refclass,$attrs{identifier});
      my $key;
      if ($refinstance->isa('Bio::MAGE::BioAssay::BioAssay')) {
	$key = 'bioAssay';
      } elsif ($refinstance->isa('Bio::MAGE::QuantitationType::QuantitationType')) {
	$key = 'quantitationType';
      } elsif ($refinstance->isa('Bio::MAGE::DesignElement::DesignElement')) {
	$key = 'designElement';
      } else {
	die "Bad ref element when handling BioDataTuples: $localname, with id: $attrs{identifier}";
      }
      $self->{BioDataTuples}{$key} = $refinstance;
    } elsif ($localname eq 'Datum') {
      # if we're a <Datum> add it
      $attrs{bioAssay} = $self->{BioDataTuples}{bioAssay};
      $attrs{quantitationType} = $self->{BioDataTuples}{quantitationType};
      $attrs{designElement} = $self->{BioDataTuples}{designElement};

      foreach my $key (qw(value
			  bioAssay
			  designElement
			  quantitationType)) {
	die "No $key defined for datum"
	  unless defined $attrs{$key};	
      }

      my $obj = Bio::MAGE::BioAssayData::BioAssayDatum->new(%attrs);
      $self->object_stack->[-1]->addBioAssayTupleData($obj);
    }
    return;
  }

  #### Top level tag MAGE-ML signals creation of MAGE object
  if ($localname eq 'MAGE-ML') {
    print $LOG "<$localname> Begin the MAGE-ML document\n" if ($VERBOSE);

    #### Simply create the MAGE object with the supplied attributes
    $self->{MAGE} = Bio::MAGE->new(%attrs);

    #### Obtain the full class path lookup hash and store it for reuse
    my %class2fullclass = Bio::MAGE->class2fullclass();
    $self->{'CLASS2FULLCLASS'} = \%class2fullclass;


  #### If there's no underscore in the tag, it must be a class
  #### This seems a little flimsy, but as long as the OM/ML follows this
  #### convention, this will work.  DUBIOUS.
  } elsif ($localname !~ /_/) {
    print $LOG "\n<$localname> has attributes:\n" if ($VERBOSE);

    #### Determine the parent object (if there is one)
    my $parent = $self->object_stack->[-1];

    #### Determine the full class name from the class
    my $class = $self->{CLASS2FULLCLASS}->{$localname};


    #### Create the object and push it onto object stack
    my $instance = $class->new(%attrs);
    push(@{$self->object_stack},$instance);
    print $LOG "    I am $instance\n" if ($VERBOSE);


    #### If object is identifiable, then add its identifier to ID hash
    if ($instance->isa('Bio::MAGE::Identifiable')) {

      #### For the moment, we have made the rule that any single document
      #### must have all totally unique identifiers.  We crash if this
      #### is ever violated.  DUBIOUS.
      if ($self->{ID}->{$class}->{$attrs{identifier}}) {
        die "ERROR: duplicate identifier '$attrs{identifier}'." .
          "Identifiers must be unique for a given class within a document!\n";

      #### Add this object to the ID hash under its indentifier
      } else {
        $self->{ID}->{$class}->{$attrs{identifier}} = $instance;
      }

    }

    #### If we have a parent, then associate with it
    if ($parent) {

      #### Get the information about the container assn
      my $assn = $self->assn_stack()->[-1];
      print $LOG "    and has parent $parent\n" if ($VERBOSE);

      #### If only a single reference is allowed, then just set it
      if ($assn->{assn_type} =~ /SINGLE/) {
        my $method = 'set'.$assn->{assn_name};
        print $LOG "   so set parent attribute $method = $instance\n" if ($VERBOSE);
        $self->object_stack->[-2]->$method($instance);

      #### If multiple references are allowed, store the list as an array
      } elsif ($assn->{assn_type} =~ /LIST/) {
        my $method = 'add'.$assn->{assn_name};
        $self->object_stack->[-2]->$method($instance);

      #### If neither SINGLE or LIST, we're hopelessly confused
      } else {
        die "INTERNAL ERROR: Unknown ASSNTYPE: '$assn->{assn_type}'\n";
      }


    #### Otherwise, if there's no parent, then push this object onto a
    #### CONTENT_HANDLER list named for the plural of its container name.  This
    #### Will be used later to register these objects with the MAGE class.
    #### Why don't we just register them here instead of waiting??? DUBIOUS
    } else {
      #### Determine the name of the container association
      my $assn_name = $self->assn_stack->[-1]->{assn_name};
      #### Make the name plural unless it already ends in 's' ?!  DUBIOUS
      $assn_name .= "s" unless ($assn_name =~ /s$/);
      #### Push onto list
      push(@{$self->{$assn_name}},$instance);
      print $LOG "    and has no parent object\n" if ($VERBOSE);
    }


    #### Print $LOG out the associations for this class for fun if very verbose
    if ($VERBOSE > 1) {
      my ($association,$key,$value);
      my %associations = $instance->associations();
      print $LOG "    and also has associations: \n";
      while ( ($key,$value) = each %associations) {
        print $LOG "\t$key = $value\n";
      }
    }


  #### Otherwise, if the tag is a "_package" then just register it with
  #### the CONTENT_HANDLER and push it onto a package stack.
  #### This part is probably totally unnecessary.  DUBIOUS
  } elsif ($localname =~ /_package$/) {

    #### Determine the package name
    my $package_name = $localname;
    $package_name =~ s/_package//;
    print $LOG "\n<$localname> is package $package_name\n" if ($VERBOSE);

    #### Determine the class and create the object
    my $class = "Bio::MAGE::$package_name";
    my $instance = $class->new();

    #### Push this package onto the stack
    my $entity = { package_name=>"$package_name" };
    push(@{$self->package_stack},$entity);

    #### Add this to our collection of PACKAGES.  Not very useful
    #### probably, but maybe someone will find a use for it.  DUBIOUS
    $self->packages()->{$package_name} = $instance;


  #### If the tag is a "_assn" then push the name of it and its type
  #### onto the assn_stack for later use
  #### The "_assn" tag indicates a container for a single item
  } elsif ($localname =~ /_assn$/) {
    print $LOG "\n<$localname> (Container for a single item)\n" if ($VERBOSE);
    my $assn_name = $localname;
    $assn_name =~ s/_assn$//;
    my $assn = { assn_name=>"$assn_name", assn_type=>"SINGLE" };
    push(@{$self->assn_stack},$assn);


  #### If the tag is a "_assnlist" then push the name of it and its type
  #### onto the assn_stack for later use
  #### The "_assnlist" tag indicates a container for a list of items
  } elsif ($localname =~ /_assnlist$/) {
    print $LOG "\n<$localname> (Container for a list of items)\n" if ($VERBOSE);
    my $assn_name = $localname;
    $assn_name =~ s/_assnlist$//;
    my $assn = { assn_name=>"$assn_name", assn_type=>"LIST" };
    push(@{$self->assn_stack},$assn);


  #### If the tag is a "_assnref" then push the name of it and its type
  #### onto the assn_stack for later use
  #### The "_assnref" tag indicates a container for a single reference
  } elsif ($localname =~ /_assnref$/) {
    print $LOG "\n<$localname> (Container for a single reference)\n" if ($VERBOSE);
    my $assn_name = $localname;
    $assn_name =~ s/_assnref$//;
    my $assn = { assn_name=>"$assn_name", assn_type=>"SINGLE" };
    push(@{$self->assn_stack},$assn);


  #### If the tag is a "_assnreflist" then push the name of it and its type
  #### onto the assn_stack for later use
  #### The "_assnreflist" tag indicates a container for a list of references
  } elsif ($localname =~ /_assnreflist$/) {
    print $LOG "\n<$localname> (Container for a list of references)\n"
      if ($VERBOSE);
    my $assn_name = $localname;
    $assn_name =~ s/_assnreflist$//;
    my $assn = { assn_name=>"$assn_name", assn_type=>"LIST" };
    push(@{$self->assn_stack},$assn);


  #### If the tag is a "_ref" then we need to store the reference(s) in
  #### the parent object
  } elsif ($localname =~ /_ref$/) {
    print $LOG "\n<$localname> is a reference\n" if ($VERBOSE);

    #### Determine the name of the referenced class
    my $refclass = $localname;
    $refclass =~ s/_ref$//;

    #### Determine the parent object
    my $parent = $self->object_stack->[-1];
    print $LOG "\tMy parent is $parent\n" if ($VERBOSE);

    #### Get the instance of the referenced object.  This function
    #### will always return something even if it has to create a dummy
    #### object to refer to.
    my $refinstance = $self->handle_ref($refclass,$attrs{identifier});

    #### Get the information about the container assn
    my $assn = $self->assn_stack()->[-1];

    #### Determine the method name used to store the reference(s)
    my $method = 'add' . ucfirst($assn->{assn_name});

    #### If only a single reference is allowed, then just set it
    if ($assn->{assn_type} =~ /SINGLE/) {
      $method = 'set'.$assn->{assn_name};
      print $LOG "\tSet parent's attribute $method = $refinstance\n" if ($VERBOSE);
      {
        no strict 'refs';
        $self->object_stack->[-1]->$method($refinstance);
      }

    #### If multiple references are allowed, store the list as an array
    } elsif ($assn->{assn_type} =~ /LIST/) {
      $method = 'add'.$assn->{assn_name};
      print $LOG "\tAdd parent's attribute $method = $refinstance\n" if ($VERBOSE);
      {
        no strict 'refs';
        $self->object_stack->[-1]->$method($refinstance);
      }


    #### If neither SINGLE or LIST, we're hopelessly confused
    } else {
      die "ERROR: Unknown ASSNTYPE: '$assn->{assn_type}'\n";
    }


  #### Otherwise, confess we don't know what to do with this type of element
  #### This should never happen
  } else {
    die "ERROR: <$localname> Don't know what to do with <$localname>\n";
  }

}


###############################################################################
# characters: SAX callback function for handling character data in an element
###############################################################################
sub characters {
  my ($self,$string,$len) = @_;
#   print $self->log_file() "Characters called with $len characters\n";
  return unless exists $self->{DATA};
  $self->{DATA} .= $string;
}

###############################################################################
# end_element: SAX callback function for handling a XML end element
###############################################################################
sub end_element {
  my ($self,$localname) = @_;

  #### Special case of BioDataCube data
  if ($localname eq 'DataExternal') {
    return;
  } elsif ($localname eq 'DataInternal') {
    my $bio_data_cube = $self->object_stack->[-1];
    die "Expected a Bio::MAGE::BioDataCube but got $bio_data_cube"
      unless $bio_data_cube->isa('Bio::MAGE::BioAssayData::BioDataCube');
    $bio_data_cube->setCube($self->get_cube($self->{DATA}));
    delete $self->{DATA};
    return;
  } elsif ($localname eq 'BioDataTuples') {
      delete $self->{BioDataTuples}
  } elsif (scalar @{$self->object_stack} and
	   UNIVERSAL::isa($self->object_stack->[-1],
			  'Bio::MAGE::BioAssayData::BioDataTuples')) {
    # do nothing
    return;
  }

  #### If finishing a _assn* element, pop it off the assn_stack
  if ($localname =~ /_assn$/       or
      $localname =~ /_assnlist$/   or
      $localname =~ /_assnref$/    or
      $localname =~ /_assnreflist$/ ) {

    #### Determine the association name
    my $assn = $self->assn_stack()->[-1];
    my $assn_name = $assn->{assn_name};
    $assn_name =~ s/_assn[a-z]*$//;

    #### If there's something on the stack
    if (scalar @{$self->assn_stack()}) {

      #### If the top object on the stack is the correct one, pop it off
      if ($self->assn_stack()->[-1]->{assn_name} eq $assn_name) {
        pop(@{$self->assn_stack});

      #### Otherwise, die bitterly
      } else {
        my $problem = $self->assn_stack()->[-1]->{assn_name};
        die "ERROR: Wanted to pop '$assn_name' off the ASSN_STACK, ".
          "but instead I found '$problem'! ".
          "This should never happen.\n";
      }

    #### but if there's nothing on the stack and we got here, die bitterly
    } else {
      die "ERROR: Wanted to pop '$assn_name' off the ASSN_STACK, ".
        "but there's nothing on the stack at all! ".
        "This should never happen.\n";
    }


  #### If finishing a _package element, pop it off the package_stack
  } elsif ($localname =~ /_package$/ ) {

    #### Determine the association name
    my $entity = $self->package_stack()->[-1];
    my $package_name = $entity->{package_name};
    $package_name =~ s/_package$//;

    #### If there's something on the stack
    if (scalar @{$self->package_stack()}) {

      #### If the top object on the stack is the correct one, pop it off
      if ($self->package_stack()->[-1]->{package_name} eq $package_name) {
        pop(@{$self->package_stack});

      #### Otherwise, die bitterly
      } else {
        my $problem = $self->package_stack()->[-1]->{package_name};
        die "ERROR: Wanted to pop '$package_name' off the PACKAGE_STACK, ".
          "but instead I found '$problem'! ".
          "This should never happen.\n";
      }

    #### but if there's nothing on the stack and we got here, die bitterly
    } else {
      die "ERROR: Wanted to pop '$package_name' off the PACKAGE_STACK, ".
        "but there's nothing on the stack at all! ".
        "This should never happen.\n";
    }


  #### Otherwise see if it's just a plain object
  #### This is based on the assumption that plain objects have no
  #### underscores!! DUBIOUS
  } elsif (!($localname =~ /_/) && !($localname =~ /MAGE-ML/)) {

    #### If there's an object on the stack consider popping it off
    if (scalar @{$self->object_stack()}){

      #### Determine the full class name from the class
      my $full_class_name = $self->{CLASS2FULLCLASS}->{$localname};

      #### If the top object on the stack is the correct one, pop it off
      if ($self->object_stack->[-1]->class_name eq $full_class_name) {
        pop(@{$self->object_stack});

      #### Otherwise, die bitterly
      } else {
        my $problem = $self->object_stack->[-1]->class_name;
        die "ERROR: Wanted to pop '$full_class_name' off the ".
          "OBJECT_STACK, but instead I found '$problem'! ".
          "This should never happen.\n";
      }

    #### but if there's nothing on the stack and we got here, die bitterly
    } else {
      die "ERROR: Wanted to pop 'Bio::MAGE::$localname' off the ".
        "OBJECT_STACK, ".
        "but there's nothing on the stack at all! ".
        "This should never happen.\n";
    }

  #### Otherwise, I'll assume we're just ending an uninteresting element
  } else {
    #### Nothing to do
  }

}


###############################################################################
# Bio::MAGE::DocumentHandler package: Callbacks to process elements as they come
#                           from the SAX parser
###############################################################################
package Bio::MAGE::DocumentHandler;
use strict;
use vars qw(@ISA);
@ISA = qw(XML::Xerces::PerlDocumentHandler Bio::MAGE::Handler);

sub start_element {
  my ($self,$localname,$attrs) = @_;
  my %attrs = $attrs->to_hash();
  Bio::MAGE::Handler::start_element($self,$localname,\%attrs);
}

sub end_element {
  Bio::MAGE::Handler::end_element(@_);
}

sub characters {
  Bio::MAGE::Handler::characters(@_);
}


###############################################################################
# ContentHandler package: Callbacks to process elements as they come
#                           from the SAX2 parser
###############################################################################
package Bio::MAGE::ContentHandler;
use strict;
use vars qw(@ISA);
@ISA = qw(XML::Xerces::PerlContentHandler Bio::MAGE::Handler);

sub start_element {
  my ($self,$uri,$localname,$qname,$attrs) = @_;

  my %attrs = $attrs->to_hash();
  foreach my $key (keys %attrs) {
    $attrs{$key} = $attrs{$key}->{value};
  }
  Bio::MAGE::Handler::start_element($self,$localname,\%attrs);
}

sub end_element {
  my ($self,$uri,$localname,$qname) = @_;
  Bio::MAGE::Handler::end_element($self,$localname);
}

sub characters {
  Bio::MAGE::Handler::characters(@_);
}

1;

