<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Politician</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            width: 50%;
            margin: auto;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
        }
        button {
            padding: 10px 20px;
            background-color: blue;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: darkblue;
        }
    </style>
</head>
<body>
    <h1>Edit Politician</h1>

    <form action="/politician/update" method="post">
        <input type="hidden" name="id" value="${politician.id}" />
        
        <label for="firstname">First Name:</label>
        <input type="text" id="firstname" name="firstname" value="${politician.firstname}" required />

        <label for="lastname">Last Name:</label>
        <input type="text" id="lastname" name="lastname" value="${politician.lastname}" required />

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="${politician.username}" readonly />

        <label for="emailid">Email:</label>
        <input type="email" id="emailid" name="emailid" value="${politician.emailid}" required />

        <label for="position">Position:</label>
        <input type="text" id="position" name="position" value="${politician.position}" required />

        <label for="location">Location:</label>
        <input type="text" id="location" name="location" value="${politician.location}" required />

        <button type="submit">Update Politician</button>
        
        <!-- Success/Error message here -->
        <c:if test="${not empty successMessage}">
            <p style="color: green; font-weight: bold; margin-top: 10px;">${successMessage}</p>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <p style="color: red; font-weight: bold; margin-top: 10px;">${errorMessage}</p>
        </c:if>
    </form>
</body>
</html>
