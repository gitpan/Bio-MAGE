$XMI::classes = {
                  'ReporterGroup' => {
                                     'attrs' => [],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'Reporter',
                                                                        'name' => 'reporters',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The reporters that belong to this group.',
                                                                        'cardinality' => '1..N',
                                                                        'class_id' => 'S.258',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'ReporterGroup',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The reporters that belong to this group.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.32',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'DesignElementGroup',
                                     'documentation' => 'Allows specification of the type of Reporter Design Element.
',
                                     'methods' => [],
                                     'name' => 'ReporterGroup',
                                     'abstract' => 'false',
                                     'id' => 'S.32',
                                     'package' => 'ArrayDesign'
                                   },
                  'SeqFeatureLocation' => {
                                          'attrs' => [
                                                       {
                                                         'documentation' => 'Indicates the direction and/or type of the SeqFeature, i.e. whether it is in the 5\' or 3\' direction, is double stranded, etc.',
                                                         'name' => 'strandType',
                                                         'type' => 'String',
                                                         'id' => 'S.230'
                                                       }
                                                     ],
                                          'associations' => [
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'SeqFeatureLocation',
                                                                             'name' => 'subregions',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'Regions within the SeqFeature.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.229',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 1',
                                                                                               'rank' => '1'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'SeqFeatureLocation',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'Regions within the SeqFeature.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.229',
                                                                            'constraint' => undef
                                                                          }
                                                              },
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'SequencePosition',
                                                                             'name' => 'coordinate',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'At which base pairs or amino acid this SeqFeature begins and ends.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.236',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 2',
                                                                                               'rank' => '2'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'SeqFeatureLocation',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'At which base pairs or amino acid this SeqFeature begins and ends.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.229',
                                                                            'constraint' => undef
                                                                          }
                                                              }
                                                            ],
                                          'parent' => 'Extendable',
                                          'documentation' => 'The location of the SeqFeature annotation.',
                                          'methods' => [],
                                          'name' => 'SeqFeatureLocation',
                                          'abstract' => 'false',
                                          'id' => 'S.229',
                                          'package' => 'BioSequence'
                                        },
                  'BibliographicReference' => {
                                              'attrs' => [
                                                           {
                                                             'name' => 'title',
                                                             'type' => 'String',
                                                             'id' => 'S.216'
                                                           },
                                                           {
                                                             'name' => 'authors',
                                                             'type' => 'String',
                                                             'id' => 'S.217'
                                                           },
                                                           {
                                                             'name' => 'publication',
                                                             'type' => 'String',
                                                             'id' => 'S.218'
                                                           },
                                                           {
                                                             'name' => 'publisher',
                                                             'type' => 'String',
                                                             'id' => 'S.219'
                                                           },
                                                           {
                                                             'name' => 'editor',
                                                             'type' => 'String',
                                                             'id' => 'S.220'
                                                           },
                                                           {
                                                             'name' => 'year',
                                                             'type' => 'Date',
                                                             'id' => 'S.221'
                                                           },
                                                           {
                                                             'name' => 'volume',
                                                             'type' => 'String',
                                                             'id' => 'S.222'
                                                           },
                                                           {
                                                             'name' => 'issue',
                                                             'type' => 'String',
                                                             'id' => 'S.223'
                                                           },
                                                           {
                                                             'name' => 'pages',
                                                             'type' => 'String',
                                                             'id' => 'S.224'
                                                           },
                                                           {
                                                             'name' => 'URI',
                                                             'type' => 'String',
                                                             'id' => 'S.225'
                                                           }
                                                         ],
                                              'associations' => [
                                                                  {
                                                                    'other' => {
                                                                                 'class_name' => 'OntologyEntry',
                                                                                 'name' => 'parameters',
                                                                                 'navigable' => 'true',
                                                                                 'ordering' => 'unordered',
                                                                                 'aggregation' => 'none',
                                                                                 'documentation' => 'Criteria that can be used to look up the reference in a repository.',
                                                                                 'cardinality' => '1..N',
                                                                                 'class_id' => 'S.185',
                                                                                 'constraint' => {
                                                                                                   'ordered' => 0,
                                                                                                   'constraint' => 'rank: 1',
                                                                                                   'rank' => '1'
                                                                                                 }
                                                                               },
                                                                    'self' => {
                                                                                'class_name' => 'BibliographicReference',
                                                                                'name' => undef,
                                                                                'navigable' => 'false',
                                                                                'ordering' => 'unordered',
                                                                                'aggregation' => 'composite',
                                                                                'documentation' => 'Criteria that can be used to look up the reference in a repository.',
                                                                                'cardinality' => '1',
                                                                                'class_id' => 'S.215',
                                                                                'constraint' => undef
                                                                              }
                                                                  }
                                                                ],
                                              'parent' => 'Describable',
                                              'documentation' => 'Attributes for the most common criteria and association with OntologyEntry allows criteria to be specified for searching for a Bibliographic reference.
',
                                              'methods' => [],
                                              'name' => 'BibliographicReference',
                                              'abstract' => 'false',
                                              'id' => 'S.215',
                                              'package' => 'BQS'
                                            },
                  'BioDataTuples' => {
                                     'attrs' => [],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'BioAssayDatum',
                                                                        'name' => 'bioAssayTupleData',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The collection of BioAssayData tuples.',
                                                                        'cardinality' => '0..N',
                                                                        'class_id' => 'S.124',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'BioDataTuples',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'The collection of BioAssayData tuples.',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.134',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'BioDataValues',
                                     'documentation' => 'A relational, tuple representation of the data.',
                                     'methods' => [],
                                     'name' => 'BioDataTuples',
                                     'abstract' => 'false',
                                     'id' => 'S.134',
                                     'package' => 'BioAssayData'
                                   },
                  'ArrayGroup' => {
                                  'attrs' => [
                                               {
                                                 'documentation' => 'Identifier for the ArrayGroup.',
                                                 'name' => 'barcode',
                                                 'type' => 'String',
                                                 'id' => 'S.47'
                                               },
                                               {
                                                 'documentation' => 'If there exist more than one array on a slide or a chip, then the spacing between the arrays is useful so that scanning / feature extraction software can crop images representing 1 unique bioassay. ',
                                                 'name' => 'arraySpacingX',
                                                 'type' => 'float',
                                                 'id' => 'S.48'
                                               },
                                               {
                                                 'documentation' => 'If there exist more than one array on a slide or a chip, then the spacing between the arrays is useful so that scanning / feature extraction software can crop images representing 1 unique bioassay. ',
                                                 'name' => 'arraySpacingY',
                                                 'type' => 'float',
                                                 'id' => 'S.49'
                                               },
                                               {
                                                 'documentation' => 'This attribute defines the number of arrays on a chip or a slide. ',
                                                 'name' => 'numArrays',
                                                 'type' => 'int',
                                                 'id' => 'S.50'
                                               },
                                               {
                                                 'documentation' => 'For a human to determine where the top left side of the array is, such as a barcode or frosted side of the glass, etc.',
                                                 'name' => 'orientationMark',
                                                 'type' => 'String',
                                                 'id' => 'S.51'
                                               },
                                               {
                                                 'documentation' => 'One of top, bottom, left or right.',
                                                 'name' => 'orientationMarkPosition',
                                                 'type' => 'enum {top,bottom,left,right}',
                                                 'id' => 'S.52'
                                               },
                                               {
                                                 'documentation' => 'The width of the platform',
                                                 'name' => 'width',
                                                 'type' => 'float',
                                                 'id' => 'S.53'
                                               },
                                               {
                                                 'documentation' => 'The length of the platform.',
                                                 'name' => 'length',
                                                 'type' => 'float',
                                                 'id' => 'S.54'
                                               }
                                             ],
                                  'associations' => [
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'Array',
                                                                     'name' => 'arrays',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                                                                     'cardinality' => '1..N',
                                                                     'class_id' => 'S.40',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 2',
                                                                                       'rank' => '2'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ArrayGroup',
                                                                    'name' => 'arrayGroup',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.46',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 3',
                                                                                      'rank' => '3'
                                                                                    }
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'Fiducial',
                                                                     'name' => 'fiducials',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Association to the marks on the Array for alignment for the scanner.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.59',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 1',
                                                                                       'rank' => '1'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ArrayGroup',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'Association to the marks on the Array for alignment for the scanner.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.46',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'DistanceUnit',
                                                                     'name' => 'distanceUnit',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The unit of the measurement attributes.',
                                                                     'cardinality' => '0..1',
                                                                     'class_id' => 'S.199',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 4',
                                                                                       'rank' => '4'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ArrayGroup',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'The unit of the measurement attributes.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.46',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'OntologyEntry',
                                                                     'name' => 'substrateType',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Commonly, arrays will be spotted on 1x3 glass microscope slides but there is nothing that says this must be the case.  This association is for scanners to inform them on the possible different formats of slides that can contain arrays.',
                                                                     'cardinality' => '0..1',
                                                                     'class_id' => 'S.185',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 3',
                                                                                       'rank' => '3'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ArrayGroup',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'Commonly, arrays will be spotted on 1x3 glass microscope slides but there is nothing that says this must be the case.  This association is for scanners to inform them on the possible different formats of slides that can contain arrays.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.46',
                                                                    'constraint' => undef
                                                                  }
                                                      }
                                                    ],
                                  'parent' => 'Identifiable',
                                  'documentation' => 'An array package is a physical platform that contains one or more arrays that are separately addressable (e.g. several arrays that can be hybridized on a single microscope slide) or a virtual grouping together of arrays.

The array package that has been manufactured has information about where certain artifacts about the array are located for scanning and feature extraction purposes.',
                                  'methods' => [],
                                  'name' => 'ArrayGroup',
                                  'abstract' => 'false',
                                  'id' => 'S.46',
                                  'package' => 'Array'
                                },
                  'DistanceUnit' => {
                                    'attrs' => [
                                                 {
                                                   'name' => 'unitNameCV',
                                                   'type' => 'enum {fm,pm,nm,um,mm,cm,m,other}',
                                                   'id' => 'S.200'
                                                 }
                                               ],
                                    'associations' => [],
                                    'parent' => 'Unit',
                                    'documentation' => 'Distance',
                                    'methods' => [],
                                    'name' => 'DistanceUnit',
                                    'abstract' => 'false',
                                    'id' => 'S.199',
                                    'package' => 'Measurement'
                                  },
                  'ProtocolApplication' => {
                                           'attrs' => [
                                                        {
                                                          'documentation' => 'When the protocol was applied.',
                                                          'name' => 'activityDate',
                                                          'type' => 'String',
                                                          'id' => 'S.156'
                                                        }
                                                      ],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Person',
                                                                              'name' => 'performers',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The people who performed the protocol.',
                                                                              'cardinality' => '0..N',
                                                                              'class_id' => 'S.102',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 3',
                                                                                                'rank' => '3'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'ProtocolApplication',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The people who performed the protocol.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.155',
                                                                             'constraint' => undef
                                                                           }
                                                               },
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Protocol',
                                                                              'name' => 'protocol',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The protocol that is being used.',
                                                                              'cardinality' => '1',
                                                                              'class_id' => 'S.149',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 4',
                                                                                                'rank' => '4'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'ProtocolApplication',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The protocol that is being used.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.155',
                                                                             'constraint' => undef
                                                                           }
                                                               },
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'SoftwareApplication',
                                                                              'name' => 'softwareApplications',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The use of software for the application of the protocol.',
                                                                              'cardinality' => '0..N',
                                                                              'class_id' => 'S.163',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 2',
                                                                                                'rank' => '2'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'ProtocolApplication',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'composite',
                                                                             'documentation' => 'The use of software for the application of the protocol.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.155',
                                                                             'constraint' => undef
                                                                           }
                                                               },
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'HardwareApplication',
                                                                              'name' => 'hardwareApplications',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The use of hardware for the application of the protocol.',
                                                                              'cardinality' => '0..N',
                                                                              'class_id' => 'S.161',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'ProtocolApplication',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'composite',
                                                                             'documentation' => 'The use of hardware for the application of the protocol.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.155',
                                                                             'constraint' => undef
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'ParameterizableApplication',
                                           'documentation' => 'The use of a protocol with the requisite Parameters and ParameterValues.',
                                           'methods' => [],
                                           'name' => 'ProtocolApplication',
                                           'abstract' => 'false',
                                           'id' => 'S.155',
                                           'package' => 'Protocol'
                                         },
                  'ManufactureLIMS' => {
                                       'subclasses' => [
                                                         'ManufactureLIMSBiomaterial'
                                                       ],
                                       'attrs' => [
                                                    {
                                                      'documentation' => 'A brief description of the quality of the array manufacture process.',
                                                      'name' => 'quality',
                                                      'type' => 'String',
                                                      'id' => 'S.61'
                                                    }
                                                  ],
                                       'parent' => 'Describable',
                                       'name' => 'ManufactureLIMS',
                                       'package' => 'Array',
                                       'associations' => [
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'Feature',
                                                                          'name' => 'feature',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The feature whose LIMS information is being described.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.262',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 1',
                                                                                            'rank' => '1'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'ManufactureLIMS',
                                                                         'name' => undef,
                                                                         'navigable' => 'false',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The feature whose LIMS information is being described.',
                                                                         'cardinality' => '0..N',
                                                                         'class_id' => 'S.60',
                                                                         'constraint' => undef
                                                                       }
                                                           },
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'DatabaseEntry',
                                                                          'name' => 'identifierLIMS',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'Association to a LIMS data source for further information on the manufacturing process.',
                                                                          'cardinality' => '0..1',
                                                                          'class_id' => 'S.173',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 3',
                                                                                            'rank' => '3'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'ManufactureLIMS',
                                                                         'name' => undef,
                                                                         'navigable' => 'false',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'composite',
                                                                         'documentation' => 'Association to a LIMS data source for further information on the manufacturing process.',
                                                                         'cardinality' => '1',
                                                                         'class_id' => 'S.60',
                                                                         'constraint' => undef
                                                                       }
                                                           },
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'BioMaterial',
                                                                          'name' => 'bioMaterial',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The BioMaterial used for the feature.',
                                                                          'cardinality' => '0..1',
                                                                          'class_id' => 'S.72',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 2',
                                                                                            'rank' => '2'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'ManufactureLIMS',
                                                                         'name' => undef,
                                                                         'navigable' => 'false',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The BioMaterial used for the feature.',
                                                                         'cardinality' => '0..N',
                                                                         'class_id' => 'S.60',
                                                                         'constraint' => undef
                                                                       }
                                                           }
                                                         ],
                                       'methods' => [],
                                       'documentation' => 'Information on the physical production of arrays within the laboratory.',
                                       'id' => 'S.60',
                                       'abstract' => 'false'
                                     },
                  'FeatureReporterMap' => {
                                          'attrs' => [],
                                          'associations' => [
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'Reporter',
                                                                             'name' => 'reporter',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'Associates features with their reporter.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.258',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 1',
                                                                                               'rank' => '1'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'FeatureReporterMap',
                                                                            'name' => 'featureReporterMaps',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'Associates features with their reporter.',
                                                                            'cardinality' => '0..N',
                                                                            'class_id' => 'S.269',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 4',
                                                                                              'rank' => '4'
                                                                                            }
                                                                          }
                                                              },
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'FeatureInformation',
                                                                             'name' => 'featureInformationSources',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'Typically, the features on an array that are manufactured with this reporter\'s BioSequence.',
                                                                             'cardinality' => '1..N',
                                                                             'class_id' => 'S.267',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 2',
                                                                                               'rank' => '2'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'FeatureReporterMap',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'Typically, the features on an array that are manufactured with this reporter\'s BioSequence.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.269',
                                                                            'constraint' => undef
                                                                          }
                                                              }
                                                            ],
                                          'parent' => 'DesignElementMap',
                                          'documentation' => 'A FeatureReporterMap is the description of how source features are transformed into a target reporter.  These would map replicate features for a reporter to the reporter.',
                                          'methods' => [],
                                          'name' => 'FeatureReporterMap',
                                          'abstract' => 'false',
                                          'id' => 'S.269',
                                          'package' => 'DesignElement'
                                        },
                  'Security' => {
                                'attrs' => [],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'SecurityGroup',
                                                                   'name' => 'securityGroups',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Specifies which security groups have permission to view the associated object.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.111',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Security',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Specifies which security groups have permission to view the associated object.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.106',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Contact',
                                                                   'name' => 'owner',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The owner of the security rights.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.112',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Security',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'The owner of the security rights.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.106',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Identifiable',
                                'documentation' => 'Permission information for an object as to ownership, write and read permissions.',
                                'methods' => [],
                                'name' => 'Security',
                                'abstract' => 'false',
                                'id' => 'S.106',
                                'package' => 'AuditAndSecurity'
                              },
                  'Hybridization' => {
                                     'attrs' => [],
                                     'associations' => [],
                                     'parent' => 'BioAssayCreation',
                                     'documentation' => 'The archetypal bioAssayCreation event, whereby biomaterials are hybridized to an array.',
                                     'methods' => [],
                                     'name' => 'Hybridization',
                                     'abstract' => 'false',
                                     'id' => 'S.98',
                                     'package' => 'BioAssay'
                                   },
                  'DerivedBioAssayData' => {
                                           'attrs' => [],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Transformation',
                                                                              'name' => 'producerTransformation',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The association between the DerivedBioAssayData and the Transformation event that produced it.',
                                                                              'cardinality' => '0..1',
                                                                              'class_id' => 'S.137',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'DerivedBioAssayData',
                                                                             'name' => 'derivedBioAssayDataTarget',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'composite',
                                                                             'documentation' => 'The association between the DerivedBioAssayData and the Transformation event that produced it.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.126',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 2',
                                                                                               'rank' => '2'
                                                                                             }
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'BioAssayData',
                                           'documentation' => 'The output of a transformation event.',
                                           'methods' => [],
                                           'name' => 'DerivedBioAssayData',
                                           'abstract' => 'false',
                                           'id' => 'S.126',
                                           'package' => 'BioAssayData'
                                         },
                  'PositionDelta' => {
                                     'attrs' => [
                                                  {
                                                    'documentation' => 'Deviation from the y coordinate of this feature\'s position.',
                                                    'name' => 'deltaX',
                                                    'type' => 'float',
                                                    'id' => 'S.67'
                                                  },
                                                  {
                                                    'documentation' => 'Deviation from the y coordinate of this feature\'s position.',
                                                    'name' => 'deltaY',
                                                    'type' => 'float',
                                                    'id' => 'S.68'
                                                  }
                                                ],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'DistanceUnit',
                                                                        'name' => 'distanceUnit',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The unit for the attributes.',
                                                                        'cardinality' => '0..1',
                                                                        'class_id' => 'S.199',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'PositionDelta',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'The unit for the attributes.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.66',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'Extendable',
                                     'documentation' => 'The delta the feature was actually printed on the array from the position specified for the feature in the array design.',
                                     'methods' => [],
                                     'name' => 'PositionDelta',
                                     'abstract' => 'false',
                                     'id' => 'S.66',
                                     'package' => 'Array'
                                   },
                  'CompositePosition' => {
                                         'attrs' => [],
                                         'associations' => [
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'CompositeSequence',
                                                                            'name' => 'composite',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'A source CompositeSequence that is part of a target CompositeSequence',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.261',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 1',
                                                                                              'rank' => '1'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'CompositePosition',
                                                                           'name' => undef,
                                                                           'navigable' => 'false',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'A source CompositeSequence that is part of a target CompositeSequence',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.260',
                                                                           'constraint' => undef
                                                                         }
                                                             },
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'MismatchInformation',
                                                                            'name' => 'mismatchInformation',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'Differences in how the contained compositeSequence matches its target compositeSequence\'s sequence.',
                                                                            'cardinality' => '0..N',
                                                                            'class_id' => 'S.263',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 2',
                                                                                              'rank' => '2'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'CompositePosition',
                                                                           'name' => undef,
                                                                           'navigable' => 'false',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'composite',
                                                                           'documentation' => 'Differences in how the contained compositeSequence matches its target compositeSequence\'s sequence.',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.260',
                                                                           'constraint' => undef
                                                                         }
                                                             }
                                                           ],
                                         'parent' => 'SequencePosition',
                                         'documentation' => 'The location in the compositeSequence target\'s sequence to which a source compositeSequence maps.  The association to MismatchInformation allows the specification, usually for control purposes, of deviations from the CompositeSequence\'s BioMaterial.',
                                         'methods' => [],
                                         'name' => 'CompositePosition',
                                         'abstract' => 'false',
                                         'id' => 'S.260',
                                         'package' => 'DesignElement'
                                       },
                  'Hardware' => {
                                'attrs' => [
                                             {
                                               'documentation' => 'The model (number) of a piece of hardware.',
                                               'name' => 'model',
                                               'type' => 'String',
                                               'id' => 'S.159'
                                             },
                                             {
                                               'documentation' => 'The make of the Hardware (its manufacturer).',
                                               'name' => 'make',
                                               'type' => 'String',
                                               'id' => 'S.160'
                                             }
                                           ],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Contact',
                                                                   'name' => 'hardwareManufacturers',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Contact for information on the Hardware.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.112',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 3',
                                                                                     'rank' => '3'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Hardware',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Contact for information on the Hardware.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.158',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Software',
                                                                   'name' => 'softwares',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Associates Hardware and Software together.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.157',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Hardware',
                                                                  'name' => 'hardware',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Associates Hardware and Software together.',
                                                                  'cardinality' => '0..1',
                                                                  'class_id' => 'S.158',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 2',
                                                                                    'rank' => '2'
                                                                                  }
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'OntologyEntry',
                                                                   'name' => 'type',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The type of a piece of Hardware.  Examples include: scanner, wash station...',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.185',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Hardware',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The type of a piece of Hardware.  Examples include: scanner, wash station...',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.158',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Parameterizable',
                                'documentation' => 'Hardware represents the hardware used.  Examples of Hardware include: computers, scanners, wash stations etc...',
                                'methods' => [],
                                'name' => 'Hardware',
                                'abstract' => 'false',
                                'id' => 'S.158',
                                'package' => 'Protocol'
                              },
                  'ParameterValue' => {
                                      'attrs' => [
                                                   {
                                                     'documentation' => 'The value of the parameter.  Will have the datatype of its associated Parameter.',
                                                     'name' => 'value',
                                                     'type' => 'any',
                                                     'id' => 'S.154'
                                                   }
                                                 ],
                                      'associations' => [
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'Parameter',
                                                                         'name' => 'parameterType',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The parameter this value is for.',
                                                                         'cardinality' => '1',
                                                                         'class_id' => 'S.152',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 1',
                                                                                           'rank' => '1'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'ParameterValue',
                                                                        'name' => undef,
                                                                        'navigable' => 'false',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The parameter this value is for.',
                                                                        'cardinality' => '0..N',
                                                                        'class_id' => 'S.153',
                                                                        'constraint' => undef
                                                                      }
                                                          }
                                                        ],
                                      'parent' => 'Extendable',
                                      'documentation' => 'The value of a Parameter.',
                                      'methods' => [],
                                      'name' => 'ParameterValue',
                                      'abstract' => 'false',
                                      'id' => 'S.153',
                                      'package' => 'Protocol'
                                    },
                  'CompositeCompositeMap' => {
                                             'attrs' => [],
                                             'associations' => [
                                                                 {
                                                                   'other' => {
                                                                                'class_name' => 'CompositePosition',
                                                                                'name' => 'compositePositionSources',
                                                                                'navigable' => 'true',
                                                                                'ordering' => 'unordered',
                                                                                'aggregation' => 'none',
                                                                                'documentation' => 'Association to the CompositeSequences that compose this CompositeSequence and where those CompositeSequences occur.',
                                                                                'cardinality' => '1..N',
                                                                                'class_id' => 'S.260',
                                                                                'constraint' => {
                                                                                                  'ordered' => 0,
                                                                                                  'constraint' => 'rank: 2',
                                                                                                  'rank' => '2'
                                                                                                }
                                                                              },
                                                                   'self' => {
                                                                               'class_name' => 'CompositeCompositeMap',
                                                                               'name' => undef,
                                                                               'navigable' => 'false',
                                                                               'ordering' => 'unordered',
                                                                               'aggregation' => 'composite',
                                                                               'documentation' => 'Association to the CompositeSequences that compose this CompositeSequence and where those CompositeSequences occur.',
                                                                               'cardinality' => '1',
                                                                               'class_id' => 'S.268',
                                                                               'constraint' => undef
                                                                             }
                                                                 },
                                                                 {
                                                                   'other' => {
                                                                                'class_name' => 'CompositeSequence',
                                                                                'name' => 'compositeSequence',
                                                                                'navigable' => 'true',
                                                                                'ordering' => 'unordered',
                                                                                'aggregation' => 'none',
                                                                                'documentation' => 'A map to the compositeSequences that compose this CompositeSequence.',
                                                                                'cardinality' => '1',
                                                                                'class_id' => 'S.261',
                                                                                'constraint' => {
                                                                                                  'ordered' => 0,
                                                                                                  'constraint' => 'rank: 1',
                                                                                                  'rank' => '1'
                                                                                                }
                                                                              },
                                                                   'self' => {
                                                                               'class_name' => 'CompositeCompositeMap',
                                                                               'name' => 'compositeCompositeMaps',
                                                                               'navigable' => 'true',
                                                                               'ordering' => 'unordered',
                                                                               'aggregation' => 'none',
                                                                               'documentation' => 'A map to the compositeSequences that compose this CompositeSequence.',
                                                                               'cardinality' => '0..N',
                                                                               'class_id' => 'S.268',
                                                                               'constraint' => {
                                                                                                 'ordered' => 0,
                                                                                                 'constraint' => 'rank: 2',
                                                                                                 'rank' => '2'
                                                                                               }
                                                                             }
                                                                 }
                                                               ],
                                             'parent' => 'DesignElementMap',
                                             'documentation' => 'A CompositeCompositeMap is the description of how source CompositeSequences are transformed into a target CompositeSequence.   For instance, several CompositeSequences could represent different sequence regions for a Gene and could be mapped to different CompositeSequences, each representing a different splice variant for that Gene.',
                                             'methods' => [],
                                             'name' => 'CompositeCompositeMap',
                                             'abstract' => 'false',
                                             'id' => 'S.268',
                                             'package' => 'DesignElement'
                                           },
                  'Audit' => {
                             'attrs' => [
                                          {
                                            'documentation' => 'The date of a change.',
                                            'name' => 'date',
                                            'type' => 'Date',
                                            'id' => 'S.108'
                                          },
                                          {
                                            'documentation' => 'Indicates whether an action is a creation or a modification.',
                                            'name' => 'action',
                                            'type' => 'enum {creation,modification}',
                                            'id' => 'S.109'
                                          }
                                        ],
                             'associations' => [
                                                 {
                                                   'other' => {
                                                                'class_name' => 'Contact',
                                                                'name' => 'performer',
                                                                'navigable' => 'true',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'The contact for creating or changing the instance referred to by the Audit.',
                                                                'cardinality' => '0..1',
                                                                'class_id' => 'S.112',
                                                                'constraint' => {
                                                                                  'ordered' => 0,
                                                                                  'constraint' => 'rank: 1',
                                                                                  'rank' => '1'
                                                                                }
                                                              },
                                                   'self' => {
                                                               'class_name' => 'Audit',
                                                               'name' => undef,
                                                               'navigable' => 'false',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'The contact for creating or changing the instance referred to by the Audit.',
                                                               'cardinality' => '0..N',
                                                               'class_id' => 'S.107',
                                                               'constraint' => undef
                                                             }
                                                 }
                                               ],
                             'parent' => 'Describable',
                             'documentation' => 'Tracks information on the contact that creates or modifies an object.',
                             'methods' => [],
                             'name' => 'Audit',
                             'abstract' => 'false',
                             'id' => 'S.107',
                             'package' => 'AuditAndSecurity'
                           },
                  'BioAssay' => {
                                'subclasses' => [
                                                  'MeasuredBioAssay',
                                                  'DerivedBioAssay',
                                                  'PhysicalBioAssay'
                                                ],
                                'attrs' => [],
                                'parent' => 'Identifiable',
                                'name' => 'BioAssay',
                                'package' => 'BioAssay',
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Channel',
                                                                   'name' => 'channels',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Channels can be non-null for all subclasses.  For instance, collapsing across replicate features will create a DerivedBioAssay that will potentially reference channels.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.94',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'BioAssay',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Channels can be non-null for all subclasses.  For instance, collapsing across replicate features will create a DerivedBioAssay that will potentially reference channels.',
                                                                  'cardinality' => '1..N',
                                                                  'class_id' => 'S.93',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'FactorValue',
                                                                   'name' => 'bioAssayFactorValues',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The values that this BioAssay is associated with for the experiment.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.147',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'BioAssay',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'The values that this BioAssay is associated with for the experiment.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.93',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'methods' => [],
                                'documentation' => 'An abstract class which represents both physical and computational groupings of arrays and biomaterials.
',
                                'id' => 'S.93',
                                'abstract' => 'true'
                              },
                  'HardwareApplication' => {
                                           'attrs' => [
                                                        {
                                                          'documentation' => 'Manufacturer\'s identifier for the Hardware.',
                                                          'name' => 'serialNumber',
                                                          'type' => 'String',
                                                          'id' => 'S.162'
                                                        }
                                                      ],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Hardware',
                                                                              'name' => 'hardware',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The underlying hardware.',
                                                                              'cardinality' => '1',
                                                                              'class_id' => 'S.158',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'HardwareApplication',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The underlying hardware.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.161',
                                                                             'constraint' => undef
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'ParameterizableApplication',
                                           'documentation' => 'The use of a piece of hardware with the requisite Parameters and ParameterValues.',
                                           'methods' => [],
                                           'name' => 'HardwareApplication',
                                           'abstract' => 'false',
                                           'id' => 'S.161',
                                           'package' => 'Protocol'
                                         },
                  'Unit' => {
                            'subclasses' => [
                                              'TemperatureUnit',
                                              'DistanceUnit',
                                              'QuantityUnit',
                                              'MassUnit',
                                              'ConcentrationUnit',
                                              'TimeUnit',
                                              'VolumeUnit'
                                            ],
                            'attrs' => [
                                         {
                                           'documentation' => 'The name of the unit.',
                                           'name' => 'unitName',
                                           'type' => 'String',
                                           'id' => 'S.196'
                                         }
                                       ],
                            'parent' => 'Extendable',
                            'name' => 'Unit',
                            'package' => 'Measurement',
                            'associations' => [],
                            'methods' => [],
                            'documentation' => 'The unit is a strict enumeration of types.',
                            'id' => 'S.195',
                            'abstract' => 'true'
                          },
                  'BioSource' => {
                                 'attrs' => [],
                                 'associations' => [
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'Contact',
                                                                    'name' => 'sourceContact',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The BioSource\'s source is the provider of the biological material (a cell line, strain, etc...).  This could be the ATTC (American Tissue Type Collection).',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.112',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 1',
                                                                                      'rank' => '1'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'BioSource',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The BioSource\'s source is the provider of the biological material (a cell line, strain, etc...).  This could be the ATTC (American Tissue Type Collection).',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.71',
                                                                   'constraint' => undef
                                                                 }
                                                     }
                                                   ],
                                 'parent' => 'BioMaterial',
                                 'documentation' => 'The BioSource is the original source material before any treatment events.  It is also a top node of the directed acyclic graph generated by treatments.   The association to OntologyEntry allows enumeration of a BioSource\'s inherent properties.',
                                 'methods' => [],
                                 'name' => 'BioSource',
                                 'abstract' => 'false',
                                 'id' => 'S.71',
                                 'package' => 'BioMaterial'
                               },
                  'CompositeSequence' => {
                                         'attrs' => [],
                                         'associations' => [
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'BioSequence',
                                                                            'name' => 'biologicalCharacteristics',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'The annotation on the BioSequence this CompositeSequence represents.  Typically the sequences will be a Genes, Exons, or SpliceVariants.',
                                                                            'cardinality' => '0..N',
                                                                            'class_id' => 'S.231',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 1',
                                                                                              'rank' => '1'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'CompositeSequence',
                                                                           'name' => undef,
                                                                           'navigable' => 'false',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The annotation on the BioSequence this CompositeSequence represents.  Typically the sequences will be a Genes, Exons, or SpliceVariants.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.261',
                                                                           'constraint' => undef
                                                                         }
                                                             },
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'ReporterCompositeMap',
                                                                            'name' => 'reporterCompositeMaps',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'A map to the reporters that compose this CompositeSequence.',
                                                                            'cardinality' => '0..N',
                                                                            'class_id' => 'S.270',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 2',
                                                                                              'rank' => '2'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'CompositeSequence',
                                                                           'name' => 'compositeSequence',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'A map to the reporters that compose this CompositeSequence.',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.261',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         }
                                                             },
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'CompositeCompositeMap',
                                                                            'name' => 'compositeCompositeMaps',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'A map to the compositeSequences that compose this CompositeSequence.',
                                                                            'cardinality' => '0..N',
                                                                            'class_id' => 'S.268',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 2',
                                                                                              'rank' => '2'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'CompositeSequence',
                                                                           'name' => 'compositeSequence',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'A map to the compositeSequences that compose this CompositeSequence.',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.261',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         }
                                                             }
                                                           ],
                                         'parent' => 'DesignElement',
                                         'documentation' => 'A collection of Reporter or CompositeSequence Design Elements, annotated through the association to BioSequence. 
