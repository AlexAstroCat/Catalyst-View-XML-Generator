use inc::Module::Install;

name     'Catalyst-View-XML-PerlData';
all_from 'lib/Catalyst/View/XML/PerlData.pm';
author   'Michael Nachbaurt <mike@nachbaur.com>';
license  'perl';

requires 'Catalyst::View';
requires 'XML::LibXML::SAX::Builder';
requires 'XML::Generator::PerlData';
requires 'namespace::clean';

test_requires 'Test::More';

auto_install;

WriteAll;                                                             
