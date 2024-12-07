<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Politicians</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-links a {
            margin-right: 10px;
            color: blue;
            text-decoration: none;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Update Politicians</h1>

    <!-- Display logged-in user's name -->
    <p>Welcome, ${firstName} ${lastName}</p>

    <!-- Politicians Table -->
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Position</th>
                <th>Location</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="politician" items="${politicians}">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${politician.firstname}</td>
                    <td>${politician.lastname}</td>
                    <td>${politician.username}</td>
                    <td>${politician.emailid}</td>
                    <td>${politician.position}</td>
                    <td>${politician.location}</td>
                    <td class="action-links">
                        <a href="/politician/edit/${politician.username}">Edit</a>
                        <!--  <a href="/politician/delete/${politician.id}" onclick="return confirm('Are you sure you want to delete this politician?');">Delete</a>  -->
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
