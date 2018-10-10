package MailPyzorTestBase;

use strict;
use warnings;

use parent 'Test::Class';

use Test::More;

use Test::Mail::Pyzor ();

sub _skip_if_no_python_pyzor {
    my ($self, $num_tests) = @_;

    if (!Test::Mail::Pyzor::python_can_load_pyzor()) {
        my $bin = Test::Mail::Pyzor::python_bin();

        skip "“$bin” can’t load pyzor!", $num_tests;
    }

    return;
}

1;
