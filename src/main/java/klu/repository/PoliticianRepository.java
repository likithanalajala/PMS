package klu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import klu.model.Politician;

@Repository
public interface PoliticianRepository extends JpaRepository<Politician, Long> {

    @Query("select count(P) from Politician P where P.username=:uname")
    public int validateUsername(@Param("uname") String uname);

    @Query("select count(P) from Politician P where P.emailid=:email")
    public int validateEmail(@Param("email") String email);

    @Query("select count(P) from Politician P where P.username=:uname and P.password=:pwd")
    public int validateCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
    
    @Query("select P from Politician P where P.username=:uname")
    Politician findByUsername(@Param("uname") String uname);
    
    List<Politician> findAll();

}
