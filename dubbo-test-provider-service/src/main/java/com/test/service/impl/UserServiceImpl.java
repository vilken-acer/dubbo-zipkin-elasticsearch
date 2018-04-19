  
package com.test.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.test.mapper.UserMapper;
import com.test.pojo.User;
import com.test.service.UserService;


@Service("userSelect")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	

	/* (non-Javadoc)    
	 * @see com.jk.service.UserService#selectUserList(java.lang.Integer, java.lang.Integer)    
	 */
	public String selectUserList(Integer page, Integer rows) {
		
		/* ShardedJedis resource = sharededJedisPool.getResource();

	     Boolean exists = resource.exists("userListIncrList");
	     if (!exists){
	    	 List<LinkedHashMap<String, Object>> map = userMapper.getUserInfo();
	    	 HashMap<String, String> hashMap = new HashMap<String, String>();
	    	 for (LinkedHashMap<String, Object> linkedHashMap : map) {
	    		 Long incr = resource.incr("userListIncr");
	    		 hashMap.put("userId",linkedHashMap.get("userId")+"");
                 hashMap.put("userName",linkedHashMap.get("userName")+"");
                 hashMap.put("userAge",linkedHashMap.get("userAge")+"");
                 hashMap.put("userSex",linkedHashMap.get("userSex")+"");
                 hashMap.put("userBirthday",linkedHashMap.get("userBirthday")+"");
                 resource.hmset("userListIncr" + incr, hashMap);
                 //获取随机对象
                 Random random = new Random();
                 //通过map的key设置失效时间
                 resource.expire("userListIncr" + incr, 300 * 650 + random.nextInt(10));
                 //以redis的左侧追加值 倒序方式 存入id list集合中
                 resource.lpush("userListIncrList", incr + "");
			}
	     }
		
	     
	  // 查询更新缓存之后  分页展示缓存中的数据
	        List<String> len = resource.lrange("userListIncrList", 0, -1);
	       
	   //redis分页
	        List<String> lrange = resource.lrange("userListIncrList",(page-1)*rows, page*rows-1);

	        List<Map<String, String>> userData = new ArrayList<>();
	        for (int i = 0; i < lrange.size(); i++) {
	            Map<String, String> hgetAll = resource.hgetAll("userListIncr"+lrange.get(i));
	            userData.add(hgetAll);
	        }

	        JSONObject json = new JSONObject();
	        json.put("total", len.size());
	        json.put("rows", userData);*/

		/*
		 * 数据分页*/
		long total = userMapper.getUserTotal();
		List<LinkedHashMap<String, Object>> map = userMapper.getUserInfo(page, rows);
		JSONObject json = new JSONObject();
		json.put("total", total);
		json.put("rows", map);
		return JSON.toJSONStringWithDateFormat(json, "yyyy-MM-dd", SerializerFeature.DisableCircularReferenceDetect);
	}

	public User selectUserById(String userId) {
		User user = userMapper.selectUserById(userId);
		return user;
	}
	
	public String selectUserList(User user) {
		//System.out.println("request params:"+params.toString());
		List<LinkedHashMap<String, Object>> userList = userMapper.selectUserList(user);
		return JSON.toJSONStringWithDateFormat(userList, "yyyy-MM-dd", SerializerFeature.DisableCircularReferenceDetect);
	}
	
	

	
}
