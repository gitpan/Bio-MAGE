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
