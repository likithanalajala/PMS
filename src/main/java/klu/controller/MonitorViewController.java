package klu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/monitor")
public class MonitorViewController {

    // Mapping for the citizen login page
    @GetMapping("/login")
    public ModelAndView monitorLogin() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("monitorlogin");  // This will map to citizenlogin.jsp
        return MV;
    }

    // Mapping for the citizen signup page
    @GetMapping("/signup")
    public ModelAndView citizenSignup() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("monitorsignup");  // This will map to citizensignup.jsp
        return MV;
    }
    
    @GetMapping("/home")
    public ModelAndView monitorHomePage(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        String firstName = (String) session.getAttribute("firstName");
        String lastName = (String) session.getAttribute("lastName");
        MV.addObject("firstName", firstName);
        MV.addObject("lastName", lastName);
        MV.setViewName("monitorhome");
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
        MV.addObject("location", session.getAttribute("location"));
        MV.addObject("password", session.getAttribute("password"));
        MV.setViewName("monitorprofile");
        return MV;
    }
    
    @GetMapping("/issues")
    public ModelAndView showIssues(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        MV.addObject("firstName", session.getAttribute("firstName"));
        MV.addObject("lastName", session.getAttribute("lastName"));
        // Add any other data required for the issues page here
        MV.setViewName("moderatorissues"); // This will map to monitorissues.jsp
        return MV;
    }
}
