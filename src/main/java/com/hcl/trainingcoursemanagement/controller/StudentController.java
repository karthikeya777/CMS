package com.hcl.trainingcoursemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hcl.trainingcoursemanagement.service.UserService;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private UserService userService;

	@RequestMapping("/delete/{id}")
	public String deleteStudent(@PathVariable(name = "id") Long id) {
		userService.delete(id);
		return "redirect:/student";
	}
}
