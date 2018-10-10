#!/usr/bin/perl

use strict;
use warnings;
use autodie;

my $bad_encoding = <<"END";
From nobody Tue Apr  1 13:18:54 2014
Content-Type: multipart/related;
 boundary="===============0632694142025794937=="
MIME-Version: 1.0\x00\x00\x00

This is a multi-part message in MIME format.
--===============0632694142025794937==
Content-Type: text/plain; charset=ISO-8859-1\x00\x00\x00Content-Transfer-Encoding: quoted-printable

This is a test

--===============0632694142025794937\x00\x00\x00==
Content-Type: text/plain; charset=us-asciia
Content-Transfer-Encoding: quoted-printable

This is a test

--===============0632694142025794937==
END

$bad_encoding = <<"END";
MIME-Version: 1.0
Received: by 10.76.127.40 with HTTP; Fri, 17 Jan 2014 02:21:43 -0800 (PST)
Date: Fri, 17 Jan 2014 12:21:43 +0200
Delivered-To: chirila.s.alexandru\@gmail.com
Message-ID: <CALTHOsuHFaaatiXJKU=LdDCo4NmD_h49yvG2RDsWw17D0-NXJg\@mail.gmail.com>
Subject: Test
From: Alexandru Chirila <chirila.s.alexandru\@gmail.com>
To: Alexandru Chirila <chirila.s.alexandru\@gmail.com>
Content-Type: multipart/mixed; boundary=f46d040a62c49bb1c804f027e8cc

--f46d040a62c49bb1c804f027e8cc
Content-Type: multipart/alternative; boundary=f46d040a62c49bb1c404f027e8ca

--f46d040a62c49bb1c404f027e8ca
Content-Type: text/plain; charset=ISO-8859-1

This is a test ma\x00\x00\x00iling
--f46d040a62c49bb1c804f027e8cc--
END

pipe my $r, my $w;

syswrite $w, $bad_encoding;

open \*STDIN, '<&=', $r;
exec 'pyzor', 'predigest';
