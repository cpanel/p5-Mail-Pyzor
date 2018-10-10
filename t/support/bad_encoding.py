#!/usr/bin/python

import pyzor

BAD_ENCODING = """From nobody Tue Apr  1 13:18:54 2014
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



"""

digester=pyzor.digest.DataDigester
