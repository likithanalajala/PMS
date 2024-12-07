package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.MonitorRepository;

@Service
public class MonitorManager {

    @Autowired
    MonitorRepository MR;

    public String signUp(Monitor M) {
        try {
            if (MR.validateUsername(M.getUsername()) > 0)
                throw new Exception("Username not available");

            if (MR.validateEmail(M.getEmailid()) > 0) {
                throw new Exception("Email already exists.");
            }

            MR.save(M);
            return "New user has been added";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    public String login(String username, String password) {
        try {
            if (MR.validateCredentials(username, password) == 0)
                throw new Exception("Invalid Credentials :(");
            return "Succesfully Logined :)";
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    public Monitor getMonitorByUsername(String username) {
        return MR.findByUsername(username);
    }
}
