package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.PoliticianRepository;

@Service
public class PoliticianManager {

    @Autowired
    PoliticianRepository PR;

    public String signUp(Politician P) {
        try {
            if (PR.validateUsername(P.getUsername()) > 0)
                throw new Exception("Username not available");

            if (PR.validateEmail(P.getEmailid()) > 0) {
                throw new Exception("Email already exists.");
            }

            PR.save(P);
            return "New user has been added";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    public String login(String username, String password) {
        try {
            if (PR.validateCredentials(username, password) == 0)
                throw new Exception("Invalid Credentials :(");
            return "Succesfully Logined :)";
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    public Politician getPoliticianByUsername(String username) {
        return PR.findByUsername(username);
    }

}
