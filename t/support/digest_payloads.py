#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright (c) 2018 cPanel, LLC.
# All rights reserved.
# http://cpanel.net
#
# <@LICENSE>
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to you under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at:
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# </@LICENSE>
#

import sys
import json
import email

import pyzor.digest

#----------------------------------------------------------------------
import getopt

def usage():
    return "Prints a message’s digest payload in newline-delimited JSON.\n\n" + "Usage: " + sys.argv[0] + "\n\nGive input via STDIN.\n";

try:
    (opts, args) = getopt.getopt(sys.argv[1:], 'h', ['help'])
except getopt.GetoptError, err:
    sys.stderr.write(usage())
    sys.exit(1)

for (o, a) in opts:
    if o in ('-h', '--help'):
        print usage()
        sys.exit();
#----------------------------------------------------------------------

msg = email.message_from_file( sys.stdin )

import pprint

digester=pyzor.digest.DataDigester

for payload in digester.digest_payloads(msg):
    print( json.dumps(payload) )
