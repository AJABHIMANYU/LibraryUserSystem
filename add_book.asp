<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
    <div class="container">
        <h1>Add Book</h1>
        <nav>
            <a href="index.asp">Home</a>
            <a href="users.asp">Manage Users</a>
            <a href="books.asp">Manage Books</a>
        </nav>
        <%
        If Request.Form("submit") <> "" Then
            Dim title, author, isbn, year
            title = Request.Form("title")
            author = Request.Form("author")
            isbn = Request.Form("isbn")
            year = Request.Form("year")
            
            If title <> "" And author <> "" And isbn <> "" And year <> "" Then
                If IsNumeric(year) Then
                    Dim sql
                    sql = "INSERT INTO Books (Title, Author, ISBN, PublishedYear) VALUES ('" & Replace(title, "'", "''") & "', '" & Replace(author, "'", "''") & "', '" & Replace(isbn, "'", "''") & "', " & year & ")"
                    conn.Execute sql
                    Response.Write "<p class='message'>Book added successfully!</p>"
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
            <input type="text" id="title" name="title">
            <label for="author">Author:</label>
            <input type="text" id="author" name="author">
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn">
            <label for="year">Published Year:</label>
            <input type="text" id="year" name="year">
            <input type="submit" name="submit" value="Add Book">
        </form>
    </div>
</body>
</html>
<!--#include file="includes/db_connection.asp"-->
