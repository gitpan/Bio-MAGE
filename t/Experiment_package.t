# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//Experiment_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..11\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::Experiment;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::Experiment->classes();
result(scalar @classes eq 4);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::Experiment::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $experiment = Bio::MAGE::Experiment->new();
result(is_object($experiment) 
       and $experiment->isa("Bio::MAGE::Experiment"));

# test the tagname method
result(defined $experiment->tagname);

# test the mageml_lists method
result(defined $experiment->mageml_lists);


# test the experiment_list method
$experiment->experiment_list([]);
result(UNIVERSAL::isa($experiment->experiment_list,'ARRAY') &&
       not scalar @{$experiment->experiment_list}
      );

# test the getExperiment_list method
result(UNIVERSAL::isa($experiment->getExperiment_list,'ARRAY') &&
       not scalar @{$experiment->getExperiment_list}
      );


