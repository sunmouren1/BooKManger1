package com.oracle.web.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.web.mapper.FenleiMapper;
import com.oracle.web.service.FenleiService;
import com.oralce.web.bean.Fenlei;

@Service
public class FenleiServiceimpl implements FenleiService {
   
	
	@Autowired
	private  FenleiMapper fenleiMapper;

	@Override
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
	}
}
