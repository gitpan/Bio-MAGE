# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//QuantitationType_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..19\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::QuantitationType;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::QuantitationType->classes();
result(scalar @classes eq 12);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::QuantitationType::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $quantitationtype = Bio::MAGE::QuantitationType->new();
result(is_object($quantitationtype) 
       and $quantitationtype->isa("Bio::MAGE::QuantitationType"));

# test the tagname method
result(defined $quantitationtype->tagname);

# test the mageml_lists method
result(defined $quantitationtype->mageml_lists);


# test the quantitationtype_list method
$quantitationtype->quantitationtype_list([]);
result(UNIVERSAL::isa($quantitationtype->quantitationtype_list,'ARRAY') &&
       not scalar @{$quantitationtype->quantitationtype_list}
      );

# test the getQuantitationType_list method
result(UNIVERSAL::isa($quantitationtype->getQuantitationType_list,'ARRAY') &&
       not scalar @{$quantitationtype->getQuantitationType_list}
      );


