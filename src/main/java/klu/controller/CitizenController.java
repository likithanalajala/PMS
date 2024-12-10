package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

import klu.model.Citizen;
import klu.model.CitizenManager;
import klu.model.Issue;
import klu.repository.CitizenRepository;
import klu.repository.IssueRepository;

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
    
 // Mapping for the add citizen page
    @GetMapping("/addCitizen")
    public ModelAndView addCitizenPage() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("addCitizen");  // This will map to addCitizen.jsp
        MV.addObject("citizen", new Citizen());  // Initialize Citizen object
        return MV;
    }

    // Handling the POST request to save the citizen
    @PostMapping("/addCitizen")
    public ModelAndView addCitizen(Citizen citizen) {
        ModelAndView MV = new ModelAndView();

        String result = CM.addCitizen(citizen);
        if ("Citizen added successfully".equals(result)) {
            MV.addObject("message", "Citizen added successfully!");
        } else {
            MV.addObject("message", "Error: " + result);
        }

        MV.setViewName("adminhome");  // Redirecting back to admin home
        return MV;
    }
    
    @Autowired
    CitizenRepository CR;
    
    @PostMapping("/update")
    public ModelAndView updateCitizen(@ModelAttribute Citizen updatedCitizen) {
        ModelAndView MV = new ModelAndView();

        // Fetch the existing politician
        Citizen existingCitizen = CR.findById(updatedCitizen.getId()).orElse(null);

        if (existingCitizen != null) {
            // Update the fields
            existingCitizen.setFirstname(updatedCitizen.getFirstname());
            existingCitizen.setLastname(updatedCitizen.getLastname());
            existingCitizen.setEmailid(updatedCitizen.getEmailid());
            existingCitizen.setMobileno(updatedCitizen.getMobileno());
            existingCitizen.setUsername(updatedCitizen.getUsername());

            // Save the updated politician back to the database
            CR.save(existingCitizen);

            // Add success message
            MV.addObject("successMessage", "Citizen details updated successfully!");
        } else {
            // Add error message if the politician does not exist
            MV.addObject("errorMessage", "Citizen not found!");
        }

        // Fetch the updated list of politicians to display
        List<Citizen> citizensList = CR.findAll();
        MV.addObject("citizens", citizensList);

        // Set the view to the updatePoliticians page
        MV.setViewName("updateCitizens");

        return MV;
    }
    
    @Autowired
    IssueRepository IR;

    @GetMapping("/viewStatus")
    public ModelAndView viewStatus(HttpSession session) {
        ModelAndView MV = new ModelAndView("viewStatus");
        try {
            // Retrieve the logged-in citizen's username from the session
            String citizenUsername = (String) session.getAttribute("username");
            if (citizenUsername == null) {
            	MV.addObject("errorMessage", "User not logged in.");
                return MV;
            }

            // Fetch issues related to the logged-in citizen
            List<Issue> citizenIssues = IR.findByCitizenUname(citizenUsername);
            MV.addObject("issues", citizenIssues);

        } catch (Exception e) {
        	MV.addObject("errorMessage", "An error occurred while retrieving issues.");
        }
        return MV;
    }


}
