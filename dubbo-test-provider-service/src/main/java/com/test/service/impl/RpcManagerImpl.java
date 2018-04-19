package com.test.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.test.mapper.UserMapper;
import com.test.pojo.User;
import com.test.service.RpcManager;

@Service("userService")
public class RpcManagerImpl implements RpcManager{
	
	@Autowired
	private UserMapper userMapper;
	
	/*@Autowired
	private Producer<String, String> producer;*/
	
	 /*@Autowired  
	 private KafkaTemplate<Integer, String> kafkaTemplate; */
	
	public String invoke(User user) {
		user.setPage((user.getPage()-1)*user.getRows());
		List<LinkedHashMap<String, Object>> userList = userMapper.selectUserList(user);
		String userlist = JSON.toJSONStringWithDateFormat(userList, "yyyy-MM-dd", SerializerFeature.DisableCircularReferenceDetect);
		
		//producer.send((Seq<KeyedMessage<String, String>>) new KeyedMessage<String, String>("userlistdata",userlist));
		
//		kafkaTemplate.sendDefault(userlist);
		return userlist;
	}
		
	/*public String invoke(User user) {
		user.setPage((user.getPage()-1)*user.getRows());
		List<LinkedHashMap<String, Object>> userList = userMapper.selectUserList(user);
		return JSON.toJSONStringWithDateFormat(userList, "yyyy-MM-dd", SerializerFeature.DisableCircularReferenceDetect);
		
	}*/
	

}
