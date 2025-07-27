<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
    <div class="container">
        <h1>Edit Book</h1>
        <nav>
            <a href="index.asp">Home</a>
            <a href="users.asp">Manage Users</a>
            <a href="books.asp">Manage Books</a>
        </nav>
        <%
        Dim id, rs
        id = Request.QueryString("id")
        Set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open "SELECT * FROM Books WHERE ID = " & id, conn
        If Not rs.EOF Then
            If Request.Form("submit") <> "" Then
                Dim title, author, isbn, year
                title = Request.Form("title")
                author = Request.Form("author")
                isbn = Request.Form("isbn")
                year = Request.Form("year")
                
                If title <> "" And author <> "" And isbn <> "" And year <> "" Then
                    If IsNumeric(year) Then
                        Dim sql
                        sql = "UPDATE Books SET Title = '" & Replace(title, "'", "''") & "', Author = '" & Replace(author, "'", "''") & "', ISBN = '" & Replace(isbn, "'", "''") & "', PublishedYear = " & year & " WHERE ID = " & id
                        conn.Execute sql
                        Response.Write "<p class='message'>Book updated successfully!</p>"
                    Else
                        Response.Write "<p class='error'>Published Year must be a number!</p>"
                    End If
                Else
                    Response.Write "<p class='error'>All fields are required!</p>"
                End If
            End If
        %>
        <form method="post" onsubmit="return validateBookForm();">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<%=rs("Title")%>">
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" value="<%=rs("Author")%>">
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" value="<%=rs("ISBN")%>">
            <label for="year">Published Year:</label>
            <input type="text" id="year" name="year" value="<%=rs("PublishedYear")%>">
            <input type="submit" name="submit" value="Update Book">
        </form>
        <%
        Else
            Response.Write "<p class='error'>Book not found!</p>"
        End If
        rs.Close
        Set rs = Nothing
        %>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
