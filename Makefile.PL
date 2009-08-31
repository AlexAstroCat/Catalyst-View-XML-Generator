use inc::Module::Install;

name     'Catalyst-Action-Serialize-XML-PerlData';
all_from 'lib/Catalyst/Action/Serialize/XML/PerlData.pm';
author   'Michael Nachbaurt <mike@nachbaur.com>';
license  'perl';

requires 'Catalyst::Controller::REST';
requires 'XML::LibXML::SAX::Builder';
requires 'XML::Generator::PerlData';
requires 'parent';
requires 'namespace::clean';

test_requires 'Test::More';

auto_install;

WriteAll;                                                             
