<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Status</title>
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

        /* Form Container Styling */
        .form-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #1a73e8;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 1.1em;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .submit-btn {
            width: 100%;
            padding: 10px;
            font-size: 1.2em;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #34a853;
        }

        .message {
            color: #1a73e8;
            text-align: center;
            font-size: 1.1em;
        }

        .user-info {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 18px;
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
            <li><a href="/politician/postStatus">Post Updates</a></li>
            <li><a href="/politician/viewFeedback">View Feedback</a></li>
            <li><a href="/politician/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
        </ul>
    </nav>

    <!-- Content -->
    <div class="content">
        <div class="form-container">
            <h2>Update Issue Status</h2>
            
            <form action="/politician/postStatus" method="POST">
                <!-- Politician username (hidden) -->
                <input type="hidden" name="politicianUsername" value="${username}" />

                <!-- Issue Title Dropdown -->
                <div class="form-group">
                    <label for="issueTitle">Select Issue Title:</label>
                    <select id="issueTitle" name="issueTitle" required>
                        <option value="">--Select an Issue--</option>
                        <c:forEach var="issue" items="${issues}">
                            <option value="${issue.title}">${issue.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Status Dropdown -->
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="">--Select Status--</option>
                        <option value="Solved">Solved</option>
                        <option value="In Process">In Process</option>
                        <option value="Start Soon">Start Soon</option>
                    </select>
                </div>

                <button type="submit" class="submit-btn">Post Status</button>
            </form>

            <c:if test="${not empty successMessage}">
                <div class="message">${successMessage}</div>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="message">${errorMessage}</div>
            </c:if>
        </div>
    </div>
</body>
</html>
