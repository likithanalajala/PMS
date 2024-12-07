<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Home</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow: hidden;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
            box-sizing: border-box;
        }
        header h1 {
            margin: 0;
            font-size: 28px;
        }
        .user-info {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 18px;
        }
        nav {
            background-color: #333;
            overflow: hidden;
            display: flex;
            justify-content: space-around;
            height: 60px;
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
            padding: 18px 0;
            text-decoration: none;
        }
        nav ul li a:hover {
            background-color: #111;
        }
        .content {
            height: calc(100% - 140px);
            display: flex;
            justify-content: center;
            background-color: #f4f4f4;
            box-sizing: border-box;
            padding: 20px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <header>
        <div class="user-info">
            Welcome <strong><%= request.getAttribute("firstName") %></strong> 
            <strong><%= request.getAttribute("lastName") %></strong>
        </div>
        <h1>Citizen Home</h1>
    </header>

    <nav>
        <ul>
            <li><a href="/citizen/viewPoliticians">Politicians</a></li>
            <li><a href="/citizen/issue" >Issue</a></li>
            <li><a href="/citizen/status">Status</a></li>
            <li><a href="/citizen/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
        </ul>
    </nav>

    <div class="content">
            <h2>Welcome to the Citizen Dashboard</h2>
            
    </div>
</body>
</html>
