Download failed: Traceback (most recent call last):
  File "/usr/share/anki/aqt/downloader.py", line 67, in run
    aqt.appShared + "download/%d" % self.code)
  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1659, in request
    (response, content) = self._request(conn, authority, uri, request_uri, method, body, headers, redirections, cachekey)
  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1452, in _request
    redirections=redirections - 1)
  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1659, in request
    (response, content) = self._request(conn, authority, uri, request_uri, method, body, headers, redirections, cachekey)
  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1399, in _request
    (response, content) = self._conn_request(conn, request_uri, method, body, headers)
  File "/usr/share/anki/aqt/sync.py", line 467, in _conn_request
    conn.connect()
  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1092, in connect
    raise SSLHandshakeError(e)
SSLHandshakeError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:590)



On two attempts, 1771074083 and 


My attempt to install on Ubuntu 16.04 by entering the code in Anki failed with a SSLHandshakeError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:590) on line 67 of anki/aqt/downloader.py. 

I've been able to install it on Windows 10 in the past without incident. (I don't recall 100% but am pretty sure I used the Anki code. It's probably just something wrong with my public key infrastructure setup on Ubuntu but I'd appreciate it if someone can walk me through it.


