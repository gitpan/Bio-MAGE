# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//BioEvent_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..7\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::BioEvent;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::BioEvent->classes();
result(scalar @classes eq 2);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::BioEvent::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $bioevent = Bio::MAGE::BioEvent->new();
result(is_object($bioevent) 
       and $bioevent->isa("Bio::MAGE::BioEvent"));

# test the tagname method
result(defined $bioevent->tagname);

# test the mageml_lists method
result(defined $bioevent->mageml_lists);


