<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Citizen</title>
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
            display: flex;
            justify-content: space-between; /* Space between items */
            align-items: center; /* Center items vertically */
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
            flex: 1;
            text-align: center; /* Center the title */
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
            background-color: lightgray;
        }

        /* Main content */
        .content {
            width: 85%;
            padding: 20px;
            background-color: white;
            overflow-y: auto; /* Allow scrolling if content is too large */
            box-sizing: border-box;
        }

        /* Form styling */
        form {
            width: 60%;
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

        /* Success or error messages */
        .message {
            margin-top: 20px;
            font-weight: bold;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
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
                    <a href="/citizens/add">Add Citizen</a>
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
            <h2>Edit Citizen</h2>
            <form action="/citizen/update" method="post">
                <input type="hidden" name="id" value="${citizen.id}" />
                
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" value="${citizen.firstname}" required />

                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" value="${citizen.lastname}" required />

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${citizen.username}" readonly />

                <label for="emailid">Email:</label>
                <input type="email" id="emailid" name="emailid" value="${citizen.emailid}" required />

                <label for="position">Mobile No:</label>
                <input type="text" id="position" name="position" value="${citizen.mobileno}" required />

                <button type="submit">Update Citizen</button>
            </form>
            
            <!-- Display Success or Error Message -->
            <c:if test="${not empty successMessage}">
                <p class="message success">${successMessage}</p>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <p class="message error">${errorMessage}</p>
            </c:if>
        </div>
    </div>

</body>
</html>
