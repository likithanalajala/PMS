package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import jakarta.servlet.http.HttpSession;

import klu.model.Citizen;
import klu.model.CitizenManager;

@RestController
@RequestMapping("/citizen")
public class CitizenController {

    @Autowired
    CitizenManager CM;
    
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Citizen C, HttpSession session) {
        String response = CM.login(C.getUsername(), C.getPassword());
        if (response.equals("Succesfully Logined :)")) {
            Citizen citizen = CM.getCitizenByUsername(C.getUsername());
            session.setAttribute("firstName", citizen.getFirstname());
            session.setAttribute("lastName", citizen.getLastname());
            session.setAttribute("username", citizen.getUsername());
            session.setAttribute("email", citizen.getEmailid());
            session.setAttribute("mobile", citizen.getMobileno());
            session.setAttribute("password", citizen.getPassword());
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.status(401).body("Invalid Credentials :(");
        }
    }
    
    @PostMapping("/signup")
    public ResponseEntity<String> signUp(@RequestBody Citizen C) {
    	
    	String email = C.getEmailid();
        String mobile = C.getMobileno();
        
        // Validate email ends with @gmail.com
        if (!email.endsWith("@gmail.com")) {
            return ResponseEntity.status(400).body("Email must end with @gmail.com");
        }

        // Validate mobile number has exactly 10 digits
        if (mobile == null || !mobile.matches("\\d{10}")) {
            return ResponseEntity.status(400).body("Mobile number must have exactly 10 digits");
        }
    	
        String result = CM.signUp(C);

        if (result.equals("New user has been added")) {
        	return ResponseEntity.ok("User successfully signed up");// Redirect to citizen login after signup
        } else {
        	 return ResponseEntity.status(400).body(result);
        }
    }
   
}
