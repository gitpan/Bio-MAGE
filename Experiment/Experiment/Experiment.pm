##############################
#
# Bio::MAGE::Experiment::Experiment
#
##############################
package Bio::MAGE::Experiment::Experiment;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Identifiable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Identifiable Exporter);
$VERSION = q[$Id: Experiment.pm,v 1.4 2002/08/24 16:12:20 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::Experiment::Experiment

=head2 SYNOPSIS

  use Bio::MAGE::Experiment::Experiment;

    # creating an empty instance
  my $experiment = Bio::MAGE::Experiment::Experiment->new();

    # creating an already populated instance
  my $experiment = Bio::MAGE::Experiment::Experiment->new(bioAssays=>$bioAssays_value,
			providers=>$providers_value,
			bioAssayData=>$bioAssayData_value,
			analysisResults=>$analysisResults_value,
			experimentDesign=>$experimentDesign_value);

    # setting and retrieving object associations
  my $bioAssays_val = $experiment->bioAssays();
  $experiment->bioAssays($value);

  my $providers_val = $experiment->providers();
  $experiment->providers($value);

  my $bioAssayData_val = $experiment->bioAssayData();
  $experiment->bioAssayData($value);

  my $analysisResults_val = $experiment->analysisResults();
  $experiment->analysisResults($value);

  my $experimentDesign_val = $experiment->experimentDesign();
  $experiment->experimentDesign($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Experiment> class:

The Experiment is the collection of all the BioAssays that are related by the ExperimentDesign.



=cut


=head2 INHERITANCE


Bio::MAGE::Experiment::Experiment has the following super classes

=over 


=item * Bio::MAGE::Identifiable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::Experiment::Experiment->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * bioAssays

Sets the value of the bioAssays association (from C<Bio::MAGE::Experiment::Experiment>).


=item * providers

Sets the value of the providers association (from C<Bio::MAGE::Experiment::Experiment>).


=item * bioAssayData

Sets the value of the bioAssayData association (from C<Bio::MAGE::Experiment::Experiment>).


=item * analysisResults

Sets the value of the analysisResults association (from C<Bio::MAGE::Experiment::Experiment>).


=item * experimentDesign

Sets the value of the experimentDesign association (from C<Bio::MAGE::Experiment::Experiment>).


=item * identifier

Sets the value of the identifier attribute (from C<Bio::MAGE::Identifiable>).


=item * name

Sets the value of the name attribute (from C<Bio::MAGE::Identifiable>).


=item * security

Sets the value of the security association (from C<Bio::MAGE::Describable>).


=item * auditTrail

Sets the value of the auditTrail association (from C<Bio::MAGE::Describable>).


=item * descriptions

Sets the value of the descriptions association (from C<Bio::MAGE::Describable>).


=item * propertySets

Sets the value of the propertySets association (from C<Bio::MAGE::Extendable>).


=back



=cut

#
# code for new() inherited from Base.pm
#

=item $obj->set_slots(%parameters)

=item $obj->set_slots(\@name_list, \@value_list)

The C<set_slots()> method is used to set a number of slots at the same
time. It has two different invocation methods. The first takes a named
parameter list, and the second takes two array references.

B<Return value>: none

B<Side effects>: will call C<croak()> if a slot_name is used that the class
does not define.

=cut

#
# code for set_slots() inherited from Base.pm
#

=item $obj->get_slots(@name_list)

The C<get_slots()> method is used to get the values of a number of
slots at the same time.

B<Return value>: a list of instance objects

B<Side effects>: none

=cut

#
# code for get_slots() inherited from Base.pm
#

=item $val = $obj->set_slot($name,$val)

The C<set_slot()> method sets the slot C<$name> to the value C<$val>

B<Return value>: the new value of the slot, i.e. C<$val>

B<Side effects>: none

=cut

#
# code for set_slot() inherited from Base.pm
#

=item $val = $obj->get_slot($name)

The C<get_slot()> method is used to get the values of a number of
slots at the same time.

B<Return value>: a single slot value, or undef if the slot has not been
initialized.

B<Side effects>: none

=cut

#
# code for get_slot() inherited from Base.pm
#

=item @names = $obj->get_slot_names()

The C<get_slot_names()> method is used to retrieve the name of all
slots defined for a given object.

B<Return value>: a single slot value, or undef if the slot has not been
initialized.

B<Side effects>: none

=cut

#
# code for get_slot_names() inherited from Base.pm
#



=item $name = class_name()

Returns the full class name for this class, Bio::MAGE::Experiment::Experiment.

=cut

sub class_name {
  return q[Bio::MAGE::Experiment::Experiment];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::Experiment::Experiment.

=cut

sub package {
  return q[Experiment];
}

=item @classes = subclasses()

returns the list of subclasses for this class.

=cut

sub subclasses {
  my @list = ();
  return @list;
}

=item @classes = superclasses()

returns the list of superclasses for this class.

=cut

sub superclasses {
  my @list = ('Bio::MAGE::Identifiable');
  return @list;
}

=item @methods = attribute_methods()

returns the list of attribute accessor methods for this class.

=cut

sub attribute_methods {
  my $class = shift;
  my @list = ();
  if ($class->superclasses()) {
    foreach ($class->superclasses()) {
      push(@list,$_->attribute_methods());
    }
  }
  return @list;
}

=item @methods = association_methods()

returns the list of association accessor methods for this class.

=cut

sub association_methods {
  my $class = shift;
  my @list = ('bioAssays', 'providers', 'bioAssayData', 'analysisResults', 'experimentDesign');
  if ($class->superclasses()) {
    foreach ($class->superclasses()) {
      push(@list,$_->association_methods());
    }
  }
  return @list;
}

=item %assns = associations()

returns the association meta-information in a hash where the keys are
the association names and the values are C<Bio::MAGE::Association>
objects that provide the meta-information for the association.

=cut

sub associations {
  my $class = shift;
  my @list = ();
  # superclasses first
  if ($class->superclasses()) {
    foreach ($class->superclasses()) {
      push(@list,$_->associations());
    }
  }
  # then associations from this class
  if (defined $__ASSOCIATIONS) {
    push(@list,@{$__ASSOCIATIONS})
  }
  return @list;
}


=head2 ATTRIBUTES

Attributes are simple data types that belong to a single instance of a
class. In the Perl implementation of the MAGE-OM classes, the
interface to attributes is implemented using separate setter and
getter methods for each attribute.

Bio::MAGE::Experiment::Experiment: has the following attribute accessor methods:

=over

Attributes Inherited from Bio::MAGE::Identifiable


=item identifier

From the MAGE-OM documentation for the C<identifier> attribute:

An identifier is an unambiguous string that is unique within the scope (i.e. a document, a set of related documents, or a repository) of its use.



=over


=item $val = $identifiable->setIdentifier($val)

The restricted setter method for the identifier attribute.

Input parameters: the value to which the identifier attribute will be set 

Return value: the current value of the identifier attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $identifiable->getIdentifier()

The restricted getter method for the identifier attribute.

Input parameters: none

Return value: the current value of the identifier attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back


=item name

From the MAGE-OM documentation for the C<name> attribute:

The potentially ambiguous common identifier.



=over


=item $val = $identifiable->setName($val)

The restricted setter method for the name attribute.

Input parameters: the value to which the name attribute will be set 

Return value: the current value of the name attribute 

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified 

=cut


=item $val = $identifiable->getName()

The restricted getter method for the name attribute.

Input parameters: none

Return value: the current value of the name attribute 

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'providers',
          bless( {
                   '__NAME' => 'providers',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Contact',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'The providers of the Experiment, its data and annotation.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'analysisResults',
          bless( {
                   '__NAME' => 'analysisResults',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BioAssayDataCluster',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The results of analyzing the data, typically with a clustering algorithm.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'bioAssayData',
          bless( {
                   '__NAME' => 'bioAssayData',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BioAssayData',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'The collection of BioAssayDatas for this Experiment.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'bioAssays',
          bless( {
                   '__NAME' => 'bioAssays',
                   '__IS_REF' => 1,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'BioAssay',
                   '__RANK' => '4',
                   '__DESCRIPTION' => 'The collection of BioAssays for this Experiment.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'experimentDesign',
          bless( {
                   '__NAME' => 'experimentDesign',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '1',
                   '__CLASS_NAME' => 'ExperimentDesign',
                   '__RANK' => '5',
                   '__DESCRIPTION' => 'The association to the description and annotation of the Experiment, along with the grouping of the top-level BioAssays.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' )
        ]

}

=head2 ASSOCIATIONS

Associations are references to other class objects which can be shared
by multiple class instances at the same time. In the Perl
implementation of MAGE-OM classes, associations are implemented using
three separate methods:

=over

=item get*

Retrieves the current value. If the association has list cardinality,
an array reference is returned.

=item set*

Sets the current value B<replacing> any existing value. If the
association has list cardinality, the argument must be an array
reference. Unless you know what you are doing, you probably should be
using the add* methods.

=item add*

This method exists only for associations with list cardinality. It
appends a list of objects to any values that may already be stored in
the association.

=back

Bio::MAGE::Experiment::Experiment: has the following association accessor methods:

=over


=item bioAssays


From the MAGE-OM documentation for the C<bioAssays> association:

The collection of BioAssays for this Experiment.



=over


=item $array_ref = $experiment->setBioAssays($array_ref)

The restricted setter method for the bioAssays association.

Input parameters: the value to which the bioAssays association will be set : a reference to an array of objects of type C<Bio::MAGE::BioAssay::BioAssay>

Return value: the current value of the bioAssays association : a reference to an array of objects of type C<Bio::MAGE::BioAssay::BioAssay>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioAssay::BioAssay> instances

=cut

sub setBioAssays {
  my $self = shift;
  croak(__PACKAGE__ . "::setBioAssays: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setBioAssays: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setBioAssays: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setBioAssays: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssay::BioAssay")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssay::BioAssay');
  }

  return $self->{__BIOASSAYS} = $val;
}



=item $array_ref = $experiment->getBioAssays()

The restricted getter method for the bioAssays association.

Input parameters: none

Return value: the current value of the bioAssays association : a reference to an array of objects of type C<Bio::MAGE::BioAssay::BioAssay>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getBioAssays {
  my $self = shift;
  croak(__PACKAGE__ . "::getBioAssays: arguments passed to getter")
    if @_;
  return $self->{__BIOASSAYS};
}



=item $experiment->addBioAssays(@vals)

Because the bioAssays association has list cardinality, it may store more
than one value. This method adds the current list of objects in the bioAssays
association.

Input parameters: the list of values C<@vals> to add to the bioAssays
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioAssay::BioAssay>

=cut

sub addBioAssays {
  my $self = shift;
  croak(__PACKAGE__ . "::addBioAssays: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addBioAssays: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssay::BioAssay")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssay::BioAssay');
  }

  push(@{$self->{__BIOASSAYS}},@vals);
}



=back


=item providers


From the MAGE-OM documentation for the C<providers> association:

The providers of the Experiment, its data and annotation.



=over


=item $array_ref = $experiment->setProviders($array_ref)

The restricted setter method for the providers association.

Input parameters: the value to which the providers association will be set : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Return value: the current value of the providers association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::AuditAndSecurity::Contact> instances

=cut

sub setProviders {
  my $self = shift;
  croak(__PACKAGE__ . "::setProviders: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setProviders: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setProviders: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setProviders: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Contact")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Contact');
  }

  return $self->{__PROVIDERS} = $val;
}



=item $array_ref = $experiment->getProviders()

The restricted getter method for the providers association.

Input parameters: none

Return value: the current value of the providers association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Contact>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getProviders {
  my $self = shift;
  croak(__PACKAGE__ . "::getProviders: arguments passed to getter")
    if @_;
  return $self->{__PROVIDERS};
}



=item $experiment->addProviders(@vals)

Because the providers association has list cardinality, it may store more
than one value. This method adds the current list of objects in the providers
association.

Input parameters: the list of values C<@vals> to add to the providers
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::AuditAndSecurity::Contact>

=cut

sub addProviders {
  my $self = shift;
  croak(__PACKAGE__ . "::addProviders: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addProviders: wrong type: " . ref($val) . " expected Bio::MAGE::AuditAndSecurity::Contact")
      unless UNIVERSAL::isa($val,'Bio::MAGE::AuditAndSecurity::Contact');
  }

  push(@{$self->{__PROVIDERS}},@vals);
}



=back


=item bioAssayData


From the MAGE-OM documentation for the C<bioAssayData> association:

The collection of BioAssayDatas for this Experiment.



=over


=item $array_ref = $experiment->setBioAssayData($array_ref)

The restricted setter method for the bioAssayData association.

Input parameters: the value to which the bioAssayData association will be set : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::BioAssayData>

Return value: the current value of the bioAssayData association : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::BioAssayData>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::BioAssayData::BioAssayData> instances

=cut

sub setBioAssayData {
  my $self = shift;
  croak(__PACKAGE__ . "::setBioAssayData: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setBioAssayData: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setBioAssayData: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setBioAssayData: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::BioAssayData")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::BioAssayData');
  }

  return $self->{__BIOASSAYDATA} = $val;
}



=item $array_ref = $experiment->getBioAssayData()

The restricted getter method for the bioAssayData association.

Input parameters: none

Return value: the current value of the bioAssayData association : a reference to an array of objects of type C<Bio::MAGE::BioAssayData::BioAssayData>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getBioAssayData {
  my $self = shift;
  croak(__PACKAGE__ . "::getBioAssayData: arguments passed to getter")
    if @_;
  return $self->{__BIOASSAYDATA};
}



=item $experiment->addBioAssayData(@vals)

Because the bioAssayData association has list cardinality, it may store more
than one value. This method adds the current list of objects in the bioAssayData
association.

Input parameters: the list of values C<@vals> to add to the bioAssayData
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::BioAssayData::BioAssayData>

=cut

sub addBioAssayData {
  my $self = shift;
  croak(__PACKAGE__ . "::addBioAssayData: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addBioAssayData: wrong type: " . ref($val) . " expected Bio::MAGE::BioAssayData::BioAssayData")
      unless UNIVERSAL::isa($val,'Bio::MAGE::BioAssayData::BioAssayData');
  }

  push(@{$self->{__BIOASSAYDATA}},@vals);
}



=back


=item analysisResults


From the MAGE-OM documentation for the C<analysisResults> association:

The results of analyzing the data, typically with a clustering algorithm.



=over


=item $array_ref = $experiment->setAnalysisResults($array_ref)

The restricted setter method for the analysisResults association.

Input parameters: the value to which the analysisResults association will be set : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster>

Return value: the current value of the analysisResults association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster> instances

=cut

sub setAnalysisResults {
  my $self = shift;
  croak(__PACKAGE__ . "::setAnalysisResults: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setAnalysisResults: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setAnalysisResults: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setAnalysisResults: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster');
  }

  return $self->{__ANALYSISRESULTS} = $val;
}



=item $array_ref = $experiment->getAnalysisResults()

The restricted getter method for the analysisResults association.

Input parameters: none

Return value: the current value of the analysisResults association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getAnalysisResults {
  my $self = shift;
  croak(__PACKAGE__ . "::getAnalysisResults: arguments passed to getter")
    if @_;
  return $self->{__ANALYSISRESULTS};
}



=item $experiment->addAnalysisResults(@vals)

Because the analysisResults association has list cardinality, it may store more
than one value. This method adds the current list of objects in the analysisResults
association.

Input parameters: the list of values C<@vals> to add to the analysisResults
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster>

=cut

sub addAnalysisResults {
  my $self = shift;
  croak(__PACKAGE__ . "::addAnalysisResults: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addAnalysisResults: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::BioAssayDataCluster');
  }

  push(@{$self->{__ANALYSISRESULTS}},@vals);
}



=back


=item experimentDesign


From the MAGE-OM documentation for the C<experimentDesign> association:

The association to the description and annotation of the Experiment, along with the grouping of the top-level BioAssays.



=over


=item $val = $experiment->setExperimentDesign($val)

The restricted setter method for the experimentDesign association.

Input parameters: the value to which the experimentDesign association will be set : an instance of type C<Bio::MAGE::Experiment::ExperimentDesign>.

Return value: the current value of the experimentDesign association : an instance of type C<Bio::MAGE::Experiment::ExperimentDesign>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::Experiment::ExperimentDesign>

=cut

sub setExperimentDesign {
  my $self = shift;
  croak(__PACKAGE__ . "::setExperimentDesign: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setExperimentDesign: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
  croak(__PACKAGE__ . "::setExperimentDesign: wrong type: " . ref($val) . " expected Bio::MAGE::Experiment::ExperimentDesign") unless UNIVERSAL::isa($val,'Bio::MAGE::Experiment::ExperimentDesign');
  return $self->{__EXPERIMENTDESIGN} = $val;
}



=item $val = $experiment->getExperimentDesign()

The restricted getter method for the experimentDesign association.

Input parameters: none

Return value: the current value of the experimentDesign association : an instance of type C<Bio::MAGE::Experiment::ExperimentDesign>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getExperimentDesign {
  my $self = shift;
  croak(__PACKAGE__ . "::getExperimentDesign: arguments passed to getter")
    if @_;
  return $self->{__EXPERIMENTDESIGN};
}




=back

Associations Inherited from Bio::MAGE::Describable


=item security


From the MAGE-OM documentation for the C<security> association:

Information on the security for the instance of the class.



=over


=item $val = $describable->setSecurity($val)

The restricted setter method for the security association.

Input parameters: the value to which the security association will be set : an instance of type C<Bio::MAGE::AuditAndSecurity::Security>.

Return value: the current value of the security association : an instance of type C<Bio::MAGE::AuditAndSecurity::Security>.

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $val is not an instance of class C<Bio::MAGE::AuditAndSecurity::Security>

=cut


=item $val = $describable->getSecurity()

The restricted getter method for the security association.

Input parameters: none

Return value: the current value of the security association : an instance of type C<Bio::MAGE::AuditAndSecurity::Security>.

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut



=back


=item auditTrail


From the MAGE-OM documentation for the C<auditTrail> association:

A list of Audit instances that track changes to the instance of Describable.



=over


=item $array_ref = $describable->setAuditTrail($array_ref)

The restricted setter method for the auditTrail association.

Input parameters: the value to which the auditTrail association will be set : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Return value: the current value of the auditTrail association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::AuditAndSecurity::Audit> instances

=cut


=item $array_ref = $describable->getAuditTrail()

The restricted getter method for the auditTrail association.

Input parameters: none

Return value: the current value of the auditTrail association : a reference to an array of objects of type C<Bio::MAGE::AuditAndSecurity::Audit>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $describable->addAuditTrail(@vals)

Because the auditTrail association has list cardinality, it may store more
than one value. This method adds the current list of objects in the auditTrail
association.

Input parameters: the list of values C<@vals> to add to the auditTrail
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::AuditAndSecurity::Audit>

=cut



=back


=item descriptions


From the MAGE-OM documentation for the C<descriptions> association:

Free hand text descriptions.  Makes available the associations of Description to an instance of Describable.



=over


=item $array_ref = $describable->setDescriptions($array_ref)

The restricted setter method for the descriptions association.

Input parameters: the value to which the descriptions association will be set : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Return value: the current value of the descriptions association : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::Description::Description> instances

=cut


=item $array_ref = $describable->getDescriptions()

The restricted getter method for the descriptions association.

Input parameters: none

Return value: the current value of the descriptions association : a reference to an array of objects of type C<Bio::MAGE::Description::Description>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $describable->addDescriptions(@vals)

Because the descriptions association has list cardinality, it may store more
than one value. This method adds the current list of objects in the descriptions
association.

Input parameters: the list of values C<@vals> to add to the descriptions
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::Description::Description>

=cut



=back

Associations Inherited from Bio::MAGE::Extendable


=item propertySets


From the MAGE-OM documentation for the C<propertySets> association:

Allows specification of name/value pairs.  Meant to primarily help in-house, pipeline processing of instances by providing a place for values that aren't part of the specification proper.



=over


=item $array_ref = $extendable->setPropertySets($array_ref)

The restricted setter method for the propertySets association.

Input parameters: the value to which the propertySets association will be set : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Return value: the current value of the propertySets association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::NameValueType> instances

=cut


=item $array_ref = $extendable->getPropertySets()

The restricted getter method for the propertySets association.

Input parameters: none

Return value: the current value of the propertySets association : a reference to an array of objects of type C<Bio::MAGE::NameValueType>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut


=item $extendable->addPropertySets(@vals)

Because the propertySets association has list cardinality, it may store more
than one value. This method adds the current list of objects in the propertySets
association.

Input parameters: the list of values C<@vals> to add to the propertySets
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::NameValueType>

=cut



=back



=back


=cut



sub initialize {
  my $self = shift;
  return 1;
}



=head1 BUGS

Please send bug reports to mged-mage@lists.sf.net

=head1 AUTHOR

Jason E. Stewart (jason@openinformatics.com)

=head1 SEE ALSO

perl(1).

=cut

#
# End the module by returning a true value
#
1;

