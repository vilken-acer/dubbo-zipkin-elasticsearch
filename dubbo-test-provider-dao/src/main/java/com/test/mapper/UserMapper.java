 
package com.test.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.test.pojo.User;




@Mapper
public interface UserMapper {


	@Select("select * from t_test_user limit #{page},#{rows}")
	@Results({
		@Result(property = "userId", column = "user_id"),
		@Result(property = "user_name", column = "name"),
		@Result(property = "userSex", column = "user_sex"),
		@Result(property = "userAge", column = "user_age"),
		@Result(property = "userBirthday", column = "user_birthday"),
		})
	List<LinkedHashMap<String, Object>> getUserInfo(@Param(value="page")Integer page, @Param(value="rows")Integer rows);

	
	@Select("select count(1) from t_test_user")
	long getUserTotal();

	@Select("select * from t_test_user where user_id=#{userId}")
	User selectUserById(String userId);


	@Select("select * from t_test_user limit #{page},#{rows}")
	@Results({
		@Result(property = "userId", column = "user_id"),
		@Result(property = "userName", column = "user_name"),
		@Result(property = "userSex", column = "user_sex"),
		@Result(property = "userAge", column = "user_age"),
		@Result(property = "userBirthday", column = "user_birthday"),
		})
	List<LinkedHashMap<String, Object>> selectUserList(User user);


	/*@Select("select * from t_test_user")
	@Results({
		@Result(property = "userId", column = "user_id"),
		@Result(property = "userName", column = "user_name"),
		@Result(property = "userSex", column = "user_sex"),
		@Result(property = "userAge", column = "user_age"),
		@Result(property = "userBirthday", column = "user_birthday"),
		})
	List<LinkedHashMap<String, Object>> getUserInfo();*/

	
}
