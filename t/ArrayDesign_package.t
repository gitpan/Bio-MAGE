# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//ArrayDesign_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..20\n"; }
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


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::ArrayDesign::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
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


# test the compositegroup_list method
$arraydesign->compositegroup_list([]);
result(UNIVERSAL::isa($arraydesign->compositegroup_list,'ARRAY') &&
       not scalar @{$arraydesign->compositegroup_list}
      );

# test the getCompositeGroup_list method
result(UNIVERSAL::isa($arraydesign->getCompositeGroup_list,'ARRAY') &&
       not scalar @{$arraydesign->getCompositeGroup_list}
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


