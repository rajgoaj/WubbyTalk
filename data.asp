<%
dim edta,sqlins,txtsess
if session("Username") <> "Rajesh" and session("Username") <> "Sindhu" then
	Response.redirect("/Chatlogin.asp")
end if
%>

<html>
<body>

<Strong>Welcome,<%Response.write(Session("Username"))%></Strong>
<font size=1><a href="/wubbyTalk/Chatlogin.asp">Logout</a></font>


<form action="/WubbyTalk/Data.asp" method="post">
	<input type="text" name="btnEdta" size="90">
	<input type="submit" value="Send" class="button">
</form>

<script type="text/javascript">
function res()
	{window.location.href("/WubbyTalk/Data.asp");}
'setInterval (res, 2000);
</script>


<%
edta = request.form("btnedta")
'txtsess = Request.ServerVariables("remote_addr")
txtsess = Session("Username")

set conn=server.createobject("ADODB.Connection")
conn.provider="Microsoft.Jet.OLEDB.4.0"
conn.open= server.mappath("data.mdb")

if edta <> "" then
	sqlset="insert into datatab (tbid, tbuser,tbstmp,tbdata,tbflag,tbcmts) values(1,'" & txtsess & "','" & now() & "','" & edta & "','Y','Nothing')"
	conn.execute sqlset,recaffected
	edta =""
end if

set rs=server.createobject("ADODB.recordset")
rs.open "select tbuser,tbstmp,tbdata from datatab order by tbstmp DESC",conn
%>

<table border="0"  width = "60%">
<TR>
<th align = "left">From</th><th align = "left">At</th><th width = 70% align = "left">Chat text</th>
</tr>

<%Do until rs.EOF%>
<tr>
<%for each x in rs.fields%>
<td><%response.write(x.value)%></td>
<%next
rs.movenext%>
</tr>
<%loop
rs.close
conn.close%>
</table>


</body>
</html>