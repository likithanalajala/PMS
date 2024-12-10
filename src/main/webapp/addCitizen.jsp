<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Citizen</title>
    <style>
        /* General body and html styling */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            overflow: hidden;
        }

        /* Header */
        .header {
            background-color: #696969;
            color: white;
            padding: 20px;
            position: relative;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
            flex: 1;
            text-align: center;
        }

        .header .admin-name {
            font-size: 16px;
            margin-left: auto;
            margin-right: 30px;
        }

        /* Wrapper for sidebar and content */
        .main-container {
            display: flex;
            height: calc(100% - 60px); /* Adjust to leave space for the header */
        }

        /* Sidebar */
        .sidebar {
            width: 15%;
            background-color: grey;
            padding-top: 20px;
            color: white;
            overflow-y: auto;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: lightblue;
        }

        .dropdown-content {
            display: none;
            background-color: #444;
            padding-left: 15px;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            font-size: 16px;
            padding: 10px 0;
        }

        /* Main content area */
        .content {
            width: 85%;
            padding: 20px;
            background-color: white;
            box-sizing: border-box;
        }

        /* Center form and message */
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 8px;
            background-color: lightblue;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container label {
            display: inline-block;
            width: 190px;
            font-weight: bold;
        }

        .form-container input {
            width: calc(100% - 50px);
            padding: 8px;
            margin-bottom: 15px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container button {
            width: 30%;
            padding: 10px;
            background-color: blue;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            display: block;
            margin: 0 auto;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        /* Success message */
        .success-message {
            text-align: center;
            margin-top: 20px;
            color: green;
            font-weight: bold;
        }

    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Admin Home</h1>
        <div class="admin-name">Welcome, <%= request.getAttribute("lastName") %> <%= request.getAttribute("firstName") %> </div>
    </div>

    <!-- Main Container for Sidebar and Content -->
    <div class="main-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="dropdown">
                <a href="#">Politicians</a>
                <div class="dropdown-content">
                    <a href="/politician/add">Add Politician</a>
                    <a href="/politician/delete">Delete Politician</a>
                    <a href="/updatePoliticians">Update Politician</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Citizens</a>
                <div class="dropdown-content">
                    <a href="/citizens/add">Add Citizen</a>
                    <a href="/citizens/delete">Delete Citizen</a>
                    <a href="/citizens/update">Update Citizen</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Monitors</a>
                <div class="dropdown-content">
                    <a href="/monitors/add">Add Monitor</a>
                    <a href="/monitors/delete">Delete Monitor</a>
                    <a href="/monitors/update">Update Monitor</a>
                </div>
            </div>
            <a href="/home">Create Feedback</a>
            <a href="/home">Analysis</a>
            <a href="#" class="profile-link">Profile</a>
            <a href="/">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <div class="form-container">
                <h2>Add Citizen</h2>

                <!-- Form to add a citizen -->
                <form:form action="/user/addCitizen" modelAttribute="citizen">
                    <div>
                        <form:label path="firstname">First Name:</form:label>
                        <form:input path="firstname" /><br/>
                    </div>

                    <div>
                        <form:label path="lastname">Last Name:</form:label>
                        <form:input path="lastname" /><br/>
                    </div>

                    <div>
                        <form:label path="mobileno">Mobile Number:</form:label>
                        <form:input path="mobileno" /><br/>
                    </div>

                    <div>
                        <form:label path="emailid">Email ID:</form:label>
                        <form:input path="emailid" /><br/>
                    </div>

                    <div>
                        <form:label path="username">Username:</form:label>
                        <form:input path="username" /><br/>
                    </div>

                    <div>
                        <form:label path="password">Password:</form:label>
                        <form:password path="password" /><br/>
                    </div>

                    <button type="submit">Add Citizen</button>
                </form:form>

                <!-- Success message -->
                <c:if test="${not empty successMessage}">
                    <div class="success-message">
                        ${successMessage}
                    </div>
                </c:if>
            </div>
        </div>
    </div>

</body>
</html>
