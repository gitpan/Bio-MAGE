# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//BioSequence_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..11\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::BioSequence;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::BioSequence->classes();
result(scalar @classes eq 4);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::BioSequence::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $biosequence = Bio::MAGE::BioSequence->new();
result(is_object($biosequence) 
       and $biosequence->isa("Bio::MAGE::BioSequence"));

# test the tagname method
result(defined $biosequence->tagname);

# test the mageml_lists method
result(defined $biosequence->mageml_lists);


# test the biosequence_list method
$biosequence->biosequence_list([]);
result(UNIVERSAL::isa($biosequence->biosequence_list,'ARRAY') &&
       not scalar @{$biosequence->biosequence_list}
      );

# test the getBioSequence_list method
result(UNIVERSAL::isa($biosequence->getBioSequence_list,'ARRAY') &&
       not scalar @{$biosequence->getBioSequence_list}
      );


