package com.hcl.trainingcoursemanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.trainingcoursemanagement.domain.Course;
import com.hcl.trainingcoursemanagement.repository.CourseRepository;

@Service
public class CourseService {
	@Autowired
	private CourseRepository repo;

	public List<Course> listAll() {
		return repo.findAll();
	}

	public void save(Course course) {
		repo.save(course);
	}

	public void enrollCourse(Course course, String StudentEmail) {
		course.setEnrolledStudent(StudentEmail);
		repo.save(course);
	}

	public Course get(long id) {
		return repo.findById(id).get();
	}

	public void delete(long id) {
		repo.deleteById(id);
	}

}
