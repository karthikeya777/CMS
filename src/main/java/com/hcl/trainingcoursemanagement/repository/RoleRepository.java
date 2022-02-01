package com.hcl.trainingcoursemanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hcl.trainingcoursemanagement.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {

	public Role getRoleByname(String roleName);

}
