# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//HigherLevelAnalysis_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..11\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::HigherLevelAnalysis;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::HigherLevelAnalysis->classes();
result(scalar @classes eq 4);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::HigherLevelAnalysis::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $higherlevelanalysis = Bio::MAGE::HigherLevelAnalysis->new();
result(is_object($higherlevelanalysis) 
       and $higherlevelanalysis->isa("Bio::MAGE::HigherLevelAnalysis"));

# test the tagname method
result(defined $higherlevelanalysis->tagname);

# test the mageml_lists method
result(defined $higherlevelanalysis->mageml_lists);


# test the bioassaydatacluster_list method
$higherlevelanalysis->bioassaydatacluster_list([]);
result(UNIVERSAL::isa($higherlevelanalysis->bioassaydatacluster_list,'ARRAY') &&
       not scalar @{$higherlevelanalysis->bioassaydatacluster_list}
      );

# test the getBioAssayDataCluster_list method
result(UNIVERSAL::isa($higherlevelanalysis->getBioAssayDataCluster_list,'ARRAY') &&
       not scalar @{$higherlevelanalysis->getBioAssayDataCluster_list}
      );


