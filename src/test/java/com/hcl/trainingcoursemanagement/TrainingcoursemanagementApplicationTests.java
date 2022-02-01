package com.hcl.trainingcoursemanagement;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.hcl.trainingcoursemanagement.domain.Course;
import com.hcl.trainingcoursemanagement.repository.CourseRepository;
import com.hcl.trainingcoursemanagement.service.CourseService;

@RunWith(SpringRunner.class)
@SpringBootTest
class TrainingcoursemanagementApplicationTests {

	@Autowired
	private CourseService courseService;

	@MockBean
	private CourseRepository courseRepository;

	@Test
	public void showEditCourse() {
		long courseid = 2;
		Course course = new Course(2, "JAVA", 3, "Karthikeya Domakonda", 1000, "student@test.com");
		when(courseRepository.findById(courseid).get()).thenReturn(course);
		assertEquals(course, courseService.get(courseid));

	}

}
