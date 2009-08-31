package Catalyst::Action::Serialize::XML::PerlData;

use strict;
use warnings;
use parent 'Catalyst::Action';
use XML::LibXML::SAX::Builder;
use XML::Generator::PerlData;
use namespace::clean;

=head1 NAME

Catalyst::Action::Serialize::XML::PerlData - Serialize the stash as XML using XML::Generator::PerlData

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

sub execute {
    my $self = shift;
    my ($controller, $c) = @_;

    my $stash_key = (
            $controller->config->{'serialize'} ?
                $controller->config->{'serialize'}->{'stash_key'} :
                $controller->config->{'stash_key'}
        ) || 'rest';

    my $data = $c->stash->{$stash_key};

    my $conf = $c->config->{'Serialize::XML::PerlData'} || {};

    my $builder = XML::LibXML::SAX::Builder->new();
    my $generator = XML::Generator::PerlData->new(
        Handler => $builder,
        %{ $conf }
    );

    my $dom = $generator->parse($data);
    my $content = $dom->toString(1);

    $c->res->content_type('text/xml');
    $c->res->output($content);

    1;
}

=head1 AUTHOR

Michael Nachbaur, C<< <mike@nachbaur.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-catalyst-action-serialize-xml-perldata at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Catalyst-Action-Serialize-XML-PerlData>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<Catalyst>, L<Catalyst::Controller::REST>, L<Catalyst::Action::REST>,
L<XML::Generator::PerlData>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Catalyst::Action::Serialize::XML::PerlData

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Catalyst-Action-Serialize-XML-PerlData>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Catalyst-Action-Serialize-XML-PerlData>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Catalyst-Action-Serialize-XML-PerlData>

=item * Search CPAN

L<http://search.cpan.org/dist/Catalyst-Action-Serialize-XML-PerlData/>

=back

=head1 COPYRIGHT & LICENSE

Copyright (c) 2009 Michael Nachbaur

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
