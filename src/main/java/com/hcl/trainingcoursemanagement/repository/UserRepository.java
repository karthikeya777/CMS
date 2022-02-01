package com.hcl.trainingcoursemanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hcl.trainingcoursemanagement.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	public User getUserByUsername(String username);

	@Query("select u from User u, Role r,UserRoles ur where ur.userId = u.id and ur.roleId = r.id and r.name = :role")
	public List<User> getUserBasedOnRoles(@Param("role") String role);

}
