<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moderator - Issues</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        header h1 {
            margin: 0;
        }
        .sidebar {
            width: 200px;
            background-color: #333;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
        }
        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            display: block;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .main-content {
            margin-left: 200px;
            padding: 20px;
        }
        .issue-details {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .issue-details h2 {
            margin: 0;
            margin-bottom: 10px;
        }
        .issue-details p {
            margin: 5px 0;
        }
        .issue-details .actions {
            margin-top: 20px;
        }
        .issue-details .actions button {
            padding: 10px 15px;
            border: none;
            color: white;
            border-radius: 3px;
            cursor: pointer;
            margin-right: 10px;
        }
        .btn-resolve {
            background-color: #4CAF50;
        }
        .btn-cancel {
            background-color: #f44336;
        }
    </style>
</head>
<body>
    <header>
        <h1>Resolve Conflict</h1>
    </header>
    <div class="sidebar">
        <a href="moderatorHome.jsp">Home</a>
        <a href="monitorInteractions.jsp">Monitor Interactions</a>
        <a href="issue.jsp">Resolve Conflicts</a>
        <a href="userReports.jsp">User Reports</a>
        <a href="/">Logout</a>
    </div>
    <div class="main-content">
        <div class="issue-details">
            <h2>Issue Details</h2>
            <p><strong>Issue Title:</strong> Miscommunication on Project Update</p>
            <p><strong>Description:</strong> There was a lack of clarity regarding the project timeline, leading to confusion among team members.</p>
            <p><strong>Reported by:</strong> Citizen A</p>
            <p><strong>Date Reported:</strong> October 1, 2024</p>
            <div class="actions">
                <button class="btn-resolve" onclick="resolveIssue()">Resolve</button>
                <button class="btn-cancel" onclick="cancelIssue()">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        function resolveIssue() {
            alert("Issue has been resolved!");
            // Logic for resolving the issue can be added here
        }

        function cancelIssue() {
            alert("Issue resolution has been canceled!");
            // Logic for canceling the issue can be added here
        }
    </script>
</body>
</html>
