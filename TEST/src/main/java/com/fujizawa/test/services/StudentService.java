package com.fujizawa.test.services;

import com.fujizawa.test.models.Student;

import java.util.List;

public interface StudentService {
    public Student saveStudent(Student student);
    public List<Student> getAllStudents();
}
