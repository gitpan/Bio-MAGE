# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//Measurement_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..14\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::Measurement;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::Measurement->classes();
result(scalar @classes eq 9);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::Measurement::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $measurement = Bio::MAGE::Measurement->new();
result(is_object($measurement) 
       and $measurement->isa("Bio::MAGE::Measurement"));

# test the tagname method
result(defined $measurement->tagname);

# test the mageml_lists method
result(defined $measurement->mageml_lists);


