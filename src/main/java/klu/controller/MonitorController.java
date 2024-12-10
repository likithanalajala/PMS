package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import klu.model.Monitor;
import klu.model.MonitorManager;
import klu.model.Report;
import klu.repository.ReportRepository;

@RestController
@RequestMapping("/monitor")
public class MonitorController {

    @Autowired
    MonitorManager MM;
    
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Monitor M, HttpSession session) {
        String response = MM.login(M.getUsername(), M.getPassword());
        if (response.equals("Succesfully Logined :)")) {
            Monitor monitor = MM.getMonitorByUsername(M.getUsername());
            session.setAttribute("firstName", monitor.getFirstname());
            session.setAttribute("lastName", monitor.getLastname());
            session.setAttribute("username", monitor.getUsername());
            session.setAttribute("email", monitor.getEmailid());
            session.setAttribute("mobile", monitor.getMobileno());
            session.setAttribute("location", monitor.getLocation());
            session.setAttribute("password", monitor.getPassword());
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.status(401).body("Invalid Credentials :(");
        }
    }
    
    @PostMapping("/signup")
    public ResponseEntity<String> signUp(@RequestBody Monitor M) {
        String result = MM.signUp(M);

        if (result.equals("New user has been added")) {
        	return ResponseEntity.ok("User successfully signed up");// Redirect to citizen login after signup
        } else {
        	 return ResponseEntity.status(400).body(result);
        }
    }
    
    @Autowired
    ReportRepository reportRepository;
    
    @GetMapping("/reports")
    public ModelAndView viewReports() {
        List<Report> reports = reportRepository.findAll();
        ModelAndView mav = new ModelAndView("monitorReports");
        mav.addObject("reports", reports);
        return mav;
    }
    
    
}
