"""Loopback-only preview with caching disabled for reliable design review."""
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from functools import partial
from pathlib import Path

root = Path(__file__).resolve().parent.parent / "_site-preview"
if not (root / "index.html").is_file():
    raise SystemExit("Build _site-preview first; see README.md.")

class PreviewHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

server = ThreadingHTTPServer(("127.0.0.1", 4017), partial(PreviewHandler, directory=str(root)))
print("Local preview: http://127.0.0.1:4017/", flush=True)
server.serve_forever()
