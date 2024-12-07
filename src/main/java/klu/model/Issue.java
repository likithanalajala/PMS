package klu.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "issue")
public class Issue {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "politician_name", nullable = false)
    private String politicianName;

    @Column(name = "citizen_username", nullable = false)
    private String citizenUsername;

    @Column(name = "description", nullable = false, length = 500)
    private String description;
    
    @Column(name = "politician_username", nullable = false)
    private String politicianUsername;
    

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoliticianName() {
		return politicianName;
	}

	public void setPoliticianName(String politicianName) {
		this.politicianName = politicianName;
	}

	public String getCitizenUsername() {
		return citizenUsername;
	}

	public void setCitizenUsername(String citizenUsername) {
		this.citizenUsername = citizenUsername;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPoliticianUsername() {
		return politicianUsername;
	}

	public void setPoliticianUsername(String politicianUsername) {
		this.politicianUsername = politicianUsername;
	}

	@Override
	public String toString() {
		return "Issue [id=" + id + ", title=" + title + ", politicianName=" + politicianName + ", citizenUsername="
				+ citizenUsername + ", description=" + description + ", politicianUsername=" + politicianUsername + "]";
	}

	
}
