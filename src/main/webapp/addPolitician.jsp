<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Politician</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            overflow: hidden; /* Prevent scroll bars */
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
            flex: 1; /* Allow the title to take available space */
            text-align: center; /* Center the title */
        }

        /* Main Container */
        .main-container {
            display: flex;
            height: calc(100% - 60px);
        }

        /* Sidebar */
        .sidebar {
            width: 15%;
            background-color: grey;
            padding-top: 20px;
            color: white;
            overflow-y: auto;
        }
        
        .sidebar .dropdown {
            position: relative;
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
            position: relative;
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

        .dropdown-content a:hover {
            background-color: lightgray;
            width: 100%;
        }
        /* Content */
        .content {
            width: 85%;
            padding: 20px;
            background-color: #f4f4f4;
            overflow-y: auto;
            box-sizing: border-box;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background: lightblue;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group label {
            flex: 1;
            font-weight: bold;
        }

        .form-group input {
            flex: 2;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px 20px;
            background-color: blue;
            color: white;
            border: none;
            cursor: pointer;
            width: 25%;
            display: block;
            margin: 0 auto;
        }
      

        h2 {
            text-align: center; /* Center the text inside h2 */
        }
        
        button:hover {
            background-color: darkblue;
        }

        .success-message {
            color: green;
            font-weight: bold;
            margin-top: 20px;
            text-align: center;
        }
        
        .header .admin-name {
            font-size: 16px;
            margin-left: auto; /* Push the admin name to the right */
            margin-right: 30px
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Add Politician</h1>
        <div class="admin-name">Welcome, <strong>${lastName} ${firstName}</strong></div>
    </div>

    <!-- Main Container -->
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
                    <a href="/citizen/addCitizen">Add Citizen</a>
                    <a href="/citizen/delete">Delete Citizen</a>
                    <a href="/citizen/update">Update Citizen</a>
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
            <a href="/home">Analysis</a>
            <a href="#" class="profile-link">Profile</a>
            <a href="/">Logout</a>
        </div>

        <!-- Content -->
        <div class="content">
          <h2>Add Politician</h2>
            <form action="/politician/add" method="post">
                <div class="form-group">
                    <label for="firstname">First Name:</label>
                    <input type="text" id="firstname" name="firstname" required />
                </div>

                <div class="form-group">
                    <label for="lastname">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" required />
                </div>

                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required />
                </div>

                <div class="form-group">
                    <label for="emailid">Email:</label>
                    <input type="email" id="emailid" name="emailid" required />
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required />
                </div>

                <div class="form-group">
                    <label for="position">Position:</label>
                    <input type="text" id="position" name="position" required />
                </div>

                <div class="form-group">
                    <label for="location">Location:</label>
                    <input type="text" id="location" name="location" required />
                </div>

                <button type="submit">Add Politician</button>
            </form>

            <!-- Success message -->
            <c:if test="${not empty successMessage}">
                <p class="success-message">${successMessage}</p>
            </c:if>
        </div>
    </div>

</body>
</html>
