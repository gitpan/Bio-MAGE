# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//HigherLevelAnalysis_package.t'

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
use Bio::MAGE::HigherLevelAnalysis;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::HigherLevelAnalysis->classes();
result(scalar @classes eq 4);

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::HigherLevelAnalysis::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
  }
}
my $higherlevelanalysis = Bio::MAGE::HigherLevelAnalysis->new();
result(is_object($higherlevelanalysis) 
       and $higherlevelanalysis->isa("Bio::MAGE::HigherLevelAnalysis"));

# test the tagname method
result(defined $higherlevelanalysis->tagname);

# test the mageml_lists method
result(defined $higherlevelanalysis->mageml_lists);


# test the bioassaydatacluster_list method
$higherlevelanalysis->bioassaydatacluster_list([]);
result(UNIVERSAL::isa($higherlevelanalysis->bioassaydatacluster_list,'ARRAY') &&
       not scalar @{$higherlevelanalysis->bioassaydatacluster_list}
      );

# test the getBioAssayDataCluster_list method
result(UNIVERSAL::isa($higherlevelanalysis->getBioAssayDataCluster_list,'ARRAY') &&
       not scalar @{$higherlevelanalysis->getBioAssayDataCluster_list}
      );

# test the addBioAssayDataCluster() method
$higherlevelanalysis->addBioAssayDataCluster($classes{BioAssayDataCluster});
result(UNIVERSAL::isa($higherlevelanalysis->getBioAssayDataCluster_list,'ARRAY') &&
       scalar @{$higherlevelanalysis->getBioAssayDataCluster_list}
      );

