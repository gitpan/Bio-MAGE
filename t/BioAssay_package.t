# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//BioAssay_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..20\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::BioAssay;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::BioAssay->classes();
result(scalar @classes eq 11);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::BioAssay::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $bioassay = Bio::MAGE::BioAssay->new();
result(is_object($bioassay) 
       and $bioassay->isa("Bio::MAGE::BioAssay"));

# test the tagname method
result(defined $bioassay->tagname);

# test the mageml_lists method
result(defined $bioassay->mageml_lists);


# test the channel_list method
$bioassay->channel_list([]);
result(UNIVERSAL::isa($bioassay->channel_list,'ARRAY') &&
       not scalar @{$bioassay->channel_list}
      );

# test the getChannel_list method
result(UNIVERSAL::isa($bioassay->getChannel_list,'ARRAY') &&
       not scalar @{$bioassay->getChannel_list}
      );


# test the bioassay_list method
$bioassay->bioassay_list([]);
result(UNIVERSAL::isa($bioassay->bioassay_list,'ARRAY') &&
       not scalar @{$bioassay->bioassay_list}
      );

# test the getBioAssay_list method
result(UNIVERSAL::isa($bioassay->getBioAssay_list,'ARRAY') &&
       not scalar @{$bioassay->getBioAssay_list}
      );


