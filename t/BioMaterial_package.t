# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//BioMaterial_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..17\n"; }
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


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::BioMaterial::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
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


# test the biomaterial_list method
$biomaterial->biomaterial_list([]);
result(UNIVERSAL::isa($biomaterial->biomaterial_list,'ARRAY') &&
       not scalar @{$biomaterial->biomaterial_list}
      );

# test the getBioMaterial_list method
result(UNIVERSAL::isa($biomaterial->getBioMaterial_list,'ARRAY') &&
       not scalar @{$biomaterial->getBioMaterial_list}
      );


