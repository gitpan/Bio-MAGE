# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//Array_package.t'

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

BEGIN { $| = 1; print "1..24\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::Array;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::Array->classes();
result(scalar @classes eq 10);

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::Array::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
  }
}
my $array = Bio::MAGE::Array->new();
result(is_object($array) 
       and $array->isa("Bio::MAGE::Array"));

# test the tagname method
result(defined $array->tagname);

# test the mageml_lists method
result(defined $array->mageml_lists);


# test the arraygroup_list method
$array->arraygroup_list([]);
result(UNIVERSAL::isa($array->arraygroup_list,'ARRAY') &&
       not scalar @{$array->arraygroup_list}
      );

# test the getArrayGroup_list method
result(UNIVERSAL::isa($array->getArrayGroup_list,'ARRAY') &&
       not scalar @{$array->getArrayGroup_list}
      );

# test the addArrayGroup() method
$array->addArrayGroup($classes{ArrayGroup});
result(UNIVERSAL::isa($array->getArrayGroup_list,'ARRAY') &&
       scalar @{$array->getArrayGroup_list}
      );

# test the array_list method
$array->array_list([]);
result(UNIVERSAL::isa($array->array_list,'ARRAY') &&
       not scalar @{$array->array_list}
      );

# test the getArray_list method
result(UNIVERSAL::isa($array->getArray_list,'ARRAY') &&
       not scalar @{$array->getArray_list}
      );

# test the addArray() method
$array->addArray($classes{Array});
result(UNIVERSAL::isa($array->getArray_list,'ARRAY') &&
       scalar @{$array->getArray_list}
      );

# test the arraymanufacture_list method
$array->arraymanufacture_list([]);
result(UNIVERSAL::isa($array->arraymanufacture_list,'ARRAY') &&
       not scalar @{$array->arraymanufacture_list}
      );

# test the getArrayManufacture_list method
result(UNIVERSAL::isa($array->getArrayManufacture_list,'ARRAY') &&
       not scalar @{$array->getArrayManufacture_list}
      );

# test the addArrayManufacture() method
$array->addArrayManufacture($classes{ArrayManufacture});
result(UNIVERSAL::isa($array->getArrayManufacture_list,'ARRAY') &&
       scalar @{$array->getArrayManufacture_list}
      );

