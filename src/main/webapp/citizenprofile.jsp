<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Profile</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow: hidden; /* Prevent scrolling */
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px; /* Increased padding for a taller header */
            text-align: center;
            position: relative;
            box-sizing: border-box;
        }
        header h1 {
            margin: 0;
            font-size: 28px; /* Increased font size for the title */
        }
        .user-info {
            position: absolute;
            top: 20px; /* Adjusted for larger padding */
            right: 20px;
            font-size: 18px;
        }
        nav {
            background-color: #333;
            overflow: hidden;
            display: flex;
            justify-content: space-around;
            height: 60px; /* Increased height of the navbar */
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around;
            width: 100%;
        }
        nav ul li {
            flex: 1;
        }
        nav ul li a {
            display: block;
            color: white;
            text-align: center;
            padding: 18px 0; /* Adjusted padding to fit the increased navbar height */
            text-decoration: none;
        }
        nav ul li a:hover {
            background-color: #111;
        }
        .content {
            height: calc(100% - 140px); /* Adjusted to fit the larger header and navbar */
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f4;
            box-sizing: border-box;
        }
        .profile-container {
            background-color: #fff; /* White background for the profile section */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            padding: 20px; /* Padding inside the container */
            max-width: 600px; /* Maximum width for the container */
            width: 100%; /* Full width on smaller screens */
            text-align: left; /* Align text to the left */
        }
        .profile-container h2 {
            text-align: center; /* Center the heading */
            color: #4CAF50; /* Heading color */
        }
        .profile-table {
            width: 100%; /* Full width for the table */
            margin-top: 20px; /* Space above the table */
            border-collapse: collapse; /* Remove space between cells */
        }
        .profile-table th, .profile-table td {
            text-align: left; /* Align text to the left */
            padding: 10px; /* Padding for cells */
            color: #333; /* Dark text color */
        }
        .profile-table th {
            background-color: #4CAF50; /* Green background for header */
            color: white; /* White text for header */
        }
        .profile-table td {
            border-bottom: 0px solid #ddd; /* Bottom border for rows */
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="user-info">
            Welcome <strong>${sessionScope.firstName}</strong> 
            <strong>${sessionScope.lastName}</strong>
        </div>
        <h1>Citizen Profile</h1>
    </header>

    <nav>
        <ul>
            <li><a href="/citizen/viewPoliticians">Politicians</a></li>
            <li><a href="/citizen/issue">Issue</a></li>
            <li><a href="/citizen/status">Status</a></li>
            <li><a href="/citizen/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
        </ul>
    </nav>

    <!-- Profile Content -->
    <div class="content">
        <div class="profile-container">
            <h2>Your Profile Details</h2>
            <table class="profile-table">
                <tr>
                    <th>Field</th>
                    <th>Details</th>
                </tr>
                <tr>
                    <td><strong>First Name:</strong></td>
                    <td>${sessionScope.firstName}</td>
                </tr>
                <tr>
                    <td><strong>Last Name:</strong></td>
                    <td>${sessionScope.lastName}</td>
                </tr>
                <tr>
                    <td><strong>Username:</strong></td>
                    <td>${sessionScope.username}</td>
                </tr>
                <tr>
                    <td><strong>Email:</strong></td>
                    <td>${sessionScope.email}</td>
                </tr>
                <tr>
                    <td><strong>Mobile:</strong></td>
                    <td>${sessionScope.mobile}</td>
                </tr>
                <tr>
                    <td><strong>Password:</strong></td>
                    <td>${sessionScope.password}</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
