<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Books</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
    <div class="container">
        <h1>Manage Books</h1>
        <nav>
            <a href="index.asp">Home</a>
            <a href="users.asp">Manage Users</a>
            <a href="books.asp">Manage Books</a>
        </nav>
        <h2>Book List</h2>
        <%
        Dim rs
        Set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open "SELECT * FROM Books", conn
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Published Year</th>
                <th>Actions</th>
            </tr>
            <%
            Do While Not rs.EOF
            %>
            <tr>
                <td><%=rs("ID")%></td>
                <td><%=rs("Title")%></td>
                <td><%=rs("Author")%></td>
                <td><%=rs("ISBN")%></td>
                <td><%=rs("PublishedYear")%></td>
                <td>
                    <a href="edit_book.asp?id=<%=rs("ID")%>">Edit</a>
                    <a href="delete_book.asp?id=<%=rs("ID")%>" onclick="return confirmDelete('Are you sure you want to delete this book?');">Delete</a>
                </td>
            </tr>
            <%
                rs.MoveNext
            Loop
            rs.Close
            Set rs = Nothing
            %>
        </table>
        <a href="add_book.asp">Add New Book</a>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
