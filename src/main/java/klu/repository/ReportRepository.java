package klu.repository;

import klu.model.Report;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportRepository extends JpaRepository<Report, Long> {
    // Custom queries (if any) can be added here
	
	

}
