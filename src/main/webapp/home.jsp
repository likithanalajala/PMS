<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
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
            background-color: #4CAF50;
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
            background-color: #333;
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
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".sidebar a.profile-link").on("click", function(e) {
                e.preventDefault();
                $.ajax({
                    url: "/user/profile",
                    type: "GET",
                    success: function(data) {
                        $(".content").html(data);
                    },
                    error: function() {
                        alert("Error loading profile information.");
                    }
                });
            });
        });
    </script>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Admin Home</h1>
        <div class="admin-name">Welcome, <strong><%= request.getAttribute("lastName") %> <%= request.getAttribute("firstName") %> </strong></div>
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
            <a href="/home">Create Feedback</a>
            <a href="/home">Analysis</a>
            <a href="#" class="profile-link">Profile</a>
            <a href="/">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Welcome to the Admin Dashboard</h2>
            <p>Use the sidebar to navigate through the various sections of the system.</p>
        </div>
    </div>

</body>
</html>
