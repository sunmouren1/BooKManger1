package com.oracle.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.web.mapper.AdminMapper;
import com.oracle.web.service.AdminService;
import com.oralce.web.bean.Admin;

@Service
public class AdminServiceimpl implements AdminService {
  @Autowired
  private  AdminMapper   adminMapper;
	@Override
	public int save(Admin admin) {
		// TODO Auto-generated method stub
		return  this.adminMapper.insert(admin);
	}

	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.selectone(admin);
	}

	@Override
	public Admin queryone(Integer id) {
		// TODO Auto-generated method stub
		return this.adminMapper.selectByPrimaryKey(id);
	} 

}