',
                                         'methods' => [],
                                         'name' => 'CompositeSequence',
                                         'abstract' => 'false',
                                         'id' => 'S.261',
                                         'package' => 'DesignElement'
                                       },
                  'PValue' => {
                              'attrs' => [],
                              'associations' => [],
                              'parent' => 'ConfidenceIndicator',
                              'documentation' => 'Measurement of the accuracy of a quantitation.  Of type float.',
                              'methods' => [],
                              'name' => 'PValue',
                              'abstract' => 'false',
                              'id' => 'S.247',
                              'package' => 'QuantitationType'
                            },
                  'StandardQuantitationType' => {
                                                'subclasses' => [
                                                                  'Failed',
                                                                  'MeasuredSignal',
                                                                  'Ratio',
                                                                  'PresentAbsent',
                                                                  'DerivedSignal',
                                                                  'ConfidenceIndicator'
                                                                ],
                                                'attrs' => [],
                                                'parent' => 'QuantitationType',
                                                'name' => 'StandardQuantitationType',
                                                'package' => 'QuantitationType',
                                                'associations' => [],
                                                'methods' => [],
                                                'documentation' => 'Superclass for the named quantitation type.  Useful for mapping to those languages that can use a fly-weight for processing the subclasses.',
                                                'id' => 'S.240',
                                                'abstract' => 'true'
                                              },
                  'BioAssayDimension' => {
                                         'attrs' => [],
                                         'associations' => [
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'BioAssay',
                                                                            'name' => 'bioAssays',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'The BioAssays for this Dimension',
                                                                            'cardinality' => '0..N',
                                                                            'class_id' => 'S.93',
                                                                            'constraint' => {
                                                                                              'ordered' => 1,
                                                                                              'constraint' => 'ordered rank: 1',
                                                                                              'rank' => '1'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'BioAssayDimension',
                                                                           'name' => undef,
                                                                           'navigable' => 'false',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The BioAssays for this Dimension',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.135',
                                                                           'constraint' => undef
                                                                         }
                                                             }
                                                           ],
                                         'parent' => 'Identifiable',
                                         'documentation' => 'An ordered list of bioAssays.',
                                         'methods' => [],
                                         'name' => 'BioAssayDimension',
                                         'abstract' => 'false',
                                         'id' => 'S.135',
                                         'package' => 'BioAssayData'
                                       },
                  'MismatchInformation' => {
                                           'attrs' => [
                                                        {
                                                          'documentation' => 'Offset into the sequence that the mismatch occurs.',
                                                          'name' => 'startCoord',
                                                          'type' => 'int',
                                                          'id' => 'S.264'
                                                        },
                                                        {
                                                          'documentation' => 'The sequence that replaces the specified sequence starting at start_coord.',
                                                          'name' => 'newSequence',
                                                          'type' => 'String',
                                                          'id' => 'S.265'
                                                        },
                                                        {
                                                          'documentation' => 'Length of the original sequence that is replaced.  A deletion is specified when the length of the newSequence is less than the replacedLength.',
                                                          'name' => 'replacedLength',
                                                          'type' => 'int',
                                                          'id' => 'S.266'
                                                        }
                                                      ],
                                           'associations' => [],
                                           'parent' => 'Extendable',
                                           'documentation' => 'Describes how a reporter varies from its ReporterCharacteristics sequence(s) or how a Feature varies from its Reporter sequence.',
                                           'methods' => [],
                                           'name' => 'MismatchInformation',
                                           'abstract' => 'false',
                                           'id' => 'S.263',
                                           'package' => 'DesignElement'
                                         },
                  'DesignElementDimension' => {
                                              'subclasses' => [
                                                                'ReporterDimension',
                                                                'CompositeSequenceDimension',
                                                                'FeatureDimension'
                                                              ],
                                              'attrs' => [],
                                              'parent' => 'Identifiable',
                                              'name' => 'DesignElementDimension',
                                              'package' => 'BioAssayData',
                                              'associations' => [],
                                              'methods' => [],
                                              'documentation' => 'An ordered list of designElements. It will be realized as one of its three subclasses.',
                                              'id' => 'S.123',
                                              'abstract' => 'true'
                                            },
                  'Feature' => {
                               'attrs' => [],
                               'associations' => [
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'Zone',
                                                                  'name' => 'zone',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'A reference to the zone this feature is in.',
                                                                  'cardinality' => '0..1',
                                                                  'class_id' => 'S.25',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 4',
                                                                                    'rank' => '4'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Feature',
                                                                 'name' => undef,
                                                                 'navigable' => 'false',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'none',
                                                                 'documentation' => 'A reference to the zone this feature is in.',
                                                                 'cardinality' => '0..N',
                                                                 'class_id' => 'S.262',
                                                                 'constraint' => undef
                                                               }
                                                   },
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'FeatureGroup',
                                                                  'name' => 'featureGroup',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The features that belong to this group.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.33',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 6',
                                                                                    'rank' => '6'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Feature',
                                                                 'name' => 'features',
                                                                 'navigable' => 'true',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'none',
                                                                 'documentation' => 'The features that belong to this group.',
                                                                 'cardinality' => '1..N',
                                                                 'class_id' => 'S.262',
                                                                 'constraint' => {
                                                                                   'ordered' => 0,
                                                                                   'constraint' => 'rank: 4',
                                                                                   'rank' => '4'
                                                                                 }
                                                               }
                                                   },
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'Position',
                                                                  'name' => 'position',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'The position of the feature on the array, relative to the top, left corner.',
                                                                  'cardinality' => '0..1',
                                                                  'class_id' => 'S.255',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 3',
                                                                                    'rank' => '3'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Feature',
                                                                 'name' => undef,
                                                                 'navigable' => 'false',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'composite',
                                                                 'documentation' => 'The position of the feature on the array, relative to the top, left corner.',
                                                                 'cardinality' => '1',
                                                                 'class_id' => 'S.262',
                                                                 'constraint' => undef
                                                               }
                                                   },
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'Feature',
                                                                  'name' => 'controlFeatures',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Associates features with their control features.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.262',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 1',
                                                                                    'rank' => '1'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Feature',
                                                                 'name' => 'controlledFeatures',
                                                                 'navigable' => 'true',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'none',
                                                                 'documentation' => 'Associates features with their control features.',
                                                                 'cardinality' => '0..N',
                                                                 'class_id' => 'S.262',
                                                                 'constraint' => {
                                                                                   'ordered' => 0,
                                                                                   'constraint' => 'rank: 2',
                                                                                   'rank' => '2'
                                                                                 }
                                                               }
                                                   },
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'Feature',
                                                                  'name' => 'controlledFeatures',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Associates features with their control features.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.262',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 2',
                                                                                    'rank' => '2'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Feature',
                                                                 'name' => 'controlFeatures',
                                                                 'navigable' => 'true',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'none',
                                                                 'documentation' => 'Associates features with their control features.',
                                                                 'cardinality' => '0..N',
                                                                 'class_id' => 'S.262',
                                                                 'constraint' => {
                                                                                   'ordered' => 0,
                                                                                   'constraint' => 'rank: 1',
                                                                                   'rank' => '1'
                                                                                 }
                                                               }
                                                   },
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'FeatureLocation',
                                                                  'name' => 'featureLocation',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Location of this feature relative to a grid.',
                                                                  'cardinality' => '0..1',
                                                                  'class_id' => 'S.271',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 5',
                                                                                    'rank' => '5'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Feature',
                                                                 'name' => undef,
                                                                 'navigable' => 'false',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'composite',
                                                                 'documentation' => 'Location of this feature relative to a grid.',
                                                                 'cardinality' => '1',
                                                                 'class_id' => 'S.262',
                                                                 'constraint' => undef
                                                               }
                                                   }
                                                 ],
                               'parent' => 'DesignElement',
                               'documentation' => 'An intended  position on an array.
',
                               'methods' => [],
                               'name' => 'Feature',
                               'abstract' => 'false',
                               'id' => 'S.262',
                               'package' => 'DesignElement'
                             },
                  'Parameter' => {
                                 'attrs' => [],
                                 'associations' => [
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'OntologyEntry',
                                                                    'name' => 'dataType',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The type of data generated by the parameter i.e. Boolean, float, etc...',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.185',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 2',
                                                                                      'rank' => '2'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'Parameter',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The type of data generated by the parameter i.e. Boolean, float, etc...',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.152',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'Measurement',
                                                                    'name' => 'defaultValue',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'Allows the optional specification of a default values and the unit for the Parameter',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.190',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 1',
                                                                                      'rank' => '1'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'Parameter',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'Allows the optional specification of a default values and the unit for the Parameter',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.152',
                                                                   'constraint' => undef
                                                                 }
                                                     }
                                                   ],
                                 'parent' => 'Identifiable',
                                 'documentation' => 'A Parameter is a replaceable value in a Parameterizable class.  Examples of Parameters include: scanning wavelength, laser power, centrifuge speed, multiplicative errors, the number of input nodes to a SOM, and PCR temperatures.  ',
                                 'methods' => [],
                                 'name' => 'Parameter',
                                 'abstract' => 'false',
                                 'id' => 'S.152',
                                 'package' => 'Protocol'
                               },
                  'FeatureGroup' => {
                                    'attrs' => [
                                                 {
                                                   'documentation' => 'The width of the feature.',
                                                   'name' => 'featureWidth',
                                                   'type' => 'float',
                                                   'id' => 'S.34'
                                                 },
                                                 {
                                                   'documentation' => 'The length of the feature.',
                                                   'name' => 'featureLength',
                                                   'type' => 'float',
                                                   'id' => 'S.35'
                                                 },
                                                 {
                                                   'documentation' => 'The height of the feature.',
                                                   'name' => 'featureHeight',
                                                   'type' => 'float',
                                                   'id' => 'S.36'
                                                 }
                                               ],
                                    'associations' => [
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'DistanceUnit',
                                                                       'name' => 'distanceUnit',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The unit for the feature measures.',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.199',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 3',
                                                                                         'rank' => '3'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'FeatureGroup',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'composite',
                                                                      'documentation' => 'The unit for the feature measures.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.33',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'Feature',
                                                                       'name' => 'features',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The features that belong to this group.',
                                                                       'cardinality' => '1..N',
                                                                       'class_id' => 'S.262',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 4',
                                                                                         'rank' => '4'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'FeatureGroup',
                                                                      'name' => 'featureGroup',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'composite',
                                                                      'documentation' => 'The features that belong to this group.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.33',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 6',
                                                                                        'rank' => '6'
                                                                                      }
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'OntologyEntry',
                                                                       'name' => 'technologyType',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The technology type of this design.  By specifying a technology type, higher level analysis can use appropriate algorithms to compare the results from multiple arrays.  The technology type may be spotted cDNA or in situ photolithography.',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.185',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 1',
                                                                                         'rank' => '1'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'FeatureGroup',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'composite',
                                                                      'documentation' => 'The technology type of this design.  By specifying a technology type, higher level analysis can use appropriate algorithms to compare the results from multiple arrays.  The technology type may be spotted cDNA or in situ photolithography.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.33',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'OntologyEntry',
                                                                       'name' => 'featureShape',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The expected shape of the feature on the array: circular, oval, square, etc.',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.185',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 2',
                                                                                         'rank' => '2'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'FeatureGroup',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'composite',
                                                                      'documentation' => 'The expected shape of the feature on the array: circular, oval, square, etc.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.33',
                                                                      'constraint' => undef
                                                                    }
                                                        }
                                                      ],
                                    'parent' => 'DesignElementGroup',
                                    'documentation' => 'A collection of like features.',
                                    'methods' => [],
                                    'name' => 'FeatureGroup',
                                    'abstract' => 'false',
                                    'id' => 'S.33',
                                    'package' => 'ArrayDesign'
                                  },
                  'QuantitationType' => {
                                        'subclasses' => [
                                                          'SpecializedQuantitationType',
                                                          'StandardQuantitationType'
                                                        ],
                                        'attrs' => [
                                                     {
                                                       'documentation' => 'Indicates whether the quantitation has been measured from the background or from the feature itself.',
                                                       'name' => 'isBackground',
                                                       'type' => 'boolean',
                                                       'id' => 'S.242'
                                                     }
                                                   ],
                                        'parent' => 'Identifiable',
                                        'name' => 'QuantitationType',
                                        'package' => 'QuantitationType',
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Channel',
                                                                           'name' => 'channel',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The optional channel associated with the QuantitationType.',
                                                                           'cardinality' => '0..1',
                                                                           'class_id' => 'S.94',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'QuantitationType',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The optional channel associated with the QuantitationType.',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.241',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'QuantitationTypeMap',
                                                                           'name' => 'quantitationTypeMaps',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The QuantitationType whose value will be produced from the values of the source QuantitationType according to the Protocol.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.136',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 5',
                                                                                             'rank' => '5'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'QuantitationType',
                                                                          'name' => 'targetQuantitationType',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The QuantitationType whose value will be produced from the values of the source QuantitationType according to the Protocol.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.241',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 1',
                                                                                            'rank' => '1'
                                                                                          }
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'OntologyEntry',
                                                                           'name' => 'dataType',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The specific type for the quantitations.  From a controlled vocabulary of {float, int, boolean, etc.}',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.185',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 3',
                                                                                             'rank' => '3'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'QuantitationType',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The specific type for the quantitations.  From a controlled vocabulary of {float, int, boolean, etc.}',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.241',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'OntologyEntry',
                                                                           'name' => 'scale',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Indication of how to interpret the value.  From a suggested vocabulary of {LINEAR | LN | LOG2 |LOG10 | FOLD_CHANGE | OTHER} ',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.185',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 2',
                                                                                             'rank' => '2'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'QuantitationType',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Indication of how to interpret the value.  From a suggested vocabulary of {LINEAR | LN | LOG2 |LOG10 | FOLD_CHANGE | OTHER} ',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.241',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'ConfidenceIndicator',
                                                                           'name' => 'confidenceIndicators',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The association between a ConfidenceIndicator and the QuantitationType its is an indicator for.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.250',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 4',
                                                                                             'rank' => '4'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'QuantitationType',
                                                                          'name' => 'targetQuantitationType',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The association between a ConfidenceIndicator and the QuantitationType its is an indicator for.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.241',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 1',
                                                                                            'rank' => '1'
                                                                                          }
                                                                        }
                                                            }
                                                          ],
                                        'methods' => [],
                                        'documentation' => 'A method for calculating a single datum of the matrix (e.g. raw intensity, background, error).
