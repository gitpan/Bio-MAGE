# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//DesignElement_package.t'

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

BEGIN { $| = 1; print "1..33\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::DesignElement;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::DesignElement->classes();
result(scalar @classes eq 13);

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::DesignElement::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
  }
}
my $designelement = Bio::MAGE::DesignElement->new();
result(is_object($designelement) 
       and $designelement->isa("Bio::MAGE::DesignElement"));

# test the tagname method
result(defined $designelement->tagname);

# test the mageml_lists method
result(defined $designelement->mageml_lists);


# test the compositesequence_list method
$designelement->compositesequence_list([]);
result(UNIVERSAL::isa($designelement->compositesequence_list,'ARRAY') &&
       not scalar @{$designelement->compositesequence_list}
      );

# test the getCompositeSequence_list method
result(UNIVERSAL::isa($designelement->getCompositeSequence_list,'ARRAY') &&
       not scalar @{$designelement->getCompositeSequence_list}
      );

# test the addCompositeSequence() method
$designelement->addCompositeSequence($classes{CompositeSequence});
result(UNIVERSAL::isa($designelement->getCompositeSequence_list,'ARRAY') &&
       scalar @{$designelement->getCompositeSequence_list}
      );

# test the reporter_list method
$designelement->reporter_list([]);
result(UNIVERSAL::isa($designelement->reporter_list,'ARRAY') &&
       not scalar @{$designelement->reporter_list}
      );

# test the getReporter_list method
result(UNIVERSAL::isa($designelement->getReporter_list,'ARRAY') &&
       not scalar @{$designelement->getReporter_list}
      );

# test the addReporter() method
$designelement->addReporter($classes{Reporter});
result(UNIVERSAL::isa($designelement->getReporter_list,'ARRAY') &&
       scalar @{$designelement->getReporter_list}
      );

# test the compositecompositemap_list method
$designelement->compositecompositemap_list([]);
result(UNIVERSAL::isa($designelement->compositecompositemap_list,'ARRAY') &&
       not scalar @{$designelement->compositecompositemap_list}
      );

# test the getCompositeCompositeMap_list method
result(UNIVERSAL::isa($designelement->getCompositeCompositeMap_list,'ARRAY') &&
       not scalar @{$designelement->getCompositeCompositeMap_list}
      );

# test the addCompositeCompositeMap() method
$designelement->addCompositeCompositeMap($classes{CompositeCompositeMap});
result(UNIVERSAL::isa($designelement->getCompositeCompositeMap_list,'ARRAY') &&
       scalar @{$designelement->getCompositeCompositeMap_list}
      );

# test the reportercompositemap_list method
$designelement->reportercompositemap_list([]);
result(UNIVERSAL::isa($designelement->reportercompositemap_list,'ARRAY') &&
       not scalar @{$designelement->reportercompositemap_list}
      );

# test the getReporterCompositeMap_list method
result(UNIVERSAL::isa($designelement->getReporterCompositeMap_list,'ARRAY') &&
       not scalar @{$designelement->getReporterCompositeMap_list}
      );

# test the addReporterCompositeMap() method
$designelement->addReporterCompositeMap($classes{ReporterCompositeMap});
result(UNIVERSAL::isa($designelement->getReporterCompositeMap_list,'ARRAY') &&
       scalar @{$designelement->getReporterCompositeMap_list}
      );

# test the featurereportermap_list method
$designelement->featurereportermap_list([]);
result(UNIVERSAL::isa($designelement->featurereportermap_list,'ARRAY') &&
       not scalar @{$designelement->featurereportermap_list}
      );

# test the getFeatureReporterMap_list method
result(UNIVERSAL::isa($designelement->getFeatureReporterMap_list,'ARRAY') &&
       not scalar @{$designelement->getFeatureReporterMap_list}
      );

# test the addFeatureReporterMap() method
$designelement->addFeatureReporterMap($classes{FeatureReporterMap});
result(UNIVERSAL::isa($designelement->getFeatureReporterMap_list,'ARRAY') &&
       scalar @{$designelement->getFeatureReporterMap_list}
      );

