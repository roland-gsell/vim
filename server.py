#!/usr/bin/env python

import socket

port = 9090

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(("", port))
s.listen(1)

try:
    while True:
        komm, addr = s.accept()
        while True:
            data = komm.recv(1024)
            if not data:
                komm.close()
                break
            print("[{}] {}".format(addr[0], data.decode()))
            nachricht = raw_input("Antwort: ")
            komm.send(nachricht.encode())
finally:
    s.close()
