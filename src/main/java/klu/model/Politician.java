package klu.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="politician")
public class Politician {
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="id")
	Long id;
	@Column(name="firstname")
	String firstname;
	@Column(name="lastname")
	String lastname;
	@Column(name="username")
	String username;
	@Column(name="emailid")
	String emailid;
	@Column(name="password")
	String password;
	@Column(name="position")
	String position;
	@Column(name="location")
	String location;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "Politician [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", username=" + username
				+ ", emailid=" + emailid + ", password=" + password + ", position=" + position + ", location="
				+ location + "]";
	}
	
}