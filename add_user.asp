<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
    <div class="container">
        <h1>Add User</h1>
        <nav>
            <a href="index.asp">Home</a>
            <a href="users.asp">Manage Users</a>
            <a href="books.asp">Manage Books</a>
        </nav>
        <%
        If Request.Form("submit") <> "" Then
            Dim name, email, phone
            name = Request.Form("name")
            email = Request.Form("email")
            phone = Request.Form("phone")
            
            If name <> "" And email <> "" And phone <> "" Then
                Dim sql
                sql = "INSERT INTO Users (Name, Email, Phone) VALUES ('" & Replace(name, "'", "''") & "', '" & Replace(email, "'", "''") & "', '" & Replace(phone, "'", "''") & "')"
                conn.Execute sql
                Response.Write "<p class='message'>User added successfully!</p>"
            Else
                Response.Write "<p class='error'>All fields are required!</p>"
            End If
        End If
        %>
        <form method="post" onsubmit="return validateUserForm();">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email">
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone">
            <input type="submit" name="submit" value="Add User">
        </form>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
