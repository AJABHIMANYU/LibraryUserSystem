<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
    <div class="container">
        <h1>Manage Users</h1>
        <nav>
            <a href="index.asp">Home</a>
            <a href="users.asp">Manage Users</a>
            <a href="books.asp">Manage Books</a>
        </nav>
        <h2>User List</h2>
        <%
        Dim rs
        Set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open "SELECT * FROM Users", conn
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            <%
            Do While Not rs.EOF
            %>
            <tr>
                <td><%=rs("ID")%></td>
                <td><%=rs("Name")%></td>
                <td><%=rs("Email")%></td>
                <td><%=rs("Phone")%></td>
                <td>
                    <a href="edit_user.asp?id=<%=rs("ID")%>">Edit</a>
                    <a href="delete_user.asp?id=<%=rs("ID")%>" onclick="return confirmDelete('Are you sure you want to delete this user?');">Delete</a>
                </td>
            </tr>
            <%
                rs.MoveNext
            Loop
            rs.Close
            Set rs = Nothing
            %>
        </table>
        <a href="add_user.asp">Add New User</a>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
