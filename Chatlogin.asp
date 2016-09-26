<html>
<body>

<H2>Wubby talk</h2>
<br>
<br>

<form action="/WubbyTalk/ChatLogin.asp" method="post">
User Name: <input type="text" name="txtusr"><br>
Password:&nbsp; &nbsp;<input type="password" name="txtpass"><br>
<br>
<input type="submit" value="Login">
</form>
</body>
</html>

<%
dim vUsr,vpass
Session("Username")=""

vUsr = Request.form("txtusr")
vPass = Request.form("txtpass")

if (vUsr = "Rajesh" or vUsr = "Sindhu") and vPass = "bowbow" then
	Session("Username")=vUsr
	Response.redirect ("/WubbyTalk/Data.asp")
else
	Session.Contents.Remove("Username")
end if
%>