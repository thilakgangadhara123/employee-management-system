package com.vcube.Dao;

import com.vcube.Dto.Admin;

public interface AdminDaoInterface {
	public boolean registerAdmin(Admin admin);
	 public boolean validateAdmin(Admin admin);
}
