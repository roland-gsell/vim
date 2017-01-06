#!/usr/bin/env python

import SocketServer


class AureaRequestHandler(SocketServer.BaseRequestHandler):
    def handle(self):
        addr = self.client_address[0]
        print("[{}] Verbindung hergestellt".format(addr))
        while True:
            s = self.request.recv(1024)
            if s:
                print("[{}] {}".format(addr, s.decode()))
                nachricht = "Antwort! "
                self.request.send(nachricht.encode())
            else:
                print("[{}] Verbindung geschlossen".format(addr))
                break


server = SocketServer.ThreadingTCPServer(("", 9090), AureaRequestHandler)
server.serve_forever()
