#!/usr/bin/env python3

import sys
import os
import struct
import select
import time
import getopt
import tqdm
import socket

try:
    optlist, args = getopt.getopt(sys.argv[1:], 's')

    timeout = 0.01
    n = 1024
    slow = False

    for o, a in optlist:
        if o == "-s":
            slow = True
            n = 16
            print('Running in slow mode')

    out = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host, port = args[1].split(':')
    out.connect((host, int(port)))

    size = os.path.getsize(args[0])
    out.send(struct.pack('>I', size))
    with open(args[0], 'rb') as f:
        data = f.read()
        for i in tqdm.tqdm(range(0, len(data), n)):
            out.send(data[i:i+n])
            if slow:
                time.sleep(timeout)

    out.close()
    os.execlp('telnet', 'telnet', host, port.strip())
except getopt.GetoptError as err:
    print(str(err))
    print('Usage: send.py [-s] file host:port')
