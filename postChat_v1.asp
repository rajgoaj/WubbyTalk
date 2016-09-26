<!--postChat.asp-->
<html>
<head>
<script>
function fngetChat()
{
var xmlhttp;
var btnEdta = "xx";
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
xmlhttp.send(btnEdta);
}
</script>
</head>
<body>

<%Session("Username")="Rajesh"%>
<Strong>Welcome,<%Response.write(Session("Username"))%></Strong>
<font size=1><a href="/wubbytalk/Chatlogin.asp">Logout</a></font>
<br>

<input type="text" name="btnEdta" onkeydown="if (event.keycode==13) fngetChat()">
<input type="submit" value="Send" onclick="fngetChat()">



<p id="getChtSpc">test </p>

</body>
</html>
