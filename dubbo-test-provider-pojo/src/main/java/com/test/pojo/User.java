package com.test.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class User implements Serializable{

//private static final long serialVersionUID = 5990794417347066832L;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7629496819237517184L;

	private String serviceName;
	
	private	Map conditionData;
	
	private Integer page;
	
	private Integer rows;
	
	private Integer userId;
	
	private String userName;
	
	private Integer userSex;
	
	private Integer userAge;
	
	private Date   userBirthday;
	
	private List<User> userList;
	
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public Map getConditionData() {
		return conditionData;
	}

	public void setConditionData(Map conditionData) {
		this.conditionData = conditionData;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserSex() {
		return userSex;
	}

	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String serviceName, Map conditionData, Integer page, Integer rows, Integer userId, String userName,
			Integer userSex, Integer userAge, Date userBirthday) {
		super();
		this.serviceName = serviceName;
		this.conditionData = conditionData;
		this.page = page;
		this.rows = rows;
		this.userId = userId;
		this.userName = userName;
		this.userSex = userSex;
		this.userAge = userAge;
		this.userBirthday = userBirthday;
	}

	@Override
	public String toString() {
		return "User [serviceName=" + serviceName + ", conditionData=" + conditionData + ", page=" + page + ", rows="
				+ rows + ", userId=" + userId + ", userName=" + userName + ", userSex=" + userSex + ", userAge="
				+ userAge + ", userBirthday=" + userBirthday + "]";
	}
}
