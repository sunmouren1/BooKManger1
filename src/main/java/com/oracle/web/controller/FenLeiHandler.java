package com.oracle.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oracle.web.service.FenleiService;
import com.oralce.web.bean.Fenlei;

@Controller
@Scope(value="prototype")
public class FenLeiHandler {

	private  static final  String  NONE=null;
	
	@Autowired
	private FenleiService fenleiservice;
	
//	public String selectAll(Fenlei fenlei){
//		
//		
//		
//	}
	
}
