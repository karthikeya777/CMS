package com.hcl.trainingcoursemanagement.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.trainingcoursemanagement.domain.Course;
import com.hcl.trainingcoursemanagement.domain.User;
import com.hcl.trainingcoursemanagement.service.CourseService;
import com.hcl.trainingcoursemanagement.service.UserService;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/addcourse", method = RequestMethod.GET)
	public String add(Model model, HttpSession session) {
		List<Course> listcourse = courseService.listAll();
		model.addAttribute("listcourse", listcourse);
		model.addAttribute("course", new Course());
		model.addAttribute("courseAdd", "add");
		List<User> listtrainer = userService.listUserByRole("Trainer");
		model.addAttribute("trainerlist", listtrainer);
		model.addAttribute("loggedinUser", session.getAttribute("username"));
		model.addAttribute("loggedrole", session.getAttribute("rolename"));
		return "addCourse";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveCourse(@ModelAttribute("course") Course course) {
		courseService.save(course);
		return "redirect:/course";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView showEditCoursePage(@PathVariable(name = "id") int id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Course course = courseService.get(id);
		mav.addObject("course", course);
		mav.addObject("courseAdd", "update");
		List<User> listtrainer = userService.listUserByRole("Trainer");
		mav.addObject("trainerlist", listtrainer);
		mav.setViewName("addCourse");
		mav.addObject("loggedinUser", session.getAttribute("username"));
		mav.addObject("loggedrole", session.getAttribute("rolename"));
		return mav;

	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteCoursePage(@PathVariable(name = "id") int id) {
		courseService.delete(id);
		return "redirect:/course";
	}

	@RequestMapping(value = "/enroll/{id}", method = RequestMethod.GET)
	public String enrollCourse(@PathVariable(name = "id") int id, HttpSession session) {
		Course course = courseService.get(id);
		String username = (String) session.getAttribute("username");
		courseService.enrollCourse(course, username);
		return "redirect:/course?success";

	}
}
