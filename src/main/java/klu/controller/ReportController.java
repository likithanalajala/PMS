package klu.controller;

import klu.model.Report;
import klu.repository.ReportRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/citizen")
public class ReportController {

    @Autowired
    private ReportRepository reportRepository;
    

    @GetMapping("/report")
    public ModelAndView showReportForm(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("report");
        // Check if the user is logged in
        String citizenUsername = (String) session.getAttribute("username");
        if (citizenUsername == null) {
            modelAndView.addObject("errorMessage", "You need to be logged in to report an issue.");
            return modelAndView;
        }
        modelAndView.addObject("citizenUsername", citizenUsername); // Pass username to the form if needed
        return modelAndView;
    }

    @PostMapping("/submitReport")
    public ModelAndView submitReport(@ModelAttribute Report report, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("report");
        
        // Set the citizen username from the session
        String citizenUsername = (String) session.getAttribute("username");
        if (citizenUsername == null) {
            modelAndView.addObject("errorMessage", "You need to be logged in to submit a report.");
            return modelAndView;
        }
        
        report.setCitizenUsername(citizenUsername); // Set the logged-in citizen's username

        // Save the report to the database
        try {
            reportRepository.save(report);
            modelAndView.addObject("successMessage", "Report submitted successfully.");
        } catch (Exception e) {
            modelAndView.addObject("errorMessage", "An error occurred while submitting your report.");
        }
        
        return modelAndView;
    }
}
