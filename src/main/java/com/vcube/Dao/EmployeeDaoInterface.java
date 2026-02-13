package com.vcube.Dao;

import com.vcube.Dto.Employee;
import com.vcube.Dto.LoginModel;

public interface EmployeeDaoInterface {
   public String insertemployee(Employee e);
   public String selectemployee(LoginModel lm);
}
