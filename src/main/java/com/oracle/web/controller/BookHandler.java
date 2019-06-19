package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;
import com.oracle.web.test.DownUtils;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.FileUtils;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean1;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	private static final String NONE = null;
	@Autowired
	private BookService bookService;

	@Autowired
	private FenleiService fenleiService;

	@RequestMapping(value = "/addbook", method = RequestMethod.POST)
	public String add(Book book) {

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

	@RequestMapping(value = "/delete/{ids}", method = RequestMethod.DELETE)
	public String deleteBookA(@PathVariable("ids") String ids) {// 批量删除

		System.out.println(ids);

		String[] arr = ids.split(",");

		for(String string:arr){
			
			System.out.println(string);
		}
	          this.bookService.delete(arr);
	
	          return "redirect:/showByPage";
		

	}

	@RequestMapping(value = "/deleteBook/{id}", method = RequestMethod.DELETE)
	public String deleteBook(@PathVariable("id") Integer id) {// 单个删除

		Book book = new Book();

		book.setId(id);

		this.bookService.delete(book);

		return "redirect:/showByPage";

	}

	@RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable(value = "id") Integer id, HttpSession session) {

		List<Fenlei> flist = this.fenleiService.list();

		session.setAttribute("flist", flist);

		Book b = this.bookService.queryOne(id);

		session.setAttribute("b", b);

		return "redirect:/xiugaiBook.jsp";

	}

	@RequestMapping(value = "/updatebook", method = RequestMethod.PUT)
	public String update(Book book) {

		bookService.update(book);

		return "redirect:/showByPage";

	}

	@RequestMapping(value = "/showByPage", method = RequestMethod.GET)
	public String showByPage(Integer pageNow1, HttpServletRequest request) {//全查分页

		// int pageSize = 2;

		if (pageNow1 == null) {

			pageNow1 = 1;
		}

		pageBean1<SubBook> pb = this.bookService.showByPage(pageNow1);
		System.out.println(pb);
		 List<Fenlei> list = fenleiService.list();

	      request. setAttribute("flist", list);
		
	      request.setAttribute("pb", pb);
		
		return "showBook";

	}

	

	@RequestMapping(value = "/showBookByWhere", method = RequestMethod.GET)
	public String ByWhere(Book where,String url, int pageNow1, HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {

		url = this.getURL2(request);
		
		//System.out.println("===============" + url1);
		
		String name = where.getName();

		where.setName(new String(name.getBytes("ISO-8859-1"), "UTF-8"));

		System.out.println(where.getName());

		String zhuangtai = where.getZhuangtai();

		where.setZhuangtai(new String(zhuangtai.getBytes("ISO-8859-1"), "UTF-8"));

		System.out.println(where.getZhuangtai());

		String chubanshe = where.getChubanshe();

		where.setChubanshe(new String(chubanshe.getBytes("ISO-8859-1"), "UTF-8"));

		System.out.println(where.getChubanshe());

		String jishuren = where.getJieshuren();

		where.setJieshuren(new String(jishuren.getBytes("ISO-8859-1"), "UTF-8"));

		System.out.println(where.getJieshuren());

		pageBean1<SubBook> pb = bookService.showByWhere2(where, pageNow1);

		pb.setUrl1(url);

		session.setAttribute("pb", pb);


		List<Fenlei> list = fenleiService.list();

		session.setAttribute("flist", list);

		return "redirect:/mohuBook.jsp";

	}

	private String getURL2(HttpServletRequest req) {
       
		String url=this.getURL(req);
   // 	System.out.println(url+"----------");
         
		int index=url.lastIndexOf("&pageNow1=");
	    
	    if(index==-1){
	    	
	    	return url;
	    }
	    

	    	return url.substring(0, index);
	    	
	}
	
	private String getURL(HttpServletRequest request) {
	
		String path=request.getContextPath();///Book2
		System.out.println(path);
		String servlet=request.getServletPath();// BookServlet 
		System.out.println(servlet);
		String param=request.getQueryString();
		
		
		System.out.println(path+servlet+"?"+param);
		return path+servlet+"?"+param;
	}

	@RequestMapping(value = "/validateName.action")
	@ResponseBody
	public String validateName(String name, HttpServletResponse response) throws IOException {
		System.out.println(name);
		Book b = this.bookService.validateName(name);
		System.out.println(b);

		// HttpServletResponse response=ServletActionContext.getResponse();

		response.setContentType("text/html;charset=UTF-8");

		if (b != null) {

			response.getWriter().write("{\"valid\":\"false\"}");// ������

			// return "redirect:/register.jsp";

		} else {

			response.getWriter().write("{\"valid\":\"true\"}");// ����

			// return "redirect:/list";
		}
		return NONE;

	}
	// 导出选择

	@RequestMapping(value = "/outputSelect/{ids}", method = RequestMethod.GET)
	public String outSelect(@PathVariable("ids") String ids, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		String[] arr = ids.split(",");

		List<Book> list = bookService.queryBooks(arr);

		System.out.println(list);
		String key = "选择";

		// 1.创建一个工作簿

		HSSFWorkbook workbook = new HSSFWorkbook();

		// 2.创建一个工作表

		HSSFSheet sheet = workbook.createSheet("图书信息表");

		// HSSFSheet sheet2 = workbook.createSheet();

		// 设置单元格的宽度,

		sheet.setColumnWidth(4, 15 * 256);

		// 3.创建行，并在行中写入数据（表头）

		// 创建一个样式对象

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体样式的

		font.setBold(true);

		font.setColor(HSSFColor.BLUE.index);


		String[] title = { "图书编号", "图书名称", "价格", "出版社", "状态", "借书人", "分类名", "分类编号" };

		HSSFRow row = sheet.createRow(0);// 从0开始,第一行

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);// 0 1 2 3 4

			cell.setCellStyle(style);

			cell.setCellValue(title[i]);

		}

		// 4.把list里面的数据放进去

		// List<Fenlei> list =
		// FenleiServiceFactory.getFenleiServiceImpl().showFenlei();

		// 在创建一个样式对象

		HSSFCellStyle style2 = workbook.createCellStyle();

		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 要几行？

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

			Book b = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(b.getId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(b.getName());

			HSSFCell cell3 = row2.createCell(2);

			cell3.setCellStyle(style2);

			cell3.setCellValue(b.getJiage());

			HSSFCell cell4 = row2.createCell(3);

			cell4.setCellStyle(style2);

			cell4.setCellValue(b.getChubanshe());

			HSSFCell cell5 = row2.createCell(4);

			cell5.setCellStyle(style2);

			cell5.setCellValue(b.getZhuangtai());


			HSSFCell cell6 = row2.createCell(5);

			cell6.setCellStyle(style2);

			cell6.setCellValue(b.getJieshuren());


			HSSFCell cell7 = row2.createCell(6);

			cell7.setCellStyle(style2);

			cell7.setCellValue(b.getFenlei());

			HSSFCell cell8 = row2.createCell(7);

			cell8.setCellStyle(style2);

			cell8.setCellValue(b.getfId());

		}

		// 内存，把数据输出到硬盘

		File f = new File("图书信息表.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

		// 响应该浏览器

		String file = f.getName();// "person.xls"

		// System.out.println(file);

		String mime = req.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

		String disposition = "attachment;filename=" + fileName;

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		resp.setHeader("Content-Type", mime);

		resp.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = resp.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);

		return null;

	}
	// 导出全部

	@RequestMapping(value = "/outAll", method = RequestMethod.GET)
	public String outAll(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		List<Book> list = bookService.list2();

		String key = "全部";

		// 1.创建一个工作簿

		HSSFWorkbook workbook = new HSSFWorkbook();

		// 2.创建一个工作表

		HSSFSheet sheet = workbook.createSheet("图书信息表");

		// HSSFSheet sheet2 = workbook.createSheet();

		// 设置单元格的宽度,

		sheet.setColumnWidth(4, 15 * 256);

		// 3.创建行，并在行中写入数据（表头）

		// 创建一个样式对象

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体样式的

		font.setBold(true);

		font.setColor(HSSFColor.BLUE.index);

		style.setFont(font);

		String[] title = { "图书编号", "图书名称", "价格", "出版社", "状态", "借书人", "分类名", "分类编号" };

		HSSFRow row = sheet.createRow(0);// 从0开始,第一行

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);// 0 1 2 3 4

			cell.setCellStyle(style);

			cell.setCellValue(title[i]);

		}

		// 4.把list里面的数据放进去

		// List<Fenlei> list =
		// FenleiServiceFactory.getFenleiServiceImpl().showFenlei();

		// 在创建一个样式对象

		HSSFCellStyle style2 = workbook.createCellStyle();

		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 要几行？

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

			Book b = list.get(i);
			//表格  "图书编号", "图书名称", "价格", "出版社", "状态", "借书人", "分类名", "分类编号"

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(b.getId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(b.getName());

			HSSFCell cell3 = row2.createCell(2);

			cell3.setCellStyle(style2);

			cell3.setCellValue(b.getJiage());

			HSSFCell cell4 = row2.createCell(3);

			cell4.setCellStyle(style2);

			cell4.setCellValue(b.getChubanshe());
			
			HSSFCell cell5 = row2.createCell(4);

			cell5.setCellStyle(style2);

			cell5.setCellValue(b.getZhuangtai());


			HSSFCell cell6 = row2.createCell(5);

			cell6.setCellStyle(style2);

			cell6.setCellValue(b.getJieshuren());

			
			HSSFCell cell7 = row2.createCell(6);

			cell7.setCellStyle(style2);

			cell7.setCellValue(b.getFenlei());

			HSSFCell cell8 = row2.createCell(7);

			cell8.setCellStyle(style2);

			cell8.setCellValue(b.getfId());

		}

		// 内存，把数据输出到硬盘

		File f = new File("图书信息表.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

		// 响应该浏览器

		String file = f.getName();// "person.xls"

		// System.out.println(file);

		String mime = req.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

		String disposition = "attachment;filename=" + fileName;

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		resp.setHeader("Content-Type", mime);

		resp.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = resp.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);

		return null;

	}

}
