# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//BioMaterial_package.t'

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

BEGIN { $| = 1; print "1..19\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::BioMaterial;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::BioMaterial->classes();
result(scalar @classes eq 8);

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::BioMaterial::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
  }
}
my $biomaterial = Bio::MAGE::BioMaterial->new();
result(is_object($biomaterial) 
       and $biomaterial->isa("Bio::MAGE::BioMaterial"));

# test the tagname method
result(defined $biomaterial->tagname);

# test the mageml_lists method
result(defined $biomaterial->mageml_lists);


# test the compound_list method
$biomaterial->compound_list([]);
result(UNIVERSAL::isa($biomaterial->compound_list,'ARRAY') &&
       not scalar @{$biomaterial->compound_list}
      );

# test the getCompound_list method
result(UNIVERSAL::isa($biomaterial->getCompound_list,'ARRAY') &&
       not scalar @{$biomaterial->getCompound_list}
      );

# test the addCompound() method
$biomaterial->addCompound($classes{Compound});
result(UNIVERSAL::isa($biomaterial->getCompound_list,'ARRAY') &&
       scalar @{$biomaterial->getCompound_list}
      );

# test the biomaterial_list method
$biomaterial->biomaterial_list([]);
result(UNIVERSAL::isa($biomaterial->biomaterial_list,'ARRAY') &&
       not scalar @{$biomaterial->biomaterial_list}
      );

# test the getBioMaterial_list method
result(UNIVERSAL::isa($biomaterial->getBioMaterial_list,'ARRAY') &&
       not scalar @{$biomaterial->getBioMaterial_list}
      );

# test the addBioMaterial() method
$biomaterial->addBioMaterial($classes{BioMaterial});
result(UNIVERSAL::isa($biomaterial->getBioMaterial_list,'ARRAY') &&
       scalar @{$biomaterial->getBioMaterial_list}
      );

