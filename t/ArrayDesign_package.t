# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//ArrayDesign_package.t'

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

BEGIN { $| = 1; print "1..23\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::ArrayDesign;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::ArrayDesign->classes();
result(scalar @classes eq 9);

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::ArrayDesign::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
  }
}
my $arraydesign = Bio::MAGE::ArrayDesign->new();
result(is_object($arraydesign) 
       and $arraydesign->isa("Bio::MAGE::ArrayDesign"));

# test the tagname method
result(defined $arraydesign->tagname);

# test the mageml_lists method
result(defined $arraydesign->mageml_lists);


# test the reportergroup_list method
$arraydesign->reportergroup_list([]);
result(UNIVERSAL::isa($arraydesign->reportergroup_list,'ARRAY') &&
       not scalar @{$arraydesign->reportergroup_list}
      );

# test the getReporterGroup_list method
result(UNIVERSAL::isa($arraydesign->getReporterGroup_list,'ARRAY') &&
       not scalar @{$arraydesign->getReporterGroup_list}
      );

# test the addReporterGroup() method
$arraydesign->addReporterGroup($classes{ReporterGroup});
result(UNIVERSAL::isa($arraydesign->getReporterGroup_list,'ARRAY') &&
       scalar @{$arraydesign->getReporterGroup_list}
      );

# test the compositegroup_list method
$arraydesign->compositegroup_list([]);
result(UNIVERSAL::isa($arraydesign->compositegroup_list,'ARRAY') &&
       not scalar @{$arraydesign->compositegroup_list}
      );

# test the getCompositeGroup_list method
result(UNIVERSAL::isa($arraydesign->getCompositeGroup_list,'ARRAY') &&
       not scalar @{$arraydesign->getCompositeGroup_list}
      );

# test the addCompositeGroup() method
$arraydesign->addCompositeGroup($classes{CompositeGroup});
result(UNIVERSAL::isa($arraydesign->getCompositeGroup_list,'ARRAY') &&
       scalar @{$arraydesign->getCompositeGroup_list}
      );

# test the arraydesign_list method
$arraydesign->arraydesign_list([]);
result(UNIVERSAL::isa($arraydesign->arraydesign_list,'ARRAY') &&
       not scalar @{$arraydesign->arraydesign_list}
      );

# test the getArrayDesign_list method
result(UNIVERSAL::isa($arraydesign->getArrayDesign_list,'ARRAY') &&
       not scalar @{$arraydesign->getArrayDesign_list}
      );

# test the addArrayDesign() method
$arraydesign->addArrayDesign($classes{ArrayDesign});
result(UNIVERSAL::isa($arraydesign->getArrayDesign_list,'ARRAY') &&
       scalar @{$arraydesign->getArrayDesign_list}
      );

