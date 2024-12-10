<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports</title>
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
            padding: 20px;
            background-color: #f4f4f4;
            box-sizing: border-box;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
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
            <li><a href="/monitor/viewPoliticians">Politicians</a></li>
            <li><a href="/monitor/issues">Issues</a></li>
            <li><a href="/monitor/reports">Reports</a></li>
            <li><a href="/monitor/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
        </ul>
    </nav>

    <div class="content">
        <h2>Report Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Citizen Username</th>
                    <th>Politician Name</th>
                    <th>Date</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="report" items="${reports}">
                    <tr>
                        <td>${report.title}</td>
                        <td>${report.citizenUsername}</td>
                        <td>${report.politicianName}</td>
                        <td>${report.date}</td>
                        <td>${report.description}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
