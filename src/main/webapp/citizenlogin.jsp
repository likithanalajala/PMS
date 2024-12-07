<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Citizen Login</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        html, body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(45deg, #ff9a9e, #fad0c4, #fbc2eb, #a1c4fd, #c2e9fb, #667eea);
            background-size: 300% 300%;
            animation: gradientBG 6s infinite;
        }

        @keyframes gradientBG {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .LoginWindow {
            position: relative;
            width: 1050px;
            height: 500px;
            display: flex;
            padding: 0;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            background-color: white;
            overflow: hidden;
            animation: slideDown 1.5s ease-out;
        }

        @keyframes slideDown {
            0% {
                transform: translateY(-100vh);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .left-panel {
            width: 600px;
            background-image: url('/images/image2.jpeg'); /* Path to the image */
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .right-panel {
            width: 450px;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: lightgray;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #00796b;
            box-shadow: 0 0 5px rgba(0, 121, 107, 0.5);
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #00796b;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #004d40;
            transform: translateY(-3px);
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 15px;
        }

        .signup-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #00796b;
            text-decoration: none;
        }

        .signup-link:hover {
            color: #004d40;
        }

        .eye-icon {
            position: absolute;
            right: 10px;
            top: 20px;
            cursor: pointer;
            color: #00796b;
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="LoginWindow">
    <div class="left-panel"></div>
    <div class="right-panel">
        <h2>Citizen Login</h2>
        <form id="loginForm" onsubmit="return handleLogin(event)">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <div style="position: relative;">
                <input type="password" id="password" name="password" required>
                <span class="eye-icon" id="togglePassword" onclick="togglePassword()">👁️</span>
            </div>
            <input type="submit" value="Login">
            <div class="error-message" id="error-message"></div>
        </form>
        <a href="/citizen/signup" class="signup-link">Don't have an account? Sign Up</a>
    </div>
</div>

<script>
    async function handleLogin(event) {
        event.preventDefault();

        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        const response = await fetch("/citizen/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ username, password }),
        });

        if (response.ok) {
            window.location.href = "/citizen/home";
        } else {
            const errorMessage = await response.text();
            document.getElementById("error-message").innerText = errorMessage;
        }
    }

    function togglePassword() {
        const passwordField = document.getElementById("password");
        const eyeIcon = document.getElementById("togglePassword");

        if (passwordField.type === "password") {
            passwordField.type = "text";
            eyeIcon.innerText = "👁️";
        } else {
            passwordField.type = "password";
            eyeIcon.innerText = "👁️";
        }
    }
</script>

</body>
</html>
