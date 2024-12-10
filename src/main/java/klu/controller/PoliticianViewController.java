package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import klu.model.Politician;
import klu.repository.PoliticianRepository;

@Controller
@RequestMapping("/politician")
public class PoliticianViewController {

    // Mapping for the politician login page
    @GetMapping("/login")
    public ModelAndView politicianLogin() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("politicianlogin");  // This will map to politician_login.jsp
        return MV;
    }

    // Mapping for the politician signup page
    @GetMapping("/signup")
    public ModelAndView politicianSignup() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("politiciansignup");  // This will map to politician_signup.jsp
        return MV;
    }
    
    @GetMapping("/home")
    public ModelAndView politicianHomePage(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        String firstName = (String) session.getAttribute("firstName");
        String lastName = (String) session.getAttribute("lastName");
        MV.addObject("firstName", firstName);
        MV.addObject("lastName", lastName);
        MV.setViewName("politicianhome");
        return MV;
    }
    
    @GetMapping("/profile")
    public ModelAndView showProfile(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        MV.addObject("firstName", session.getAttribute("firstName"));
        MV.addObject("lastName", session.getAttribute("lastName"));
        MV.addObject("username", session.getAttribute("username"));
        MV.addObject("email", session.getAttribute("email"));
        MV.addObject("password", session.getAttribute("password"));
        MV.addObject("position", session.getAttribute("position"));
        MV.addObject("location", session.getAttribute("location"));
        MV.setViewName("politicianprofile");
        return MV;
    }
    
    @Autowired
    PoliticianRepository PR;
    
    @GetMapping("/edit/{username}")
    public ModelAndView editPolitician(@PathVariable String username) {
        ModelAndView MV = new ModelAndView();

        // Fetch the politician by username
        Politician politician = PR.findByUsername(username);

        if (politician != null) {
            MV.addObject("politician", politician);
            MV.setViewName("editPolitician");
        } else {
            MV.addObject("error", "Politician not found!");
            MV.setViewName("updatePoliticians");
        }

        return MV;
    }
    
    @GetMapping("/delete")
    public ModelAndView showDeletePoliticiansPage() {
        ModelAndView MV = new ModelAndView();
        MV.addObject("politicians", PR.findAll()); // Fetch all politicians
        MV.setViewName("deletePoliticians"); // Map to deletePoliticians.jsp
        return MV;
    }

    @GetMapping("/delete/{username}")
    public ModelAndView deletePolitician(@PathVariable String username) {
        ModelAndView MV = new ModelAndView();
        try {
            Politician politician = PR.findByUsername(username);
            if (politician != null) {
                PR.delete(politician); // Delete the politician from the database
                MV.addObject("successMessage", "Politician deleted successfully!");
            } else {
                MV.addObject("errorMessage", "Politician not found!");
            }
        } catch (Exception e) {
            MV.addObject("errorMessage", "An error occurred while deleting the politician.");
        }
        MV.addObject("politicians", PR.findAll()); // Fetch updated list of politicians
        MV.setViewName("deletePoliticians");
        return MV;
    }


}
