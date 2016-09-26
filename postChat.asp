<!--postChat.asp-->
<%
Session("Username")="Rajesh"
dim edta,sqlins,txtsess
if session("Username") <> "Rajesh" and session("Username") <> "Sindhu" then
	Response.redirect("/Chatlogin.asp")
end if
%>

<html>
<head>
<script>
function fngetChat()
{
var xmlhttp;
var Edata=encodeURIComponent(document.getElementById("btnEdta").value);

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("getChtSpc").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("POST","getChat.asp",true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
var parm="btnEdta="+Edata;
xmlhttp.send(parm);
}
</script>
</head>
<body>
<Strong>Welcome,<%Response.write(Session("Username"))%></Strong>
<font size=1><a href="/wubbytalk/Chatlogin.asp">Logout</a></font>



<form action="/Wubbytalk/postChat.asp" method="post">
	<input type="text" name="btnEdta" id="btnEdta" size="90">
	<input type="submit" id = "btnSnd" value="Send" class="button">
</form>

<script type="text/javascript">

setInterval (fngetChat, 2000);
</script>
<p id="getChtSpc">test </p>

</body>
</html>