',
                                        'id' => 'S.241',
                                        'abstract' => 'true'
                                      },
                  'ExternalReference' => {
                                         'attrs' => [
                                                      {
                                                        'documentation' => 'The originating server for the object, a network address or common name.',
                                                        'name' => 'exportedFromServer',
                                                        'type' => 'String',
                                                        'id' => 'S.181'
                                                      },
                                                      {
                                                        'documentation' => 'Name of the database, if applicable, that the object was exported from.',
                                                        'name' => 'exportedFromDB',
                                                        'type' => 'String',
                                                        'id' => 'S.182'
                                                      },
                                                      {
                                                        'documentation' => 'The identifier of the object at the originating source.',
                                                        'name' => 'exportID',
                                                        'type' => 'String',
                                                        'id' => 'S.183'
                                                      },
                                                      {
                                                        'documentation' => 'The name of the object at the originating source.',
                                                        'name' => 'exportName',
                                                        'type' => 'String',
                                                        'id' => 'S.184'
                                                      }
                                                    ],
                                         'associations' => [],
                                         'parent' => 'Extendable',
                                         'documentation' => 'A reference to the originating source for the object.',
                                         'methods' => [],
                                         'name' => 'ExternalReference',
                                         'abstract' => 'false',
                                         'id' => 'S.180',
                                         'package' => 'Description'
                                       },
                  'SequencePosition' => {
                                        'subclasses' => [
                                                          'CompositePosition',
                                                          'ReporterPosition'
                                                        ],
                                        'attrs' => [
                                                     {
                                                       'documentation' => 'The location of the base, for nucleotides, that the SeqFeature starts. ',
                                                       'name' => 'start',
                                                       'type' => 'int',
                                                       'id' => 'S.237'
                                                     },
                                                     {
                                                       'documentation' => 'The location of the base, for nucleotides, that the SeqFeature ends.',
                                                       'name' => 'end',
                                                       'type' => 'int',
                                                       'id' => 'S.238'
                                                     }
                                                   ],
                                        'parent' => 'Extendable',
                                        'name' => 'SequencePosition',
                                        'package' => 'BioSequence',
                                        'associations' => [],
                                        'methods' => [],
                                        'documentation' => 'Designates the position of the Feature in its BioSequence.',
                                        'id' => 'S.236',
                                        'abstract' => 'false'
                                      },
                  'BioEvent' => {
                                'subclasses' => [
                                                  'BioAssayCreation',
                                                  'Transformation',
                                                  'Map',
                                                  'FeatureExtraction',
                                                  'Treatment',
                                                  'BioAssayTreatment'
                                                ],
                                'attrs' => [],
                                'parent' => 'Identifiable',
                                'name' => 'BioEvent',
                                'package' => 'BioEvent',
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'ProtocolApplication',
                                                                   'name' => 'protocolApplications',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The applied protocols to the BioEvent.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.155',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'BioEvent',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The applied protocols to the BioEvent.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.212',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'methods' => [],
                                'documentation' => 'An abstract class to capture the concept of an event (either in the laboratory or a computational analysis).',
                                'id' => 'S.212',
                                'abstract' => 'true'
                              },
                  'CompositeGroup' => {
                                      'attrs' => [],
                                      'associations' => [
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'CompositeSequence',
                                                                         'name' => 'compositeSequences',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The compositeSequences that belong to this group.',
                                                                         'cardinality' => '1..N',
                                                                         'class_id' => 'S.261',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 1',
                                                                                           'rank' => '1'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'CompositeGroup',
                                                                        'name' => undef,
                                                                        'navigable' => 'false',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The compositeSequences that belong to this group.',
                                                                        'cardinality' => '0..N',
                                                                        'class_id' => 'S.38',
                                                                        'constraint' => undef
                                                                      }
                                                          }
                                                        ],
                                      'parent' => 'DesignElementGroup',
                                      'documentation' => 'Allows specification of the type of Composite Design Element.',
                                      'methods' => [],
                                      'name' => 'CompositeGroup',
                                      'abstract' => 'false',
                                      'id' => 'S.38',
                                      'package' => 'ArrayDesign'
                                    },
                  'MeasuredBioAssay' => {
                                        'attrs' => [],
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'FeatureExtraction',
                                                                           'name' => 'featureExtraction',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The association between the MeasuredBioAssay and the FeatureExtraction Event.',
                                                                           'cardinality' => '0..1',
                                                                           'class_id' => 'S.97',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'MeasuredBioAssay',
                                                                          'name' => 'measuredBioAssayTarget',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The association between the MeasuredBioAssay and the FeatureExtraction Event.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.95',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 2',
                                                                                            'rank' => '2'
                                                                                          }
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'MeasuredBioAssayData',
                                                                           'name' => 'measuredBioAssayData',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The data associated with the MeasuredBioAssay.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.127',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 2',
                                                                                             'rank' => '2'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'MeasuredBioAssay',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The data associated with the MeasuredBioAssay.',
                                                                          'cardinality' => '1..N',
                                                                          'class_id' => 'S.95',
                                                                          'constraint' => undef
                                                                        }
                                                            }
                                                          ],
                                        'parent' => 'BioAssay',
                                        'documentation' => 'A measured bioAssay is the direct processing of information in a physical bioAssay by the featureExtraction event.  Often uses images which are referenced through the physical bioAssay.',
                                        'methods' => [],
                                        'name' => 'MeasuredBioAssay',
                                        'abstract' => 'false',
                                        'id' => 'S.95',
                                        'package' => 'BioAssay'
                                      },
                  'BioAssayDatum' => {
                                     'attrs' => [
                                                  {
                                                    'documentation' => 'The datum value.',
                                                    'name' => 'value',
                                                    'type' => 'any',
                                                    'id' => 'S.125'
                                                  }
                                                ],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'BioAssay',
                                                                        'name' => 'bioAssay',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The BioAssay associated with the value of the BioAssayDatum.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.93',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'BioAssayDatum',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The BioAssay associated with the value of the BioAssayDatum.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.124',
                                                                       'constraint' => undef
                                                                     }
                                                         },
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'DesignElement',
                                                                        'name' => 'designElement',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The DesignElement associated with the value of the BioAssayDatum.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.254',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 2',
                                                                                          'rank' => '2'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'BioAssayDatum',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The DesignElement associated with the value of the BioAssayDatum.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.124',
                                                                       'constraint' => undef
                                                                     }
                                                         },
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'QuantitationType',
                                                                        'name' => 'quantitationType',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The QuantitationType associated with the value of the BioAssayDatum.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.241',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 3',
                                                                                          'rank' => '3'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'BioAssayDatum',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The QuantitationType associated with the value of the BioAssayDatum.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.124',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'Extendable',
                                     'documentation' => 'A single cell of the quantitation, bioAssay, designElement matrix.',
                                     'methods' => [],
                                     'name' => 'BioAssayDatum',
                                     'abstract' => 'false',
                                     'id' => 'S.124',
                                     'package' => 'BioAssayData'
                                   },
                  'BioAssayTreatment' => {
                                         'subclasses' => [
                                                           'ImageAcquisition'
                                                         ],
                                         'attrs' => [],
                                         'parent' => 'BioEvent',
                                         'name' => 'BioAssayTreatment',
                                         'package' => 'BioAssay',
                                         'associations' => [
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'PhysicalBioAssay',
                                                                            'name' => 'physicalBioAssay',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'The set of treatments undergone by this PhysicalBioAssay.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.89',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 1',
                                                                                              'rank' => '1'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'BioAssayTreatment',
                                                                           'name' => 'bioAssayTreatments',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The set of treatments undergone by this PhysicalBioAssay.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.100',
                                                                           'constraint' => {
                                                                                             'ordered' => 1,
                                                                                             'constraint' => 'ordered rank: 3',
                                                                                             'rank' => '3'
                                                                                           }
                                                                         }
                                                             },
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'PhysicalBioAssay',
                                                                            'name' => 'target',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'The PhysicalBioAssay that was treated.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.89',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 2',
                                                                                              'rank' => '2'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'BioAssayTreatment',
                                                                           'name' => undef,
                                                                           'navigable' => 'false',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The PhysicalBioAssay that was treated.',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.100',
                                                                           'constraint' => undef
                                                                         }
                                                             }
                                                           ],
                                         'methods' => [],
                                         'documentation' => 'The event which records the process by which PhysicalBioAssays are processed (typically washing, blocking, etc...).',
                                         'id' => 'S.100',
                                         'abstract' => 'false'
                                       },
                  'Extendable' => {
                                  'subclasses' => [
                                                    'BioAssayDatum',
                                                    'BioDataValues',
                                                    'ExternalReference',
                                                    'ZoneDefect',
                                                    'DesignElementMapping',
                                                    'FeatureLocation',
                                                    'QuantitationTypeMapping',
                                                    'BioMaterialMeasurement',
                                                    'OntologyEntry',
                                                    'ParameterValue',
                                                    'Position',
                                                    'MismatchInformation',
                                                    'NodeValue',
                                                    'Measurement',
                                                    'ZoneLayout',
                                                    'Unit',
                                                    'ArrayManufactureDeviation',
                                                    'BioAssayMapping',
                                                    'FeatureInformation',
                                                    'CompoundMeasurement',
                                                    'SeqFeatureLocation',
                                                    'PositionDelta',
                                                    'DatabaseEntry',
                                                    'Describable',
                                                    'ZoneGroup',
                                                    'FeatureDefect',
                                                    'SequencePosition'
                                                  ],
                                  'attrs' => [],
                                  'parent' => undef,
                                  'name' => 'Extendable',
                                  'package' => 'MAGE',
                                  'associations' => [
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'NameValueType',
                                                                     'name' => 'propertySets',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Allows specification of name/value pairs.  Meant to primarily help in-house, pipeline processing of instances by providing a place for values that aren\'t part of the specification proper.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.6',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 1',
                                                                                       'rank' => '1'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'Extendable',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'Allows specification of name/value pairs.  Meant to primarily help in-house, pipeline processing of instances by providing a place for values that aren\'t part of the specification proper.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.5',
                                                                    'constraint' => undef
                                                                  }
                                                      }
                                                    ],
                                  'methods' => [],
                                  'documentation' => 'Abstract class that specifies for subclasses an association to NameValueTypes.  These can be used, for instance, to specify proprietary properties and in-house processing hints.',
                                  'id' => 'S.5',
                                  'abstract' => 'true'
                                },
                  'SoftwareApplication' => {
                                           'attrs' => [
                                                        {
                                                          'documentation' => 'The version of the software.',
                                                          'name' => 'version',
                                                          'type' => 'String',
                                                          'id' => 'S.164'
                                                        },
                                                        {
                                                          'documentation' => 'When the software was released.',
                                                          'name' => 'releaseDate',
                                                          'type' => 'Date',
                                                          'id' => 'S.165'
                                                        }
                                                      ],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Software',
                                                                              'name' => 'software',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The underlying software.',
                                                                              'cardinality' => '1',
                                                                              'class_id' => 'S.157',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'SoftwareApplication',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The underlying software.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.163',
                                                                             'constraint' => undef
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'ParameterizableApplication',
                                           'documentation' => 'The use of a piece of software with the requisite Parameters and ParameterValues.',
                                           'methods' => [],
                                           'name' => 'SoftwareApplication',
                                           'abstract' => 'false',
                                           'id' => 'S.163',
                                           'package' => 'Protocol'
                                         },
                  'Node' => {
                            'attrs' => [],
                            'associations' => [
                                                {
                                                  'other' => {
                                                               'class_name' => 'Node',
                                                               'name' => 'nodes',
                                                               'navigable' => 'true',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'Nested nodes of the BioAssayDataCluster.',
                                                               'cardinality' => '0..N',
                                                               'class_id' => 'S.83',
                                                               'constraint' => {
                                                                                 'ordered' => 0,
                                                                                 'constraint' => 'rank: 1',
                                                                                 'rank' => '1'
                                                                               }
                                                             },
                                                  'self' => {
                                                              'class_name' => 'Node',
                                                              'name' => undef,
                                                              'navigable' => 'false',
                                                              'ordering' => 'unordered',
                                                              'aggregation' => 'composite',
                                                              'documentation' => 'Nested nodes of the BioAssayDataCluster.',
                                                              'cardinality' => '1',
                                                              'class_id' => 'S.83',
                                                              'constraint' => undef
                                                            }
                                                },
                                                {
                                                  'other' => {
                                                               'class_name' => 'NodeContents',
                                                               'name' => 'nodeContents',
                                                               'navigable' => 'true',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'The contents of the node, expressed as either a one, two or three dimensional object.',
                                                               'cardinality' => '0..N',
                                                               'class_id' => 'S.84',
                                                               'constraint' => {
                                                                                 'ordered' => 0,
                                                                                 'constraint' => 'rank: 2',
                                                                                 'rank' => '2'
                                                                               }
                                                             },
                                                  'self' => {
                                                              'class_name' => 'Node',
                                                              'name' => undef,
                                                              'navigable' => 'false',
                                                              'ordering' => 'unordered',
                                                              'aggregation' => 'composite',
                                                              'documentation' => 'The contents of the node, expressed as either a one, two or three dimensional object.',
                                                              'cardinality' => '1',
                                                              'class_id' => 'S.83',
                                                              'constraint' => undef
                                                            }
                                                },
                                                {
                                                  'other' => {
                                                               'class_name' => 'NodeValue',
                                                               'name' => 'nodeValue',
                                                               'navigable' => 'true',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'Values or measurements for this node that may be produced by the clustering algorithm.  Typical are distance values for the nodes.',
                                                               'cardinality' => '0..N',
                                                               'class_id' => 'S.85',
                                                               'constraint' => {
                                                                                 'ordered' => 0,
                                                                                 'constraint' => 'rank: 3',
                                                                                 'rank' => '3'
                                                                               }
                                                             },
                                                  'self' => {
                                                              'class_name' => 'Node',
                                                              'name' => undef,
                                                              'navigable' => 'false',
                                                              'ordering' => 'unordered',
                                                              'aggregation' => 'composite',
                                                              'documentation' => 'Values or measurements for this node that may be produced by the clustering algorithm.  Typical are distance values for the nodes.',
                                                              'cardinality' => '1',
                                                              'class_id' => 'S.83',
                                                              'constraint' => undef
                                                            }
                                                }
                                              ],
                            'parent' => 'Describable',
                            'documentation' => 'An individual component of a clustering.  May contain other nodes.',
                            'methods' => [],
                            'name' => 'Node',
                            'abstract' => 'false',
                            'id' => 'S.83',
                            'package' => 'HigherLevelAnalysis'
                          },
                  'NodeValue' => {
                                 'attrs' => [
                                              {
                                                'documentation' => 'The name for this value.',
                                                'name' => 'name',
                                                'type' => 'String',
                                                'id' => 'S.86'
                                              },
                                              {
                                                'documentation' => 'The value for this NodeValue.',
                                                'name' => 'value',
                                                'type' => 'any',
                                                'id' => 'S.87'
                                              }
                                            ],
                                 'associations' => [
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'OntologyEntry',
                                                                    'name' => 'scale',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The scale (linear, log10, ln, etc.) of the value.',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.185',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 2',
                                                                                      'rank' => '2'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'NodeValue',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The scale (linear, log10, ln, etc.) of the value.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.85',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'OntologyEntry',
                                                                    'name' => 'dataType',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The data type of the any element.',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.185',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 3',
                                                                                      'rank' => '3'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'NodeValue',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The data type of the any element.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.85',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'OntologyEntry',
                                                                    'name' => 'type',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The type of value, distance, etc.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.185',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 1',
                                                                                      'rank' => '1'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'NodeValue',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The type of value, distance, etc.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.85',
                                                                   'constraint' => undef
                                                                 }
                                                     }
                                                   ],
                                 'parent' => 'Extendable',
                                 'documentation' => 'A value associated with the Node that can rank it in relation to the other nodes produced by the clustering algorithm.',
                                 'methods' => [],
                                 'name' => 'NodeValue',
                                 'abstract' => 'false',
                                 'id' => 'S.85',
                                 'package' => 'HigherLevelAnalysis'
                               },
                  'DatabaseEntry' => {
                                     'attrs' => [
                                                  {
                                                    'documentation' => 'The identifier used to look up the record.',
                                                    'name' => 'accession',
                                                    'type' => 'String',
                                                    'id' => 'S.174'
                                                  },
                                                  {
                                                    'documentation' => 'The appropriate version of the accession (if applicable).',
                                                    'name' => 'accessionVersion',
                                                    'type' => 'String',
                                                    'id' => 'S.175'
                                                  },
                                                  {
                                                    'documentation' => 'The location of the record.',
                                                    'name' => 'URI',
                                                    'type' => 'String',
                                                    'id' => 'S.176'
                                                  }
                                                ],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'Database',
                                                                        'name' => 'database',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'Reference to the database where the DataEntry instance can be found.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.177',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 2',
                                                                                          'rank' => '2'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'DatabaseEntry',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'Reference to the database where the DataEntry instance can be found.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.173',
                                                                       'constraint' => undef
                                                                     }
                                                         },
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'OntologyEntry',
                                                                        'name' => 'type',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The type of record (e.g. a protein in SwissProt, or a yeast strain in SGD).',
                                                                        'cardinality' => '0..1',
                                                                        'class_id' => 'S.185',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'DatabaseEntry',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'The type of record (e.g. a protein in SwissProt, or a yeast strain in SGD).',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.173',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'Extendable',
                                     'documentation' => 'A reference to a record in a database.',
                                     'methods' => [],
                                     'name' => 'DatabaseEntry',
                                     'abstract' => 'false',
                                     'id' => 'S.173',
                                     'package' => 'Description'
                                   },
                  'DerivedBioAssay' => {
                                       'attrs' => [],
                                       'associations' => [
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'DerivedBioAssayData',
                                                                          'name' => 'derivedBioAssayData',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The data associated with the DerivedBioAssay.',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.126',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 2',
                                                                                            'rank' => '2'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'DerivedBioAssay',
                                                                         'name' => undef,
                                                                         'navigable' => 'false',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The data associated with the DerivedBioAssay.',
                                                                         'cardinality' => '1..N',
                                                                         'class_id' => 'S.90',
                                                                         'constraint' => undef
                                                                       }
                                                           },
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'OntologyEntry',
                                                                          'name' => 'type',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The derivation type, for instance collapsed spot replicate, ratio, averaged intensity, bioassay replicates, etc.',
                                                                          'cardinality' => '0..1',
                                                                          'class_id' => 'S.185',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 1',
                                                                                            'rank' => '1'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'DerivedBioAssay',
                                                                         'name' => undef,
                                                                         'navigable' => 'false',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'composite',
                                                                         'documentation' => 'The derivation type, for instance collapsed spot replicate, ratio, averaged intensity, bioassay replicates, etc.',
                                                                         'cardinality' => '1',
                                                                         'class_id' => 'S.90',
                                                                         'constraint' => undef
                                                                       }
                                                           },
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'BioAssayMap',
                                                                          'name' => 'derivedBioAssayMap',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The DerivedBioAssay that is produced by the sources of the BioAssayMap.',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.139',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 3',
                                                                                            'rank' => '3'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'DerivedBioAssay',
                                                                         'name' => 'bioAssayMapTarget',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The DerivedBioAssay that is produced by the sources of the BioAssayMap.',
                                                                         'cardinality' => '1',
                                                                         'class_id' => 'S.90',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 1',
                                                                                           'rank' => '1'
                                                                                         }
                                                                       }
                                                           }
                                                         ],
                                       'parent' => 'BioAssay',
                                       'documentation' => 'A BioAssay that is created by the Transformation BioEvent from one or more MeasuredBioAssays or DerivedBioAssays.',
                                       'methods' => [],
                                       'name' => 'DerivedBioAssay',
                                       'abstract' => 'false',
                                       'id' => 'S.90',
                                       'package' => 'BioAssay'
                                     },
                  'Compound' => {
                                'attrs' => [
                                             {
                                               'documentation' => 'A Compound may be a special case Solvent.',
                                               'name' => 'isSolvent',
                                               'type' => 'boolean',
                                               'id' => 'S.76'
                                             }
                                           ],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'CompoundMeasurement',
                                                                   'name' => 'componentCompounds',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The Compounds and their amounts used to create this Compound.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.77',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Compound',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The Compounds and their amounts used to create this Compound.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.75',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'OntologyEntry',
                                                                   'name' => 'merckIndex',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The Merck Index of this Compound.',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.185',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Compound',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The Merck Index of this Compound.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.75',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'DatabaseEntry',
                                                                   'name' => 'externalLIMS',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Reference to an entry in an external LIMS data source.',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.173',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 3',
                                                                                     'rank' => '3'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Compound',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'Reference to an entry in an external LIMS data source.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.75',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Identifiable',
                                'documentation' => 'A Compound can be a simple compound such as SDS (sodium dodecyl sulfate).  It may also be made of other Compounds in proportions using CompoundMeasurements to enumerate the Compounds and their amounts such as LB (Luria Broth) Media.',
                                'methods' => [],
                                'name' => 'Compound',
                                'abstract' => 'false',
                                'id' => 'S.75',
                                'package' => 'BioMaterial'
                              },
                  'ArrayDesign' => {
                                   'subclasses' => [
                                                     'PhysicalArrayDesign'
                                                   ],
                                   'attrs' => [
                                                {
                                                  'documentation' => 'The version of this design.',
                                                  'name' => 'version',
                                                  'type' => 'String',
                                                  'id' => 'S.12'
                                                },
                                                {
                                                  'documentation' => 'The number of features for this array',
                                                  'name' => 'numberOfFeatures',
                                                  'type' => 'int',
                                                  'id' => 'S.13'
                                                }
                                              ],
                                   'parent' => 'Identifiable',
                                   'name' => 'ArrayDesign',
                                   'package' => 'ArrayDesign',
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'ProtocolApplication',
                                                                      'name' => 'protocolApplications',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Describes the application of any protocols, such as the methodology used to pick oligos, in the design of the array.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.155',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'ArrayDesign',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Describes the application of any protocols, such as the methodology used to pick oligos, in the design of the array.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.11',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'CompositeGroup',
                                                                      'name' => 'compositeGroups',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The grouping of like CompositeSequence together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple CompositeGroups to segregate the technology types.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.38',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 4',
                                                                                        'rank' => '4'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'ArrayDesign',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The grouping of like CompositeSequence together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple CompositeGroups to segregate the technology types.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.11',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'Contact',
                                                                      'name' => 'designProviders',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The primary contact for information on the array design',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.112',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 5',
                                                                                        'rank' => '5'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'ArrayDesign',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The primary contact for information on the array design',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.11',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'ReporterGroup',
                                                                      'name' => 'reporterGroups',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The grouping of like Reporter together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple ReporterGroups to segregate the technology types.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.32',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 3',
                                                                                        'rank' => '3'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'ArrayDesign',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The grouping of like Reporter together.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple ReporterGroups to segregate the technology types.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.11',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'FeatureGroup',
                                                                      'name' => 'featureGroups',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The grouping of like Features together.  Typically for a physical array design, this will be a single grouping of features whose type might be PCR Product or Oligo.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple FeatureGroups to segregate the technology types.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.33',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 2',
                                                                                        'rank' => '2'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'ArrayDesign',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'The grouping of like Features together.  Typically for a physical array design, this will be a single grouping of features whose type might be PCR Product or Oligo.  If more than one technology type occurs on the array, such as the mixing of Cloned BioMaterial and Oligos, then there would be multiple FeatureGroups to segregate the technology types.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.11',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'methods' => [],
                                   'documentation' => 'Describes the design of an gene expression layout.  In some cases this might be virtual and, for instance, represent the output from analysis software at the composite level without reporters or features.',
                                   'id' => 'S.11',
                                   'abstract' => 'false'
                                 },
                  'BioMaterialMeasurement' => {
                                              'attrs' => [],
                                              'associations' => [
                                                                  {
                                                                    'other' => {
                                                                                 'class_name' => 'BioMaterial',
                                                                                 'name' => 'bioMaterial',
                                                                                 'navigable' => 'true',
                                                                                 'ordering' => 'unordered',
                                                                                 'aggregation' => 'none',
                                                                                 'documentation' => 'A source BioMaterial for a treatment.',
                                                                                 'cardinality' => '1',
                                                                                 'class_id' => 'S.72',
                                                                                 'constraint' => {
                                                                                                   'ordered' => 0,
                                                                                                   'constraint' => 'rank: 1',
                                                                                                   'rank' => '1'
                                                                                                 }
                                                                               },
                                                                    'self' => {
                                                                                'class_name' => 'BioMaterialMeasurement',
                                                                                'name' => undef,
                                                                                'navigable' => 'false',
                                                                                'ordering' => 'unordered',
                                                                                'aggregation' => 'none',
                                                                                'documentation' => 'A source BioMaterial for a treatment.',
                                                                                'cardinality' => '0..N',
                                                                                'class_id' => 'S.78',
                                                                                'constraint' => undef
                                                                              }
                                                                  },
                                                                  {
                                                                    'other' => {
                                                                                 'class_name' => 'Measurement',
                                                                                 'name' => 'measurement',
                                                                                 'navigable' => 'true',
                                                                                 'ordering' => 'unordered',
                                                                                 'aggregation' => 'none',
                                                                                 'documentation' => 'The amount of the BioMaterial.',
                                                                                 'cardinality' => '0..1',
                                                                                 'class_id' => 'S.190',
                                                                                 'constraint' => {
                                                                                                   'ordered' => 0,
                                                                                                   'constraint' => 'rank: 2',
                                                                                                   'rank' => '2'
                                                                                                 }
                                                                               },
                                                                    'self' => {
                                                                                'class_name' => 'BioMaterialMeasurement',
                                                                                'name' => undef,
                                                                                'navigable' => 'false',
                                                                                'ordering' => 'unordered',
                                                                                'aggregation' => 'composite',
                                                                                'documentation' => 'The amount of the BioMaterial.',
                                                                                'cardinality' => '1',
                                                                                'class_id' => 'S.78',
                                                                                'constraint' => undef
                                                                              }
                                                                  }
                                                                ],
                                              'parent' => 'Extendable',
                                              'documentation' => 'A BioMaterialMeasurement is a pairing of a source BioMaterial and an amount (Measurement) of that BioMaterial.',
                                              'methods' => [],
                                              'name' => 'BioMaterialMeasurement',
                                              'abstract' => 'false',
                                              'id' => 'S.78',
                                              'package' => 'BioMaterial'
                                            },
                  'ConcentrationUnit' => {
                                         'attrs' => [
                                                      {
                                                        'name' => 'unitNameCV',
                                                        'type' => 'enum {M,mM,uM,nM,pM,fM,mg/mL,mL/L,g/L,gram_percent,mass/volume_percent, mass/mass_percent,other}',
                                                        'id' => 'S.210'
                                                      }
                                                    ],
                                         'associations' => [],
                                         'parent' => 'Unit',
                                         'documentation' => 'Concentration',
                                         'methods' => [],
                                         'name' => 'ConcentrationUnit',
                                         'abstract' => 'false',
                                         'id' => 'S.209',
                                         'package' => 'Measurement'
                                       },
                  'Transformation' => {
                                      'attrs' => [],
                                      'associations' => [
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'BioAssayData',
                                                                         'name' => 'bioAssayDataSources',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The BioAssayData sources that the Transformation event uses to produce the target DerivedBioAssayData.',
                                                                         'cardinality' => '0..N',
                                                                         'class_id' => 'S.120',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 1',
                                                                                           'rank' => '1'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'Transformation',
                                                                        'name' => undef,
                                                                        'navigable' => 'false',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The BioAssayData sources that the Transformation event uses to produce the target DerivedBioAssayData.',
                                                                        'cardinality' => '0..N',
                                                                        'class_id' => 'S.137',
                                                                        'constraint' => undef
                                                                      }
                                                          },
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'BioAssayMapping',
                                                                         'name' => 'bioAssayMapping',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The collection of mappings for the BioAssays.',
                                                                         'cardinality' => '0..1',
                                                                         'class_id' => 'S.122',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 5',
                                                                                           'rank' => '5'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'Transformation',
                                                                        'name' => undef,
                                                                        'navigable' => 'false',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'composite',
                                                                        'documentation' => 'The collection of mappings for the BioAssays.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.137',
                                                                        'constraint' => undef
                                                                      }
                                                          },
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'DerivedBioAssayData',
                                                                         'name' => 'derivedBioAssayDataTarget',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'composite',
                                                                         'documentation' => 'The association between the DerivedBioAssayData and the Transformation event that produced it.',
                                                                         'cardinality' => '1',
                                                                         'class_id' => 'S.126',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 2',
                                                                                           'rank' => '2'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'Transformation',
                                                                        'name' => 'producerTransformation',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The association between the DerivedBioAssayData and the Transformation event that produced it.',
                                                                        'cardinality' => '0..1',
                                                                        'class_id' => 'S.137',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      }
                                                          },
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'QuantitationTypeMapping',
                                                                         'name' => 'quantitationTypeMapping',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The collection of mappings for the QuantitationTypes.',
                                                                         'cardinality' => '0..1',
                                                                         'class_id' => 'S.128',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 3',
                                                                                           'rank' => '3'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'Transformation',
                                                                        'name' => undef,
                                                                        'navigable' => 'false',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'composite',
                                                                        'documentation' => 'The collection of mappings for the QuantitationTypes.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.137',
                                                                        'constraint' => undef
                                                                      }
                                                          },
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'DesignElementMapping',
                                                                         'name' => 'designElementMapping',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The collection of mappings for the DesignElements.',
                                                                         'cardinality' => '0..1',
                                                                         'class_id' => 'S.129',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 4',
                                                                                           'rank' => '4'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'Transformation',
                                                                        'name' => undef,
                                                                        'navigable' => 'false',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'composite',
                                                                        'documentation' => 'The collection of mappings for the DesignElements.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.137',
                                                                        'constraint' => undef
                                                                      }
                                                          }
                                                        ],
                                      'parent' => 'BioEvent',
                                      'documentation' => 'The process by which derivedBioAssays are created from measuredBioAssays and/or derivedBioAssays.  It uses mappings to indicate the input and output dimensions.  ',
                                      'methods' => [],
                                      'name' => 'Transformation',
                                      'abstract' => 'false',
                                      'id' => 'S.137',
                                      'package' => 'BioAssayData'
                                    },
                  'BioMaterial' => {
                                   'subclasses' => [
                                                     'LabeledExtract',
                                                     'BioSource',
                                                     'BioSample'
                                                   ],
                                   'attrs' => [],
                                   'parent' => 'Identifiable',
                                   'name' => 'BioMaterial',
                                   'package' => 'BioMaterial',
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'Treatment',
                                                                      'name' => 'treatments',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'This association is one way from BioMaterial to Treatment.  From this a BioMaterial can discover the amount and type of BioMaterial that was part of the treatment that produced it.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.79',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 4',
                                                                                        'rank' => '4'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioMaterial',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'This association is one way from BioMaterial to Treatment.  From this a BioMaterial can discover the amount and type of BioMaterial that was part of the treatment that produced it.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.72',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'materialType',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The type of material used, i.e. rna, dna, lipid, phosphoprotein, etc.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 3',
                                                                                        'rank' => '3'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioMaterial',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'The type of material used, i.e. rna, dna, lipid, phosphoprotein, etc.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.72',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'characteristics',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Innate properties of the biosource, such as genotype, cultivar, tissue type, cell type, ploidy, etc.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 2',
                                                                                        'rank' => '2'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioMaterial',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Innate properties of the biosource, such as genotype, cultivar, tissue type, cell type, ploidy, etc.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.72',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'NameValueType',
                                                                      'name' => 'qualityControlStatistics',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Measures of the quality of the BioMaterial.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.6',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioMaterial',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Measures of the quality of the BioMaterial.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.72',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'methods' => [],
                                   'documentation' => 'BioMaterial is an abstract class that represents the important substances such as cells, tissues, DNA, proteins, etc...  Biomaterials can be related to other biomaterial through a directed acyclic graph (represented by treatment(s)).',
                                   'id' => 'S.72',
                                   'abstract' => 'true'
                                 },
                  'Treatment' => {
                                 'attrs' => [
                                              {
                                                'documentation' => 'The chronological order in which a treatment occurred (in relation to other treatments).  More than one treatment can have the same chronological order indicating that they happened (or were caused to happen) simultaneously.',
                                                'name' => 'order',
                                                'type' => 'int',
                                                'id' => 'S.80'
                                              }
                                            ],
                                 'associations' => [
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'CompoundMeasurement',
                                                                    'name' => 'compoundMeasurements',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The compounds and their amounts used in the treatment.',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.77',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 3',
                                                                                      'rank' => '3'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'Treatment',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The compounds and their amounts used in the treatment.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.79',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'BioMaterialMeasurement',
                                                                    'name' => 'sourceBioMaterialMeasurements',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The BioMaterials and the amounts used in the treatment',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.78',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 4',
                                                                                      'rank' => '4'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'Treatment',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The BioMaterials and the amounts used in the treatment',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.79',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'Measurement',
                                                                    'name' => 'actionMeasurement',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'Measures events like duration, centrifuge speed, etc.',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.190',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 2',
                                                                                      'rank' => '2'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'Treatment',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'Measures events like duration, centrifuge speed, etc.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.79',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'OntologyEntry',
                                                                    'name' => 'action',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The event that occurred (e.g. grow, wait, add, etc...).  The actions should be a recommended vocabulary',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.185',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 1',
                                                                                      'rank' => '1'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'Treatment',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The event that occurred (e.g. grow, wait, add, etc...).  The actions should be a recommended vocabulary',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.79',
                                                                   'constraint' => undef
                                                                 }
                                                     }
                                                   ],
                                 'parent' => 'BioEvent',
                                 'documentation' => 'The process by which a biomaterial is created (from source biomaterials).  Treatments have an order and an action.',
                                 'methods' => [],
                                 'name' => 'Treatment',
                                 'abstract' => 'false',
                                 'id' => 'S.79',
                                 'package' => 'BioMaterial'
                               },
                  'BioAssayData' => {
                                    'subclasses' => [
                                                      'MeasuredBioAssayData',
                                                      'DerivedBioAssayData'
                                                    ],
                                    'attrs' => [],
                                    'parent' => 'Identifiable',
                                    'name' => 'BioAssayData',
                                    'package' => 'BioAssayData',
                                    'associations' => [
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'BioAssayDimension',
                                                                       'name' => 'bioAssayDimension',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The BioAssays of the BioAssayData.',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.135',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 2',
                                                                                         'rank' => '2'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'BioAssayData',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'aggregate',
                                                                      'documentation' => 'The BioAssays of the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.120',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'DesignElementDimension',
                                                                       'name' => 'designElementDimension',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The DesignElements of the BioAssayData.',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.123',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 3',
                                                                                         'rank' => '3'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'BioAssayData',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'aggregate',
                                                                      'documentation' => 'The DesignElements of the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.120',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'QuantitationTypeDimension',
                                                                       'name' => 'quantitationTypeDimension',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The QuantitationTypes of the BioAssayData.',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.121',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 4',
                                                                                         'rank' => '4'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'BioAssayData',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'aggregate',
                                                                      'documentation' => 'The QuantitationTypes of the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.120',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'NameValueType',
                                                                       'name' => 'summaryStatistics',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'Statistics on the Quality of the BioAssayData.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.6',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 1',
                                                                                         'rank' => '1'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'BioAssayData',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'composite',
                                                                      'documentation' => 'Statistics on the Quality of the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.120',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'BioDataValues',
                                                                       'name' => 'bioDataValues',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The data values of the BioAssayData.',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.133',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 5',
                                                                                         'rank' => '5'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'BioAssayData',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'composite',
                                                                      'documentation' => 'The data values of the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.120',
                                                                      'constraint' => undef
                                                                    }
                                                        }
                                                      ],
                                    'methods' => [],
                                    'documentation' => 'Represents the dataset created when the BioAssays are created.  BioAssayData is the entry point to the values.  Because the actual values are represented by a different object, BioDataValues, which can be memory intensive, the annotation of the transformation can be gotten separate from the data.',
                                    'id' => 'S.120',
                                    'abstract' => 'true'
                                  },
                  'BioAssayCreation' => {
                                        'subclasses' => [
                                                          'Hybridization'
                                                        ],
                                        'attrs' => [],
                                        'parent' => 'BioEvent',
                                        'name' => 'BioAssayCreation',
                                        'package' => 'BioAssay',
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Array',
                                                                           'name' => 'array',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The array used in the BioAssayCreation event.',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.40',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 2',
                                                                                             'rank' => '2'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'BioAssayCreation',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The array used in the BioAssayCreation event.',
                                                                          'cardinality' => '0..1',
                                                                          'class_id' => 'S.96',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'BioMaterialMeasurement',
                                                                           'name' => 'sourceBioMaterialMeasurements',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The BioSample and its amount used in the BioAssayCreation event.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.78',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'BioAssayCreation',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The BioSample and its amount used in the BioAssayCreation event.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.96',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'PhysicalBioAssay',
                                                                           'name' => 'physicalBioAssayTarget',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'composite',
                                                                           'documentation' => 'The association between the BioAssayCreation event (typically Hybridization) and the PhysicalBioAssay and its annotation of this event.',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.89',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 3',
                                                                                             'rank' => '3'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'BioAssayCreation',
                                                                          'name' => 'bioAssayCreation',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The association between the BioAssayCreation event (typically Hybridization) and the PhysicalBioAssay and its annotation of this event.',
                                                                          'cardinality' => '0..1',
                                                                          'class_id' => 'S.96',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 2',
                                                                                            'rank' => '2'
                                                                                          }
                                                                        }
                                                            }
                                                          ],
                                        'methods' => [],
                                        'documentation' => 'The process by which an array and one or more biomaterials are combined to create a bioAssayCreation.',
                                        'id' => 'S.96',
                                        'abstract' => 'false'
                                      },
                  'ConfidenceIndicator' => {
                                           'subclasses' => [
                                                             'ExpectedValue',
                                                             'PValue',
                                                             'Error'
                                                           ],
                                           'attrs' => [],
                                           'parent' => 'StandardQuantitationType',
                                           'name' => 'ConfidenceIndicator',
                                           'package' => 'QuantitationType',
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'QuantitationType',
                                                                              'name' => 'targetQuantitationType',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The association between a ConfidenceIndicator and the QuantitationType its is an indicator for.',
                                                                              'cardinality' => '1',
                                                                              'class_id' => 'S.241',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'ConfidenceIndicator',
                                                                             'name' => 'confidenceIndicators',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The association between a ConfidenceIndicator and the QuantitationType its is an indicator for.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.250',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 4',
                                                                                               'rank' => '4'
                                                                                             }
                                                                           }
                                                               }
                                                             ],
                                           'methods' => [],
                                           'documentation' => 'Indication of some measure of confidence for a standard quantitation type.',
                                           'id' => 'S.250',
                                           'abstract' => 'true'
                                         },
                  'ReporterDimension' => {
                                         'attrs' => [],
                                         'associations' => [
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'Reporter',
                                                                            'name' => 'reporters',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'The reporters for this dimension.',
                                                                            'cardinality' => '0..N',
                                                                            'class_id' => 'S.258',
                                                                            'constraint' => {
                                                                                              'ordered' => 1,
                                                                                              'constraint' => 'ordered rank: 1',
                                                                                              'rank' => '1'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'ReporterDimension',
                                                                           'name' => undef,
                                                                           'navigable' => 'false',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The reporters for this dimension.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.141',
                                                                           'constraint' => undef
                                                                         }
                                                             }
                                                           ],
                                         'parent' => 'DesignElementDimension',
                                         'documentation' => 'Specialized DesignElementDimension to hold Reporters.',
                                         'methods' => [],
                                         'name' => 'ReporterDimension',
                                         'abstract' => 'false',
                                         'id' => 'S.141',
                                         'package' => 'BioAssayData'
                                       },
                  'Failed' => {
                              'attrs' => [],
                              'associations' => [],
                              'parent' => 'StandardQuantitationType',
                              'documentation' => 'Values associated with this QuantitationType indicate a failure of some kind for a particular DesignElement for a BioAssay.  Of type boolean.',
                              'methods' => [],
                              'name' => 'Failed',
                              'abstract' => 'false',
                              'id' => 'S.252',
                              'package' => 'QuantitationType'
                            },
                  'ArrayManufactureDeviation' => {
                                                 'attrs' => [],
                                                 'associations' => [
                                                                     {
                                                                       'other' => {
                                                                                    'class_name' => 'FeatureDefect',
                                                                                    'name' => 'featureDefects',
                                                                                    'navigable' => 'true',
                                                                                    'ordering' => 'unordered',
                                                                                    'aggregation' => 'none',
                                                                                    'documentation' => 'Description on features who are manufactured in a different location than specified in the ArrayDesign.',
                                                                                    'cardinality' => '0..N',
                                                                                    'class_id' => 'S.45',
                                                                                    'constraint' => {
                                                                                                      'ordered' => 0,
                                                                                                      'constraint' => 'rank: 2',
                                                                                                      'rank' => '2'
                                                                                                    }
                                                                                  },
                                                                       'self' => {
                                                                                   'class_name' => 'ArrayManufactureDeviation',
                                                                                   'name' => undef,
                                                                                   'navigable' => 'false',
                                                                                   'ordering' => 'unordered',
                                                                                   'aggregation' => 'composite',
                                                                                   'documentation' => 'Description on features who are manufactured in a different location than specified in the ArrayDesign.',
                                                                                   'cardinality' => '1',
                                                                                   'class_id' => 'S.58',
                                                                                   'constraint' => undef
                                                                                 }
                                                                     },
                                                                     {
                                                                       'other' => {
                                                                                    'class_name' => 'ZoneDefect',
                                                                                    'name' => 'adjustments',
                                                                                    'navigable' => 'true',
                                                                                    'ordering' => 'unordered',
                                                                                    'aggregation' => 'none',
                                                                                    'documentation' => 'Descriptions of how a Zone has been printed differently than specified in the ArrayDesign.',
                                                                                    'cardinality' => '0..N',
                                                                                    'class_id' => 'S.69',
                                                                                    'constraint' => {
                                                                                                      'ordered' => 0,
                                                                                                      'constraint' => 'rank: 1',
                                                                                                      'rank' => '1'
                                                                                                    }
                                                                                  },
                                                                       'self' => {
                                                                                   'class_name' => 'ArrayManufactureDeviation',
                                                                                   'name' => undef,
                                                                                   'navigable' => 'false',
                                                                                   'ordering' => 'unordered',
                                                                                   'aggregation' => 'composite',
                                                                                   'documentation' => 'Descriptions of how a Zone has been printed differently than specified in the ArrayDesign.',
                                                                                   'cardinality' => '1',
                                                                                   'class_id' => 'S.58',
                                                                                   'constraint' => undef
                                                                                 }
                                                                     }
                                                                   ],
                                                 'parent' => 'Extendable',
                                                 'documentation' => 'Stores information of the potential difference between an array design and arrays that have been manufactured using that design (e.g. a tip failed to print several spots).',
                                                 'methods' => [],
                                                 'name' => 'ArrayManufactureDeviation',
                                                 'abstract' => 'false',
                                                 'id' => 'S.58',
                                                 'package' => 'Array'
                                               },
                  'SpecializedQuantitationType' => {
                                                   'attrs' => [],
                                                   'associations' => [],
                                                   'parent' => 'QuantitationType',
                                                   'documentation' => 'User defined quantitation type.',
                                                   'methods' => [],
                                                   'name' => 'SpecializedQuantitationType',
                                                   'abstract' => 'false',
                                                   'id' => 'S.243',
                                                   'package' => 'QuantitationType'
                                                 },
                  'FeatureInformation' => {
                                          'attrs' => [],
                                          'associations' => [
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'Feature',
                                                                             'name' => 'feature',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The feature the FeatureInformation is supplying information for.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.262',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 1',
                                                                                               'rank' => '1'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'FeatureInformation',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'The feature the FeatureInformation is supplying information for.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.267',
                                                                            'constraint' => undef
                                                                          }
                                                              },
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'MismatchInformation',
                                                                             'name' => 'mismatchInformation',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'Differences in how the feature matches the reporter\'s sequence, typical examples is the Affymetrix probe pair where one of the features is printed with a mismatch to the other feature\'s perfect match.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.263',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 2',
                                                                                               'rank' => '2'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'FeatureInformation',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'Differences in how the feature matches the reporter\'s sequence, typical examples is the Affymetrix probe pair where one of the features is printed with a mismatch to the other feature\'s perfect match.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.267',
                                                                            'constraint' => undef
                                                                          }
                                                              }
                                                            ],
                                          'parent' => 'Extendable',
                                          'documentation' => 'As part of the map information, allows the association of one or more differences in the BioMaterial on a feature from the BioMaterial of the Reporter.  Useful for control purposes such as in Affymetrix probe pairs. ',
                                          'methods' => [],
                                          'name' => 'FeatureInformation',
                                          'abstract' => 'false',
                                          'id' => 'S.267',
                                          'package' => 'DesignElement'
                                        },
                  'ExperimentDesign' => {
                                        'attrs' => [],
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'BioAssay',
                                                                           'name' => 'topLevelBioAssays',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The organization of the BioAssays as specified by the ExperimentDesign (TimeCourse, Dosage, etc.)',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.93',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 2',
                                                                                             'rank' => '2'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ExperimentDesign',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The organization of the BioAssays as specified by the ExperimentDesign (TimeCourse, Dosage, etc.)',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.145',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'ExperimentalFactor',
                                                                           'name' => 'experimentalFactors',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The description of the factors (TimeCourse, Dosage, etc.) that group the BioAssays.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.146',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 3',
                                                                                             'rank' => '3'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ExperimentDesign',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The description of the factors (TimeCourse, Dosage, etc.) that group the BioAssays.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.145',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Description',
                                                                           'name' => 'replicateDescription',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Description of the replicate strategy of the Experiment.',
                                                                           'cardinality' => '0..1',
                                                                           'class_id' => 'S.170',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 6',
                                                                                             'rank' => '6'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ExperimentDesign',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Description of the replicate strategy of the Experiment.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.145',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Description',
                                                                           'name' => 'qualityControlDescription',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Description of the quality control aspects of the Experiment.',
                                                                           'cardinality' => '0..1',
                                                                           'class_id' => 'S.170',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 4',
                                                                                             'rank' => '4'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ExperimentDesign',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Description of the quality control aspects of the Experiment.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.145',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Description',
                                                                           'name' => 'normalizationDescription',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Description of the normalization strategy of the Experiment.',
                                                                           'cardinality' => '0..1',
                                                                           'class_id' => 'S.170',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 5',
                                                                                             'rank' => '5'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ExperimentDesign',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Description of the normalization strategy of the Experiment.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.145',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'OntologyEntry',
                                                                           'name' => 'types',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Classification of an experiment.  For example \'normal vs. diseased\', \'treated vs. untreated\', \'time course\', \'tiling\', etc.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.185',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ExperimentDesign',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Classification of an experiment.  For example \'normal vs. diseased\', \'treated vs. untreated\', \'time course\', \'tiling\', etc.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.145',
                                                                          'constraint' => undef
                                                                        }
                                                            }
                                                          ],
                                        'parent' => 'Describable',
                                        'documentation' => 'The ExperimentDesign is the description and collection of ExperimentalFactors and the hierarchy of BioAssays to which they pertain.',
                                        'methods' => [],
                                        'name' => 'ExperimentDesign',
                                        'abstract' => 'false',
                                        'id' => 'S.145',
                                        'package' => 'Experiment'
                                      },
                  'PhysicalBioAssay' => {
                                        'attrs' => [],
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Image',
                                                                           'name' => 'physicalBioAssayData',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The Images associated with this PhysicalBioAssay by ImageAcquisition.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.91',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'PhysicalBioAssay',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The Images associated with this PhysicalBioAssay by ImageAcquisition.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.89',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'BioAssayCreation',
                                                                           'name' => 'bioAssayCreation',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The association between the BioAssayCreation event (typically Hybridization) and the PhysicalBioAssay and its annotation of this event.',
                                                                           'cardinality' => '0..1',
                                                                           'class_id' => 'S.96',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 2',
                                                                                             'rank' => '2'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'PhysicalBioAssay',
                                                                          'name' => 'physicalBioAssayTarget',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The association between the BioAssayCreation event (typically Hybridization) and the PhysicalBioAssay and its annotation of this event.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.89',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 3',
                                                                                            'rank' => '3'
                                                                                          }
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'BioAssayTreatment',
                                                                           'name' => 'bioAssayTreatments',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The set of treatments undergone by this PhysicalBioAssay.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.100',
                                                                           'constraint' => {
                                                                                             'ordered' => 1,
                                                                                             'constraint' => 'ordered rank: 3',
                                                                                             'rank' => '3'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'PhysicalBioAssay',
                                                                          'name' => 'physicalBioAssay',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The set of treatments undergone by this PhysicalBioAssay.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.89',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 1',
                                                                                            'rank' => '1'
                                                                                          }
                                                                        }
                                                            }
                                                          ],
                                        'parent' => 'BioAssay',
                                        'documentation' => 'A bioAssay created by the bioAssayCreation event (e.g. in gene expression analysis this event is represented by the hybridization event).',
                                        'methods' => [],
                                        'name' => 'PhysicalBioAssay',
                                        'abstract' => 'false',
                                        'id' => 'S.89',
                                        'package' => 'BioAssay'
                                      },
                  'PhysicalArrayDesign' => {
                                           'attrs' => [],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'ZoneGroup',
                                                                              'name' => 'zoneGroups',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'In the case where the array design is specified by one or more zones, allows specifying where those zones are located.',
                                                                              'cardinality' => '0..N',
                                                                              'class_id' => 'S.20',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 2',
                                                                                                'rank' => '2'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'PhysicalArrayDesign',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'composite',
                                                                             'documentation' => 'In the case where the array design is specified by one or more zones, allows specifying where those zones are located.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.14',
                                                                             'constraint' => undef
                                                                           }
                                                               },
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'OntologyEntry',
                                                                              'name' => 'surfaceType',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The type of surface from a controlled vocabulary that would include terms such as non-absorptive, absorptive, etc.',
                                                                              'cardinality' => '0..1',
                                                                              'class_id' => 'S.185',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'PhysicalArrayDesign',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'composite',
                                                                             'documentation' => 'The type of surface from a controlled vocabulary that would include terms such as non-absorptive, absorptive, etc.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.14',
                                                                             'constraint' => undef
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'ArrayDesign',
                                           'documentation' => 'A design that is expected to be used to manufacture physical arrays.',
                                           'methods' => [],
                                           'name' => 'PhysicalArrayDesign',
                                           'abstract' => 'false',
                                           'id' => 'S.14',
                                           'package' => 'ArrayDesign'
                                         },
                  'Ratio' => {
                             'attrs' => [],
                             'associations' => [],
                             'parent' => 'StandardQuantitationType',
                             'documentation' => 'The ratio of two or more signals, typically between two channels.  Of type float.',
                             'methods' => [],
                             'name' => 'Ratio',
                             'abstract' => 'false',
                             'id' => 'S.249',
                             'package' => 'QuantitationType'
                           },
                  'FeatureLocation' => {
                                       'attrs' => [
                                                    {
                                                      'documentation' => 'row position in the Zone',
                                                      'name' => 'row',
                                                      'type' => 'int',
                                                      'id' => 'S.272'
                                                    },
                                                    {
                                                      'documentation' => 'column position in the Zone.',
                                                      'name' => 'column',
                                                      'type' => 'int',
                                                      'id' => 'S.273'
                                                    }
                                                  ],
                                       'associations' => [],
                                       'parent' => 'Extendable',
                                       'documentation' => 'Specifies where a feature is located relative to a grid.',
                                       'methods' => [],
                                       'name' => 'FeatureLocation',
                                       'abstract' => 'false',
                                       'id' => 'S.271',
                                       'package' => 'DesignElement'
                                     },
                  'DesignElement' => {
                                     'subclasses' => [
                                                       'Reporter',
                                                       'CompositeSequence',
                                                       'Feature'
                                                     ],
                                     'attrs' => [],
                                     'parent' => 'Identifiable',
                                     'name' => 'DesignElement',
                                     'package' => 'DesignElement',
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'OntologyEntry',
                                                                        'name' => 'controlType',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'If the design element represents a control, the type of control it is (normalization, deletion, negative, positive, etc.)',
                                                                        'cardinality' => '0..1',
                                                                        'class_id' => 'S.185',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'DesignElement',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'If the design element represents a control, the type of control it is (normalization, deletion, negative, positive, etc.)',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.254',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'methods' => [],
                                     'documentation' => 'An element of an array.  This is generally of type feature but can be specified as reporters or compositeSequence for arrays that are abstracted from a physical array.',
                                     'id' => 'S.254',
                                     'abstract' => 'true'
                                   },
                  'QuantitationTypeDimension' => {
                                                 'attrs' => [],
                                                 'associations' => [
                                                                     {
                                                                       'other' => {
                                                                                    'class_name' => 'QuantitationType',
                                                                                    'name' => 'quantitationTypes',
                                                                                    'navigable' => 'true',
                                                                                    'ordering' => 'unordered',
                                                                                    'aggregation' => 'none',
                                                                                    'documentation' => 'The QuantitationTypes for this Dimension.',
                                                                                    'cardinality' => '0..N',
                                                                                    'class_id' => 'S.241',
                                                                                    'constraint' => {
                                                                                                      'ordered' => 1,
                                                                                                      'constraint' => 'ordered rank: 1',
                                                                                                      'rank' => '1'
                                                                                                    }
                                                                                  },
                                                                       'self' => {
                                                                                   'class_name' => 'QuantitationTypeDimension',
                                                                                   'name' => undef,
                                                                                   'navigable' => 'false',
                                                                                   'ordering' => 'unordered',
                                                                                   'aggregation' => 'none',
                                                                                   'documentation' => 'The QuantitationTypes for this Dimension.',
                                                                                   'cardinality' => '0..N',
                                                                                   'class_id' => 'S.121',
                                                                                   'constraint' => undef
                                                                                 }
                                                                     }
                                                                   ],
                                                 'parent' => 'Identifiable',
                                                 'documentation' => 'An ordered list of quantitationTypes.',
                                                 'methods' => [],
                                                 'name' => 'QuantitationTypeDimension',
                                                 'abstract' => 'false',
                                                 'id' => 'S.121',
                                                 'package' => 'BioAssayData'
                                               },
                  'Fiducial' => {
                                'attrs' => [],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'DistanceUnit',
                                                                   'name' => 'distanceUnit',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The units the fiducial is measured in.',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.199',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Fiducial',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The units the fiducial is measured in.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.59',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'OntologyEntry',
                                                                   'name' => 'fiducialType',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'A descriptive string that indicates the type of a fiducial (e.g. the chrome border on an Affymetrix array, a laser ablation mark).',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.185',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Fiducial',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'A descriptive string that indicates the type of a fiducial (e.g. the chrome border on an Affymetrix array, a laser ablation mark).',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.59',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Position',
                                                                   'name' => 'position',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The position, relative to the upper left corner, of the fiducial',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.255',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 3',
                                                                                     'rank' => '3'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Fiducial',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The position, relative to the upper left corner, of the fiducial',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.59',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Describable',
                                'documentation' => 'A marking on the surface of the array that can be used to identify the array\'s origin, the coordinates of which are the fiducial\'s centroid.',
                                'methods' => [],
                                'name' => 'Fiducial',
                                'abstract' => 'false',
                                'id' => 'S.59',
                                'package' => 'Array'
                              },
                  'DerivedSignal' => {
                                     'attrs' => [],
                                     'associations' => [],
                                     'parent' => 'StandardQuantitationType',
                                     'documentation' => 'A calculated measurement of the intensity of a signal, for example, after a transformation involving normalization and/or replicate DesignElements.  Of type float.',
                                     'methods' => [],
                                     'name' => 'DerivedSignal',
                                     'abstract' => 'false',
                                     'id' => 'S.244',
                                     'package' => 'QuantitationType'
                                   },
                  'BioSequence' => {
                                   'attrs' => [
                                                {
                                                  'documentation' => 'The number of residues in the biosequence.',
                                                  'name' => 'length',
                                                  'type' => 'int',
                                                  'id' => 'S.232'
                                                },
                                                {
                                                  'documentation' => 'If length not positively known will be true',
                                                  'name' => 'isApproximateLength',
                                                  'type' => 'boolean',
                                                  'id' => 'S.233'
                                                },
                                                {
                                                  'documentation' => 'Indicates if the BioSequence is circular in nature.',
                                                  'name' => 'isCircular',
                                                  'type' => 'boolean',
                                                  'id' => 'S.234'
                                                },
                                                {
                                                  'documentation' => 'The actual components of the sequence, for instance, for DNA a string consisting of A,T,C and G.

The attribute is optional and instead of specified here, can be found through the DatabaseEntry. ',
                                                  'name' => 'sequence',
                                                  'type' => 'String',
                                                  'id' => 'S.235'
                                                }
                                              ],
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'DatabaseEntry',
                                                                      'name' => 'sequenceDatabases',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'References an entry in a species database, like GenBank, UniGene, etc.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.173',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioSequence',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'References an entry in a species database, like GenBank, UniGene, etc.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.231',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'ontologyEntries',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Ontology entries referring to common values associated with BioSequences, such as gene names, go ids, etc.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 2',
                                                                                        'rank' => '2'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioSequence',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Ontology entries referring to common values associated with BioSequences, such as gene names, go ids, etc.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.231',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'polymerType',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'A choice of protein, RNA, or DNA.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 3',
                                                                                        'rank' => '3'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioSequence',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'A choice of protein, RNA, or DNA.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.231',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'type',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The type of biosequence, i.e. gene, exon, UniGene cluster, fragment, BAC, EST, etc.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 4',
                                                                                        'rank' => '4'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioSequence',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'The type of biosequence, i.e. gene, exon, UniGene cluster, fragment, BAC, EST, etc.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.231',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'species',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The organism from which this sequence was obtained.',
                                                                      'cardinality' => '0..1',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 5',
                                                                                        'rank' => '5'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioSequence',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'The organism from which this sequence was obtained.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.231',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'SeqFeature',
                                                                      'name' => 'seqFeatures',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Association to annotations for subsequences.  Corresponds to the GenBank Frame Table.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.227',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 6',
                                                                                        'rank' => '6'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioSequence',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Association to annotations for subsequences.  Corresponds to the GenBank Frame Table.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.231',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'parent' => 'Identifiable',
                                   'documentation' => 'A BioSequence is a representation of a DNA, RNA, or protein sequence.  It can be represented by a Clone, Gene, or the sequence.',
                                   'methods' => [],
                                   'name' => 'BioSequence',
                                   'abstract' => 'false',
                                   'id' => 'S.231',
                                   'package' => 'BioSequence'
                                 },
                  'ReporterPosition' => {
                                        'attrs' => [],
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Reporter',
                                                                           'name' => 'reporter',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'A reporter that comprises part of a CompositeSequence.',
                                                                           'cardinality' => '1',
                                                                           'class_id' => 'S.258',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ReporterPosition',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'A reporter that comprises part of a CompositeSequence.',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.259',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'MismatchInformation',
                                                                           'name' => 'mismatchInformation',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Differences in how the reporter matches its compositeSequence\'s sequence.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.263',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 2',
                                                                                             'rank' => '2'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ReporterPosition',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Differences in how the reporter matches its compositeSequence\'s sequence.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.259',
                                                                          'constraint' => undef
                                                                        }
                                                            }
                                                          ],
                                        'parent' => 'SequencePosition',
                                        'documentation' => 'The location in the composite target\'s sequence to which a source reporter maps.  The association to MismatchInformation allows the specification, usually for control purposes, of deviations from the CompositeSequence\'s BioMaterial.',
                                        'methods' => [],
                                        'name' => 'ReporterPosition',
                                        'abstract' => 'false',
                                        'id' => 'S.259',
                                        'package' => 'DesignElement'
                                      },
                  'QuantitationTypeMapping' => {
                                               'attrs' => [],
                                               'associations' => [
                                                                   {
                                                                     'other' => {
                                                                                  'class_name' => 'QuantitationTypeMap',
                                                                                  'name' => 'quantitationTypeMaps',
                                                                                  'navigable' => 'true',
                                                                                  'ordering' => 'unordered',
                                                                                  'aggregation' => 'none',
                                                                                  'documentation' => 'The maps for the QuantitationTypes.',
                                                                                  'cardinality' => '1..N',
                                                                                  'class_id' => 'S.136',
                                                                                  'constraint' => {
                                                                                                    'ordered' => 0,
                                                                                                    'constraint' => 'rank: 1',
                                                                                                    'rank' => '1'
                                                                                                  }
                                                                                },
                                                                     'self' => {
                                                                                 'class_name' => 'QuantitationTypeMapping',
                                                                                 'name' => undef,
                                                                                 'navigable' => 'false',
                                                                                 'ordering' => 'unordered',
                                                                                 'aggregation' => 'none',
                                                                                 'documentation' => 'The maps for the QuantitationTypes.',
                                                                                 'cardinality' => '0..N',
                                                                                 'class_id' => 'S.128',
                                                                                 'constraint' => undef
                                                                               }
                                                                   }
                                                                 ],
                                               'parent' => 'Extendable',
                                               'documentation' => 'Container of the mappings of the input QuantitationType dimensions to the output QuantitationType dimension.',
                                               'methods' => [],
                                               'name' => 'QuantitationTypeMapping',
                                               'abstract' => 'false',
                                               'id' => 'S.128',
                                               'package' => 'BioAssayData'
                                             },
                  'Identifiable' => {
                                    'subclasses' => [
                                                      'Compound',
                                                      'BioEvent',
                                                      'DesignElementGroup',
                                                      'QuantitationType',
                                                      'Zone',
                                                      'BioAssayDimension',
                                                      'QuantitationTypeDimension',
                                                      'ArrayDesign',
                                                      'Contact',
                                                      'FactorValue',
                                                      'BioAssayData',
                                                      'ArrayManufacture',
                                                      'DesignElement',
                                                      'DesignElementDimension',
                                                      'Database',
                                                      'Experiment',
                                                      'ArrayGroup',
                                                      'Security',
                                                      'Channel',
                                                      'Parameterizable',
                                                      'SecurityGroup',
                                                      'Array',
                                                      'Image',
                                                      'Parameter',
                                                      'BioAssay',
                                                      'BioAssayDataCluster',
                                                      'ExperimentalFactor',
                                                      'BioSequence',
                                                      'BioMaterial'
                                                    ],
                                    'attrs' => [
                                                 {
                                                   'documentation' => 'An identifier is an unambiguous string that is unique within the scope (i.e. a document, a set of related documents, or a repository) of its use.',
                                                   'name' => 'identifier',
                                                   'type' => 'String',
                                                   'id' => 'S.3'
                                                 },
                                                 {
                                                   'documentation' => 'The potentially ambiguous common identifier.',
                                                   'name' => 'name',
                                                   'type' => 'String',
                                                   'id' => 'S.4'
                                                 }
                                               ],
                                    'parent' => 'Describable',
                                    'name' => 'Identifiable',
                                    'package' => 'MAGE',
                                    'associations' => [],
                                    'methods' => [],
                                    'documentation' => 'An Identifiable class is one that has an unambiguous reference within the scope.  It also has a potentially ambiguous name.',
                                    'id' => 'S.2',
                                    'abstract' => 'true'
                                  },
                  'MeasuredBioAssayData' => {
                                            'attrs' => [],
                                            'associations' => [],
                                            'parent' => 'BioAssayData',
                                            'documentation' => 'The data associated with the MeasuredBioAssay produced by FeatureExtraction.',
                                            'methods' => [],
                                            'name' => 'MeasuredBioAssayData',
                                            'abstract' => 'false',
                                            'id' => 'S.127',
                                            'package' => 'BioAssayData'
                                          },
                  'Array' => {
                             'attrs' => [
                                          {
                                            'documentation' => 'An identifying string, e.g. a barcode.',
                                            'name' => 'arrayIdentifier',
                                            'type' => 'String',
                                            'id' => 'S.41'
                                          },
                                          {
                                            'documentation' => 'This can indicate the x position on a slide, chip, etc. of the first Feature and is usually specified relative to the fiducial.',
                                            'name' => 'arrayXOrigin',
                                            'type' => 'float',
                                            'id' => 'S.42'
                                          },
                                          {
                                            'documentation' => 'This can indicate the y position on a slide, chip, etc. of the first Feature and is usually specified relative to the fiducial.',
                                            'name' => 'arrayYOrigin',
                                            'type' => 'float',
                                            'id' => 'S.43'
                                          },
                                          {
                                            'documentation' => 'What the array origin is relative to, e.g. upper left corner, fiducial, etc.',
                                            'name' => 'originRelativeTo',
                                            'type' => 'String',
                                            'id' => 'S.44'
                                          }
                                        ],
                             'associations' => [
                                                 {
                                                   'other' => {
                                                                'class_name' => 'ArrayDesign',
                                                                'name' => 'arrayDesign',
                                                                'navigable' => 'true',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'The association of a physical array with its array design.',
                                                                'cardinality' => '1',
                                                                'class_id' => 'S.11',
                                                                'constraint' => {
                                                                                  'ordered' => 0,
                                                                                  'constraint' => 'rank: 1',
                                                                                  'rank' => '1'
                                                                                }
                                                              },
                                                   'self' => {
                                                               'class_name' => 'Array',
                                                               'name' => undef,
                                                               'navigable' => 'false',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'The association of a physical array with its array design.',
                                                               'cardinality' => '0..N',
                                                               'class_id' => 'S.40',
                                                               'constraint' => undef
                                                             }
                                                 },
                                                 {
                                                   'other' => {
                                                                'class_name' => 'ArrayGroup',
                                                                'name' => 'arrayGroup',
                                                                'navigable' => 'true',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                                                                'cardinality' => '0..1',
                                                                'class_id' => 'S.46',
                                                                'constraint' => {
                                                                                  'ordered' => 0,
                                                                                  'constraint' => 'rank: 3',
                                                                                  'rank' => '3'
                                                                                }
                                                              },
                                                   'self' => {
                                                               'class_name' => 'Array',
                                                               'name' => 'arrays',
                                                               'navigable' => 'true',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'Association between an ArrayGroup and its Arrays, typically the ArrayGroup will represent a slide and the Arrays will be the manufactured so that they may be hybridized separately on that slide. ',
                                                               'cardinality' => '1..N',
                                                               'class_id' => 'S.40',
                                                               'constraint' => {
                                                                                 'ordered' => 0,
                                                                                 'constraint' => 'rank: 2',
                                                                                 'rank' => '2'
                                                                               }
                                                             }
                                                 },
                                                 {
                                                   'other' => {
                                                                'class_name' => 'ArrayManufacture',
                                                                'name' => 'information',
                                                                'navigable' => 'true',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'Association between the manufactured array and the information on that manufacture.',
                                                                'cardinality' => '1',
                                                                'class_id' => 'S.55',
                                                                'constraint' => {
                                                                                  'ordered' => 0,
                                                                                  'constraint' => 'rank: 2',
                                                                                  'rank' => '2'
                                                                                }
                                                              },
                                                   'self' => {
                                                               'class_name' => 'Array',
                                                               'name' => 'arrays',
                                                               'navigable' => 'true',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'Association between the manufactured array and the information on that manufacture.',
                                                               'cardinality' => '1..N',
                                                               'class_id' => 'S.40',
                                                               'constraint' => {
                                                                                 'ordered' => 0,
                                                                                 'constraint' => 'rank: 1',
                                                                                 'rank' => '1'
                                                                               }
                                                             }
                                                 },
                                                 {
                                                   'other' => {
                                                                'class_name' => 'ArrayManufactureDeviation',
                                                                'name' => 'arrayManufactureDeviations',
                                                                'navigable' => 'true',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'Association to classes to describe deviations from the ArrayDesign.',
                                                                'cardinality' => '0..N',
                                                                'class_id' => 'S.58',
                                                                'constraint' => {
                                                                                  'ordered' => 0,
                                                                                  'constraint' => 'rank: 4',
                                                                                  'rank' => '4'
                                                                                }
                                                              },
                                                   'self' => {
                                                               'class_name' => 'Array',
                                                               'name' => undef,
                                                               'navigable' => 'false',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'composite',
                                                               'documentation' => 'Association to classes to describe deviations from the ArrayDesign.',
                                                               'cardinality' => '1',
                                                               'class_id' => 'S.40',
                                                               'constraint' => undef
                                                             }
                                                 }
                                               ],
                             'parent' => 'Identifiable',
                             'documentation' => 'The physical substrate along with its features and their annotation',
                             'methods' => [],
                             'name' => 'Array',
                             'abstract' => 'false',
                             'id' => 'S.40',
                             'package' => 'Array'
                           },
                  'BioAssayMap' => {
                                   'attrs' => [],
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'DerivedBioAssay',
                                                                      'name' => 'bioAssayMapTarget',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The DerivedBioAssay that is produced by the sources of the BioAssayMap.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.90',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioAssayMap',
                                                                     'name' => 'derivedBioAssayMap',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The DerivedBioAssay that is produced by the sources of the BioAssayMap.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.139',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 3',
                                                                                       'rank' => '3'
                                                                                     }
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'BioAssay',
                                                                      'name' => 'sourceBioAssays',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The sources of the BioAssayMap that are used to produce a target DerivedBioAssay.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.93',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 2',
                                                                                        'rank' => '2'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'BioAssayMap',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The sources of the BioAssayMap that are used to produce a target DerivedBioAssay.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.139',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'parent' => 'Map',
                                   'documentation' => 'The BioAssayMap is the description of how source MeasuredBioAssays and/or DerivedBioAssays are manipulated (mathematically) to produce DerivedBioAssays.',
                                   'methods' => [],
                                   'name' => 'BioAssayMap',
                                   'abstract' => 'false',
                                   'id' => 'S.139',
                                   'package' => 'BioAssayData'
                                 },
                  'ExperimentalFactor' => {
                                          'attrs' => [],
                                          'associations' => [
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'FactorValue',
                                                                             'name' => 'factorValues',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The pairing of BioAssay FactorValues with the ExperimentDesign ExperimentFactor.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.147',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 2',
                                                                                               'rank' => '2'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'ExperimentalFactor',
                                                                            'name' => 'experimentalFactor',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'The pairing of BioAssay FactorValues with the ExperimentDesign ExperimentFactor.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.146',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 1',
                                                                                              'rank' => '1'
                                                                                            }
                                                                          }
                                                              },
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'OntologyEntry',
                                                                             'name' => 'category',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The category of an ExperimentalFactor could be biological (time, [glucose]) or a methodological factor (differing cDNA preparation protocols).',
                                                                             'cardinality' => '0..1',
                                                                             'class_id' => 'S.185',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 1',
                                                                                               'rank' => '1'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'ExperimentalFactor',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'The category of an ExperimentalFactor could be biological (time, [glucose]) or a methodological factor (differing cDNA preparation protocols).',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.146',
                                                                            'constraint' => undef
                                                                          }
                                                              },
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'OntologyEntry',
                                                                             'name' => 'annotations',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'Allows describing additional information such as concentration of Tamoxafin with a CASRegistry #.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.185',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 3',
                                                                                               'rank' => '3'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'ExperimentalFactor',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'Allows describing additional information such as concentration of Tamoxafin with a CASRegistry #.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.146',
                                                                            'constraint' => undef
                                                                          }
                                                              }
                                                            ],
                                          'parent' => 'Identifiable',
                                          'documentation' => 'ExperimentFactors are the dependent variables of an experiment (e.g. time, glucose concentration, ...).',
                                          'methods' => [],
                                          'name' => 'ExperimentalFactor',
                                          'abstract' => 'false',
                                          'id' => 'S.146',
                                          'package' => 'Experiment'
                                        },
                  'Position' => {
                                'attrs' => [
                                             {
                                               'documentation' => 'The horizontal distance from the upper left corner of the array.',
                                               'name' => 'x',
                                               'type' => 'float',
                                               'id' => 'S.256'
                                             },
                                             {
                                               'documentation' => 'The vertical distance from the upper left corner of the array.',
                                               'name' => 'y',
                                               'type' => 'float',
                                               'id' => 'S.257'
                                             }
                                           ],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'DistanceUnit',
                                                                   'name' => 'distanceUnit',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The units of the x, y positions.',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.199',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Position',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The units of the x, y positions.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.255',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Extendable',
                                'documentation' => 'Specifies a position on an array.',
                                'methods' => [],
                                'name' => 'Position',
                                'abstract' => 'false',
                                'id' => 'S.255',
                                'package' => 'DesignElement'
                              },
                  'SeqFeature' => {
                                  'attrs' => [
                                               {
                                                 'documentation' => 'How the evidence for a SeqFeature was determined.',
                                                 'name' => 'basis',
                                                 'type' => 'enum {experimental, computational,both,unknown,NA}',
                                                 'id' => 'S.228'
                                               }
                                             ],
                                  'associations' => [
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'SeqFeatureLocation',
                                                                     'name' => 'regions',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Association to classes that describe the location with the sequence of the SeqFeature.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.229',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 1',
                                                                                       'rank' => '1'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'SeqFeature',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'Association to classes that describe the location with the sequence of the SeqFeature.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.227',
                                                                    'constraint' => undef
                                                                  }
                                                      }
                                                    ],
                                  'parent' => 'Describable',
                                  'documentation' => 'Represents, in general, what would be a GenBank Feature Table annotation for a sequence.',
                                  'methods' => [],
                                  'name' => 'SeqFeature',
                                  'abstract' => 'false',
                                  'id' => 'S.227',
                                  'package' => 'BioSequence'
                                },
                  'OntologyEntry' => {
                                     'attrs' => [
                                                  {
                                                    'documentation' => 'The category to which this entry belongs.',
                                                    'name' => 'category',
                                                    'type' => 'String',
                                                    'id' => 'S.186'
                                                  },
                                                  {
                                                    'documentation' => 'The value for this entry in this category.  ',
                                                    'name' => 'value',
                                                    'type' => 'String',
                                                    'id' => 'S.187'
                                                  },
                                                  {
                                                    'documentation' => 'The description of the meaning for this entry.',
                                                    'name' => 'description',
                                                    'type' => 'String',
                                                    'id' => 'S.188'
                                                  }
                                                ],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'DatabaseEntry',
                                                                        'name' => 'ontologyReference',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'Many ontology entries will not yet have formalized ontologies.  In those cases, they will not have a database reference to the ontology.

In the future it is highly encouraged that these ontologies be developed and ontologyEntry be subclassed from DatabaseReference.',
                                                                        'cardinality' => '0..1',
                                                                        'class_id' => 'S.173',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'OntologyEntry',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'Many ontology entries will not yet have formalized ontologies.  In those cases, they will not have a database reference to the ontology.

In the future it is highly encouraged that these ontologies be developed and ontologyEntry be subclassed from DatabaseReference.',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.185',
                                                                       'constraint' => undef
                                                                     }
                                                         },
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'OntologyEntry',
                                                                        'name' => 'associations',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'Allows an instance of an OntologyEntry to be further qualified.',
                                                                        'cardinality' => '0..N',
                                                                        'class_id' => 'S.185',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 2',
                                                                                          'rank' => '2'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'OntologyEntry',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'Allows an instance of an OntologyEntry to be further qualified.',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.185',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'Extendable',
                                     'documentation' => 'A single entry from an ontology or a controlled vocabulary.  For instance, category could be \'species name\', value could be \'homo sapiens\' and ontology would  be taxonomy database, NCBI.',
                                     'methods' => [],
                                     'name' => 'OntologyEntry',
                                     'abstract' => 'false',
                                     'id' => 'S.185',
                                     'package' => 'Description'
                                   },
                  'ImageAcquisition' => {
                                        'attrs' => [],
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Image',
                                                                           'name' => 'images',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The images produced by the ImageAcquisition event.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.91',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ImageAcquisition',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The images produced by the ImageAcquisition event.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.99',
                                                                          'constraint' => undef
                                                                        }
                                                            }
                                                          ],
                                        'parent' => 'BioAssayTreatment',
                                        'documentation' => 'The process by which an image is generated (typically scanning).',
                                        'methods' => [],
                                        'name' => 'ImageAcquisition',
                                        'abstract' => 'false',
                                        'id' => 'S.99',
                                        'package' => 'BioAssay'
                                      },
                  'FeatureExtraction' => {
                                         'attrs' => [],
                                         'associations' => [
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'PhysicalBioAssay',
                                                                            'name' => 'physicalBioAssaySource',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'none',
                                                                            'documentation' => 'The PhysicalBioAssay used in the FeatureExtraction event.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.89',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 1',
                                                                                              'rank' => '1'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'FeatureExtraction',
                                                                           'name' => undef,
                                                                           'navigable' => 'false',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The PhysicalBioAssay used in the FeatureExtraction event.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.97',
                                                                           'constraint' => undef
                                                                         }
                                                             },
                                                             {
                                                               'other' => {
                                                                            'class_name' => 'MeasuredBioAssay',
                                                                            'name' => 'measuredBioAssayTarget',
                                                                            'navigable' => 'true',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'The association between the MeasuredBioAssay and the FeatureExtraction Event.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.95',
                                                                            'constraint' => {
                                                                                              'ordered' => 0,
                                                                                              'constraint' => 'rank: 2',
                                                                                              'rank' => '2'
                                                                                            }
                                                                          },
                                                               'self' => {
                                                                           'class_name' => 'FeatureExtraction',
                                                                           'name' => 'featureExtraction',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The association between the MeasuredBioAssay and the FeatureExtraction Event.',
                                                                           'cardinality' => '0..1',
                                                                           'class_id' => 'S.97',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         }
                                                             }
                                                           ],
                                         'parent' => 'BioEvent',
                                         'documentation' => 'The process by which data is extracted from an image producing a measuredBioAssayData and a measuredBioAssay.',
                                         'methods' => [],
                                         'name' => 'FeatureExtraction',
                                         'abstract' => 'false',
                                         'id' => 'S.97',
                                         'package' => 'BioAssay'
                                       },
                  'Error' => {
                             'attrs' => [],
                             'associations' => [],
                             'parent' => 'ConfidenceIndicator',
                             'documentation' => 'Error measurement of a quantitation.  Of type float.',
                             'methods' => [],
                             'name' => 'Error',
                             'abstract' => 'false',
                             'id' => 'S.246',
                             'package' => 'QuantitationType'
                           },
                  'ArrayManufacture' => {
                                        'attrs' => [
                                                     {
                                                       'documentation' => 'The date the arrays were manufactured',
                                                       'name' => 'manufacturingDate',
                                                       'type' => 'String',
                                                       'id' => 'S.56'
                                                     },
                                                     {
                                                       'documentation' => 'The allowable error of a feature printed to its intended position.',
                                                       'name' => 'tolerance',
                                                       'type' => 'float',
                                                       'id' => 'S.57'
                                                     }
                                                   ],
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Array',
                                                                           'name' => 'arrays',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Association between the manufactured array and the information on that manufacture.',
                                                                           'cardinality' => '1..N',
                                                                           'class_id' => 'S.40',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ArrayManufacture',
                                                                          'name' => 'information',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'Association between the manufactured array and the information on that manufacture.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.55',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 2',
                                                                                            'rank' => '2'
                                                                                          }
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'ProtocolApplication',
                                                                           'name' => 'protocolApplications',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The protocols followed in the manufacturing of the arrays.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.155',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 5',
                                                                                             'rank' => '5'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ArrayManufacture',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'The protocols followed in the manufacturing of the arrays.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.55',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'ManufactureLIMS',
                                                                           'name' => 'featureLIMSs',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Information on the manufacture of the features.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.60',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 4',
                                                                                             'rank' => '4'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ArrayManufacture',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Information on the manufacture of the features.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.55',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Contact',
                                                                           'name' => 'arrayManufacturers',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The person or organization to contact for information concerning the ArrayManufacture.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.112',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 2',
                                                                                             'rank' => '2'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ArrayManufacture',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The person or organization to contact for information concerning the ArrayManufacture.',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.55',
                                                                          'constraint' => undef
                                                                        }
                                                            },
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'NameValueType',
                                                                           'name' => 'qualityControlStatistics',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'Information on the quality of the ArrayManufacture.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.6',
                                                                           'constraint' => {
                                                                                             'ordered' => 0,
                                                                                             'constraint' => 'rank: 3',
                                                                                             'rank' => '3'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'ArrayManufacture',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'composite',
                                                                          'documentation' => 'Information on the quality of the ArrayManufacture.',
                                                                          'cardinality' => '1',
                                                                          'class_id' => 'S.55',
                                                                          'constraint' => undef
                                                                        }
                                                            }
                                                          ],
                                        'parent' => 'Identifiable',
                                        'documentation' => 'Describes the process by which arrays are produced.  ',
                                        'methods' => [],
                                        'name' => 'ArrayManufacture',
                                        'abstract' => 'false',
                                        'id' => 'S.55',
                                        'package' => 'Array'
                                      },
                  'Map' => {
                           'subclasses' => [
                                             'BioAssayMap',
                                             'QuantitationTypeMap',
                                             'DesignElementMap'
                                           ],
                           'attrs' => [],
                           'parent' => 'BioEvent',
                           'name' => 'Map',
                           'package' => 'BioEvent',
                           'associations' => [],
                           'methods' => [],
                           'documentation' => 'A Map is the description of how sources are transformed into a target.  Provides an abstarct base class that separates the mapping BioEvents from the transforming.',
                           'id' => 'S.213',
                           'abstract' => 'true'
                         },
                  'Organization' => {
                                    'attrs' => [],
                                    'associations' => [
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'Organization',
                                                                       'name' => 'parent',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The containing organization (the university or business which a lab belongs to, etc.)',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.110',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 1',
                                                                                         'rank' => '1'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'Organization',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The containing organization (the university or business which a lab belongs to, etc.)',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.110',
                                                                      'constraint' => undef
                                                                    }
                                                        }
                                                      ],
                                    'parent' => 'Contact',
                                    'documentation' => 'Organizations are entities like companies, universities, government agencies for which the attributes are self describing.',
                                    'methods' => [],
                                    'name' => 'Organization',
                                    'abstract' => 'false',
                                    'id' => 'S.110',
                                    'package' => 'AuditAndSecurity'
                                  },
                  'SecurityGroup' => {
                                     'attrs' => [],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'Contact',
                                                                        'name' => 'members',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The members of the Security Group.',
                                                                        'cardinality' => '1..N',
                                                                        'class_id' => 'S.112',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'SecurityGroup',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The members of the Security Group.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.111',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'Identifiable',
                                     'documentation' => 'Groups contacts together based on their security privileges.',
                                     'methods' => [],
                                     'name' => 'SecurityGroup',
                                     'abstract' => 'false',
                                     'id' => 'S.111',
                                     'package' => 'AuditAndSecurity'
                                   },
                  'Database' => {
                                'attrs' => [
                                             {
                                               'documentation' => 'The version for which a DatabaseReference applies.',
                                               'name' => 'version',
                                               'type' => 'String',
                                               'id' => 'S.178'
                                             },
                                             {
                                               'documentation' => 'The location of the Database.',
                                               'name' => 'URI',
                                               'type' => 'String',
                                               'id' => 'S.179'
                                             }
                                           ],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Contact',
                                                                   'name' => 'contacts',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Information on the contacts for the database',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.112',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Database',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Information on the contacts for the database',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.177',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Identifiable',
                                'documentation' => 'An address to a repository.',
                                'methods' => [],
                                'name' => 'Database',
                                'abstract' => 'false',
                                'id' => 'S.177',
                                'package' => 'Description'
                              },
                  'CompositeSequenceDimension' => {
                                                  'attrs' => [],
                                                  'associations' => [
                                                                      {
                                                                        'other' => {
                                                                                     'class_name' => 'CompositeSequence',
                                                                                     'name' => 'compositeSequences',
                                                                                     'navigable' => 'true',
                                                                                     'ordering' => 'unordered',
                                                                                     'aggregation' => 'none',
                                                                                     'documentation' => 'The CompositeSequences for this Dimension.',
                                                                                     'cardinality' => '0..N',
                                                                                     'class_id' => 'S.261',
                                                                                     'constraint' => {
                                                                                                       'ordered' => 1,
                                                                                                       'constraint' => 'ordered rank: 1',
                                                                                                       'rank' => '1'
                                                                                                     }
                                                                                   },
                                                                        'self' => {
                                                                                    'class_name' => 'CompositeSequenceDimension',
                                                                                    'name' => undef,
                                                                                    'navigable' => 'false',
                                                                                    'ordering' => 'unordered',
                                                                                    'aggregation' => 'none',
                                                                                    'documentation' => 'The CompositeSequences for this Dimension.',
                                                                                    'cardinality' => '0..N',
                                                                                    'class_id' => 'S.140',
                                                                                    'constraint' => undef
                                                                                  }
                                                                      }
                                                                    ],
                                                  'parent' => 'DesignElementDimension',
                                                  'documentation' => 'Specialized DesignElementDimension to hold CompositeSequences.',
                                                  'methods' => [],
                                                  'name' => 'CompositeSequenceDimension',
                                                  'abstract' => 'false',
                                                  'id' => 'S.140',
                                                  'package' => 'BioAssayData'
                                                },
                  'Image' => {
                             'attrs' => [
                                          {
                                            'documentation' => 'The file location in which an image may be found.',
                                            'name' => 'URI',
                                            'type' => 'String',
                                            'id' => 'S.92'
                                          }
                                        ],
                             'associations' => [
                                                 {
                                                   'other' => {
                                                                'class_name' => 'Channel',
                                                                'name' => 'channels',
                                                                'navigable' => 'true',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'The channels captured in this image.',
                                                                'cardinality' => '0..N',
                                                                'class_id' => 'S.94',
                                                                'constraint' => {
                                                                                  'ordered' => 0,
                                                                                  'constraint' => 'rank: 1',
                                                                                  'rank' => '1'
                                                                                }
                                                              },
                                                   'self' => {
                                                               'class_name' => 'Image',
                                                               'name' => undef,
                                                               'navigable' => 'false',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'The channels captured in this image.',
                                                               'cardinality' => '1',
                                                               'class_id' => 'S.91',
                                                               'constraint' => undef
                                                             }
                                                 },
                                                 {
                                                   'other' => {
                                                                'class_name' => 'OntologyEntry',
                                                                'name' => 'format',
                                                                'navigable' => 'true',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'The file format of the image typically a TIF or a JPEG.',
                                                                'cardinality' => '1',
                                                                'class_id' => 'S.185',
                                                                'constraint' => {
                                                                                  'ordered' => 0,
                                                                                  'constraint' => 'rank: 2',
                                                                                  'rank' => '2'
                                                                                }
                                                              },
                                                   'self' => {
                                                               'class_name' => 'Image',
                                                               'name' => undef,
                                                               'navigable' => 'false',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'composite',
                                                               'documentation' => 'The file format of the image typically a TIF or a JPEG.',
                                                               'cardinality' => '1',
                                                               'class_id' => 'S.91',
                                                               'constraint' => undef
                                                             }
                                                 }
                                               ],
                             'parent' => 'Identifiable',
                             'documentation' => 'An image is created by an imageAcquisition event, typically by scanning the hybridized array (the PhysicalBioAssay).
',
                             'methods' => [],
                             'name' => 'Image',
                             'abstract' => 'false',
                             'id' => 'S.91',
                             'package' => 'BioAssay'
                           },
                  'Zone' => {
                            'attrs' => [
                                         {
                                           'documentation' => 'row position in the ZoneGroup',
                                           'name' => 'row',
                                           'type' => 'int',
                                           'id' => 'S.26'
                                         },
                                         {
                                           'documentation' => 'column position in the ZoneGroup.',
                                           'name' => 'column',
                                           'type' => 'int',
                                           'id' => 'S.27'
                                         },
                                         {
                                           'documentation' => 'Boundary vertical upper left position relative to (0,0).',
                                           'name' => 'upperLeftX',
                                           'type' => 'float',
                                           'id' => 'S.28'
                                         },
                                         {
                                           'documentation' => 'Boundary horizontal upper left position relative to (0,0).',
                                           'name' => 'upperLeftY',
                                           'type' => 'float',
                                           'id' => 'S.29'
                                         },
                                         {
                                           'documentation' => 'Boundary vertical lower right position relative to (0,0).',
                                           'name' => 'lowerRightX',
                                           'type' => 'float',
                                           'id' => 'S.30'
                                         },
                                         {
                                           'documentation' => 'Boundary horizontal lower right position relative to (0,0).',
                                           'name' => 'lowerRightY',
                                           'type' => 'float',
                                           'id' => 'S.31'
                                         }
                                       ],
                            'associations' => [
                                                {
                                                  'other' => {
                                                               'class_name' => 'DistanceUnit',
                                                               'name' => 'distanceUnit',
                                                               'navigable' => 'true',
                                                               'ordering' => 'unordered',
                                                               'aggregation' => 'none',
                                                               'documentation' => 'Unit for the Zone attributes.',
                                                               'cardinality' => '0..1',
                                                               'class_id' => 'S.199',
                                                               'constraint' => {
                                                                                 'ordered' => 0,
                                                                                 'constraint' => 'rank: 1',
                                                                                 'rank' => '1'
                                                                               }
                                                             },
                                                  'self' => {
                                                              'class_name' => 'Zone',
                                                              'name' => undef,
                                                              'navigable' => 'false',
                                                              'ordering' => 'unordered',
                                                              'aggregation' => 'composite',
                                                              'documentation' => 'Unit for the Zone attributes.',
                                                              'cardinality' => '1',
                                                              'class_id' => 'S.25',
                                                              'constraint' => undef
                                                            }
                                                }
                                              ],
                            'parent' => 'Identifiable',
                            'documentation' => 'Specifies the location of a zone on an array.',
                            'methods' => [],
                            'name' => 'Zone',
                            'abstract' => 'false',
                            'id' => 'S.25',
                            'package' => 'ArrayDesign'
                          },
                  'NodeContents' => {
                                    'attrs' => [],
                                    'associations' => [
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'DesignElementDimension',
                                                                       'name' => 'designElementDimension',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The relevant DesignElements for this NodeContents from the BioAssayData.',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.123',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 2',
                                                                                         'rank' => '2'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'NodeContents',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'aggregate',
                                                                      'documentation' => 'The relevant DesignElements for this NodeContents from the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.84',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'QuantitationTypeDimension',
                                                                       'name' => 'quantitationDimension',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The relevant QuantitationTypes for this NodeContents from the BioAssayData.',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.121',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 3',
                                                                                         'rank' => '3'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'NodeContents',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'aggregate',
                                                                      'documentation' => 'The relevant QuantitationTypes for this NodeContents from the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.84',
                                                                      'constraint' => undef
                                                                    }
                                                        },
                                                        {
                                                          'other' => {
                                                                       'class_name' => 'BioAssayDimension',
                                                                       'name' => 'bioAssayDimension',
                                                                       'navigable' => 'true',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The relevant BioAssays for this NodeContents from the BioAssayData.',
                                                                       'cardinality' => '0..1',
                                                                       'class_id' => 'S.135',
                                                                       'constraint' => {
                                                                                         'ordered' => 0,
                                                                                         'constraint' => 'rank: 1',
                                                                                         'rank' => '1'
                                                                                       }
                                                                     },
                                                          'self' => {
                                                                      'class_name' => 'NodeContents',
                                                                      'name' => undef,
                                                                      'navigable' => 'false',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'aggregate',
                                                                      'documentation' => 'The relevant BioAssays for this NodeContents from the BioAssayData.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.84',
                                                                      'constraint' => undef
                                                                    }
                                                        }
                                                      ],
                                    'parent' => 'Describable',
                                    'documentation' => 'The contents of a node for any or all of the three Dimensions.  If a node only contained genes just the DesignElementDimension would be defined.',
                                    'methods' => [],
                                    'name' => 'NodeContents',
                                    'abstract' => 'false',
                                    'id' => 'S.84',
                                    'package' => 'HigherLevelAnalysis'
                                  },
                  'Reporter' => {
                                'attrs' => [],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'OntologyEntry',
                                                                   'name' => 'failTypes',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'If at some time the reporter is determined to be failed this indicts the failure (doesn\'t report on what it was intended to report on, etc.)',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.185',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 3',
                                                                                     'rank' => '3'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Reporter',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'If at some time the reporter is determined to be failed this indicts the failure (doesn\'t report on what it was intended to report on, etc.)',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.258',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'OntologyEntry',
                                                                   'name' => 'warningType',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Similar to failType but indicates a warning rather than a failure.',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.185',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Reporter',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'Similar to failType but indicates a warning rather than a failure.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.258',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'BioSequence',
                                                                   'name' => 'immobilizedCharacteristics',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The sequence annotation on the BioMaterial this reporter represents.  Typically the sequences will be an Oligo Sequence, Clone or PCR Primer.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.231',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Reporter',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'The sequence annotation on the BioMaterial this reporter represents.  Typically the sequences will be an Oligo Sequence, Clone or PCR Primer.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.258',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'FeatureReporterMap',
                                                                   'name' => 'featureReporterMaps',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Associates features with their reporter.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.269',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 4',
                                                                                     'rank' => '4'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Reporter',
                                                                  'name' => 'reporter',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Associates features with their reporter.',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.258',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 1',
                                                                                    'rank' => '1'
                                                                                  }
                                                                }
                                                    }
                                                  ],
                                'parent' => 'DesignElement',
                                'documentation' => 'A Design Element that represents some biological material (clone, oligo, etc.) on an array which will report on some biosequence or biosequences.  The derived data from the measured data of its Features represents the presence or absence of the biosequence or biosequences it is reporting on in the BioAssay.

