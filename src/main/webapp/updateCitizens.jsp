<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Citizens</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            overflow: hidden; /* Prevent scroll bars */
        }

        /* Header */
        .header {
            background-color: #696969;
            color: white;
            padding: 20px;
            position: relative;
            width: 100%;
            display: flex; /* Use flexbox to align items */
            justify-content: space-between; /* Space between items */
            align-items: center; /* Center items vertically */
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
            flex: 1; /* Allow the title to take available space */
            text-align: center; /* Center the title */
        }

        .header .admin-name {
            font-size: 16px;
            margin-left: auto; /* Push the admin name to the right */
            margin-right: 30px
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
            overflow-y: auto; /* Allow scrolling in sidebar if needed */
        }

        .sidebar .dropdown {
            position: relative;
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
            background-color: #007FFF;
            width: 100%;
        }

        /* Main content */
        .content {
            width: 85%;
            padding: 20px;
            background-color: white;
            overflow-y: auto; /* Allow scrolling if content is too large */
            box-sizing: border-box; /* Include padding in width calculation */
        }

        /* Table styles */
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
            background-color: lightblue;
        }

        tr:hover {
            background-color: lightblue;
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

    <!-- Header -->
    <div class="header">
        <h1>Update Citizens</h1>
        <div class="admin-name">Welcome, <strong>${lastName} ${firstName}</strong></div>
    </div>

    <!-- Main Container for Sidebar and Content -->
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
            <a href="/user/profile" class="profile-link">Profile</a>
            <a href="/">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Citizens List</h2>
            <table>
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Mobileno</th>
                        <th>Update</th>
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
                            
                            <td class="action-links">
                                <a href="/citizen/edit/${citizen.username}">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
