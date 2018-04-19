  
package com.test.service;

import com.test.pojo.User;

public interface UserService {

	//String selectUserList(Integer page, Integer rows);
	String selectUserList(User user);

	User selectUserById(String userId);

}
