package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.CitizenRepository;

@Service
public class CitizenManager {
	
	@Autowired
	CitizenRepository CR;
	
	public String signUp(Citizen C) {
		try
		{
			if(CR.validateUsername(C.getUsername())>0)
				throw new Exception("Username not available");
			
			if (CR.validateEmail(C.getEmailid()) > 0) {
                throw new Exception("Email already exists.");
            }
			
			CR.save(C);
			return "New user has been added";
		}catch(Exception e)
		{
			return e.getMessage();
		}
	}
	
	//LOGIN
	public String login(String username,String password)
	{
		try {
			if (CR.validateCredentials(username, password) == 0)
				throw new Exception("Invalid Credentials :(");
			return "Succesfully Logined :)";
		}
		catch(Exception e)
		{
			return e.getMessage();
		}
	}
	
	public Citizen getCitizenByUsername(String username) {
        return CR.findByUsername(username);
    }
	
}