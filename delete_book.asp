<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Book</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Delete Book</h1>
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
            sql = "DELETE FROM Books WHERE ID = " & id
            conn.Execute sql
            Response.Write "<p class='message'>Book deleted successfully!</p>"
        Else
            Response.Write "<p class='error'>Invalid book ID!</p>"
        End If
        %>
        <a href="books.asp">Back to Books</a>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
