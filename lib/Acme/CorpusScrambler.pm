package Acme::CorpusScrambler;

use warnings;
use strict;

use Text::Greeking::zh_TW;

=head1 NAME

Acme::CorpusScrambler - An Acme way doing Lorem Ipsum.

=head1 VERSION

version 0.02

=cut

our $VERSION = '0.02';

=head1 SYNOPSIS

    use Acme::CorpusScrambler;

    my $foo = Acme::CorpusScrambler->new();
    my $text = $foo->scramble;

=head1 FUNCTIONS

=head2 new

Object constructor, no parameters required.

=cut

sub new {
    my $class = shift;
    bless {}, $class;
}

=head2 feed( $keyword => $corpus )

Feeds the $corpus to object, indexed by $keyword. The corpus is used latter as scrambling
material.

=cut

my %corpushash;
sub feed {
    my ($self, $keyword, $corpus) = @_;
    $corpushash{"$keyword"}="$corpus";
}

=head2 scramble( @keyword )

Generate a piece of lipsum text accroding to @keyword. If you didn't
feed any corpus before with feed() method, it will use
Text::Greeking::zh_TW's default corpus.

=cut

sub scramble {
    my ($self, @keyword) = @_;

    my $g = Text::Greeking::zh_TW->new;
    $g->paragraphs(3,15);
    $g->sentences(2,10);

    if (@keyword) {
        my $newcorpus = join("\n\n", @corpushash{ grep { exists $corpushash{$_} } @keyword });
        if ($newcorpus) {
            # $g->add_source($newcorpus);
            return $g->generate;
        }
        return ""
    }else {
        return $g->generate;
    }
}

=head1 AUTHOR

Kang-min Liu <gugod at gugod.org>

shelling <navyblueshellingford at gmail.com>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-acme-scrambledcorpus at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Acme-CorpusScrambler>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Acme::CorpusScrambler

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Acme-CorpusScrambler>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Acme-CorpusScrambler>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Acme-CorpusScrambler>

=item * Search CPAN

L<http://search.cpan.org/dist/Acme-CorpusScrambler>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2007 Kang-min Liu, shelling, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
