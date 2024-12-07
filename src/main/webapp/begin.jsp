<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <style>
        /* Basic styles for the page */
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            font-family: 'Arial', sans-serif;
            overflow-x: hidden;
        }

        /* Animated Background */
        .animated-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb, #a1c4fd, #c2e9fb, #d4fc79);
            background-size: 400% 400%;
            animation: gradientAnimation 12s infinite;
            z-index: -1;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Project Name Section */
        .project-name {
            text-align: center;
            padding: 50px 0;
            font-size: 3em;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            font-style: italic;
        }

        /* Navigation Bar */
        .navbar {
            background-color: rgba(0, 0, 0, 0.5);
            color: #ffffff;
            text-align: center;
            padding: 15px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .navbar a {
            color: #ffffff;
            text-decoration: none;
            padding: 14px 20px;
            display: inline-block;
            font-size: 18px;
            font-weight: bold;
            border-radius: 5px;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Description Section */
        .description {
            text-align: center;
            padding: 40px;
            font-size: 18px;
            background-color: rgba(255, 255, 255, 0.85);
            color: #333333;
            margin: 20px auto;
            width: 80%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Windows Section */
        .windows-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            padding: 50px;
            max-width: 90%;
            margin: 0 auto;
            box-sizing: border-box;
        }

        .window {
            background-color: rgba(255, 255, 255, 0.85);
            color: #333333;
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform 0.3s ease-in-out, background-color 0.3s ease-in-out;
            font-size: 18px;
        }

        .window:hover {
            background-color: rgba(255, 255, 255, 0.95);
            transform: translateY(-5px);
        }

        .window a {
            color: inherit;
            text-decoration: none;
        }

        /* Footer Section */
        footer {
            background-color: rgba(0, 0, 0, 0.7);
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
        }

        /* Mobile responsiveness */
        @media screen and (max-width: 768px) {
            .navbar {
                padding: 10px 0;
            }

            .project-name {
                font-size: 2.5em;
            }

            .windows-container {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- Animated Background -->
    <div class="animated-background"></div>

    <!-- Main Content -->
    <div class="content">
        <!-- Project Name Section -->
        <div class="project-name">
            POLITICAL MANAGEMENT SYSTEM
        </div>

        <!-- Navigation Bar -->
        <div class="navbar">
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Contact</a>
        </div>

        <!-- Description Section -->
        <div class="description">
            <p>This project provides an easy interaction between the elected representatives and citizens to solve their issues quicker.</p>
        </div>

        <!-- Windows Section -->
        <div class="windows-container">
            <div class="window">
                <a href="/login">Admin</a>
            </div>
            <div class="window">
                <a href="/politician/login">Politician</a>
            </div>
            <div class="window">
                <a href="/citizen/login">Citizen</a>
            </div>
            <div class="window">
                <a href="/monitor/login">Moderator</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        © Copyright 2024 by K L Deemed to be University. All Rights Reserved.
    </footer>

</body>
</html>
