##############################
#
# Bio::MAGE::HigherLevelAnalysis::Node
#
##############################
package Bio::MAGE::HigherLevelAnalysis::Node;

use strict;
use Carp;
use Bio::MAGE::Base;
use Bio::MAGE::Association;
use Bio::MAGE::Describable;


use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $__ASSOCIATIONS);

require Exporter;

@ISA = qw(Bio::MAGE::Base Bio::MAGE::Describable Exporter);
$VERSION = q[$Id: Node.pm,v 1.4 2002/08/24 16:12:21 jason_e_stewart Exp $];

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT_OK = qw();


=head1 Bio::MAGE::HigherLevelAnalysis::Node

=head2 SYNOPSIS

  use Bio::MAGE::HigherLevelAnalysis::Node;

    # creating an empty instance
  my $node = Bio::MAGE::HigherLevelAnalysis::Node->new();

    # creating an already populated instance
  my $node = Bio::MAGE::HigherLevelAnalysis::Node->new(nodeValue=>$nodeValue_value,
			nodeContents=>$nodeContents_value,
			nodes=>$nodes_value);

    # setting and retrieving object associations
  my $nodeValue_val = $node->nodeValue();
  $node->nodeValue($value);

  my $nodeContents_val = $node->nodeContents();
  $node->nodeContents($value);

  my $nodes_val = $node->nodes();
  $node->nodes($value);


=head2 DESCRIPTION

From the MAGE-OM documentation for the C<Node> class:

An individual component of a clustering.  May contain other nodes.



=cut


=head2 INHERITANCE


Bio::MAGE::HigherLevelAnalysis::Node has the following super classes

=over 


=item * Bio::MAGE::Describable


=back


=head2 CLASS METHODS

The following methods can all be called without first having an
instance of the class via the Bio::MAGE::HigherLevelAnalysis::Node->methodname() syntax.


=item new()

=item new(%args)


The object constructor C<new()> accepts the following optional
named-value style arguments:

=over


=item * nodeValue

Sets the value of the nodeValue association (from C<Bio::MAGE::HigherLevelAnalysis::Node>).


=item * nodeContents

Sets the value of the nodeContents association (from C<Bio::MAGE::HigherLevelAnalysis::Node>).


=item * nodes

Sets the value of the nodes association (from C<Bio::MAGE::HigherLevelAnalysis::Node>).


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

Returns the full class name for this class, Bio::MAGE::HigherLevelAnalysis::Node.

=cut

sub class_name {
  return q[Bio::MAGE::HigherLevelAnalysis::Node];
}

=item $package_name = package()

Returns the unresolved package name (i.e. no 'Bio::MAGE::') of the
package that contains class, Bio::MAGE::HigherLevelAnalysis::Node.

=cut

