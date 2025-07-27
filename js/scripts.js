function confirmDelete(message) {
    return confirm(message);
}

function validateUserForm() {
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    if (!name || !email || !phone) {
        alert("All fields are required!");
        return false;
    }
    return true;
}

function validateBookForm() {
    var title = document.getElementById("title").value;
    var author = document.getElementById("author").value;
    var isbn = document.getElementById("isbn").value;
    var year = document.getElementById("year").value;
    if (!title || !author || !isbn || !year) {
        alert("All fields are required!");
        return false;
    }
    if (isNaN(year) || year < 1000 || year > new Date().getFullYear()) {
        alert("Please enter a valid year!");
        return false;
    }
    return true;
}
