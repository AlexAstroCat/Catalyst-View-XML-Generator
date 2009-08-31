#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Catalyst::Action::Serialize::XML::PerlData' );
}

diag( "Testing Catalyst::Action::Serialize::XML::PerlData $Catalyst::Action::Serialize::XML::PerlData::VERSION, Perl $], $^X" );
