# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//BioAssayData_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..37\n"; }
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


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::BioAssayData::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
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


# test the designelementdimension_list method
$bioassaydata->designelementdimension_list([]);
result(UNIVERSAL::isa($bioassaydata->designelementdimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->designelementdimension_list}
      );

# test the getDesignElementDimension_list method
result(UNIVERSAL::isa($bioassaydata->getDesignElementDimension_list,'ARRAY') &&
       not scalar @{$bioassaydata->getDesignElementDimension_list}
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


# test the bioassaymap_list method
$bioassaydata->bioassaymap_list([]);
result(UNIVERSAL::isa($bioassaydata->bioassaymap_list,'ARRAY') &&
       not scalar @{$bioassaydata->bioassaymap_list}
      );

# test the getBioAssayMap_list method
result(UNIVERSAL::isa($bioassaydata->getBioAssayMap_list,'ARRAY') &&
       not scalar @{$bioassaydata->getBioAssayMap_list}
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


# test the bioassaydata_list method
$bioassaydata->bioassaydata_list([]);
result(UNIVERSAL::isa($bioassaydata->bioassaydata_list,'ARRAY') &&
       not scalar @{$bioassaydata->bioassaydata_list}
      );

# test the getBioAssayData_list method
result(UNIVERSAL::isa($bioassaydata->getBioAssayData_list,'ARRAY') &&
       not scalar @{$bioassaydata->getBioAssayData_list}
      );


