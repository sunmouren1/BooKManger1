package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;
import com.oralce.web.bean.Book;
import com.oralce.web.bean.Fenlei;
import com.oralce.web.bean.SubBook;
import com.oralce.web.bean.pageBean;

@Controller
@Scope(value="prototype")
public class BookHandler {
  
    
	private static final String NONE = null;
	@Autowired
	private BookService bookService;
	
	@Autowired
	private FenleiService fenleiService;
	

	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String  add(Book book){
		
		int i = this.bookService.save(book);
		
		
			System.out.println("成功");
			
		return "redirect:/showByPage";
	
		
	}
	

	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> flist = this.fenleiService.list();
		
		request.setAttribute("flist", flist);

		return "addBook";
	}


	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public String selectBooks(HttpServletRequest request) {// 全查

		List<SubBook> mlist = this.bookService.list();

		System.out.println(mlist);

		request.setAttribute("mlist", mlist);

		return "showBook";
	}
	@RequestMapping(value="/deleteBook/{id}",method=RequestMethod.DELETE)
	public String deleteBook(@PathVariable(value="id") Integer id){
		
		
		// String[] ids=id2.split(",");
		
		
		Book book=new Book();
		
		book.setId(id);
		this.bookService.delete(book);
		
		//System.out.println("pp");
		return "redirect:/showByPage";
		
	}
	
	@RequestMapping(value="/book/{id}",method=RequestMethod.GET)
	public String updateUI(@PathVariable(value="id") Integer id ,HttpSession session){
		
		List<Fenlei> flist=this.fenleiService.list();
		
		session.setAttribute("flist", flist);
		
		Book b=this.bookService.queryOne(id);
		
		session.setAttribute("b", b);
		
		return "redirect:/xiugaiBook.jsp";
		
	}
	
	@RequestMapping(value="/updatebook",method=RequestMethod.PUT)
	public String update(Book book){
		
	    bookService.update(book);
	
	
		return "redirect:/showByPage";
		
	}
	@RequestMapping(value = "/showByPage", method = RequestMethod.GET)
	public String showByPage( Integer pageNow, HttpServletRequest request) {

      //  int pageSize = 2;
		
		if(pageNow==null){
			
			pageNow=1;
		}
		
		//System.out.println("ok");
		
		pageBean<SubBook> pb=this.bookService.showByPage(pageNow);
		
		request.setAttribute("pb", pb);
		
		return "showBook";
		
	}

}
