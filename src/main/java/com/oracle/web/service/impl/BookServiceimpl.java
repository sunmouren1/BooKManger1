package com.oracle.web.service.impl;


import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.web.mapper.BookMapper;
import com.oracle.web.service.BookService;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean1;
@Service
public class BookServiceimpl implements BookService {
  
	@Autowired
	private BookMapper BookMapper;
	
	@Override
	@Transactional
	public int save(Book book) {
		// TODO Auto-generated method stub
		return this.BookMapper.insert(book);
	}

	@Override
	@Transactional
	public List<SubBook> list() {
		// TODO Auto-generated method stub
		return this.BookMapper.selectAllWithOneSQL();
	}

      @Override
	@Transactional
	public void delete(Book book) {
		// TODO Auto-generated method stub
		this.BookMapper.deleteByPrimaryKey(book.getId());
	}

	@Override
	@Transactional
	public Book queryOne(Integer id) {
		// TODO Auto-generated method stub
		return this.BookMapper.selectByPrimaryKey(id);
	}

	@Override
	@Transactional
	public void update(Book book) {
		// TODO Auto-generated method stub
		 this.BookMapper.updateByPrimaryKey(book);
	}

	@Override
	@Transactional  
	public pageBean1<SubBook> showByPage(Integer pageNow1) {
      
		pageBean1<SubBook> pb = new pageBean1<SubBook>();

		
		PageHelper.startPage(pageNow1, 2);
		
		List<SubBook> list = this.BookMapper.showByPageHelper();
		
		pb.setBeanList1(list);
		
		//总记录数
		//System.out.println("ok2");
		
		PageInfo<SubBook> pi=new PageInfo<SubBook>(list);
		
		//pb
		pb.setCounts1((int) pi.getTotal());
		
		//当前页
		pb.setPageNow1(pi.getPageNum());
		
		//每页显示的条数 自定义
		pb.setPageSize1(pi.getPageSize());
		
		return pb;
	}

	@Override
	@Transactional
	public void delete(String[] arr) {
		// TODO Auto-generated method stub
		
		 this.BookMapper.deleteByIds(arr);
	}

	@Override
	@Transactional
	public Book validateName(String name) {
		// TODO Auto-generated method stub
		return  this.BookMapper.validateName(name);
	}

	@Override
	@Transactional
	public List<Book> list2() {
		// TODO Auto-generated method stub
		return this.BookMapper.list2();
	}

	@Override
	@Transactional
	public List<Book> queryBooks(String[] arr) {
		// TODO Auto-generated method stub
		return this.BookMapper.queryBooks(arr);
	}

	@Override
	@Transactional
	public List<SubBook> findName(String name) {
		// TODO Auto-generated method stub
		return this.BookMapper.findName(name);
	}

	@Override
	@Transactional
	public pageBean1<SubBook> showByWhere2(Book where, int pageNow1) {

		pageBean1<SubBook> pb = new pageBean1<SubBook>();

      //当前页的数据

      PageHelper.startPage(pageNow1,2);//分页好的数据

      List<SubBook> list = this.BookMapper.showWhere2(where);

      pb.setBeanList1(list);//总记录数

      PageInfo<SubBook> pi = new PageInfo<SubBook> (list);

      pb.setCounts1((int) pi. getTotal());

      //当前页

      pb.setPageNow1(pi . getPageNum()); 

      //每页显示的条数-自定义

      pb.setPageSize1( pi. getPageSize());


	return pb;
	

	}


}
