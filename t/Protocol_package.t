# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//Protocol_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..21\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::Protocol;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::Protocol->classes();
result(scalar @classes eq 10);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::Protocol::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $protocol = Bio::MAGE::Protocol->new();
result(is_object($protocol) 
       and $protocol->isa("Bio::MAGE::Protocol"));

# test the tagname method
result(defined $protocol->tagname);

# test the mageml_lists method
result(defined $protocol->mageml_lists);


# test the hardware_list method
$protocol->hardware_list([]);
result(UNIVERSAL::isa($protocol->hardware_list,'ARRAY') &&
       not scalar @{$protocol->hardware_list}
      );

# test the getHardware_list method
result(UNIVERSAL::isa($protocol->getHardware_list,'ARRAY') &&
       not scalar @{$protocol->getHardware_list}
      );


# test the software_list method
$protocol->software_list([]);
result(UNIVERSAL::isa($protocol->software_list,'ARRAY') &&
       not scalar @{$protocol->software_list}
      );

# test the getSoftware_list method
result(UNIVERSAL::isa($protocol->getSoftware_list,'ARRAY') &&
       not scalar @{$protocol->getSoftware_list}
      );


# test the protocol_list method
$protocol->protocol_list([]);
result(UNIVERSAL::isa($protocol->protocol_list,'ARRAY') &&
       not scalar @{$protocol->protocol_list}
      );

# test the getProtocol_list method
result(UNIVERSAL::isa($protocol->getProtocol_list,'ARRAY') &&
       not scalar @{$protocol->getProtocol_list}
      );


