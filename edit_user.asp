<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
    <div class="container">
        <h1>Edit User</h1>
        <nav>
            <a href="index.asp">Home</a>
            <a href="users.asp">Manage Users</a>
            <a href="books.asp">Manage Books</a>
        </nav>
        <%
        Dim id, rs
        id = Request.QueryString("id")
        Set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open "SELECT * FROM Users WHERE ID = " & id, conn
        If Not rs.EOF Then
            If Request.Form("submit") <> "" Then
                Dim name, email, phone
                name = Request.Form("name")
                email = Request.Form("email")
                phone = Request.Form("phone")
                
                If name <> "" And email <> "" And phone <> "" Then
                    Dim sql
                    sql = "UPDATE Users SET Name = '" & Replace(name, "'", "''") & "', Email = '" & Replace(email, "'", "''") & "', Phone = '" & Replace(phone, "'", "''") & "' WHERE ID = " & id
                    conn.Execute sql
                    Response.Write "<p class='message'>User updated successfully!</p>"
                Else
                    Response.Write "<p class='error'>All fields are required!</p>"
                End If
            End If
        %>
        <form method="post" onsubmit="return validateUserForm();">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%=rs("Name")%>">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%=rs("Email")%>">
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="<%=rs("Phone")%>">
            <input type="submit" name="submit" value="Update User">
        </form>
        <%
        Else
            Response.Write "<p class='error'>User not found!</p>"
        End If
        rs.Close
        Set rs = Nothing
        %>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
