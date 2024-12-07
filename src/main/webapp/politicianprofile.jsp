<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Politician Profile</title>
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
            background: linear-gradient(to right, #1a73e8, #34a853);
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
            box-sizing: border-box;
        }

        header h1 {
            margin: 0;
        }

        .user-info {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 18px;
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

        /* Profile Content Styling */
        .profile-container {
            background-color: white;
            margin: 40px auto;
            padding: 30px;
            max-width: 400px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .profile-container h2 {
            color: #1a73e8;
            margin-bottom: 20px;
            text-align: center;
        }

        .profile-details {
            display: grid;
            grid-template-columns: 1fr 2fr;
            row-gap: 15px;
            column-gap: 10px;
            font-size: 18px;
            color: #555;
        }

        .profile-details strong {
            color: #333;
        }

        .profile-details div {
            align-self: center;
        }
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

    <!-- Profile Content -->
    <div class="profile-container">
        <h2>Politician Profile</h2>
        <div class="profile-details">
            <div><strong>First Name:</strong></div>
            <div>${firstName}</div>

            <div><strong>Last Name:</strong></div>
            <div>${lastName}</div>

            <div><strong>Username:</strong></div>
            <div>${username}</div>

            <div><strong>Email:</strong></div>
            <div>${email}</div>

            <div><strong>Password:</strong></div>
            <div>${password}</div>

            <div><strong>Position:</strong></div>
            <div>${position}</div>

            <div><strong>Location:</strong></div>
            <div>${location}</div>
        </div>
    </div>
</body>
</html>