sub package {
  return q[HigherLevelAnalysis];
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
  my @list = ('Bio::MAGE::Describable');
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
  my @list = ('nodeValue', 'nodeContents', 'nodes');
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

Bio::MAGE::HigherLevelAnalysis::Node: has the following attribute accessor methods:

=over



=back


=cut



BEGIN {
  $__ASSOCIATIONS = [
          'nodes',
          bless( {
                   '__NAME' => 'nodes',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'Node',
                   '__RANK' => '1',
                   '__DESCRIPTION' => 'Nested nodes of the BioAssayDataCluster.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'nodeContents',
          bless( {
                   '__NAME' => 'nodeContents',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'NodeContents',
                   '__RANK' => '2',
                   '__DESCRIPTION' => 'The contents of the node, expressed as either a one, two or three dimensional object.',
                   '__ORDERED' => 0
                 }, 'Bio::MAGE::Association' ),
          'nodeValue',
          bless( {
                   '__NAME' => 'nodeValue',
                   '__IS_REF' => 0,
                   '__CARDINALITY' => '0..N',
                   '__CLASS_NAME' => 'NodeValue',
                   '__RANK' => '3',
                   '__DESCRIPTION' => 'Values or measurements for this node that may be produced by the clustering algorithm.  Typical are distance values for the nodes.',
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

Bio::MAGE::HigherLevelAnalysis::Node: has the following association accessor methods:

=over


=item nodeValue


From the MAGE-OM documentation for the C<nodeValue> association:

Values or measurements for this node that may be produced by the clustering algorithm.  Typical are distance values for the nodes.



=over


=item $array_ref = $node->setNodeValue($array_ref)

The restricted setter method for the nodeValue association.

Input parameters: the value to which the nodeValue association will be set : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::NodeValue>

Return value: the current value of the nodeValue association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::NodeValue>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::HigherLevelAnalysis::NodeValue> instances

=cut

sub setNodeValue {
  my $self = shift;
  croak(__PACKAGE__ . "::setNodeValue: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNodeValue: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setNodeValue: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setNodeValue: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::NodeValue")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::NodeValue');
  }

  return $self->{__NODEVALUE} = $val;
}



=item $array_ref = $node->getNodeValue()

The restricted getter method for the nodeValue association.

Input parameters: none

Return value: the current value of the nodeValue association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::NodeValue>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNodeValue {
  my $self = shift;
  croak(__PACKAGE__ . "::getNodeValue: arguments passed to getter")
    if @_;
  return $self->{__NODEVALUE};
}



=item $node->addNodeValue(@vals)

Because the nodeValue association has list cardinality, it may store more
than one value. This method adds the current list of objects in the nodeValue
association.

Input parameters: the list of values C<@vals> to add to the nodeValue
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::HigherLevelAnalysis::NodeValue>

=cut

sub addNodeValue {
  my $self = shift;
  croak(__PACKAGE__ . "::addNodeValue: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addNodeValue: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::NodeValue")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::NodeValue');
  }

  push(@{$self->{__NODEVALUE}},@vals);
}



=back


=item nodeContents


From the MAGE-OM documentation for the C<nodeContents> association:

The contents of the node, expressed as either a one, two or three dimensional object.



=over


=item $array_ref = $node->setNodeContents($array_ref)

The restricted setter method for the nodeContents association.

Input parameters: the value to which the nodeContents association will be set : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::NodeContents>

Return value: the current value of the nodeContents association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::NodeContents>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::HigherLevelAnalysis::NodeContents> instances

=cut

sub setNodeContents {
  my $self = shift;
  croak(__PACKAGE__ . "::setNodeContents: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNodeContents: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setNodeContents: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setNodeContents: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::NodeContents")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::NodeContents');
  }

  return $self->{__NODECONTENTS} = $val;
}



=item $array_ref = $node->getNodeContents()

The restricted getter method for the nodeContents association.

Input parameters: none

Return value: the current value of the nodeContents association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::NodeContents>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNodeContents {
  my $self = shift;
  croak(__PACKAGE__ . "::getNodeContents: arguments passed to getter")
    if @_;
  return $self->{__NODECONTENTS};
}



=item $node->addNodeContents(@vals)

Because the nodeContents association has list cardinality, it may store more
than one value. This method adds the current list of objects in the nodeContents
association.

Input parameters: the list of values C<@vals> to add to the nodeContents
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::HigherLevelAnalysis::NodeContents>

=cut

sub addNodeContents {
  my $self = shift;
  croak(__PACKAGE__ . "::addNodeContents: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addNodeContents: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::NodeContents")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::NodeContents');
  }

  push(@{$self->{__NODECONTENTS}},@vals);
}



=back


=item nodes


From the MAGE-OM documentation for the C<nodes> association:

Nested nodes of the BioAssayDataCluster.



=over


=item $array_ref = $node->setNodes($array_ref)

The restricted setter method for the nodes association.

Input parameters: the value to which the nodes association will be set : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::Node>

Return value: the current value of the nodes association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::Node>

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified, or
if too many input parameters are specified , or if $array_ref is not a reference to an array class C<Bio::MAGE::HigherLevelAnalysis::Node> instances

=cut

sub setNodes {
  my $self = shift;
  croak(__PACKAGE__ . "::setNodes: no arguments passed to setter")
    unless @_;
  croak(__PACKAGE__ . "::setNodes: too many arguments passed to setter")
    if @_ > 1;
  my $val = shift;
    croak(__PACKAGE__ . "::setNodes: expected array reference, got $self")
    unless UNIVERSAL::isa($val,'ARRAY');
  foreach my $val (@{$val}) {
    croak(__PACKAGE__ . "::setNodes: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::Node")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::Node');
  }

  return $self->{__NODES} = $val;
}



=item $array_ref = $node->getNodes()

The restricted getter method for the nodes association.

Input parameters: none

Return value: the current value of the nodes association : a reference to an array of objects of type C<Bio::MAGE::HigherLevelAnalysis::Node>

Side effects: none

Exceptions: will call C<croak()> if any input parameters are specified

=cut

sub getNodes {
  my $self = shift;
  croak(__PACKAGE__ . "::getNodes: arguments passed to getter")
    if @_;
  return $self->{__NODES};
}



=item $node->addNodes(@vals)

Because the nodes association has list cardinality, it may store more
than one value. This method adds the current list of objects in the nodes
association.

Input parameters: the list of values C<@vals> to add to the nodes
association. B<NOTE>: submitting a single value is permitted.

Return value: none

Side effects: none

Exceptions: will call C<croak()> if no input parameters are specified
, or if any of the objects in @vals is not an instance of class C<Bio::MAGE::HigherLevelAnalysis::Node>

=cut

sub addNodes {
  my $self = shift;
  croak(__PACKAGE__ . "::addNodes: no arguments passed to setter")
    unless @_;
  my @vals = @_;
    foreach my $val (@vals) {
    croak(__PACKAGE__ . "::addNodes: wrong type: " . ref($val) . " expected Bio::MAGE::HigherLevelAnalysis::Node")
      unless UNIVERSAL::isa($val,'Bio::MAGE::HigherLevelAnalysis::Node');
  }

  push(@{$self->{__NODES}},@vals);
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

