# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//AuditAndSecurity_package.t'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..17\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use lib 't';
use strict;
use TestMAGE qw(result is_object);
use vars qw($i $loaded);
use Bio::MAGE;
use Bio::MAGE::AuditAndSecurity;

$loaded = 1;
$i = 1;
result($i);

######################### End of black magic.

# we test the classes() method
my @classes = Bio::MAGE::AuditAndSecurity->classes();
result(scalar @classes eq 6);


{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class (map {"Bio::MAGE::AuditAndSecurity::$_"} @classes) {
    my $obj = $class->new();
    result(is_object($obj) and $obj->isa($class));
  }
}
my $auditandsecurity = Bio::MAGE::AuditAndSecurity->new();
result(is_object($auditandsecurity) 
       and $auditandsecurity->isa("Bio::MAGE::AuditAndSecurity"));

# test the tagname method
result(defined $auditandsecurity->tagname);

# test the mageml_lists method
result(defined $auditandsecurity->mageml_lists);


# test the contact_list method
$auditandsecurity->contact_list([]);
result(UNIVERSAL::isa($auditandsecurity->contact_list,'ARRAY') &&
       not scalar @{$auditandsecurity->contact_list}
      );

# test the getContact_list method
result(UNIVERSAL::isa($auditandsecurity->getContact_list,'ARRAY') &&
       not scalar @{$auditandsecurity->getContact_list}
      );


# test the securitygroup_list method
$auditandsecurity->securitygroup_list([]);
result(UNIVERSAL::isa($auditandsecurity->securitygroup_list,'ARRAY') &&
       not scalar @{$auditandsecurity->securitygroup_list}
      );

# test the getSecurityGroup_list method
result(UNIVERSAL::isa($auditandsecurity->getSecurityGroup_list,'ARRAY') &&
       not scalar @{$auditandsecurity->getSecurityGroup_list}
      );


# test the security_list method
$auditandsecurity->security_list([]);
result(UNIVERSAL::isa($auditandsecurity->security_list,'ARRAY') &&
       not scalar @{$auditandsecurity->security_list}
      );

# test the getSecurity_list method
result(UNIVERSAL::isa($auditandsecurity->getSecurity_list,'ARRAY') &&
       not scalar @{$auditandsecurity->getSecurity_list}
      );


