# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Image.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..41\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
# use blib;
use Bio::MAGE;
use Bio::MAGE::Association;
use Bio::MAGE::BioAssay::Image;
use Bio::MAGE::Description::OntologyEntry;
use Bio::MAGE::AuditAndSecurity::Audit;
use Bio::MAGE::AuditAndSecurity::Security;
use Bio::MAGE::NameValueType;
use Bio::MAGE::BioAssay::Channel;
use Bio::MAGE::Description::Description;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the new() method
my $image;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $image = Bio::MAGE::BioAssay::Image->new();
}
result($image->isa('Bio::MAGE::BioAssay::Image'));

# test the package class method
result($image->package() eq q[BioAssay]);

# test the class_name class method
result($image->class_name() eq q[Bio::MAGE::BioAssay::Image]);

# set the attribute values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $image = Bio::MAGE::BioAssay::Image->new(URI => 1,
identifier => 2,
name => 3);
}
# testing attribute URI
result ($image->getURI() == 1);
$image->setURI(1);
result ($image->getURI() == 1);

# testing attribute identifier
result ($image->getIdentifier() == 2);
$image->setIdentifier(2);
result ($image->getIdentifier() == 2);

# testing attribute name
result ($image->getName() == 3);
$image->setName(3);
result ($image->getName() == 3);

# retrieve the list of association meta-data
my %assns = Bio::MAGE::BioAssay::Image->associations();
my $assn;

# set the association values in the call to new()
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $image = Bio::MAGE::BioAssay::Image->new(format => Bio::MAGE::Description::OntologyEntry->new(),
channels => [Bio::MAGE::BioAssay::Channel->new()],
security => Bio::MAGE::AuditAndSecurity::Security->new(),
auditTrail => [Bio::MAGE::AuditAndSecurity::Audit->new()],
descriptions => [Bio::MAGE::Description::Description->new()],
propertySets => [Bio::MAGE::NameValueType->new()]);
}
# testing association format
my $format_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $format_assn = Bio::MAGE::Description::OntologyEntry->new();
}
result (UNIVERSAL::isa($image->getFormat,q[Bio::MAGE::Description::OntologyEntry]));
result ($image->setFormat($format_assn) == $format_assn);
result ($image->getFormat() == $format_assn);



# test the meta-data for the assoication
($assn) = $assns{format};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association channels
my $channels_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $channels_assn = Bio::MAGE::BioAssay::Channel->new();
}
result (UNIVERSAL::isa($image->getChannels->[0],q[Bio::MAGE::BioAssay::Channel]));
result ($image->setChannels([$channels_assn]));
result (UNIVERSAL::isa($image->getChannels,'ARRAY')
 and scalar @{$image->getChannels()} == 1
 and $image->getChannels->[0] == $channels_assn);
$image->addChannels($channels_assn);
result (UNIVERSAL::isa($image->getChannels,'ARRAY')
 and scalar @{$image->getChannels()} == 2
 and $image->getChannels->[0] == $channels_assn
 and $image->getChannels->[1] == $channels_assn);


# test the meta-data for the assoication
($assn) = $assns{channels};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association security
my $security_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $security_assn = Bio::MAGE::AuditAndSecurity::Security->new();
}
result (UNIVERSAL::isa($image->getSecurity,q[Bio::MAGE::AuditAndSecurity::Security]));
result ($image->setSecurity($security_assn) == $security_assn);
result ($image->getSecurity() == $security_assn);



# test the meta-data for the assoication
($assn) = $assns{security};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association auditTrail
my $audittrail_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $audittrail_assn = Bio::MAGE::AuditAndSecurity::Audit->new();
}
result (UNIVERSAL::isa($image->getAuditTrail->[0],q[Bio::MAGE::AuditAndSecurity::Audit]));
result ($image->setAuditTrail([$audittrail_assn]));
result (UNIVERSAL::isa($image->getAuditTrail,'ARRAY')
 and scalar @{$image->getAuditTrail()} == 1
 and $image->getAuditTrail->[0] == $audittrail_assn);
$image->addAuditTrail($audittrail_assn);
result (UNIVERSAL::isa($image->getAuditTrail,'ARRAY')
 and scalar @{$image->getAuditTrail()} == 2
 and $image->getAuditTrail->[0] == $audittrail_assn
 and $image->getAuditTrail->[1] == $audittrail_assn);


# test the meta-data for the assoication
($assn) = $assns{auditTrail};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association descriptions
my $descriptions_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $descriptions_assn = Bio::MAGE::Description::Description->new();
}
result (UNIVERSAL::isa($image->getDescriptions->[0],q[Bio::MAGE::Description::Description]));
result ($image->setDescriptions([$descriptions_assn]));
result (UNIVERSAL::isa($image->getDescriptions,'ARRAY')
 and scalar @{$image->getDescriptions()} == 1
 and $image->getDescriptions->[0] == $descriptions_assn);
$image->addDescriptions($descriptions_assn);
result (UNIVERSAL::isa($image->getDescriptions,'ARRAY')
 and scalar @{$image->getDescriptions()} == 2
 and $image->getDescriptions->[0] == $descriptions_assn
 and $image->getDescriptions->[1] == $descriptions_assn);


# test the meta-data for the assoication
($assn) = $assns{descriptions};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing association propertySets
my $propertysets_assn;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  $propertysets_assn = Bio::MAGE::NameValueType->new();
}
result (UNIVERSAL::isa($image->getPropertySets->[0],q[Bio::MAGE::NameValueType]));
result ($image->setPropertySets([$propertysets_assn]));
result (UNIVERSAL::isa($image->getPropertySets,'ARRAY')
 and scalar @{$image->getPropertySets()} == 1
 and $image->getPropertySets->[0] == $propertysets_assn);
$image->addPropertySets($propertysets_assn);
result (UNIVERSAL::isa($image->getPropertySets,'ARRAY')
 and scalar @{$image->getPropertySets()} == 2
 and $image->getPropertySets->[0] == $propertysets_assn
 and $image->getPropertySets->[1] == $propertysets_assn);


# test the meta-data for the assoication
($assn) = $assns{propertySets};
result(is_object($assn)
       and $assn->isa('Bio::MAGE::Association')
       and defined $assn->description(),
       and defined $assn->cardinality(),
       and grep {$_ eq $assn->cardinality} ('0..1','1','1..N','0..N'),
       and defined $assn->is_ref(),
       and ($assn->is_ref() == 0 or $assn->is_ref() == 1),
       and defined $assn->rank(),
       and $assn->rank(),
       and defined $assn->ordered(),
       and ($assn->ordered() == 0 or $assn->ordered() == 1),
       and defined $assn->class_name(),
       and $assn->class_name(),
       and defined $assn->name(),
       and $assn->name(),
      );
# testing superclass Bio::MAGE::Identifiable
result ($image->isa(q[Bio::MAGE::Identifiable]));

# testing superclass Bio::MAGE::Describable
result ($image->isa(q[Bio::MAGE::Describable]));

# testing superclass Bio::MAGE::Extendable
result ($image->isa(q[Bio::MAGE::Extendable]));

