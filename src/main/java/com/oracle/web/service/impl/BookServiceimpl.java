package com.oracle.web.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



import com.oracle.web.mapper.BookMapper;
import com.oracle.web.service.BookService;
import com.oralce.web.bean.Book;
import com.oralce.web.bean.SubBook;
import com.oralce.web.bean.pageBean;
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
	public pageBean<SubBook> showByPage(Integer pageNow) {
      
		pageBean<SubBook> pb = new pageBean<SubBook>();

		
		PageHelper.startPage(pageNow, 2);
		
		List<SubBook> list = this.BookMapper.showByPageHelper();
		
		pb.setBeanList(list);
		
		//总记录数
		System.out.println("ok2");
		
		PageInfo<SubBook> pi=new PageInfo<SubBook>(list);
		
		//pb
		pb.setCounts((int) pi.getTotal());
		
		//当前页
		pb.setPageNow(pi.getPageNum());
		
		//每页显示的条数 自定义
		pb.setpageSize(pi.getPageSize());
		
		
		
		
		return pb;
	}

}
