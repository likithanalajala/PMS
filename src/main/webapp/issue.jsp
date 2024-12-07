<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Issue</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
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
            padding: 20px;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: #b3e0f2; /* Sky blue */
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        form {
            width: 100%;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group label {
            width: 20%; /* Set width for labels to align properly */
            font-weight: bold;
            text-align: left;
        }

        .form-group input[type="text"], 
        .form-group textarea, 
        .form-group select {
            width: 80%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 0 auto; /* Center align the button */
        }

        button:hover {
            background-color: #45a049;
        }

        .success-message {
            margin-top: 10px;
            color: green;
            font-weight: bold;
            text-align: center;
        }

        .error-message {
            margin-top: 10px;
            color: red;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="user-info">
            Welcome <strong>${sessionScope.firstName}</strong> 
            <strong>${sessionScope.lastName}</strong>
        </div>
        <h1>Citizen Home</h1>
    </header>

    <!-- Navigation Bar -->
    <nav>
        <ul>
            <li><a href="/citizen/viewPoliticians">Politicians</a></li>
            <li><a href="/citizen/issue" class="active">Issue</a></li>
            <li><a href="/citizen/status">Status</a></li>
            <li><a href="/citizen/profile">Profile</a></li>
            <li><a href="/">Logout</a></li>
        </ul>
    </nav>

    <!-- Content Area -->
    <div class="content">
        <div class="container">
            <h2>Submit an Issue</h2>
            <form action="/citizen/submitIssue" method="post">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required>
                </div>

                <div class="form-group">
                    <label for="politicianName">Politician:</label>
                    <select id="politicianName" name="politicianName" required>
                        <option value="" disabled selected>Select Politician</option>
                        <c:forEach var="politician" items="${politicians}">
                            <option value="${politician.firstname} ${politician.lastname}">
                                ${politician.firstname} ${politician.lastname}
                            </option>
                        </c:forEach>
                    </select>
                    
                </div>
                
                <div class="form-group">
                    <label for="politicianUsername">Politician Username:</label>
                     <select id="politicianUserame" name="politicianUsername" required>
                        <option value="" disabled selected>Select Politician Username</option>
                        <c:forEach var="politician" items="${politicians}">
                             <option value="${politician.username}">
                                       ${politician.username}
                             </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" rows="4" required></textarea>
                </div>

                <button type="submit">Submit</button>

                <!-- Success Message -->
                <c:if test="${not empty successMessage}">
                    <p class="success-message">${successMessage}</p>
                </c:if>

                <!-- Error Message -->
                <c:if test="${not empty errorMessage}">
                    <p class="error-message">${errorMessage}</p>
                </c:if>
            </form>
        </div>
    </div>
</body>
</html>
