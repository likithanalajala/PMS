<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Citizen Sign Up</title>
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

        .SignupWindow {
            background-color: rgba(255, 255, 255, 0.9);
            width: 100%;
            max-width: 400px;
            padding: 15px 25px; /* Adjusted padding */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: slideIn 0.5s ease-in-out;
            box-sizing: border-box;
        }

        @keyframes slideIn {
            0% {
                transform: translateY(-50%);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .SignupWindow h2 {
            margin-bottom: 8px; /* Reduced margin */
            font-size: 22px;
            color: #333;
        }

        .input-container {
            margin-bottom: 12px; /* Reduced margin */
            text-align: left;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #555;
            margin-bottom: 4px; /* Reduced margin */
            display: block;
        }

        input[type="text"], input[type="password"], input[type="email"], input[type="tel"] {
            width: 100%;
            padding: 10px; /* Adjusted padding */
            margin-top: 4px; /* Reduced margin */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease-in-out;
        }

        input:focus {
            border-color: #00796b;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 121, 107, 0.5);
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #00796b;
            border: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 8px; /* Reduced margin */
            transition: background-color 0.3s, transform 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #004d40;
            transform: translateY(-3px);
        }

        .error-message {
            color: red;
            margin-top: 12px; /* Reduced margin */
            font-size: 14px;
        }

        .login-link {
            display: block;
            margin-top: 12px; /* Reduced margin */
            color: #00796b;
            text-decoration: none;
            font-size: 14px;
        }

        .login-link:hover {
            color: #004d40;
        }

        @media (max-width: 500px) {
            .SignupWindow {
                width: 90%;
                padding: 15px;
            }

            .SignupWindow h2 {
                font-size: 20px;
            }

            input[type="submit"] {
                font-size: 14px;
            }

            .login-link {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="SignupWindow">
        <h2>Citizen Signup</h2>
        <form id="signupForm">
            <label for="firstname">First Name:</label>
            <input type="text" name="firstname" id="firstname" required>
            <label for="lastname">Last Name:</label>
            <input type="text" name="lastname" id="lastname" required>
            <label for="mobileno">Mobile No:</label>
            <input type="text" name="mobileno" id="mobileno" required>
            <label for="emailid">Email ID:</label>
            <input type="email" name="emailid" id="emailid" required>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
            <input type="submit" value="Sign Up">
        </form>
        <a href="/citizen/login" class="login-link">Already have an account? Login here</a>
        <p class="error-message" id="error-message"></p>
    </div>
    
    <script>
        document.getElementById("signupForm").addEventListener("submit", function(event) {
            event.preventDefault();
            var email = document.getElementById("emailid").value;
            var mobile = document.getElementById("mobileno").value;
            var errorMessage = document.getElementById("error-message");

            // Clear any previous error messages
            errorMessage.innerText = "";

            // Email validation: Check if email ends with @gmail.com
            if (!email.endsWith("@gmail.com")) {
                errorMessage.innerText = "Email must end with @gmail.com";
                return; // Stop form submission
            }

            // Mobile number validation: Check if mobile number has exactly 10 digits
            var mobilePattern = /^\d{10}$/;
            if (!mobilePattern.test(mobile)) {
                errorMessage.innerText = "Mobile number must have exactly 10 digits";
                return; // Stop form submission
            }

            // If both validations pass, submit the form
            const formData = {
                firstname: document.getElementById("firstname").value,
                lastname: document.getElementById("lastname").value,
                mobileno: document.getElementById("mobileno").value,
                emailid: document.getElementById("emailid").value,
                username: document.getElementById("username").value,
                password: document.getElementById("password").value
            };

            fetch("/citizen/signup", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(formData)
            })
            .then(response => {
                if (response.ok) {
                    window.location.href = "/citizen/login";
                } else {
                    return response.text().then(text => {
                        errorMessage.innerText = text;
                    });
                }
            })
            .catch(error => {
                errorMessage.innerText = "An error occurred. Please try again.";
            });
        });
    </script>
</body>
</html>
