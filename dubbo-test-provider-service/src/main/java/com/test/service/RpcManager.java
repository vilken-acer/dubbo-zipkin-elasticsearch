package com.test.service;

import com.test.pojo.User;

public interface RpcManager {
	String invoke(User user);  
}
