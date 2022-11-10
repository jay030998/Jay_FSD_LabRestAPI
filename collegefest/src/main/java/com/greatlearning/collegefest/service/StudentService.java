package com.greatlearning.collegefest.service;

import java.util.List;

import javax.transaction.Transactional;

import com.greatlearning.collegefest.entity.Student;

public interface StudentService {

	List<Student> findAll();

	Student findById(int id);

	void save(Student theStudent);

	void deleteById(int id);

}