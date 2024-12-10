<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Citizen</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        /* Header */
        .header {
            background-color: #696969;
            color: white;
            padding: 20px;
            position: relative;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
            flex: 1;
            text-align: center;
        }

        .header .admin-name {
            font-size: 16px;
            margin-left: auto;
            margin-right: 30px;
        }

        /* Wrapper for sidebar and content */
        .main-container {
            display: flex;
            height: calc(100% - 60px); /* Adjust to leave space for the header */
        }

        /* Sidebar */
        .sidebar {
            width: 15%;
            background-color: grey;
            padding-top: 20px;
            color: white;
            overflow-y: auto;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: lightblue;
        }

        .dropdown-content {
            display: none;
            position: relative;
            background-color: #444;
            padding-left: 15px;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            font-size: 16px;
            padding: 10px 0;
        }

        .dropdown-content a:hover {
            background-color: lightgray;
            width: 100%;
        }

        /* Main content */
        .content {
            width: 85%;
            padding: 20px;
            background-color: white;
            overflow-y: auto;
            box-sizing: border-box;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: left;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #7CB9E8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a.delete-link {
            color: red;
            text-decoration: none;
        }

        a.delete-link:hover {
            color: darkred;
        }

        /* Messages */
        .success-message {
            color: green;
            font-weight: bold;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Admin Home</h1>
        <div class="admin-name">Welcome, <strong>${lastName} ${firstName}</strong></div>
    </div>

    <!-- Main Container -->
    <div class="main-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="dropdown">
                <a href="#">Politicians</a>
                <div class="dropdown-content">
                    <a href="/politician/add">Add Politician</a>
                    <a href="/politician/delete">Delete Politician</a>
                    <a href="/updatePoliticians">Update Politician</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Citizens</a>
                <div class="dropdown-content">
                    <a href="/citizen/addCitizen">Add Citizen</a>
                    <a href="/citizens/delete">Delete Citizen</a>
                    <a href="/citizens/update">Update Citizen</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Monitors</a>
                <div class="dropdown-content">
                    <a href="/monitors/add">Add Monitor</a>
                    <a href="/monitors/delete">Delete Monitor</a>
                    <a href="/monitors/update">Update Monitor</a>
                </div>
            </div>
            <a href="/home">Analysis</a>
            <a href="#" class="profile-link">Profile</a>
            <a href="/">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Delete Citizen</h2>
            
            <!-- Success or Error Message -->
            <c:if test="${not empty successMessage}">
                <div class="success-message">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>

            <!-- Citizens Table -->
            <table>
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="citizen" items="${citizens}">
                        <tr>
                            <td>${citizen.firstname}</td>
                            <td>${citizen.lastname}</td>
                            <td>${citizen.username}</td>
                            <td>${citizen.emailid}</td>
                            <td>${citizen.mobileno}</td>
                            <td>
                                <a href="/citizen/delete/${citizen.username}" 
                                   class="delete-link" 
                                   onclick="return confirm('Are you sure you want to delete this citizen?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
