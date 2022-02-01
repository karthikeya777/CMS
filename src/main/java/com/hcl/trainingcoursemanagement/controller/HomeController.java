package com.hcl.trainingcoursemanagement.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.trainingcoursemanagement.MyUserDetails;
import com.hcl.trainingcoursemanagement.domain.Course;
import com.hcl.trainingcoursemanagement.domain.Role;
import com.hcl.trainingcoursemanagement.domain.User;
import com.hcl.trainingcoursemanagement.service.CourseService;
import com.hcl.trainingcoursemanagement.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@Autowired
	private CourseService courseService;

	@RequestMapping(value = "/")
	public ModelAndView home(Model model, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = "", rolename = "";
		if (principal instanceof MyUserDetails) {
			username = ((UserDetails) principal).getUsername();
			session.setAttribute("username", username);
			User userdetails = userService.findByUsername(username);
			for (Role role : userdetails.getRoles()) {
				rolename = role.getName();
				session.setAttribute("rolename", rolename);
			}
		} else {
			username = principal.toString();
		}
		mv.addObject("loggedinUser", username);
		mv.addObject("loggedrole", rolename);
		if (username != null && !username.equalsIgnoreCase("anonymousUser")) {
			mv.setViewName("home");
		} else {
			mv.setViewName("login");
		}
		return mv;

	}

	@GetMapping("/student")
	public String students(Model model, HttpSession session) {
		List<User> liststudent = userService.listUserByRole("STUDENT");
		model.addAttribute("studentlist", liststudent);
		model.addAttribute("loggedinUser", session.getAttribute("username"));
		model.addAttribute("loggedrole", session.getAttribute("rolename"));
		return "students";
	}

	@GetMapping("/trainer")
	public String trainers(Model model, HttpSession session) {
		List<User> listtrainer = userService.listUserByRole("Trainer");
		model.addAttribute("loggedinUser", session.getAttribute("username"));
		model.addAttribute("loggedrole", session.getAttribute("rolename"));
		model.addAttribute("trainerlist", listtrainer);
		return "trainers";
	}

	@GetMapping("/course")
	public String courses(Model model, HttpSession session) {
		List<Course> listcourse = courseService.listAll();
		model.addAttribute("listcourse", listcourse);
		model.addAttribute("loggedinUser", session.getAttribute("username"));
		model.addAttribute("loggedrole", session.getAttribute("rolename"));
		return "courses";
	}

	@RequestMapping(value = "/login")
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(value = "/logout-success")
	public String logout(Model model) {
		return "redirect:/login";
	}

	@RequestMapping(value = "/myprofile")
	public ModelAndView profile(Model model, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String username = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("rolename");
		User userdetails = userService.findByUsername(username);

		mv.addObject("userdetails", userdetails);
		mv.addObject("loggedrole", role);
		mv.addObject("loggedinUser", username);
		mv.setViewName("myprofile");
		return mv;
	}

	@RequestMapping(value = "/updateprofile")
	public String updateUser(@ModelAttribute("user") User user) {
		userService.update(user);
		return "redirect:/myprofile";
	}
}
