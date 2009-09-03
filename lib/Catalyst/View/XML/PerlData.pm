package Catalyst::View::XML::PerlData;
use Moose;
BEGIN { extends 'Catalyst::View' }

use XML::LibXML::SAX::Builder;
use XML::Generator::PerlData;
use namespace::clean;

=head1 NAME

Catalyst::View::XML::PerlData - Serialize the stash as XML using XML::Generator::PerlData

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    __PACKAGE__->config(
        'XML::PerlData' => {
            rootname => 'document',
            attrmap => {
                action => [qw( class name )],
                view   => [qw( type )]
            }
        }
    );

=head1 DESCRIPTION

This Catalyst view renders the context stash as XML using L<XML::Generator::PerlData>.  This enables you
to quickly render customized XML output using a set of rules to dictate which hash parameters will be stored
as attributes, elements, and other configuration options.

=cut

sub process {
    my ($self, $c) = @_;

    my $conf = $c->config->{'View::XML'};
    my $builder = XML::LibXML::SAX::Builder->new();
    my $generator = XML::Generator::PerlData->new(
        Handler => $builder,
        %{ $conf }
    );

    my $dom = $generator->parse($c->stash);
    my $content = $dom->toString(1);

    $c->res->headers->header("Content-Type" => "text/xml");
    $c->res->body( $content );

    1;
}

=head1 AUTHOR

Michael Nachbaur, C<< <mike@nachbaur.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-catalyst-view-xml-perldata at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Catalyst-View-XML-PerlData>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<Catalyst>, L<Catalyst::View>, L<XML::Generator::PerlData>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Catalyst::View::XML::PerlData

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Catalyst-View-XML-PerlData>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Catalyst-View-XML-PerlData>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Catalyst-View-XML-PerlData>

=item * Search CPAN

L<http://search.cpan.org/dist/Catalyst-View-XML-PerlData/>

=back

=head1 COPYRIGHT & LICENSE

Copyright (c) 2009 Michael Nachbaur

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;