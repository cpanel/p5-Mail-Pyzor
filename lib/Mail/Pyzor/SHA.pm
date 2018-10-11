package Mail::Pyzor::SHA;

use strict;
use warnings;

use Module::Load ();

use constant _ORDER => ( 'Digest::SHA1', 'Digest::SHA' );

my $_sha_module;
sub _sha_module {
    if (!$_sha_module) {

        # First check if one of the modules is loaded.
        if (my @loaded = grep { $_->can('sha1') } _ORDER) {
            $_sha_module = $loaded[0];
        }
        else {
            my @modules = _ORDER();

            while (my $module = shift @modules) {
                if ( eval { Module::Load::load($module); 1 } ) {
                    $_sha_module = $module;
                    last;
                }
                elsif (!@modules) {
                    die;
                }
            }
        }
    }

    return $_sha_module;
}

sub sha1 {
    return _sha_module()->can('sha1')->(@_);
}

sub sha1_hex {
    return _sha_module()->can('sha1_hex')->(@_);
}

1;
