# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//MAGE_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..29\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE->classes();
result(scalar @classes eq 4);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $mage = Bio::MAGE->new();
result(is_object($mage) 
       and $mage->isa("Bio::MAGE"));

# test the tagname method
result(defined $mage->tagname);

# test the packages() method
result(defined $mage->packages);

# test the mageml_packages() method
result(scalar $mage->mageml_packages == 16);

# test the identifiers() method
$mage->identifiers(27);
result($mage->identifiers == 27);

# test the objects() method
$mage->objects(42);
result($mage->objects == 42);

# test the getAuditAndSecurity_package singleton method
result($mage->getAuditAndSecurity_package->isa('Bio::MAGE::AuditAndSecurity'));

# test the getDescription_package singleton method
result($mage->getDescription_package->isa('Bio::MAGE::Description'));

# test the getMeasurement_package singleton method
result($mage->getMeasurement_package->isa('Bio::MAGE::Measurement'));

# test the getBQS_package singleton method
result($mage->getBQS_package->isa('Bio::MAGE::BQS'));

# test the getBioEvent_package singleton method
result($mage->getBioEvent_package->isa('Bio::MAGE::BioEvent'));

# test the getProtocol_package singleton method
result($mage->getProtocol_package->isa('Bio::MAGE::Protocol'));

# test the getBioMaterial_package singleton method
result($mage->getBioMaterial_package->isa('Bio::MAGE::BioMaterial'));

# test the getBioSequence_package singleton method
result($mage->getBioSequence_package->isa('Bio::MAGE::BioSequence'));

# test the getDesignElement_package singleton method
result($mage->getDesignElement_package->isa('Bio::MAGE::DesignElement'));

# test the getArrayDesign_package singleton method
result($mage->getArrayDesign_package->isa('Bio::MAGE::ArrayDesign'));

# test the getArray_package singleton method
result($mage->getArray_package->isa('Bio::MAGE::Array'));

# test the getBioAssay_package singleton method
result($mage->getBioAssay_package->isa('Bio::MAGE::BioAssay'));

# test the getQuantitationType_package singleton method
result($mage->getQuantitationType_package->isa('Bio::MAGE::QuantitationType'));

# test the getBioAssayData_package singleton method
result($mage->getBioAssayData_package->isa('Bio::MAGE::BioAssayData'));

# test the getExperiment_package singleton method
result($mage->getExperiment_package->isa('Bio::MAGE::Experiment'));

# test the getHigherLevelAnalysis_package singleton method
result($mage->getHigherLevelAnalysis_package->isa('Bio::MAGE::HigherLevelAnalysis'));

# now that we've accessed each package, we check the count
result(keys %{$mage->packages} == 16);

