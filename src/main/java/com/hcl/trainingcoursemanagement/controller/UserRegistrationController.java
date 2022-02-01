package com.hcl.trainingcoursemanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.trainingcoursemanagement.domain.Role;
import com.hcl.trainingcoursemanagement.domain.User;
import com.hcl.trainingcoursemanagement.service.RoleService;
import com.hcl.trainingcoursemanagement.service.UserService;

@Controller
@RequestMapping("/registration")
public class UserRegistrationController {

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserService userService;

	@GetMapping
	public ModelAndView register(Model model) {
		ModelAndView mv = new ModelAndView();
		List<Role> rolelist = roleService.listAll();
		mv.addObject("roles", rolelist);
		mv.setViewName("register");
		return mv;
	}

	@PostMapping
	public String registerUser(@ModelAttribute("user") User user) {

		User userrecord = userService.findByUsername(user.getUsername());
		if (userrecord != null) {
			return "redirect:/registration?failed";
		}
		userService.save(user);
		return "redirect:/registration?success";
	}
}
