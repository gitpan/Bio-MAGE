sub MY::top_targets {
    package MY; # so that "SUPER" works right
    my $inherited = shift->SUPER::top_targets(@_);
    $inherited =~ s/(man|html)ifypods//g;
    $inherited;
}

WriteMakefile(
    'NAME'	=> 'Bio::MAGE::Base',
    'SKIP'      => [qw( test makeaperl manifypods htmlifypods xs_o static)],
);
