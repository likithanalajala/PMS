package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import klu.model.Citizen;
import klu.model.Politician;
import klu.repository.CitizenRepository;
import klu.repository.PoliticianRepository;

@Controller
@RequestMapping("/")
public class ViewController {
	
	@GetMapping("/login")
	public ModelAndView login()
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("login");
		return MV;
	}
	
	
	@GetMapping("/home")
    public ModelAndView homePage(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        String firstName = (String) session.getAttribute("firstName");
        String lastName = (String) session.getAttribute("lastName");
        MV.addObject("firstName", firstName);
        MV.addObject("lastName", lastName);
        MV.setViewName("home");
        return MV;
    }
	
	@GetMapping("/")
    public ModelAndView beginPage() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("begin");
        return MV;
    }
	
	@GetMapping("/signup")
    public ModelAndView signup() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("signup");
        return MV;
    }
	
	@Autowired
    private PoliticianRepository politicianRepository;

    @GetMapping("/updatePoliticians")
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
        
        MV.setViewName("updatePoliticians");
        return MV;
    }
    
    @Autowired
    private CitizenRepository CR;

    @GetMapping("/updateCitizens")
    public ModelAndView viewCitizens(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        
        // Fetch the list of politicians
        List<Citizen> citizensList = CR.findAll();
        
        // Ensure the list is not empty (debugging step)
        System.out.println("Citizens List: " + citizensList);
        
        // Adding the list of politicians to the model
        MV.addObject("citizens", citizensList);
        
        // Adding firstName and lastName to the model from the session
        MV.addObject("firstName", session.getAttribute("firstName"));
        MV.addObject("lastName", session.getAttribute("lastName"));
        
        MV.setViewName("updateCitizens");
        return MV;
    }

}