Reporters are Identifiable and several Features on the same array can be mapped to the same reporter as can Features from a different ArrayDesign.  The granularity of the Reporters independence is dependent on the technology and the intent of the ArrayDesign.  Oligos using mature technologies can in general be assumed to be safely replicated on many features where as with PCR Products there might be the desire for quality assurence to make reporters one to one with features and use the mappings to CompositeSequences for replication purposes.',
                                'methods' => [],
                                'name' => 'Reporter',
                                'abstract' => 'false',
                                'id' => 'S.258',
                                'package' => 'DesignElement'
                              },
                  'FeatureDimension' => {
                                        'attrs' => [],
                                        'associations' => [
                                                            {
                                                              'other' => {
                                                                           'class_name' => 'Feature',
                                                                           'name' => 'containedFeatures',
                                                                           'navigable' => 'true',
                                                                           'ordering' => 'unordered',
                                                                           'aggregation' => 'none',
                                                                           'documentation' => 'The features for this dimension.',
                                                                           'cardinality' => '0..N',
                                                                           'class_id' => 'S.262',
                                                                           'constraint' => {
                                                                                             'ordered' => 1,
                                                                                             'constraint' => 'ordered rank: 1',
                                                                                             'rank' => '1'
                                                                                           }
                                                                         },
                                                              'self' => {
                                                                          'class_name' => 'FeatureDimension',
                                                                          'name' => undef,
                                                                          'navigable' => 'false',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The features for this dimension.',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.142',
                                                                          'constraint' => undef
                                                                        }
                                                            }
                                                          ],
                                        'parent' => 'DesignElementDimension',
                                        'documentation' => 'Specialized DesignElementDimension to hold Features.',
                                        'methods' => [],
                                        'name' => 'FeatureDimension',
                                        'abstract' => 'false',
                                        'id' => 'S.142',
                                        'package' => 'BioAssayData'
                                      },
                  'Describable' => {
                                   'subclasses' => [
                                                     'Audit',
                                                     'SeqFeature',
                                                     'Node',
                                                     'ParameterizableApplication',
                                                     'Identifiable',
                                                     'ExperimentDesign',
                                                     'ManufactureLIMS',
                                                     'BibliographicReference',
                                                     'Fiducial',
                                                     'NodeContents',
                                                     'Description'
                                                   ],
                                   'attrs' => [],
                                   'parent' => 'Extendable',
                                   'name' => 'Describable',
                                   'package' => 'MAGE',
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'Security',
                                                                      'name' => 'security',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Information on the security for the instance of the class.',
                                                                      'cardinality' => '0..1',
                                                                      'class_id' => 'S.106',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 3',
                                                                                        'rank' => '3'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Describable',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Information on the security for the instance of the class.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.1',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'Audit',
                                                                      'name' => 'auditTrail',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'A list of Audit instances that track changes to the instance of Describable.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.107',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 2',
                                                                                        'rank' => '2'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Describable',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'A list of Audit instances that track changes to the instance of Describable.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.1',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'Description',
                                                                      'name' => 'descriptions',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Free hand text descriptions.  Makes available the associations of Description to an instance of Describable.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.170',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Describable',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Free hand text descriptions.  Makes available the associations of Description to an instance of Describable.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.1',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'methods' => [],
                                   'documentation' => 'Abstract class that allows subclasses to inherit the association to Description, for detailed annotations such as Ontology entries and Database references, the association to Audit, for tracking changes, and the association to Security for indicating permissions.',
                                   'id' => 'S.1',
                                   'abstract' => 'true'
                                 },
                  'Protocol' => {
                                'attrs' => [
                                             {
                                               'documentation' => 'The text description of the Protocol.',
                                               'name' => 'text',
                                               'type' => 'String',
                                               'id' => 'S.150'
                                             },
                                             {
                                               'documentation' => 'The title of the Protocol',
                                               'name' => 'title',
                                               'type' => 'String',
                                               'id' => 'S.151'
                                             }
                                           ],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Software',
                                                                   'name' => 'softwares',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Software used by this Protocol.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.157',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 3',
                                                                                     'rank' => '3'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Protocol',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Software used by this Protocol.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.149',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Hardware',
                                                                   'name' => 'hardwares',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Hardware used by this protocol.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.158',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Protocol',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Hardware used by this protocol.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.149',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'OntologyEntry',
                                                                   'name' => 'type',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The type of a Protocol,  a user should provide/use a recommended vocabulary.  Examples of types include:  RNA extraction, array washing, etc...',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.185',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Protocol',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The type of a Protocol,  a user should provide/use a recommended vocabulary.  Examples of types include:  RNA extraction, array washing, etc...',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.149',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Parameterizable',
                                'documentation' => 'A Protocol is a parameterizable description of a method.  ProtocolApplication is used to specify the ParameterValues of it\'s Protocol\'s Parameters.',
                                'methods' => [],
                                'name' => 'Protocol',
                                'abstract' => 'false',
                                'id' => 'S.149',
                                'package' => 'Protocol'
                              },
                  'Contact' => {
                               'subclasses' => [
                                                 'Organization',
                                                 'Person'
                                               ],
                               'attrs' => [
                                            {
                                              'name' => 'URI',
                                              'type' => 'String',
                                              'id' => 'S.113'
                                            },
                                            {
                                              'name' => 'address',
                                              'type' => 'String',
                                              'id' => 'S.114'
                                            },
                                            {
                                              'name' => 'phone',
                                              'type' => 'String',
                                              'id' => 'S.115'
                                            },
                                            {
                                              'name' => 'tollFreePhone',
                                              'type' => 'String',
                                              'id' => 'S.116'
                                            },
                                            {
                                              'name' => 'email',
                                              'type' => 'String',
                                              'id' => 'S.117'
                                            },
                                            {
                                              'name' => 'fax',
                                              'type' => 'String',
                                              'id' => 'S.118'
                                            }
                                          ],
                               'parent' => 'Identifiable',
                               'name' => 'Contact',
                               'package' => 'AuditAndSecurity',
                               'associations' => [
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'OntologyEntry',
                                                                  'name' => 'roles',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'The roles (lab equipment sales, contractor, etc.) the contact fills.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.185',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 1',
                                                                                    'rank' => '1'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Contact',
                                                                 'name' => undef,
                                                                 'navigable' => 'false',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'composite',
                                                                 'documentation' => 'The roles (lab equipment sales, contractor, etc.) the contact fills.',
                                                                 'cardinality' => '1',
                                                                 'class_id' => 'S.112',
                                                                 'constraint' => undef
                                                               }
                                                   }
                                                 ],
                               'methods' => [],
                               'documentation' => 'A contact is either a person or an organization.',
                               'id' => 'S.112',
                               'abstract' => 'true'
                             },
                  'ExpectedValue' => {
                                     'attrs' => [],
                                     'associations' => [],
                                     'parent' => 'ConfidenceIndicator',
                                     'documentation' => 'Indication of what value is expected of the associated standard quantitation type.',
                                     'methods' => [],
                                     'name' => 'ExpectedValue',
                                     'abstract' => 'false',
                                     'id' => 'S.248',
                                     'package' => 'QuantitationType'
                                   },
                  'CompoundMeasurement' => {
                                           'attrs' => [],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Compound',
                                                                              'name' => 'compound',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'A Compound to be used to create another Compound.',
                                                                              'cardinality' => '1',
                                                                              'class_id' => 'S.75',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'CompoundMeasurement',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'A Compound to be used to create another Compound.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.77',
                                                                             'constraint' => undef
                                                                           }
                                                               },
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Measurement',
                                                                              'name' => 'measurement',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The amount of the Compound.',
                                                                              'cardinality' => '0..1',
                                                                              'class_id' => 'S.190',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 2',
                                                                                                'rank' => '2'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'CompoundMeasurement',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'composite',
                                                                             'documentation' => 'The amount of the Compound.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.77',
                                                                             'constraint' => undef
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'Extendable',
                                           'documentation' => 'A CompoundMeasurement is a pairing of a source Compound and an amount (Measurement) of that Compound.',
                                           'methods' => [],
                                           'name' => 'CompoundMeasurement',
                                           'abstract' => 'false',
                                           'id' => 'S.77',
                                           'package' => 'BioMaterial'
                                         },
                  'MassUnit' => {
                                'attrs' => [
                                             {
                                               'name' => 'unitNameCV',
                                               'type' => 'enum {kg,g,mg,ug,ng,pg,fg,other}',
                                               'id' => 'S.206'
                                             }
                                           ],
                                'associations' => [],
                                'parent' => 'Unit',
                                'documentation' => 'Mass',
                                'methods' => [],
                                'name' => 'MassUnit',
                                'abstract' => 'false',
                                'id' => 'S.205',
                                'package' => 'Measurement'
                              },
                  'FactorValue' => {
                                   'attrs' => [],
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'ExperimentalFactor',
                                                                      'name' => 'experimentalFactor',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'composite',
                                                                      'documentation' => 'The pairing of BioAssay FactorValues with the ExperimentDesign ExperimentFactor.',
                                                                      'cardinality' => '1',
                                                                      'class_id' => 'S.146',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'FactorValue',
                                                                     'name' => 'factorValues',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The pairing of BioAssay FactorValues with the ExperimentDesign ExperimentFactor.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.147',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 2',
                                                                                       'rank' => '2'
                                                                                     }
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'Measurement',
                                                                      'name' => 'measurement',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The measured value for this factor.',
                                                                      'cardinality' => '0..1',
                                                                      'class_id' => 'S.190',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'FactorValue',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'The measured value for this factor.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.147',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'value',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Allows a more complex value to be specified for a FactorValue than a simple Measurement.',
                                                                      'cardinality' => '0..1',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'FactorValue',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Allows a more complex value to be specified for a FactorValue than a simple Measurement.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.147',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'parent' => 'Identifiable',
                                   'documentation' => 'The value for a ExperimentalFactor',
                                   'methods' => [],
                                   'name' => 'FactorValue',
                                   'abstract' => 'false',
                                   'id' => 'S.147',
                                   'package' => 'Experiment'
                                 },
                  'ZoneDefect' => {
                                  'attrs' => [],
                                  'associations' => [
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'Zone',
                                                                     'name' => 'zone',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Reference to the Zone that was misprinted.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.25',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 3',
                                                                                       'rank' => '3'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ZoneDefect',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'Reference to the Zone that was misprinted.',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.69',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'PositionDelta',
                                                                     'name' => 'positionDelta',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'How the zone deviates in position from the ArrayDesign.',
                                                                     'cardinality' => '0..1',
                                                                     'class_id' => 'S.66',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 2',
                                                                                       'rank' => '2'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ZoneDefect',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'How the zone deviates in position from the ArrayDesign.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.69',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'OntologyEntry',
                                                                     'name' => 'defectType',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Indicates the type of defect (e.g. a missing zone or a moved zone).',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.185',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 1',
                                                                                       'rank' => '1'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ZoneDefect',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'Indicates the type of defect (e.g. a missing zone or a moved zone).',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.69',
                                                                    'constraint' => undef
                                                                  }
                                                      }
                                                    ],
                                  'parent' => 'Extendable',
                                  'documentation' => 'Stores the defect information for a zone.',
                                  'methods' => [],
                                  'name' => 'ZoneDefect',
                                  'abstract' => 'false',
                                  'id' => 'S.69',
                                  'package' => 'Array'
                                },
                  'VolumeUnit' => {
                                  'attrs' => [
                                               {
                                                 'name' => 'unitNameCV',
                                                 'type' => 'enum {mL,cc,dL,L,uL,nL,pL,fL,other}',
                                                 'id' => 'S.208'
                                               }
                                             ],
                                  'associations' => [],
                                  'parent' => 'Unit',
                                  'documentation' => 'Volume',
                                  'methods' => [],
                                  'name' => 'VolumeUnit',
                                  'abstract' => 'false',
                                  'id' => 'S.207',
                                  'package' => 'Measurement'
                                },
                  'DesignElementGroup' => {
                                          'subclasses' => [
                                                            'CompositeGroup',
                                                            'ReporterGroup',
                                                            'FeatureGroup'
                                                          ],
                                          'attrs' => [],
                                          'parent' => 'Identifiable',
                                          'name' => 'DesignElementGroup',
                                          'package' => 'ArrayDesign',
                                          'associations' => [
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'OntologyEntry',
                                                                             'name' => 'species',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The organism from which the biosequences of this group are from.',
                                                                             'cardinality' => '0..1',
                                                                             'class_id' => 'S.185',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 2',
                                                                                               'rank' => '2'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'DesignElementGroup',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'The organism from which the biosequences of this group are from.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.37',
                                                                            'constraint' => undef
                                                                          }
                                                              },
                                                              {
                                                                'other' => {
                                                                             'class_name' => 'OntologyEntry',
                                                                             'name' => 'types',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The specific type of a feature, reporter, or composite.  A composite type might be a gene while a reporter type might be a cDNA clone or an oligo.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.185',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 1',
                                                                                               'rank' => '1'
                                                                                             }
                                                                           },
                                                                'self' => {
                                                                            'class_name' => 'DesignElementGroup',
                                                                            'name' => undef,
                                                                            'navigable' => 'false',
                                                                            'ordering' => 'unordered',
                                                                            'aggregation' => 'composite',
                                                                            'documentation' => 'The specific type of a feature, reporter, or composite.  A composite type might be a gene while a reporter type might be a cDNA clone or an oligo.',
                                                                            'cardinality' => '1',
                                                                            'class_id' => 'S.37',
                                                                            'constraint' => undef
                                                                          }
                                                              }
                                                            ],
                                          'methods' => [],
                                          'documentation' => 'The DesignElementGroup holds information on either features, reporters, or compositeSequences, particularly that information that is common between all of the DesignElements contained.',
                                          'id' => 'S.37',
                                          'abstract' => 'true'
                                        },
                  'ReporterCompositeMap' => {
                                            'attrs' => [],
                                            'associations' => [
                                                                {
                                                                  'other' => {
                                                                               'class_name' => 'ReporterPosition',
                                                                               'name' => 'reporterPositionSources',
                                                                               'navigable' => 'true',
                                                                               'ordering' => 'unordered',
                                                                               'aggregation' => 'none',
                                                                               'documentation' => 'Association to the reporters that compose this CompositeSequence and where those reporters occur.',
                                                                               'cardinality' => '1..N',
                                                                               'class_id' => 'S.259',
                                                                               'constraint' => {
                                                                                                 'ordered' => 0,
                                                                                                 'constraint' => 'rank: 2',
                                                                                                 'rank' => '2'
                                                                                               }
                                                                             },
                                                                  'self' => {
                                                                              'class_name' => 'ReporterCompositeMap',
                                                                              'name' => undef,
                                                                              'navigable' => 'false',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'composite',
                                                                              'documentation' => 'Association to the reporters that compose this CompositeSequence and where those reporters occur.',
                                                                              'cardinality' => '1',
                                                                              'class_id' => 'S.270',
                                                                              'constraint' => undef
                                                                            }
                                                                },
                                                                {
                                                                  'other' => {
                                                                               'class_name' => 'CompositeSequence',
                                                                               'name' => 'compositeSequence',
                                                                               'navigable' => 'true',
                                                                               'ordering' => 'unordered',
                                                                               'aggregation' => 'none',
                                                                               'documentation' => 'A map to the reporters that compose this CompositeSequence.',
                                                                               'cardinality' => '1',
                                                                               'class_id' => 'S.261',
                                                                               'constraint' => {
                                                                                                 'ordered' => 0,
                                                                                                 'constraint' => 'rank: 1',
                                                                                                 'rank' => '1'
                                                                                               }
                                                                             },
                                                                  'self' => {
                                                                              'class_name' => 'ReporterCompositeMap',
                                                                              'name' => 'reporterCompositeMaps',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'A map to the reporters that compose this CompositeSequence.',
                                                                              'cardinality' => '0..N',
                                                                              'class_id' => 'S.270',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 2',
                                                                                                'rank' => '2'
                                                                                              }
                                                                            }
                                                                }
                                                              ],
                                            'parent' => 'DesignElementMap',
                                            'documentation' => 'A ReporterCompositeMap is the description of how source Reporters are transformed into a target CompositeSequences.  For instance, several reporters that tile across a section of a chromosome could be mapped to a CompositeSequence.',
                                            'methods' => [],
                                            'name' => 'ReporterCompositeMap',
                                            'abstract' => 'false',
                                            'id' => 'S.270',
                                            'package' => 'DesignElement'
                                          },
                  'LabeledExtract' => {
                                      'attrs' => [],
                                      'associations' => [
                                                          {
                                                            'other' => {
                                                                         'class_name' => 'Compound',
                                                                         'name' => 'labels',
                                                                         'navigable' => 'true',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'Compound used to label the extract.',
                                                                         'cardinality' => '1..N',
                                                                         'class_id' => 'S.75',
                                                                         'constraint' => {
                                                                                           'ordered' => 0,
                                                                                           'constraint' => 'rank: 1',
                                                                                           'rank' => '1'
                                                                                         }
                                                                       },
                                                            'self' => {
                                                                        'class_name' => 'LabeledExtract',
                                                                        'name' => undef,
                                                                        'navigable' => 'false',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'Compound used to label the extract.',
                                                                        'cardinality' => '0..N',
                                                                        'class_id' => 'S.73',
                                                                        'constraint' => undef
                                                                      }
                                                          }
                                                        ],
                                      'parent' => 'BioMaterial',
                                      'documentation' => 'LabeledExtracts are special BioSamples that have Compounds which are detectable (these are often fluorescent or reactive moieties).',
                                      'methods' => [],
                                      'name' => 'LabeledExtract',
                                      'abstract' => 'false',
                                      'id' => 'S.73',
                                      'package' => 'BioMaterial'
                                    },
                  'TimeUnit' => {
                                'attrs' => [
                                             {
                                               'name' => 'unitNameCV',
                                               'type' => 'enum {years,months,weeks,d,h,m,s,us,other}',
                                               'id' => 'S.198'
                                             }
                                           ],
                                'associations' => [],
                                'parent' => 'Unit',
                                'documentation' => 'Time',
                                'methods' => [],
                                'name' => 'TimeUnit',
                                'abstract' => 'false',
                                'id' => 'S.197',
                                'package' => 'Measurement'
                              },
                  'FeatureDefect' => {
                                     'attrs' => [],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'PositionDelta',
                                                                        'name' => 'positionDelta',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'How the feature deviates in position from the ArrayDesign.',
                                                                        'cardinality' => '0..1',
                                                                        'class_id' => 'S.66',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 2',
                                                                                          'rank' => '2'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'FeatureDefect',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'How the feature deviates in position from the ArrayDesign.',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.45',
                                                                       'constraint' => undef
                                                                     }
                                                         },
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'Feature',
                                                                        'name' => 'feature',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'The feature that was manufactured defectively.',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.262',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 3',
                                                                                          'rank' => '3'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'FeatureDefect',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'none',
                                                                       'documentation' => 'The feature that was manufactured defectively.',
                                                                       'cardinality' => '0..N',
                                                                       'class_id' => 'S.45',
                                                                       'constraint' => undef
                                                                     }
                                                         },
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'OntologyEntry',
                                                                        'name' => 'defectType',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'Indicates the type of defect (e.g. a missing feature or a moved feature).',
                                                                        'cardinality' => '1',
                                                                        'class_id' => 'S.185',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'FeatureDefect',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'Indicates the type of defect (e.g. a missing feature or a moved feature).',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.45',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => 'Extendable',
                                     'documentation' => 'Stores the defect information for a feature.',
                                     'methods' => [],
                                     'name' => 'FeatureDefect',
                                     'abstract' => 'false',
                                     'id' => 'S.45',
                                     'package' => 'Array'
                                   },
                  'QuantityUnit' => {
                                    'attrs' => [
                                                 {
                                                   'name' => 'unitNameCV',
                                                   'type' => 'enum {mol,amol,fmol,pmol,nmol,umol,mmol,molecules,other}',
                                                   'id' => 'S.204'
                                                 }
                                               ],
                                    'associations' => [],
                                    'parent' => 'Unit',
                                    'documentation' => 'Quantity',
                                    'methods' => [],
                                    'name' => 'QuantityUnit',
                                    'abstract' => 'false',
                                    'id' => 'S.203',
                                    'package' => 'Measurement'
                                  },
                  'BioAssayMapping' => {
                                       'attrs' => [],
                                       'associations' => [
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'BioAssayMap',
                                                                          'name' => 'bioAssayMaps',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The maps for the BioAssays.',
                                                                          'cardinality' => '1..N',
                                                                          'class_id' => 'S.139',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 1',
                                                                                            'rank' => '1'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'BioAssayMapping',
                                                                         'name' => undef,
                                                                         'navigable' => 'false',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'none',
                                                                         'documentation' => 'The maps for the BioAssays.',
                                                                         'cardinality' => '0..N',
                                                                         'class_id' => 'S.122',
                                                                         'constraint' => undef
                                                                       }
                                                           }
                                                         ],
                                       'parent' => 'Extendable',
                                       'documentation' => 'Container of the mappings of the input BioAssay dimensions to the output BioAssay dimension.',
                                       'methods' => [],
                                       'name' => 'BioAssayMapping',
                                       'abstract' => 'false',
                                       'id' => 'S.122',
                                       'package' => 'BioAssayData'
                                     },
                  'ZoneGroup' => {
                                 'attrs' => [
                                              {
                                                'documentation' => 'Spacing between zones, if applicable.',
                                                'name' => 'spacingsBetweenZonesX',
                                                'type' => 'float',
                                                'id' => 'S.21'
                                              },
                                              {
                                                'documentation' => 'Spacing between zones, if applicable.',
                                                'name' => 'spacingsBetweenZonesY',
                                                'type' => 'float',
                                                'id' => 'S.22'
                                              },
                                              {
                                                'documentation' => 'The number of zones on the x-axis.',
                                                'name' => 'zonesPerX',
                                                'type' => 'int',
                                                'id' => 'S.23'
                                              },
                                              {
                                                'documentation' => 'The number of zones on the y-axis.',
                                                'name' => 'zonesPerY',
                                                'type' => 'int',
                                                'id' => 'S.24'
                                              }
                                            ],
                                 'associations' => [
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'ZoneLayout',
                                                                    'name' => 'zoneLayout',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'Describes the rectangular layout of features in the array design. ',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.15',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 2',
                                                                                      'rank' => '2'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'ZoneGroup',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'Describes the rectangular layout of features in the array design. ',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.20',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'Zone',
                                                                    'name' => 'zoneLocations',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'Describes the location of different zones within the array design.',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.25',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 3',
                                                                                      'rank' => '3'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'ZoneGroup',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'Describes the location of different zones within the array design.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.20',
                                                                   'constraint' => undef
                                                                 }
                                                     },
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'DistanceUnit',
                                                                    'name' => 'distanceUnit',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'Unit for the ZoneGroup attributes.',
                                                                    'cardinality' => '0..1',
                                                                    'class_id' => 'S.199',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 1',
                                                                                      'rank' => '1'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'ZoneGroup',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'Unit for the ZoneGroup attributes.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.20',
                                                                   'constraint' => undef
                                                                 }
                                                     }
                                                   ],
                                 'parent' => 'Extendable',
                                 'documentation' => 'Specifies a repeating area on an array.  This is useful for printing when the same pattern is repeated in a regular fashion.',
                                 'methods' => [],
                                 'name' => 'ZoneGroup',
                                 'abstract' => 'false',
                                 'id' => 'S.20',
                                 'package' => 'ArrayDesign'
                               },
                  'BioAssayDataCluster' => {
                                           'attrs' => [],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'Node',
                                                                              'name' => 'nodes',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The nodes of the cluster.',
                                                                              'cardinality' => '1..N',
                                                                              'class_id' => 'S.83',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 2',
                                                                                                'rank' => '2'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'BioAssayDataCluster',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'composite',
                                                                             'documentation' => 'The nodes of the cluster.',
                                                                             'cardinality' => '1',
                                                                             'class_id' => 'S.82',
                                                                             'constraint' => undef
                                                                           }
                                                               },
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'BioAssayData',
                                                                              'name' => 'clusterBioAssayData',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The BioAssayData whose values were used by the cluster algorithm.',
                                                                              'cardinality' => '0..1',
                                                                              'class_id' => 'S.120',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'BioAssayDataCluster',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The BioAssayData whose values were used by the cluster algorithm.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.82',
                                                                             'constraint' => undef
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'Identifiable',
                                           'documentation' => 'A mathematical method of higher level analysis whereby BioAssayData are grouped together into nodes.',
                                           'methods' => [],
                                           'name' => 'BioAssayDataCluster',
                                           'abstract' => 'false',
                                           'id' => 'S.82',
                                           'package' => 'HigherLevelAnalysis'
                                         },
                  'DesignElementMapping' => {
                                            'attrs' => [],
                                            'associations' => [
                                                                {
                                                                  'other' => {
                                                                               'class_name' => 'DesignElementMap',
                                                                               'name' => 'designElementMaps',
                                                                               'navigable' => 'true',
                                                                               'ordering' => 'unordered',
                                                                               'aggregation' => 'none',
                                                                               'documentation' => 'The maps for the DesignElements.',
                                                                               'cardinality' => '1..N',
                                                                               'class_id' => 'S.138',
                                                                               'constraint' => {
                                                                                                 'ordered' => 0,
                                                                                                 'constraint' => 'rank: 1',
                                                                                                 'rank' => '1'
                                                                                               }
                                                                             },
                                                                  'self' => {
                                                                              'class_name' => 'DesignElementMapping',
                                                                              'name' => undef,
                                                                              'navigable' => 'false',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The maps for the DesignElements.',
                                                                              'cardinality' => '0..N',
                                                                              'class_id' => 'S.129',
                                                                              'constraint' => undef
                                                                            }
                                                                }
                                                              ],
                                            'parent' => 'Extendable',
                                            'documentation' => 'Container of the mappings of the input DesignElement dimensions to the output DesignElement dimension.',
                                            'methods' => [],
                                            'name' => 'DesignElementMapping',
                                            'abstract' => 'false',
                                            'id' => 'S.129',
                                            'package' => 'BioAssayData'
                                          },
                  'DesignElementMap' => {
                                        'subclasses' => [
                                                          'CompositeCompositeMap',
                                                          'ReporterCompositeMap',
                                                          'FeatureReporterMap'
                                                        ],
                                        'attrs' => [],
                                        'parent' => 'Map',
                                        'name' => 'DesignElementMap',
                                        'package' => 'BioAssayData',
                                        'associations' => [],
                                        'methods' => [],
                                        'documentation' => 'A DesignElementMap is the description of how source DesignElements are transformed into a target DesignElement.',
                                        'id' => 'S.138',
                                        'abstract' => 'true'
                                      },
                  'BioDataValues' => {
                                     'subclasses' => [
                                                       'BioDataTuples',
                                                       'BioDataCube'
                                                     ],
                                     'attrs' => [],
                                     'parent' => 'Extendable',
                                     'name' => 'BioDataValues',
                                     'package' => 'BioAssayData',
                                     'associations' => [],
                                     'methods' => [],
                                     'documentation' => 'The actual values for the BioAssayCube. ',
                                     'id' => 'S.133',
                                     'abstract' => 'true'
                                   },
                  'Parameterizable' => {
                                       'subclasses' => [
                                                         'Protocol',
                                                         'Hardware',
                                                         'Software'
                                                       ],
                                       'attrs' => [
                                                    {
                                                      'documentation' => 'Where an instantiated Parameterizable is located.',
                                                      'name' => 'URI',
                                                      'type' => 'String',
                                                      'id' => 'S.167'
                                                    }
                                                  ],
                                       'parent' => 'Identifiable',
                                       'name' => 'Parameterizable',
                                       'package' => 'Protocol',
                                       'associations' => [
                                                           {
                                                             'other' => {
                                                                          'class_name' => 'Parameter',
                                                                          'name' => 'parameterTypes',
                                                                          'navigable' => 'true',
                                                                          'ordering' => 'unordered',
                                                                          'aggregation' => 'none',
                                                                          'documentation' => 'The description of the parameters for the Parameterizable class instance.',
                                                                          'cardinality' => '0..N',
                                                                          'class_id' => 'S.152',
                                                                          'constraint' => {
                                                                                            'ordered' => 0,
                                                                                            'constraint' => 'rank: 1',
                                                                                            'rank' => '1'
                                                                                          }
                                                                        },
                                                             'self' => {
                                                                         'class_name' => 'Parameterizable',
                                                                         'name' => undef,
                                                                         'navigable' => 'false',
                                                                         'ordering' => 'unordered',
                                                                         'aggregation' => 'composite',
                                                                         'documentation' => 'The description of the parameters for the Parameterizable class instance.',
                                                                         'cardinality' => '1',
                                                                         'class_id' => 'S.166',
                                                                         'constraint' => undef
                                                                       }
                                                           }
                                                         ],
                                       'methods' => [],
                                       'documentation' => 'The Parameterizable interface encapsulates the association of Parameters with ParameterValues.',
                                       'id' => 'S.166',
                                       'abstract' => 'true'
                                     },
                  'QuantitationTypeMap' => {
                                           'attrs' => [],
                                           'associations' => [
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'QuantitationType',
                                                                              'name' => 'targetQuantitationType',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The QuantitationType whose value will be produced from the values of the source QuantitationType according to the Protocol.',
                                                                              'cardinality' => '1',
                                                                              'class_id' => 'S.241',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 1',
                                                                                                'rank' => '1'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'QuantitationTypeMap',
                                                                             'name' => 'quantitationTypeMaps',
                                                                             'navigable' => 'true',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The QuantitationType whose value will be produced from the values of the source QuantitationType according to the Protocol.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.136',
                                                                             'constraint' => {
                                                                                               'ordered' => 0,
                                                                                               'constraint' => 'rank: 5',
                                                                                               'rank' => '5'
                                                                                             }
                                                                           }
                                                               },
                                                               {
                                                                 'other' => {
                                                                              'class_name' => 'QuantitationType',
                                                                              'name' => 'sourcesQuantitationType',
                                                                              'navigable' => 'true',
                                                                              'ordering' => 'unordered',
                                                                              'aggregation' => 'none',
                                                                              'documentation' => 'The QuantitationType sources for values for the transformation.',
                                                                              'cardinality' => '0..N',
                                                                              'class_id' => 'S.241',
                                                                              'constraint' => {
                                                                                                'ordered' => 0,
                                                                                                'constraint' => 'rank: 2',
                                                                                                'rank' => '2'
                                                                                              }
                                                                            },
                                                                 'self' => {
                                                                             'class_name' => 'QuantitationTypeMap',
                                                                             'name' => undef,
                                                                             'navigable' => 'false',
                                                                             'ordering' => 'unordered',
                                                                             'aggregation' => 'none',
                                                                             'documentation' => 'The QuantitationType sources for values for the transformation.',
                                                                             'cardinality' => '0..N',
                                                                             'class_id' => 'S.136',
                                                                             'constraint' => undef
                                                                           }
                                                               }
                                                             ],
                                           'parent' => 'Map',
                                           'documentation' => 'A QuantitationTypeMap is the description of how source QuantitationTypes are mathematically transformed into a target QuantitationType.',
                                           'methods' => [],
                                           'name' => 'QuantitationTypeMap',
                                           'abstract' => 'false',
                                           'id' => 'S.136',
                                           'package' => 'BioAssayData'
                                         },
                  'Person' => {
                              'attrs' => [
                                           {
                                             'name' => 'lastName',
                                             'type' => 'String',
                                             'id' => 'S.103'
                                           },
                                           {
                                             'name' => 'firstName',
                                             'type' => 'String',
                                             'id' => 'S.104'
                                           },
                                           {
                                             'name' => 'midInitials',
                                             'type' => 'String',
                                             'id' => 'S.105'
                                           }
                                         ],
                              'associations' => [
                                                  {
                                                    'other' => {
                                                                 'class_name' => 'Organization',
                                                                 'name' => 'affiliation',
                                                                 'navigable' => 'true',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'none',
                                                                 'documentation' => 'The organization a person belongs to.',
                                                                 'cardinality' => '0..1',
                                                                 'class_id' => 'S.110',
                                                                 'constraint' => {
                                                                                   'ordered' => 0,
                                                                                   'constraint' => 'rank: 1',
                                                                                   'rank' => '1'
                                                                                 }
                                                               },
                                                    'self' => {
                                                                'class_name' => 'Person',
                                                                'name' => undef,
                                                                'navigable' => 'false',
                                                                'ordering' => 'unordered',
                                                                'aggregation' => 'none',
                                                                'documentation' => 'The organization a person belongs to.',
                                                                'cardinality' => '0..N',
                                                                'class_id' => 'S.102',
                                                                'constraint' => undef
                                                              }
                                                  }
                                                ],
                              'parent' => 'Contact',
                              'documentation' => 'A person for which the attributes are self describing.',
                              'methods' => [],
                              'name' => 'Person',
                              'abstract' => 'false',
                              'id' => 'S.102',
                              'package' => 'AuditAndSecurity'
                            },
                  'ZoneLayout' => {
                                  'attrs' => [
                                               {
                                                 'documentation' => 'The number of features from left to right.',
                                                 'name' => 'numFeaturesPerRow',
                                                 'type' => 'int',
                                                 'id' => 'S.16'
                                               },
                                               {
                                                 'documentation' => 'The number of features from top to bottom of the grid.',
                                                 'name' => 'numFeaturesPerCol',
                                                 'type' => 'int',
                                                 'id' => 'S.17'
                                               },
                                               {
                                                 'documentation' => 'Spacing between the rows.',
                                                 'name' => 'spacingBetweenRows',
                                                 'type' => 'float',
                                                 'id' => 'S.18'
                                               },
                                               {
                                                 'documentation' => 'Spacing between the columns.',
                                                 'name' => 'spacingBetweenCols',
                                                 'type' => 'float',
                                                 'id' => 'S.19'
                                               }
                                             ],
                                  'associations' => [
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'DistanceUnit',
                                                                     'name' => 'distanceUnit',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'Unit of the ZoneLayout attributes.',
                                                                     'cardinality' => '0..1',
                                                                     'class_id' => 'S.199',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 1',
                                                                                       'rank' => '1'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'ZoneLayout',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'Unit of the ZoneLayout attributes.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.15',
                                                                    'constraint' => undef
                                                                  }
                                                      }
                                                    ],
                                  'parent' => 'Extendable',
                                  'documentation' => 'Specifies the layout of features in a rectangular grid.',
                                  'methods' => [],
                                  'name' => 'ZoneLayout',
                                  'abstract' => 'false',
                                  'id' => 'S.15',
                                  'package' => 'ArrayDesign'
                                },
                  'ParameterizableApplication' => {
                                                  'subclasses' => [
                                                                    'HardwareApplication',
                                                                    'ProtocolApplication',
                                                                    'SoftwareApplication'
                                                                  ],
                                                  'attrs' => [],
                                                  'parent' => 'Describable',
                                                  'name' => 'ParameterizableApplication',
                                                  'package' => 'Protocol',
                                                  'associations' => [
                                                                      {
                                                                        'other' => {
                                                                                     'class_name' => 'ParameterValue',
                                                                                     'name' => 'parameterValues',
                                                                                     'navigable' => 'true',
                                                                                     'ordering' => 'unordered',
                                                                                     'aggregation' => 'none',
                                                                                     'documentation' => 'The parameter values for this Parameterizable Application.',
                                                                                     'cardinality' => '0..N',
                                                                                     'class_id' => 'S.153',
                                                                                     'constraint' => {
                                                                                                       'ordered' => 0,
                                                                                                       'constraint' => 'rank: 1',
                                                                                                       'rank' => '1'
                                                                                                     }
                                                                                   },
                                                                        'self' => {
                                                                                    'class_name' => 'ParameterizableApplication',
                                                                                    'name' => undef,
                                                                                    'navigable' => 'false',
                                                                                    'ordering' => 'unordered',
                                                                                    'aggregation' => 'composite',
                                                                                    'documentation' => 'The parameter values for this Parameterizable Application.',
                                                                                    'cardinality' => '1',
                                                                                    'class_id' => 'S.168',
                                                                                    'constraint' => undef
                                                                                  }
                                                                      }
                                                                    ],
                                                  'methods' => [],
                                                  'documentation' => 'The interface that is the use of a Parameterizable class.',
                                                  'id' => 'S.168',
                                                  'abstract' => 'true'
                                                },
                  'BioDataCube' => {
                                   'attrs' => [
                                                {
                                                  'documentation' => 'Three dimension array, indexed by the three dimensions to provide the data for the BioAssayData.',
                                                  'name' => 'cube',
                                                  'type' => 'any[][][]',
                                                  'id' => 'S.131'
                                                },
                                                {
                                                  'documentation' => 'The order to expect the dimension.  The enumeration uses the first letter of the three dimensions to represent the six possible orderings.',
                                                  'name' => 'order',
                                                  'type' => 'enum {BDQ,BQD,DBQ,DQB,QBD,QDB}',
                                                  'id' => 'S.132'
                                                }
                                              ],
                                   'associations' => [],
                                   'parent' => 'BioDataValues',
                                   'documentation' => 'A three-dimensional cube representation of the data.',
                                   'methods' => [],
                                   'name' => 'BioDataCube',
                                   'abstract' => 'false',
                                   'id' => 'S.130',
                                   'package' => 'BioAssayData'
                                 },
                  'Channel' => {
                               'attrs' => [],
                               'associations' => [
                                                   {
                                                     'other' => {
                                                                  'class_name' => 'Compound',
                                                                  'name' => 'labels',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'The compound used to label the extract.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.75',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 1',
                                                                                    'rank' => '1'
                                                                                  }
                                                                },
                                                     'self' => {
                                                                 'class_name' => 'Channel',
                                                                 'name' => undef,
                                                                 'navigable' => 'false',
                                                                 'ordering' => 'unordered',
                                                                 'aggregation' => 'none',
                                                                 'documentation' => 'The compound used to label the extract.',
                                                                 'cardinality' => '0..N',
                                                                 'class_id' => 'S.94',
                                                                 'constraint' => undef
                                                               }
                                                   }
                                                 ],
                               'parent' => 'Identifiable',
                               'documentation' => 'A channel represents an independent acquisition scheme for the ImageAcquisition event, typically a wavelength.',
                               'methods' => [],
                               'name' => 'Channel',
                               'abstract' => 'false',
                               'id' => 'S.94',
                               'package' => 'BioAssay'
                             },
                  'MeasuredSignal' => {
                                      'attrs' => [],
                                      'associations' => [],
                                      'parent' => 'StandardQuantitationType',
                                      'documentation' => 'Best measure from feature extraction as to the presence and intensity of the signal.  Of type float.',
                                      'methods' => [],
                                      'name' => 'MeasuredSignal',
                                      'abstract' => 'false',
                                      'id' => 'S.245',
                                      'package' => 'QuantitationType'
                                    },
                  'ManufactureLIMSBiomaterial' => {
                                                  'attrs' => [
                                                               {
                                                                 'documentation' => 'The plate from which a biomaterial was obtained.',
                                                                 'name' => 'bioMaterialPlateIdentifier',
                                                                 'type' => 'String',
                                                                 'id' => 'S.63'
                                                               },
                                                               {
                                                                 'documentation' => 'The plate row from which a biomaterial was obtained.  Specified by a letter.',
                                                                 'name' => 'bioMaterialPlateRow',
                                                                 'type' => 'String',
                                                                 'id' => 'S.64'
                                                               },
                                                               {
                                                                 'documentation' => 'The plate column from which a biomaterial was obtained.  Specified by a number.',
                                                                 'name' => 'bioMaterialPlateCol',
                                                                 'type' => 'String',
                                                                 'id' => 'S.65'
                                                               }
                                                             ],
                                                  'associations' => [],
                                                  'parent' => 'ManufactureLIMS',
                                                  'documentation' => 'Stores the location from which a biomaterial was obtained.',
                                                  'methods' => [],
                                                  'name' => 'ManufactureLIMSBiomaterial',
                                                  'abstract' => 'false',
                                                  'id' => 'S.62',
                                                  'package' => 'Array'
                                                },
                  'BioSample' => {
                                 'attrs' => [],
                                 'associations' => [
                                                     {
                                                       'other' => {
                                                                    'class_name' => 'OntologyEntry',
                                                                    'name' => 'type',
                                                                    'navigable' => 'true',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The Type attribute describes the role the BioSample holds in the treatment hierarchy.  This type can be an extract.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.185',
                                                                    'constraint' => {
                                                                                      'ordered' => 0,
                                                                                      'constraint' => 'rank: 1',
                                                                                      'rank' => '1'
                                                                                    }
                                                                  },
                                                       'self' => {
                                                                   'class_name' => 'BioSample',
                                                                   'name' => undef,
                                                                   'navigable' => 'false',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'composite',
                                                                   'documentation' => 'The Type attribute describes the role the BioSample holds in the treatment hierarchy.  This type can be an extract.',
                                                                   'cardinality' => '1',
                                                                   'class_id' => 'S.74',
                                                                   'constraint' => undef
                                                                 }
                                                     }
                                                   ],
                                 'parent' => 'BioMaterial',
                                 'documentation' => 'BioSamples are products of treatments that are of interest.  BioSamples are often used as the sources for other biosamples.  The Type attribute describes the role the BioSample holds in the treatment hierarchy.  This type can be an extract.',
                                 'methods' => [],
                                 'name' => 'BioSample',
                                 'abstract' => 'false',
                                 'id' => 'S.74',
                                 'package' => 'BioMaterial'
                               },
                  'NameValueType' => {
                                     'attrs' => [
                                                  {
                                                    'documentation' => 'The name of the key.',
                                                    'name' => 'name',
                                                    'type' => 'String',
                                                    'id' => 'S.7'
                                                  },
                                                  {
                                                    'documentation' => 'The value of the name.',
                                                    'name' => 'value',
                                                    'type' => 'String',
                                                    'id' => 'S.8'
                                                  },
                                                  {
                                                    'documentation' => 'The type of the key.',
                                                    'name' => 'type',
                                                    'type' => 'String',
                                                    'id' => 'S.9'
                                                  }
                                                ],
                                     'associations' => [
                                                         {
                                                           'other' => {
                                                                        'class_name' => 'NameValueType',
                                                                        'name' => 'propertySets',
                                                                        'navigable' => 'true',
                                                                        'ordering' => 'unordered',
                                                                        'aggregation' => 'none',
                                                                        'documentation' => 'Allows nested specification of name/value pairs',
                                                                        'cardinality' => '0..N',
                                                                        'class_id' => 'S.6',
                                                                        'constraint' => {
                                                                                          'ordered' => 0,
                                                                                          'constraint' => 'rank: 1',
                                                                                          'rank' => '1'
                                                                                        }
                                                                      },
                                                           'self' => {
                                                                       'class_name' => 'NameValueType',
                                                                       'name' => undef,
                                                                       'navigable' => 'false',
                                                                       'ordering' => 'unordered',
                                                                       'aggregation' => 'composite',
                                                                       'documentation' => 'Allows nested specification of name/value pairs',
                                                                       'cardinality' => '1',
                                                                       'class_id' => 'S.6',
                                                                       'constraint' => undef
                                                                     }
                                                         }
                                                       ],
                                     'parent' => undef,
                                     'documentation' => 'A tuple designed to store data, keyed by a name and type.',
                                     'methods' => [],
                                     'name' => 'NameValueType',
                                     'abstract' => 'false',
                                     'id' => 'S.6',
                                     'package' => 'MAGE'
                                   },
                  'TemperatureUnit' => {
                                       'attrs' => [
                                                    {
                                                      'name' => 'unitNameCV',
                                                      'type' => 'enum {degree_C,degree_F,K}',
                                                      'id' => 'S.202'
                                                    }
                                                  ],
                                       'associations' => [],
                                       'parent' => 'Unit',
                                       'documentation' => 'Temperature',
                                       'methods' => [],
                                       'name' => 'TemperatureUnit',
                                       'abstract' => 'false',
                                       'id' => 'S.201',
                                       'package' => 'Measurement'
                                     },
                  'Experiment' => {
                                  'attrs' => [],
                                  'associations' => [
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'BioAssayDataCluster',
                                                                     'name' => 'analysisResults',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The results of analyzing the data, typically with a clustering algorithm.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.82',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 2',
                                                                                       'rank' => '2'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'Experiment',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The results of analyzing the data, typically with a clustering algorithm.',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.144',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'BioAssay',
                                                                     'name' => 'bioAssays',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The collection of BioAssays for this Experiment.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.93',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 4',
                                                                                       'rank' => '4'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'Experiment',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The collection of BioAssays for this Experiment.',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.144',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'Contact',
                                                                     'name' => 'providers',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The providers of the Experiment, its data and annotation.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.112',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 1',
                                                                                       'rank' => '1'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'Experiment',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The providers of the Experiment, its data and annotation.',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.144',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'BioAssayData',
                                                                     'name' => 'bioAssayData',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The collection of BioAssayDatas for this Experiment.',
                                                                     'cardinality' => '0..N',
                                                                     'class_id' => 'S.120',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 3',
                                                                                       'rank' => '3'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'Experiment',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'none',
                                                                    'documentation' => 'The collection of BioAssayDatas for this Experiment.',
                                                                    'cardinality' => '0..N',
                                                                    'class_id' => 'S.144',
                                                                    'constraint' => undef
                                                                  }
                                                      },
                                                      {
                                                        'other' => {
                                                                     'class_name' => 'ExperimentDesign',
                                                                     'name' => 'experimentDesign',
                                                                     'navigable' => 'true',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'none',
                                                                     'documentation' => 'The association to the description and annotation of the Experiment, along with the grouping of the top-level BioAssays.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.145',
                                                                     'constraint' => {
                                                                                       'ordered' => 0,
                                                                                       'constraint' => 'rank: 5',
                                                                                       'rank' => '5'
                                                                                     }
                                                                   },
                                                        'self' => {
                                                                    'class_name' => 'Experiment',
                                                                    'name' => undef,
                                                                    'navigable' => 'false',
                                                                    'ordering' => 'unordered',
                                                                    'aggregation' => 'composite',
                                                                    'documentation' => 'The association to the description and annotation of the Experiment, along with the grouping of the top-level BioAssays.',
                                                                    'cardinality' => '1',
                                                                    'class_id' => 'S.144',
                                                                    'constraint' => undef
                                                                  }
                                                      }
                                                    ],
                                  'parent' => 'Identifiable',
                                  'documentation' => 'The Experiment is the collection of all the BioAssays that are related by the ExperimentDesign.',
                                  'methods' => [],
                                  'name' => 'Experiment',
                                  'abstract' => 'false',
                                  'id' => 'S.144',
                                  'package' => 'Experiment'
                                },
                  'Software' => {
                                'attrs' => [],
                                'associations' => [
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Contact',
                                                                   'name' => 'softwareManufacturers',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Contact for information on the software.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.112',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 4',
                                                                                     'rank' => '4'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Software',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Contact for information on the software.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.157',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Hardware',
                                                                   'name' => 'hardware',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Associates Hardware and Software together.',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.158',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 2',
                                                                                     'rank' => '2'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Software',
                                                                  'name' => 'softwares',
                                                                  'navigable' => 'true',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Associates Hardware and Software together.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.157',
                                                                  'constraint' => {
                                                                                    'ordered' => 0,
                                                                                    'constraint' => 'rank: 2',
                                                                                    'rank' => '2'
                                                                                  }
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'Software',
                                                                   'name' => 'softwares',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'Software packages this software uses, i.e. operating system, 3rd party software packages, etc.',
                                                                   'cardinality' => '0..N',
                                                                   'class_id' => 'S.157',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 3',
                                                                                     'rank' => '3'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Software',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'none',
                                                                  'documentation' => 'Software packages this software uses, i.e. operating system, 3rd party software packages, etc.',
                                                                  'cardinality' => '0..N',
                                                                  'class_id' => 'S.157',
                                                                  'constraint' => undef
                                                                }
                                                    },
                                                    {
                                                      'other' => {
                                                                   'class_name' => 'OntologyEntry',
                                                                   'name' => 'type',
                                                                   'navigable' => 'true',
                                                                   'ordering' => 'unordered',
                                                                   'aggregation' => 'none',
                                                                   'documentation' => 'The type of a piece of Software.  Examples include: feature extractor...',
                                                                   'cardinality' => '0..1',
                                                                   'class_id' => 'S.185',
                                                                   'constraint' => {
                                                                                     'ordered' => 0,
                                                                                     'constraint' => 'rank: 1',
                                                                                     'rank' => '1'
                                                                                   }
                                                                 },
                                                      'self' => {
                                                                  'class_name' => 'Software',
                                                                  'name' => undef,
                                                                  'navigable' => 'false',
                                                                  'ordering' => 'unordered',
                                                                  'aggregation' => 'composite',
                                                                  'documentation' => 'The type of a piece of Software.  Examples include: feature extractor...',
                                                                  'cardinality' => '1',
                                                                  'class_id' => 'S.157',
                                                                  'constraint' => undef
                                                                }
                                                    }
                                                  ],
                                'parent' => 'Parameterizable',
                                'documentation' => 'Software represents the software used.  Examples of Software include: feature extraction software, clustering software, etc...',
                                'methods' => [],
                                'name' => 'Software',
                                'abstract' => 'false',
                                'id' => 'S.157',
                                'package' => 'Protocol'
                              },
                  'PresentAbsent' => {
                                     'attrs' => [],
                                     'associations' => [],
                                     'parent' => 'StandardQuantitationType',
                                     'documentation' => 'Indicates relative presence or absence.  From the enumeration AbsoluteCallTypeEnum {Present | Absent | Marginal | No call} or ComparisonCallTypeEnum {Increase I Marginal Increase | Decrease | Marginal Decrease |  No change | No Call | Unknown }, as specified by the dataType.',
                                     'methods' => [],
                                     'name' => 'PresentAbsent',
                                     'abstract' => 'false',
                                     'id' => 'S.251',
                                     'package' => 'QuantitationType'
                                   },
                  'Description' => {
                                   'attrs' => [
                                                {
                                                  'documentation' => 'The description.',
                                                  'name' => 'text',
                                                  'type' => 'String',
                                                  'id' => 'S.171'
                                                },
                                                {
                                                  'documentation' => 'A reference to the location and type of an outside resource.',
                                                  'name' => 'URI',
                                                  'type' => 'String',
                                                  'id' => 'S.172'
                                                }
                                              ],
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'DatabaseEntry',
                                                                      'name' => 'databaseReferences',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'References to entries in databases.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.173',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 3',
                                                                                        'rank' => '3'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Description',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'References to entries in databases.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.170',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'BibliographicReference',
                                                                      'name' => 'bibliographicReferences',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'References to existing literature.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.215',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 4',
                                                                                        'rank' => '4'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Description',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'References to existing literature.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.170',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'ExternalReference',
                                                                      'name' => 'externalReference',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Specifies where the described instance was originally obtained from.',
                                                                      'cardinality' => '0..1',
                                                                      'class_id' => 'S.180',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Description',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Specifies where the described instance was originally obtained from.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.170',
                                                                     'constraint' => undef
                                                                   }
                                                       },
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'OntologyEntry',
                                                                      'name' => 'annotations',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'Allows specification of ontology entries related to the instance being described.',
                                                                      'cardinality' => '0..N',
                                                                      'class_id' => 'S.185',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 2',
                                                                                        'rank' => '2'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Description',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'Allows specification of ontology entries related to the instance being described.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.170',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'parent' => 'Describable',
                                   'documentation' => 'A free text description of an object.',
                                   'methods' => [],
                                   'name' => 'Description',
                                   'abstract' => 'false',
                                   'id' => 'S.170',
                                   'package' => 'Description'
                                 },
                  'Measurement' => {
                                   'attrs' => [
                                                {
                                                  'documentation' => 'The type of measurement, for instance if the measurement is five feet, it can be either absolute (five feet tall) or change (five feet further along).',
                                                  'name' => 'type',
                                                  'type' => 'enum {absolute,change}',
                                                  'id' => 'S.191'
                                                },
                                                {
                                                  'documentation' => 'The value of the measurement.  kindCV (and otherKind) determine with Unit the datatype of value.',
                                                  'name' => 'value',
                                                  'type' => 'any',
                                                  'id' => 'S.192'
                                                },
                                                {
                                                  'documentation' => 'One of the enumeration values to determine the controlled vocabulary of the value.',
                                                  'name' => 'kindCV',
                                                  'type' => 'enum {time,distance,temperature,quantity,mass,volume,concentration,other}',
                                                  'id' => 'S.193'
                                                },
                                                {
                                                  'documentation' => 'Name of the controlled vocabulary if it isn\'t one of the Unit subclasses.',
                                                  'name' => 'otherKind',
                                                  'type' => 'String',
                                                  'id' => 'S.194'
                                                }
                                              ],
                                   'associations' => [
                                                       {
                                                         'other' => {
                                                                      'class_name' => 'Unit',
                                                                      'name' => 'unit',
                                                                      'navigable' => 'true',
                                                                      'ordering' => 'unordered',
                                                                      'aggregation' => 'none',
                                                                      'documentation' => 'The Unit associated with the Measurement.',
                                                                      'cardinality' => '0..1',
                                                                      'class_id' => 'S.195',
                                                                      'constraint' => {
                                                                                        'ordered' => 0,
                                                                                        'constraint' => 'rank: 1',
                                                                                        'rank' => '1'
                                                                                      }
                                                                    },
                                                         'self' => {
                                                                     'class_name' => 'Measurement',
                                                                     'name' => undef,
                                                                     'navigable' => 'false',
                                                                     'ordering' => 'unordered',
                                                                     'aggregation' => 'composite',
                                                                     'documentation' => 'The Unit associated with the Measurement.',
                                                                     'cardinality' => '1',
                                                                     'class_id' => 'S.190',
                                                                     'constraint' => undef
                                                                   }
                                                       }
                                                     ],
                                   'parent' => 'Extendable',
                                   'documentation' => 'A Measurement is a quantity with a unit.',
                                   'methods' => [],
                                   'name' => 'Measurement',
                                   'abstract' => 'false',
                                   'id' => 'S.190',
                                   'package' => 'Measurement'
                                 }
                };

