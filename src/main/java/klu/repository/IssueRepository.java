package klu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import klu.model.Issue;

public interface IssueRepository extends JpaRepository<Issue, Long> {
	
	List<Issue> findByPoliticianUsername(String politicianUsername);
	
}
