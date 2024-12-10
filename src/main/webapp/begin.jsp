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
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
        }

        /* Main content container */
        .content {
            flex: 1;
        }

        /* Background parallax effect */
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('images/bg5.jpg') no-repeat center center fixed;
            background-size: cover;
            z-index: -1;
            animation: parallax 10s infinite linear;
        }

        @keyframes parallax {
            0% { transform: translateY(0); }
            50% { transform: translateY(10px); }
            100% { transform: translateY(0); }
        }

        /* Project Name Section */
        .project-name {
            text-align: center;
            padding: 50px 0;
            font-size: 3em;
            font-weight: bold;
            color: #fff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
            font-style: italic;
        }

        /* Navigation Bar */
        .navbar {
            background-color: rgba(0, 123, 255, 0.7);
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            display: inline-block;
            font-size: 18px;
            font-weight: bold;
        }

        .navbar a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }

        /* Description Section */
        .description {
            text-align: center;
            padding: 40px;
            font-size: 18px;
            background-color: rgba(255, 255, 255, 0.85);
            color: #495057;
            margin: 20px auto;
            width: 80%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: all 0.4s ease-in-out;
            font-size: 18px;
            position: relative;
            overflow: hidden;
        }

        .window:before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300%;
            height: 300%;
            background-color: rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease-in-out;
            border-radius: 50%;
            transform: translate(-50%, -50%);
            z-index: 0;
        }

        .window:hover:before {
            width: 0;
            height: 0;
        }

        .window:hover {
            background-color: #218838;
            transform: translateY(-10px);
        }

        .window a {
            color: white;
            text-decoration: none;
            position: relative;
            z-index: 1;
        }

        .window:active {
            transform: translateY(2px);
        }

        /* Footer Section */
        footer {
            background-color: #343a40; /* Dark gray footer */
            color: white;
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

    <!-- Background Parallax Effect -->
    <div class="background"></div>

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
        © Copyright 2021 by K L Deemed to be University. All Rights Reserved.
    </footer>

</body>
</html>
