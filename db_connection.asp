<%
Dim conn, dbPath
dbPath = Server.MapPath("../db/library.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath
%>
