# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//Description_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..12\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::Description->classes();
result(scalar @classes eq 5);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::Description::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $description = Bio::MAGE::Description->new();
result(is_object($description) 
       and $description->isa("Bio::MAGE::Description"));

# test the tagname method
result(defined $description->tagname);

# test the mageml_lists method
result(defined $description->mageml_lists);


# test the database_list method
$description->database_list([]);
result(UNIVERSAL::isa($description->database_list,'ARRAY') &&
       not scalar @{$description->database_list}
      );

# test the getDatabase_list method
result(UNIVERSAL::isa($description->getDatabase_list,'ARRAY') &&
       not scalar @{$description->getDatabase_list}
      );


