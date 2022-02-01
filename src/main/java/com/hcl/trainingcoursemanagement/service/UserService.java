package com.hcl.trainingcoursemanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hcl.trainingcoursemanagement.domain.Role;
import com.hcl.trainingcoursemanagement.domain.User;
import com.hcl.trainingcoursemanagement.repository.RoleRepository;
import com.hcl.trainingcoursemanagement.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Autowired
	private RoleRepository roleRepository;

	public List<User> listAll() {
		return userRepository.findAll();
	}

	public void save(User user) {
		User useradd = new User();

		useradd.setFullname(user.getFullname());
		useradd.setUsername(user.getUsername());
		useradd.setEnabled(true);
		useradd.setPassword(passEncoder.encode(user.getPassword()));

		Role role = roleRepository.getRoleByname(user.getRoleName());
		useradd.roles(role);

		userRepository.save(useradd);
	}

	public void update(User user) {

		User userupdate = findByUsername(user.getUsername());
		userupdate.setId(user.getId());
		userupdate.setFullname(user.getFullname());
		userRepository.save(userupdate);
	}

	public User get(Long id) {
		return userRepository.findById(id).get();
	}

	public void delete(Long id) {
		userRepository.deleteById(id);
	}

	public User findByUsername(String username) {
		return userRepository.getUserByUsername(username);
	}

	public List<User> listUserByRole(String roleName) {
		return userRepository.getUserBasedOnRoles(roleName);
	}
}
