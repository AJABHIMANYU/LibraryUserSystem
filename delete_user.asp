<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete User</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Delete User</h1>
        <nav>
            <a href="index.asp">Home</a>
            <a href="users.asp">Manage Users</a>
            <a href="books.asp">Manage Books</a>
        </nav>
        <%
        Dim id
        id = Request.QueryString("id")
        If id <> "" Then
            Dim sql
            sql = "DELETE FROM Users WHERE ID = " & id
            conn.Execute sql
            Response.Write "<p class='message'>User deleted successfully!</p>"
        Else
            Response.Write "<p class='error'>Invalid user ID!</p>"
        End If
        %>
        <a href="users.asp">Back to Users</a>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
