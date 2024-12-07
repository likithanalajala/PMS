<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Issues</title>
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

        /* Table Styling for Issues */
        .content {
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #1E90FF;
            color: white;
        }

        .header {
            margin-bottom: 20px;
        }

        .header h2 {
            color: #4CAF50;
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
            <li><a href="/politician/assignIssues">Assign Issues</a></li>
            <li><a href="/politician/viewFeedback">View Feedback</a></li>
            <li><a href="/politician/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
        </ul>
    </nav>

    <!-- Content -->
    <div class="content">
       
            <h2>Issues Assigned to You</h2>

        <c:if test="${not empty issues}">
            <table>
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Citizen Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="issue" items="${issues}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${issue.title}</td>
                            <td>${issue.description}</td>
                            <td>${issue.citizenUsername}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty issues}">
            <p>No issues assigned to you yet.</p>
        </c:if>
    </div>
</body>
</html>
