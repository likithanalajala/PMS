package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import klu.model.Issue;
import klu.model.Politician;
import klu.model.PoliticianManager;
import klu.repository.IssueRepository;
import klu.repository.PoliticianRepository;

@Controller
@RequestMapping("/politician")
public class PoliticianController {

    @Autowired
    PoliticianManager PM;
 
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Politician P, HttpSession session) {
        String response = PM.login(P.getUsername(), P.getPassword());
        if (response.equals("Succesfully Logined :)")) {
            Politician politician = PM.getPoliticianByUsername(P.getUsername());
            session.setAttribute("firstName", politician.getFirstname());
            session.setAttribute("lastName", politician.getLastname());
            session.setAttribute("username", politician.getUsername());
            session.setAttribute("email", politician.getEmailid());
            session.setAttribute("password", politician.getPassword());
            session.setAttribute("position", politician.getPosition());
            session.setAttribute("location", politician.getLocation());
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.status(401).body("Invalid Credentials :(");
        }
    }
    
    @PostMapping("/signup")
    public ResponseEntity<String> signUp(@RequestBody Politician P) {
        String result = PM.signUp(P);

        if (result.equals("New user has been added")) {
        	return ResponseEntity.ok("User successfully signed up");// Redirect to politician login after signup
        } else {
        	 return ResponseEntity.status(400).body(result);
        }
    }
    
    @Autowired
    private IssueRepository issueRepository;

    @GetMapping("/viewIssues")
    public String viewIssues(HttpSession session, Model model) {
        // Retrieve logged-in politician's username
        String politicianUsername = (String) session.getAttribute("username");
        
        if (politicianUsername == null) {
            model.addAttribute("errorMessage", "User not logged in.");
            return "politicianhome"; // Redirect to home page or login page
        }

        System.out.println("Politician Username: " + politicianUsername);

        // Fetch issues for the logged-in politician
        List<Issue> issues = issueRepository.findByPoliticianUsername(politicianUsername);

        if (issues.isEmpty()) {
            model.addAttribute("infoMessage", "No issues found for the logged-in politician.");
        }

        model.addAttribute("issues", issues);
        return "viewIssues"; // JSP page to display the issues
    }
    
    @Autowired
    PoliticianRepository PR;
    
    @PostMapping("/update")
    public ModelAndView updatePolitician(@ModelAttribute Politician updatedPolitician) {
        ModelAndView MV = new ModelAndView();

        // Fetch the existing politician
        Politician existingPolitician = PR.findById(updatedPolitician.getId()).orElse(null);

        if (existingPolitician != null) {
            // Update the fields
            existingPolitician.setFirstname(updatedPolitician.getFirstname());
            existingPolitician.setLastname(updatedPolitician.getLastname());
            existingPolitician.setEmailid(updatedPolitician.getEmailid());
            existingPolitician.setPosition(updatedPolitician.getPosition());
            existingPolitician.setLocation(updatedPolitician.getLocation());

            // Save the updated politician back to the database
            PR.save(existingPolitician);

            // Add success message
            MV.addObject("successMessage", "Politician details updated successfully!");
        } else {
            // Add error message if the politician does not exist
            MV.addObject("errorMessage", "Politician not found!");
        }

        // Fetch the updated list of politicians to display
        List<Politician> politiciansList = PR.findAll();
        MV.addObject("politicians", politiciansList);

        // Set the view to the updatePoliticians page
        MV.setViewName("updatePoliticians");

        return MV;
    }



}
