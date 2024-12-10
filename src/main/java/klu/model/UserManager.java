package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.UserRepository;

@Service
public class UserManager {
	@Autowired
	UserRepository UR;
	
	public String signUp(User U) {
		try
		{
			if(UR.validateUsername(U.getUsername())>0)
				throw new Exception("Username not available");
			
			if (UR.validateEmail(U.getEmailid()) > 0) {
                throw new Exception("Email already exists.");
            }
			if (!isStrongPassword(U.getPassword())) {
		        return "Password must be at least 8 characters long, contain uppercase letters, lowercase letters, numbers, and special characters.";
		    }
			UR.save(U);
			return "New user has been added";
		}catch(Exception e)
		{
			return e.getMessage();
		}
	}
	
	private boolean isStrongPassword(String password) {
	    String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=]).{8,}$";
	    return password.matches(regex);
	}
	
	//LOGIN
	public String login(String username,String password)
	{
		try {
			if (UR.validateCredentials(username, password) == 0)
				throw new Exception("Invalid Credentials :(");
			return "Succesfully Logined :)";
		}
		catch(Exception e)
		{
			return e.getMessage();
		}
	}

    // Fetch user details
    public User getUserByUsername(String username) {
        return UR.findByUsername(username);
    }
	
}