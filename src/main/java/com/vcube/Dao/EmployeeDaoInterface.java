package com.vcube.Dao;

import java.util.List;

import com.vcube.Dto.Employee;
import com.vcube.Dto.LoginModel;

public interface EmployeeDaoInterface {
   public String insertemployee(Employee e);
   public Employee selectemployee(LoginModel lm);
   public List<Employee> viewEmployees();
   boolean updateEmployeeProfile(Employee emp);
   
   
}
