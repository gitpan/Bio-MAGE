# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//Experiment_package.t'

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

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..12\n"; }
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

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::Experiment::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
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

# test the addExperiment() method
$experiment->addExperiment($classes{Experiment});
result(UNIVERSAL::isa($experiment->getExperiment_list,'ARRAY') &&
       scalar @{$experiment->getExperiment_list}
      );

