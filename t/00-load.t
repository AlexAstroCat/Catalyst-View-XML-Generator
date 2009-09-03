#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Catalyst::View::XML::PerlData' );
}

diag( "Testing Catalyst::View::XML::PerlData $Catalyst::View::XML::PerlData::VERSION, Perl $], $^X" );
