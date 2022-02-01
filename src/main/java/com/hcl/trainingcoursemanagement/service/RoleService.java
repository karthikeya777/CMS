package com.hcl.trainingcoursemanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.trainingcoursemanagement.domain.Role;
import com.hcl.trainingcoursemanagement.repository.RoleRepository;

@Service
public class RoleService {

	@Autowired
	private RoleRepository roleRepository;

	public List<Role> listAll() {
		return roleRepository.findAll();
	}

	public void save(Role role) {
		roleRepository.save(role);
	}

	public Role get(int id) {
		return roleRepository.findById(id).get();
	}

	public void delete(int id) {
		roleRepository.deleteById(id);
	}
}
