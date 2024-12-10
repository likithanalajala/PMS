package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import klu.model.Citizen;
import klu.model.Politician;
import klu.repository.CitizenRepository;
import klu.repository.PoliticianRepository;

@Controller
@RequestMapping("/citizen")
public class CitizenViewController {

    // Mapping for the citizen login page
    @GetMapping("/login")
    public ModelAndView citizenLogin() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("citizenlogin");  // This will map to citizenlogin.jsp
        return MV;
    }

    // Mapping for the citizen signup page
    @GetMapping("/signup")
    public ModelAndView citizenSignup() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("citizensignup");  // This will map to citizensignup.jsp
        return MV;
    }
    
    @GetMapping("/home")
    public ModelAndView citizenHomePage(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        String firstName = (String) session.getAttribute("firstName");
        String lastName = (String) session.getAttribute("lastName");
        MV.addObject("firstName", firstName);
        MV.addObject("lastName", lastName);
        MV.setViewName("citizenhome");
        return MV;
    }
    
    @GetMapping("/profile")
    public ModelAndView showProfile(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        MV.addObject("firstName", session.getAttribute("firstName"));
        MV.addObject("lastName", session.getAttribute("lastName"));
        MV.addObject("username", session.getAttribute("username"));
        MV.addObject("email", session.getAttribute("email"));
        MV.addObject("mobile", session.getAttribute("mobile"));
        MV.addObject("password", session.getAttribute("password"));
        MV.setViewName("citizenprofile");
        return MV;
    }
    
    @Autowired
    private PoliticianRepository politicianRepository;

    @GetMapping("/viewPoliticians")
    public ModelAndView viewPoliticians(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        
        // Fetch the list of politicians
        List<Politician> politiciansList = politicianRepository.findAll();
        
        // Ensure the list is not empty (debugging step)
        System.out.println("Politicians List: " + politiciansList);
        
        // Adding the list of politicians to the model
        MV.addObject("politicians", politiciansList);
        
        // Adding firstName and lastName to the model from the session
        MV.addObject("firstName", session.getAttribute("firstName"));
        MV.addObject("lastName", session.getAttribute("lastName"));
        
        MV.setViewName("viewPoliticians");
        return MV;
    }
    
    @Autowired
    CitizenRepository CR;
    
    @GetMapping("/edit/{username}")
    public ModelAndView editCitizen(@PathVariable String username) {
        ModelAndView MV = new ModelAndView();

        // Fetch the politician by username
        Citizen citizen = CR.findByUsername(username);

        if (citizen != null) {
            MV.addObject("citizen", citizen);
            MV.setViewName("editCitizen");
        } else {
            MV.addObject("error", "Citizen not found!");
            MV.setViewName("updateCitizens");
        }

        return MV;
    }
    
 // Display the delete citizen page with the list of citizens
    @GetMapping("/delete")
    public ModelAndView deleteCitizenPage() {
        ModelAndView MV = new ModelAndView();
        MV.addObject("citizens", CR.findAll());
        MV.setViewName("deleteCitizens");
        return MV;
    }

    // Delete a citizen based on username
    @GetMapping("/delete/{username}")
    public ModelAndView deleteCitizen(@PathVariable String username) {
        ModelAndView MV = new ModelAndView();
        try {
        	Citizen citizen = CR.findByUsername(username);
            if (citizen != null) {
                CR.delete(citizen); // Delete the politician from the database
                MV.addObject("successMessage", "citizen deleted successfully!");
            } else {
                MV.addObject("errorMessage", "citizen not found!");
            }
        } catch (Exception e) {
            MV.addObject("errorMessage", "An error occurred while deleting the citizen.");
        }
        MV.addObject("citizens", CR.findAll()); // Fetch updated list of politicians
        MV.setViewName("deleteCitizens");
        return MV;
    }
    
}
