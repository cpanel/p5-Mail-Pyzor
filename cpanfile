# kind of duplicate of Makefile.PL
#   but convenient for Continuous Integration

requires 'parent'                   => 0;
requires 'Digest::SHA'              => 0;
requires 'Email::MIME'              => 0;
requires 'Email::MIME::ContentType' => 0;
requires 'Encode'                   => 0;
requires 'IO::SigGuard'             => 0.12;
requires 'IPC::Run'                 => 0;
requires 'HTML::Parser'             => 0;
requires 'X::Tiny'                  => 0;

on 'test' => sub {
    requires 'autodie'            => 0;
    requires 'JSON'               => 0;
    requires 'Test::Class'        => 0;
    requires 'Test::More'         => 0;
    requires 'Test::FailWarnings' => 0;
    requires 'Test::Deep'         => 0;
    requires 'Test::Exception'    => 0;
    requires 'File::Slurp'        => 0;
    requires 'Data::Dumper'       => 0;
    requires 'File::Which'        => 0;
    requires 'IO::Pty'            => 0;
};
