<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moderator Home</title>
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
            background-color: #f4f4f4;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <header>
        <div class="user-info">
            Welcome <strong><%= request.getAttribute("firstName") %></strong> 
            <strong><%= request.getAttribute("lastName") %></strong>
        </div>
        <h1>Moderator Home</h1>
    </header>

    <nav>
        <ul>
            <li><a href="viewPoliticians">Politicians</a></li>
            <li><a href="/monitor/issues">Issues</a></li>
            <li><a href="status">Status</a></li>
            <li><a href="/monitor/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
            
        </ul>
    </nav>

    <div class="content">
            <h2>Welcome to the Moderator Dashboard</h2>
            
        </div>
</body>
</html>
