# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//DesignElement_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..28\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::DesignElement;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::DesignElement->classes();
result(scalar @classes eq 13);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::DesignElement::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $designelement = Bio::MAGE::DesignElement->new();
result(is_object($designelement) 
       and $designelement->isa("Bio::MAGE::DesignElement"));

# test the tagname method
result(defined $designelement->tagname);

# test the mageml_lists method
result(defined $designelement->mageml_lists);


# test the compositesequence_list method
$designelement->compositesequence_list([]);
result(UNIVERSAL::isa($designelement->compositesequence_list,'ARRAY') &&
       not scalar @{$designelement->compositesequence_list}
      );

# test the getCompositeSequence_list method
result(UNIVERSAL::isa($designelement->getCompositeSequence_list,'ARRAY') &&
       not scalar @{$designelement->getCompositeSequence_list}
      );


# test the reporter_list method
$designelement->reporter_list([]);
result(UNIVERSAL::isa($designelement->reporter_list,'ARRAY') &&
       not scalar @{$designelement->reporter_list}
      );

# test the getReporter_list method
result(UNIVERSAL::isa($designelement->getReporter_list,'ARRAY') &&
       not scalar @{$designelement->getReporter_list}
      );


# test the compositecompositemap_list method
$designelement->compositecompositemap_list([]);
result(UNIVERSAL::isa($designelement->compositecompositemap_list,'ARRAY') &&
       not scalar @{$designelement->compositecompositemap_list}
      );

# test the getCompositeCompositeMap_list method
result(UNIVERSAL::isa($designelement->getCompositeCompositeMap_list,'ARRAY') &&
       not scalar @{$designelement->getCompositeCompositeMap_list}
      );


# test the reportercompositemap_list method
$designelement->reportercompositemap_list([]);
result(UNIVERSAL::isa($designelement->reportercompositemap_list,'ARRAY') &&
       not scalar @{$designelement->reportercompositemap_list}
      );

# test the getReporterCompositeMap_list method
result(UNIVERSAL::isa($designelement->getReporterCompositeMap_list,'ARRAY') &&
       not scalar @{$designelement->getReporterCompositeMap_list}
      );


# test the featurereportermap_list method
$designelement->featurereportermap_list([]);
result(UNIVERSAL::isa($designelement->featurereportermap_list,'ARRAY') &&
       not scalar @{$designelement->featurereportermap_list}
      );

# test the getFeatureReporterMap_list method
result(UNIVERSAL::isa($designelement->getFeatureReporterMap_list,'ARRAY') &&
       not scalar @{$designelement->getFeatureReporterMap_list}
      );