$XMI::packages = {
                   'BioEvent' => [
                                 'BioEvent',
                                 'Map'
                               ],
                   'HigherLevelAnalysis' => [
                                            'BioAssayDataCluster',
                                            'Node',
                                            'NodeContents',
                                            'NodeValue'
                                          ],
                   'BioMaterial' => [
                                    'BioSource',
                                    'BioMaterial',
                                    'LabeledExtract',
                                    'BioSample',
                                    'Compound',
                                    'CompoundMeasurement',
                                    'BioMaterialMeasurement',
                                    'Treatment'
                                  ],
                   'BioSequence' => [
                                    'SeqFeature',
                                    'SeqFeatureLocation',
                                    'BioSequence',
                                    'SequencePosition'
                                  ],
                   'AuditAndSecurity' => [
                                         'Person',
                                         'Security',
                                         'Audit',
                                         'Organization',
                                         'SecurityGroup',
                                         'Contact'
                                       ],
                   'MAGE' => [
                               'Extendable',
                               'Identifiable',
                               'Describable',
                               'NameValueType'
                             ],
                   'BioAssayData' => [
                                     'BioAssayData',
                                     'QuantitationTypeDimension',
                                     'BioAssayMapping',
                                     'DesignElementDimension',
                                     'BioAssayDatum',
                                     'DerivedBioAssayData',
                                     'MeasuredBioAssayData',
                                     'QuantitationTypeMapping',
                                     'DesignElementMapping',
                                     'BioDataCube',
                                     'BioDataValues',
                                     'BioDataTuples',
                                     'BioAssayDimension',
                                     'QuantitationTypeMap',
                                     'Transformation',
                                     'DesignElementMap',
                                     'BioAssayMap',
                                     'CompositeSequenceDimension',
                                     'ReporterDimension',
                                     'FeatureDimension'
                                   ],
                   'BQS' => [
                            'BibliographicReference'
                          ],
                   'Array' => [
                              'Array',
                              'FeatureDefect',
                              'ArrayGroup',
                              'ArrayManufacture',
                              'ArrayManufactureDeviation',
                              'Fiducial',
                              'ManufactureLIMS',
                              'ManufactureLIMSBiomaterial',
                              'PositionDelta',
                              'ZoneDefect'
                            ],
                   'QuantitationType' => [
                                         'StandardQuantitationType',
                                         'QuantitationType',
                                         'SpecializedQuantitationType',
                                         'DerivedSignal',
                                         'MeasuredSignal',
                                         'Error',
                                         'PValue',
                                         'ExpectedValue',
                                         'Ratio',
                                         'ConfidenceIndicator',
                                         'PresentAbsent',
                                         'Failed'
                                       ],
                   'Experiment' => [
                                   'Experiment',
                                   'ExperimentDesign',
                                   'ExperimentalFactor',
                                   'FactorValue'
                                 ],
                   'BioAssay' => [
                                 'PhysicalBioAssay',
                                 'DerivedBioAssay',
                                 'Image',
                                 'BioAssay',
                                 'Channel',
                                 'MeasuredBioAssay',
                                 'BioAssayCreation',
                                 'FeatureExtraction',
                                 'Hybridization',
                                 'ImageAcquisition',
                                 'BioAssayTreatment'
                               ],
                   'DesignElement' => [
                                      'DesignElement',
                                      'Position',
                                      'Reporter',
                                      'ReporterPosition',
                                      'CompositePosition',
                                      'CompositeSequence',
                                      'Feature',
                                      'MismatchInformation',
                                      'FeatureInformation',
                                      'CompositeCompositeMap',
                                      'FeatureReporterMap',
                                      'ReporterCompositeMap',
                                      'FeatureLocation'
                                    ],
                   'Protocol' => [
                                 'Protocol',
                                 'Parameter',
                                 'ParameterValue',
                                 'ProtocolApplication',
                                 'Software',
                                 'Hardware',
                                 'HardwareApplication',
                                 'SoftwareApplication',
                                 'Parameterizable',
                                 'ParameterizableApplication'
                               ],
                   'ArrayDesign' => [
                                    'ArrayDesign',
                                    'PhysicalArrayDesign',
                                    'ZoneLayout',
                                    'ZoneGroup',
                                    'Zone',
                                    'ReporterGroup',
                                    'FeatureGroup',
                                    'DesignElementGroup',
                                    'CompositeGroup'
                                  ],
                   'Description' => [
                                    'Description',
                                    'DatabaseEntry',
                                    'Database',
                                    'ExternalReference',
                                    'OntologyEntry'
                                  ],
                   'Measurement' => [
                                    'Measurement',
                                    'Unit',
                                    'TimeUnit',
                                    'DistanceUnit',
                                    'TemperatureUnit',
                                    'QuantityUnit',
                                    'MassUnit',
                                    'VolumeUnit',
                                    'ConcentrationUnit'
                                  ]
                 };

