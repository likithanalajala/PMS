<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Politician Home</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f4f6;
        }

        /* Header Styling */
        header {
            background: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
            box-sizing: border-box;
        }

        header h1 {
            margin: 0;
        }

        header div {
            font-size: 1.2em;
        }

        /* Navbar Styling */
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
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #1a73e8;
        }

        /* Content Styling */
        .content {
            padding: 20px;
            text-align: center;
        }

        .content h2 {
            color: #1a73e8;
        }

        .content p {
            color: #555;
        }
        .user-info {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 18px;
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="user-info">
            Welcome <strong>${firstName}</strong> <strong>${lastName}</strong>
        </div>
        <h1>Politician Home</h1>
    </header>

    <!-- Navbar -->
    <nav>
        <ul>
            <li><a href="/politician/viewIssues">View Issues</a></li>
            <li><a href="/politician/assignIssues">Assign Issues</a></li>
            <li><a href="/politician/viewFeedback">View Feedback</a></li>
            <li><a href="/politician/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
        </ul>
    </nav>

    <!-- Content -->
    <div class="content">
        <h2>Welcome to the Politician Dashboard</h2>
    </div>
</body>
</html>
