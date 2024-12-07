<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Politician Login</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
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

        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            max-width: 800px;
            width: 90%;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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

        .image-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f5f5f5;
            padding: 20px;
        }

        .image-section img {
            max-width: 100%;
            border-radius: 10px;
        }

        .form-section {
            flex: 1;
            padding: 40px;
            text-align: center;
        }

        .form-section h2 {
            margin-bottom: 20px;
            font-size: 26px;
            color: #333;
        }

        .input-container {
            position: relative;
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #004d99;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 77, 153, 0.5);
        }

        .eye-icon {
            position: absolute;
            right: 10px;
            top: 15px;
            cursor: pointer;
            color: #004d99;
            font-size: 18px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #004d99;
            border: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            transition: background-color 0.3s, transform 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #003366;
            transform: translateY(-3px);
        }

        .error-message {
            color: red;
            margin-top: 15px;
            font-size: 14px;
            display: none;
        }

        .signup-link {
            display: block;
            margin-top: 15px;
            color: #004d99;
            text-decoration: none;
            font-size: 14px;
        }

        .signup-link:hover {
            color: #003366;
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }

            .image-section {
                display: none;
            }

            .form-section {
                padding: 30px;
            }

            .form-section h2 {
                font-size: 22px;
            }

            input[type="submit"] {
                font-size: 14px;
            }

            .signup-link {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="image-section">
      <img src="${pageContext.request.contextPath}/images/politician.jpg" alt="Politician Illustration">
      

    </div>
    <div class="form-section">
        <h2>Politician Login</h2>
        <form id="politicianLoginForm" onsubmit="return handleLogin(event)">
            <div class="input-container">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="input-container">
                <label for="password">Password:</label>
                <div style="position: relative;">
                    <input type="password" id="password" name="password" required>
                    <span class="eye-icon" id="togglePassword" onclick="togglePassword()">👁️</span>
                </div>
            </div>

            <input type="submit" value="Login">
            <div class="error-message" id="error-message"></div>
        </form>
        <a href="/politician/signup" class="signup-link">Don't have an account? Sign Up</a>
    </div>
</div>

<script>
    async function handleLogin(event) {
        event.preventDefault();

        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        const response = await fetch("/politician/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ username, password }),
        });

        const errorMessage = document.getElementById("error-message");
        if (response.ok) {
            window.location.href = "/politician/home";
        } else {
            const message = await response.text();
            errorMessage.innerText = message;
            errorMessage.style.display = "block";
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
