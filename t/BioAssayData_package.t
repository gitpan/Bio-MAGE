# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//BioAssayData_package.t'

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

BEGIN { $| = 1; print "1..43\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::BioAssayData;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::BioAssayData->classes();
result(scalar @classes eq 20);

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::BioAssayData::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
  }
}
my $bioassaydata = Bio::MAGE::BioAssayData->new();
result(is_object($bioassaydata) 
       and $bioassaydata->isa("Bio::MAGE::BioAssayData"));

# test the tagname method
result(defined $bioassaydata->tagname);

# test the mageml_lists method
result(defined $bioassaydata->mageml_lists);


# test the bioassaydimension_list method
$bioassaydata->bioassaydimension_list([]);
result(UNIVERSAL::isa($bioassaydata->bioassaydimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->bioassaydimension_list}
      );

# test the getBioAssayDimension_list method
result(UNIVERSAL::isa($bioassaydata->getBioAssayDimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->getBioAssayDimension_list}
      );

# test the addBioAssayDimension() method
$bioassaydata->addBioAssayDimension($classes{BioAssayDimension});
result(UNIVERSAL::isa($bioassaydata->getBioAssayDimension_list,'ARRAY') &&
       scalar @{$bioassaydata->getBioAssayDimension_list}
      );

# test the designelementdimension_list method
$bioassaydata->designelementdimension_list([]);
result(UNIVERSAL::isa($bioassaydata->designelementdimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->designelementdimension_list}
      );

# test the getDesignElementDimension_list method
result(UNIVERSAL::isa($bioassaydata->getDesignElementDimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->getDesignElementDimension_list}
      );

# test the addDesignElementDimension() method
$bioassaydata->addDesignElementDimension($classes{DesignElementDimension});
result(UNIVERSAL::isa($bioassaydata->getDesignElementDimension_list,'ARRAY') &&
       scalar @{$bioassaydata->getDesignElementDimension_list}
      );

# test the quantitationtypedimension_list method
$bioassaydata->quantitationtypedimension_list([]);
result(UNIVERSAL::isa($bioassaydata->quantitationtypedimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->quantitationtypedimension_list}
      );

# test the getQuantitationTypeDimension_list method
result(UNIVERSAL::isa($bioassaydata->getQuantitationTypeDimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->getQuantitationTypeDimension_list}
      );

# test the addQuantitationTypeDimension() method
$bioassaydata->addQuantitationTypeDimension($classes{QuantitationTypeDimension});
result(UNIVERSAL::isa($bioassaydata->getQuantitationTypeDimension_list,'ARRAY') &&
       scalar @{$bioassaydata->getQuantitationTypeDimension_list}
      );

# test the bioassaymap_list method
$bioassaydata->bioassaymap_list([]);
result(UNIVERSAL::isa($bioassaydata->bioassaymap_list,'ARRAY') &&
       not scalar @{$bioassaydata->bioassaymap_list}
      );

# test the getBioAssayMap_list method
result(UNIVERSAL::isa($bioassaydata->getBioAssayMap_list,'ARRAY') &&
       not scalar @{$bioassaydata->getBioAssayMap_list}
      );

# test the addBioAssayMap() method
$bioassaydata->addBioAssayMap($classes{BioAssayMap});
result(UNIVERSAL::isa($bioassaydata->getBioAssayMap_list,'ARRAY') &&
       scalar @{$bioassaydata->getBioAssayMap_list}
      );

# test the quantitationtypemap_list method
$bioassaydata->quantitationtypemap_list([]);
result(UNIVERSAL::isa($bioassaydata->quantitationtypemap_list,'ARRAY') &&
       not scalar @{$bioassaydata->quantitationtypemap_list}
      );

# test the getQuantitationTypeMap_list method
result(UNIVERSAL::isa($bioassaydata->getQuantitationTypeMap_list,'ARRAY') &&
       not scalar @{$bioassaydata->getQuantitationTypeMap_list}
      );

# test the addQuantitationTypeMap() method
$bioassaydata->addQuantitationTypeMap($classes{QuantitationTypeMap});
result(UNIVERSAL::isa($bioassaydata->getQuantitationTypeMap_list,'ARRAY') &&
       scalar @{$bioassaydata->getQuantitationTypeMap_list}
      );

# test the bioassaydata_list method
$bioassaydata->bioassaydata_list([]);
result(UNIVERSAL::isa($bioassaydata->bioassaydata_list,'ARRAY') &&
       not scalar @{$bioassaydata->bioassaydata_list}
      );

# test the getBioAssayData_list method
result(UNIVERSAL::isa($bioassaydata->getBioAssayData_list,'ARRAY') &&
       not scalar @{$bioassaydata->getBioAssayData_list}
      );

# test the addBioAssayData() method
$bioassaydata->addBioAssayData($classes{BioAssayData});
result(UNIVERSAL::isa($bioassaydata->getBioAssayData_list,'ARRAY') &&
       scalar @{$bioassaydata->getBioAssayData_list}
      );

