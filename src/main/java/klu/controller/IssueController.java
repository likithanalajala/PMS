package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String showIssueForm(Model model) {
        model.addAttribute("issue", new Issue());
        model.addAttribute("politicians", politicianRepository.findAll());
        return "issue";
    }

    @PostMapping("/submitIssue")
    public String submitIssue(
        @RequestParam("title") String title,@RequestParam("politicianName") String politicianName,
        @RequestParam("politicianUsername") String politicianUsername,
        @RequestParam("description") String description,
        HttpSession session, // Inject HttpSession to retrieve user details
        Model model
    ) {
        try {
            // Retrieve logged-in citizen's username from the session
            String citizenUsername = (String) session.getAttribute("username");
            if (citizenUsername == null) {
                model.addAttribute("errorMessage", "User not logged in.");
                return "issue"; // Return to the same page if the user is not logged in
            }

            // Fetch the Citizen object using the citizenUsername
            Citizen citizen = citizenRepository.findByUsername(citizenUsername);
            if (citizen == null) {
                model.addAttribute("errorMessage", "Citizen not found.");
                return "issue"; // Return to the same page if the citizen is not found
            }

            // Combine first name and last name to create the citizen's full name (username)
            String fullCitizenName = citizen.getFirstname() + " " + citizen.getLastname();

            // Create and save the issue
            Issue issue = new Issue();
            issue.setTitle(title);
            issue.setPoliticianName(politicianName);
            issue.setPoliticianUsername(politicianUsername);
            issue.setDescription(description);
            issue.setCitizenUsername(fullCitizenName);  // Set full citizen name

            issueRepository.save(issue);

            // Add success message and clear the form
            model.addAttribute("successMessage", "Issue submitted successfully!");
            model.addAttribute("issue", new Issue());  // Reset the issue form
            model.addAttribute("politicians", politicianRepository.findAll());

            return "issue"; // Return to the same JSP page after successful submission
        } catch (Exception e) {
            model.addAttribute("errorMessage", "An error occurred while submitting the issue.");
            return "issue"; // Return to the same page in case of an error
        }
    }

}
   


