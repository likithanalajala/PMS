package klu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import klu.model.Citizen;

@Repository
public interface CitizenRepository extends JpaRepository<Citizen, Long> {

    @Query("select count(C) from Citizen C where C.username=:uname")
    public int validateUsername(@Param("uname") String uname);

    @Query("select count(C) from Citizen C where C.emailid=:email")
    public int validateEmail(@Param("email") String email);

    @Query("select count(C) from Citizen C where C.username=:uname and C.password=:pwd")
    public int validateCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
    
    @Query("select C from Citizen C where C.username=:uname")
    Citizen findByUsername(@Param("uname") String uname);
    
    List<Citizen> findAll();
}
