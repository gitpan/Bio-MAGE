##############################
#
# Description_package.t
#

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Description_package.t`

##############################
# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2006 by:
#    * The MicroArray Gene Expression Database Society (MGED)
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



use Carp;
# use blib;
use Test::More tests => 16;
use strict;

BEGIN { use_ok('Bio::MAGE::Description') };

# we test the classes() method
my @classes = Bio::MAGE::Description->classes();
is((scalar @classes), 5, 'number of subclasses');

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::Description::$class_name";
    $classes{$class_name} = $class->new();
    isa_ok($classes{$class_name}, $class);
  }
}
# test isa
my $description = Bio::MAGE::Description->new();
isa_ok($description, "Bio::MAGE::Description");

# test the tagname method
ok(defined $description->tagname, 'tagname');


# test the xml_lists method
ok(defined $description->xml_lists,
  'xml_lists');


# test the database_list method
$description->database_list([]);
isa_ok($description->database_list,'ARRAY');
is(scalar @{$description->database_list}, 0,
   'database_list empty');

# test the getDatabase_list method
isa_ok($description->getDatabase_list,'ARRAY');
is(scalar @{$description->getDatabase_list}, 0,
   'getDatabase_list empty');

# test the addDatabase() method
$description->addDatabase($classes{Database});
isa_ok($description->getDatabase_list,'ARRAY');
ok(scalar @{$description->getDatabase_list},
   'getDatabase_list not empty');


