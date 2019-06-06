package com.oracle.web.service;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.oralce.web.bean.Book;
import com.oralce.web.bean.SubBook;
import com.oralce.web.bean.pageBean;


public interface BookService {

	int save(Book book);

	List<SubBook> list();

	

	
	Book queryOne(Integer id);

	void update(Book book);

	pageBean<SubBook> showByPage(Integer pageNow);

	void delete(Book book);

	Book validateName(String name);

	List<Book> list2();

	List<Book> queryBooks(String[] arr);

	List<SubBook> findName(String name);

	void delete(String[] arr);

	//void exportAls(FileInputStream fileInputStream, ServletOutputStream outputStream);

	

}
