# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//Array_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..21\n"; }
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


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::Array::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
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


# test the array_list method
$array->array_list([]);
result(UNIVERSAL::isa($array->array_list,'ARRAY') &&
       not scalar @{$array->array_list}
      );

# test the getArray_list method
result(UNIVERSAL::isa($array->getArray_list,'ARRAY') &&
       not scalar @{$array->getArray_list}
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


