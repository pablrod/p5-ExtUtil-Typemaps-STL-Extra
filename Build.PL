use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'ExtUtils::Typemaps::STL::Extra',
    license             => 'artistic_2',
    dist_author         => q{Pablo Rodríguez González <pablrod@cpan.org>},
    dist_version_from   => 'lib/ExtUtils/Typemaps/STL/Extra.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    add_to_cleanup     => [ 'ExtUtils-Typemaps-STL-Extra-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
