# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ./t//AuditAndSecurity_package.t'

# C O P Y R I G H T   N O T I C E
#  Copyright (c) 2001-2002 by:
#    * The MicroArray Gene Expression Database Society (MGED)
#    * Rosetta Inpharmatics
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..20\n"; }
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

my %classes;
{
  # silence the abstract class warnings
  local $SIG{__WARN__} = sub {'IGNORE'};
  foreach my $class_name (@classes) {
    my $class = "Bio::MAGE::AuditAndSecurity::$class_name";
    $classes{$class_name} = $class->new();
    result(is_object($classes{$class_name}) and $classes{$class_name}->isa($class));
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

# test the addContact() method
$auditandsecurity->addContact($classes{Contact});
result(UNIVERSAL::isa($auditandsecurity->getContact_list,'ARRAY') &&
       scalar @{$auditandsecurity->getContact_list}
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

# test the addSecurityGroup() method
$auditandsecurity->addSecurityGroup($classes{SecurityGroup});
result(UNIVERSAL::isa($auditandsecurity->getSecurityGroup_list,'ARRAY') &&
       scalar @{$auditandsecurity->getSecurityGroup_list}
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

# test the addSecurity() method
$auditandsecurity->addSecurity($classes{Security});
result(UNIVERSAL::isa($auditandsecurity->getSecurity_list,'ARRAY') &&
       scalar @{$auditandsecurity->getSecurity_list}
      );

