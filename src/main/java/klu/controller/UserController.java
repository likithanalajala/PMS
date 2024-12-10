package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import klu.model.User;
import klu.model.UserManager;

@RestController
@RequestMapping("/user")
public class UserController {
	
		@Autowired
		UserManager UM;
		
	    @PostMapping("/login")
		    public ResponseEntity<String> login(@RequestBody User U, HttpSession session) {
		        String response = UM.login(U.getUsername(), U.getPassword());
		        if (response.equals("Succesfully Logined :)")) {
		            // Fetch the logged-in user details
		            User user = UM.getUserByUsername(U.getUsername());
		            // Set user details in session
		            session.setAttribute("firstName", user.getFirstname());
		            session.setAttribute("lastName", user.getLastname());
		            session.setAttribute("username", user.getUsername());
		            return ResponseEntity.ok("success");
		        } else {
		            return ResponseEntity.status(401).body("Invalid Credentials :(");
		        }
		}
		
	    @PostMapping("/signup")
	    public ResponseEntity<String> signUp(@RequestBody User U) {
	        // Validate password strength
	        String password = U.getPassword();
	        if (!isStrongPassword(password)) {
	            return ResponseEntity.status(400).body("Password must be at least 8 characters long, contain uppercase letters, lowercase letters, numbers, and special characters.");
	        }

	        String result = UM.signUp(U);
	        if (result.equals("New user has been added")) {
	            return ResponseEntity.ok("User successfully signed up");
	        } else {
	            return ResponseEntity.status(400).body(result);
	        }
	    }

	    // Password strength validation method
	    private boolean isStrongPassword(String password) {
	        String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=]).{8,}$";
	        return password.matches(regex);
	    }

		
		@GetMapping("/profile")
		public ModelAndView getProfile(HttpSession session) {
		    // Fetch the user details from the session
		    String username = (String) session.getAttribute("username");
		    if (username != null) {
		        User user = UM.getUserByUsername(username);
		        ModelAndView MP = new ModelAndView("profile");
		        MP.addObject("firstName", user.getFirstname());
		        MP.addObject("lastName", user.getLastname());
		        MP.addObject("username", user.getUsername());
		        MP.addObject("email", user.getEmailid());
		        MP.addObject("mobile", user.getMobileno()); // Add mobile number
		        MP.addObject("password", user.getPassword()); // Add password (be cautious with this)
		        return MP;
		    }
		    return new ModelAndView("error").addObject("message", "User not logged in.");
		}
		
	}