<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            flex-direction: column;
            align-items: center;
            background-color: #f4f4f4;
            box-sizing: border-box;
            padding: 20px;
            overflow-y: auto;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <div class="user-info">
            Welcome <strong>${sessionScope.firstName}</strong> 
            <strong>${sessionScope.lastName}</strong>
        </div>
        <h1>Citizen Home</h1>
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

    <div class="content">
    <h2>List of Politicians</h2>
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>Name</th>
                <th>Username</th>
                <th>Position</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
            <!-- Use JSTL to loop through politicians list and display serial number -->
            <c:forEach var="politician" items="${politicians}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td> <!-- This will give you the serial number starting from 1 -->
                    <td>${politician.firstname} ${politician.lastname}</td>
                    <td>${politician.username}</td>
                    <td>${politician.position}</td>
                    <td>${politician.location}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>