use strict;
use warnings;
use inc::Module::Install;

license 'perl';

WriteMakefile(
    NAME                => 'Acme::CorpusScrambler',
    AUTHOR              => 'Kang-min Liu, <gugod@gugod.org>',
    VERSION_FROM        => 'lib/Acme/CorpusScrambler.pm',
    ABSTRACT_FROM       => 'lib/Acme/CorpusScrambler.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Text::Greeking::zh_TW' => '0.0.3',
        'IO::All' => 0
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Acme-CorpusScrambler-*' },
);
