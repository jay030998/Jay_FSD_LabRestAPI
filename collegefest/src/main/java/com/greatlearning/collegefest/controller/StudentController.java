package com.greatlearning.collegefest.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.greatlearning.collegefest.entity.Student;
import com.greatlearning.collegefest.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	StudentService studentService;
	
	@RequestMapping("/list")
	public String listStudents(Model theModel) {
		//get  students from db
		
		List<Student> theStudents = studentService.findAll();
		
		//add to the spring model
		theModel.addAttribute("Students", theStudents);
		return "list-students";
	}
	
	@RequestMapping("/showFormForAdd")
	public String showFormforAdd(Model theModel) {
		//create model attribute to bind form data
		
		Student theStudent = new Student();
		
		theModel.addAttribute("Student",theStudent);
		return "Student-form";
	}
	
	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentId") int theId , Model themodel) {
		
		Student theStudent = studentService.findById(theId);
		
		themodel.addAttribute("Student", theStudent);
		return "Student-form";
	}
	
	@PostMapping("/save")
	public String saveStudent(@RequestParam("id") int id, @RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName, 
			@RequestParam("course") String course, @RequestParam("country") String country){
		
		System.out.println(id);
		Student theStudent;
		if(id!=0) {
			theStudent = studentService.findById(id);
			theStudent.setFirstName(firstName);
			theStudent.setLastName(lastName);
			theStudent.setCourse(course);
			theStudent.setCountry(country);
		} else {
			theStudent = new Student(firstName, lastName, course, country);
		}
			studentService.save(theStudent);
			
			return "redirect:/student/list";
		
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int theId) {
		
		studentService.deleteById(theId);
		
		return "redirect:/student/list";
	}
	
	@RequestMapping(value="/403")
	public ModelAndView accessDenied(Principal user) {
		
		ModelAndView model = new ModelAndView();
		
		if(user != null) {
			model.addObject("msg", "Hi " + user.getName()
			+ ", you do not have permission to access this page!");
		} else {
			model.addObject("msg",
			"you do not have permission to access this page!");
		}
		
		model.setViewName("403");
		return model;
	}
}
