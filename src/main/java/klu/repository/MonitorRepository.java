package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import klu.model.Monitor;

@Repository
public interface MonitorRepository extends JpaRepository<Monitor, Long> {

    @Query("select count(M) from Monitor M where M.username=:uname")
    public int validateUsername(@Param("uname") String uname);

    @Query("select count(M) from Monitor M where M.emailid=:email")
    public int validateEmail(@Param("email") String email);

    @Query("select count(M) from Monitor M where M.username=:uname and M.password=:pwd")
    public int validateCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
    
    @Query("select M from Monitor M where M.username=:uname")
    Monitor findByUsername(@Param("uname") String uname);
}
