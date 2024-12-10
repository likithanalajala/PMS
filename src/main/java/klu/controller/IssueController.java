package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import klu.model.Citizen;
import klu.model.Issue;
import klu.repository.CitizenRepository;
import klu.repository.IssueRepository;
import klu.repository.PoliticianRepository;

@Controller
@RequestMapping("/citizen")
public class IssueController {

    @Autowired
    private IssueRepository issueRepository;
    
    @Autowired
    private CitizenRepository citizenRepository;

    @Autowired
    private PoliticianRepository politicianRepository;

    @GetMapping("/issue")
    public ModelAndView showIssueForm() {
        ModelAndView modelAndView = new ModelAndView("issue");
        modelAndView.addObject("issue", new Issue());
        modelAndView.addObject("politicians", politicianRepository.findAll());
        return modelAndView;
    }

    @PostMapping("/submitIssue")
    public ModelAndView submitIssue(
        @RequestParam("title") String title,
        @RequestParam("politicianName") String politicianName,
        @RequestParam("politicianUsername") String politicianUsername,
        @RequestParam("description") String description,
        HttpSession session
    ) {
        ModelAndView modelAndView = new ModelAndView("issue");
        try {
            // Retrieve logged-in citizen's username from the session
            String citizenUsername = (String) session.getAttribute("username");
            if (citizenUsername == null) {
                modelAndView.addObject("errorMessage", "User not logged in.");
                return modelAndView; // Return to the same page if the user is not logged in
            }

            // Fetch the Citizen object using the citizenUsername
            Citizen citizen = citizenRepository.findByUsername(citizenUsername);
            if (citizen == null) {
                modelAndView.addObject("errorMessage", "Citizen not found.");
                return modelAndView; // Return to the same page if the citizen is not found
            }

            // Combine first name and last name to create the citizen's full name (username)
            String fullCitizenName = citizen.getFirstname() + " " + citizen.getLastname();
            String CitizenUname = citizen.getUsername();

            // Create and save the issue
            Issue issue = new Issue();
            issue.setTitle(title);
            issue.setPoliticianName(politicianName);
            issue.setPoliticianUsername(politicianUsername);
            issue.setDescription(description);
            issue.setCitizenUsername(fullCitizenName);  // Set full citizen name
            issue.setCitizenUname(CitizenUname);
            issue.setStatus("Pending");
            
            issueRepository.save(issue);

            // Add success message and reset the form
            modelAndView.addObject("successMessage", "Issue submitted successfully!");
            modelAndView.addObject("issue", new Issue());  // Reset the issue form
            modelAndView.addObject("politicians", politicianRepository.findAll());

            return modelAndView; // Return to the same JSP page after successful submission
        } catch (Exception e) {
            modelAndView.addObject("errorMessage", "An error occurred while submitting the issue.");
            return modelAndView; // Return to the same page in case of an error
        }
    }

}
   


