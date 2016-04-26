use strict;
use warnings;

use Test::Most tests => 1;

use Module::Build::WithXSpp;
use Data::Dumper;

chdir('t/02-map_of_strings_strings');

my $builder = Module::Build::WithXSpp->new(
	module_name => 'test_map_of_strings_strings',
	license => 'perl',
	dist_version => '0.01',
	#pm_files => {'t/02-map_of_strings_strings/lib/test_map_of_strings_strings.pm' => 'lib/test_map_of_strings_strings.pm'},
'build_requires' => {
    'ExtUtils::Typemaps::Default' => '1.05',
    'ExtUtils::XSpp' => '0.18',
    'Module::Build' => '0.4211',
    'Test::More' => '0'
  },
  'configure_requires' => {
    'ExtUtils::CppGuess' => '0.07',
    'Module::Build' => '0.4211',
    'Module::Build::WithXSpp' => '0.13'
  },
  extra_compiler_flags => [qw(-std=c++11)],
  extra_typemap_modules => {
    #'ExtUtils::Typemaps::Default' => '1.05',
    'ExtUtils::Typemaps::STL::Extra' => '0',
  },
  cpp_source_dirs => [qw(src)],
  extra_xs_dirs => [qw(xsp)]

);

$builder->create_build_script();
$builder->dispatch('clean');
$builder->dispatch('build');

push @INC, './blib/arch', './blib/lib';
use Module::Load;
load 'test_map_of_strings_strings';
my $hash = {key => 'value', another_key => 'another value'};

diag(Dumper(test_map_of_strings_strings::check_map_of_strings_strings($hash)));
is_deeply($hash, test_map_of_strings_strings::check_map_of_strings_strings($hash));
