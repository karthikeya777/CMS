package com.hcl.trainingcoursemanagement.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "course")
public class Course {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name = "coursename")
	private String courseName;
	@Column(name = "duration")
	private int duration;
	@Column(name = "trainer")
	private String trainer;
	@Column(name = "fees")
	private double fees;
	@Column(name = "enrolledstudent")
	private String enrolledStudent;

	public Course(long id, String courseName, int duration, String trainer, double fees, String enrolledStudent) {
		super();
		this.id = id;
		this.courseName = courseName;
		this.duration = duration;
		this.trainer = trainer;
		this.fees = fees;
		this.enrolledStudent = enrolledStudent;
	}

	public Course() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getTrainer() {
		return trainer;
	}

	public void setTrainer(String trainer) {
		this.trainer = trainer;
	}

	public double getFees() {
		return fees;
	}

	public void setFees(double fees) {
		this.fees = fees;
	}

	public String getEnrolledStudent() {
		return enrolledStudent;
	}

	public void setEnrolledStudent(String enrolledStudent) {
		this.enrolledStudent = enrolledStudent;
	}

}
