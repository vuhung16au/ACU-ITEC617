"""
Minimal HTTP listener for out-of-band (OOB) demos.

In a real OOB SQL injection, the database (not the application) would call
an attacker-controlled host. This service simply logs any inbound request so
students can see what exfiltrated data would look like on the wire.
"""

from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import unquote


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        print(f"[OOB LISTENER] GET {unquote(self.path)} from {self.client_address[0]}", flush=True)
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(b"oob listener ok\n")

    def do_POST(self):
        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length).decode("utf-8", errors="replace")
        print(f"[OOB LISTENER] POST {unquote(self.path)} body={body!r}", flush=True)
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(b"oob listener ok\n")

    def log_message(self, format, *args):
        # Suppress default access log; we print our own lines above.
        return


if __name__ == "__main__":
    port = 9999
    print(f"OOB listener listening on 0.0.0.0:{port}", flush=True)
    HTTPServer(("0.0.0.0", port), Handler).serve_forever()
