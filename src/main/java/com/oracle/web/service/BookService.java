package com.oracle.web.service;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean1;



public interface BookService {

	int save(Book book);

	List<SubBook> list();
	
	Book queryOne(Integer id);

	void update(Book book);

	pageBean1<SubBook> showByPage(Integer pageNow1);

	void delete(Book book);

	Book validateName(String name);

	List<Book> list2();

	List<Book> queryBooks(String[] arr);

	List<SubBook> findName(String name);

	void delete(String[] arr);

	/*pageBean<SubBook> showByWhere(Integer pageNow, Book book);
*/
	pageBean1<SubBook> showByWhere2(Book where, int pageNow1);

	//void exportAls(FileInputStream fileInputStream, ServletOutputStream outputStream);

	

}
