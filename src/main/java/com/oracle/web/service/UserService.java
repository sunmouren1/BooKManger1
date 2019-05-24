package com.oracle.web.service;

import java.util.List;

import com.oralce.web.bean.PageBean;
import com.oralce.web.bean.User;

public interface UserService {

	int save(User user);

	List<User> list();

	PageBean<User> selectByPage(Integer pageNow,int pageSize);
	
	PageBean<User> selectAllPage(Integer pageNow);

	void  delete(User user);

	User queryOneUser(Integer id);

	void update(User user);

	
  
}
