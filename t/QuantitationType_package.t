# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//QuantitationType_package.t'

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

BEGIN { $| = 1; print "1..20\n"; }
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

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::QuantitationType::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
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

# test the addQuantitationType() method
$quantitationtype->addQuantitationType($classes{QuantitationType});
result(UNIVERSAL::isa($quantitationtype->getQuantitationType_list,'ARRAY') &&
       scalar @{$quantitationtype->getQuantitationType_list}
      );

