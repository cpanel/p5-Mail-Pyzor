package Test::Mail::Pyzor;

# Copyright (c) 2012, cPanel, LLC.
# All rights reserved.
# http://cpanel.net
#
# This is free software; you can redistribute it and/or modify it under the
# same terms as Perl itself. See L<perlartistic>.

use strict;
use warnings;
use autodie;

use FindBin;

use File::Slurp;

use constant _SUPPORT_DIR => "$FindBin::Bin/support";
use constant _EMAILS_DIR  => _SUPPORT_DIR() . '/digest_email';

# cf. https://github.com/SpamExperts/pyzor/blob/master/tests/functional/test_digest.py
use constant EMAIL_DIGEST => {
    pyzor_functional_bad_encoding => '2b4dbf2fb521edd21d997f3f04b1c7155ba91fff',

    # sha1('Thisisatestmailing')
    pyzor_functional_text_attachment_w_contenttype_null => 'faaaf3e31637eb4c5bfeb0a915e5cc48e4221ebb',
    pyzor_functional_text_attachment_w_multiple_nulls   => 'faaaf3e31637eb4c5bfeb0a915e5cc48e4221ebb',
    pyzor_functional_text_attachment_w_null             => 'faaaf3e31637eb4c5bfeb0a915e5cc48e4221ebb',
};

sub get_test_emails_hr {
    my %name_content;

    opendir my $dh, _EMAILS_DIR();
    while (my $name = readdir $dh) {
        next if $name =~ m<\A\.>;

        $name_content{$name} = \(q<> . File::Slurp::read_file( _EMAILS_DIR() . "/$name" ));
    }

    return \%name_content;
}

1;
