package com.ust.emr.dao;

import java.util.List;

import com.ust.emr.model.Address;
import com.ust.emr.model.Role;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;


public interface UserDao {
	User findUserByUsername(String username) throws DataAccessException;
	User findUserById(Long id);
	Role getRoleByRoleType(String roleType);
	
	void saveUser(User user);
	void saveAddresses(List<Address> addresses);
	void updateUser(User user);
}
