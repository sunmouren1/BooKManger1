package com.oracle.web.service;

import java.util.List;

import com.oralce.web.bean.Book;
import com.oralce.web.bean.SubBook;
import com.oralce.web.bean.pageBean;


public interface BookService {

	int save(Book book);

	List<SubBook> list();

	int[] delete(String ids);

	
	Book queryOne(Integer id);

	void update(Book book);

	pageBean<SubBook> showByPage(Integer pageNow);

	void delete(Book book);

	

}
