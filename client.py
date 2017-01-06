#!/usr/bin/env python

import socket

ip = "127.0.0.1"
port = 9090

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((ip, port))

try:
    while True:
        nachricht = raw_input("Nachricht: ")
        s.send(nachricht.encode())
        antwort = s.recv(1024)
        print("[{}] {}".format(ip, antwort.decode()))
finally:
    s.close()
