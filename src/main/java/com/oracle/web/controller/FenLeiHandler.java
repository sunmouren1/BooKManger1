package com.oracle.web.controller;

 

import java.io.IOException;
import java.util.List;

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
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.service.FenleiService;
 
 
@Controller
@Scope(value = "prototype")
public class  FenLeiHandler{
	 
	@Autowired
	private FenleiService fenleiService;
	
	@RequestMapping(value="/fenlei1",method=RequestMethod.GET)
	public String fenleis(HttpServletRequest request) {


	
		
			List<com.oracle.web.bean.Fenlei> list = fenleiService.list();


			System.out.println(list);

			
			request.setAttribute("fList", list);


			return "showFenlei";
		}

	@RequestMapping(value="/fenlei",method=RequestMethod.POST)
	public String add(Fenlei fenlei){
		
		fenleiService.save(fenlei);
		
		return "redirect:/fenleis/1";
		
	}
	
	
		@RequestMapping(value = "/yanzhengAddFenlei", method = RequestMethod.GET)
		public void yanzhengAddFenlei(@RequestParam(value = "name") String name, @RequestParam(value = "id") String id,
				HttpServletResponse response) throws IOException {
			
			 
			response.setContentType("text/html;charset=UTF-8");
			Fenlei f = this.fenleiService.yanzhengAddFenlei(name, id);

			
			if (f == null) {
				
				response.getWriter().write("{\"valid\":\"true\"}");
			} else {
				

				response.getWriter().write("{\"valid\":\"false\"}");

			}
			

		}

	
	@RequestMapping(value = "/fenlei_delete/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") String id1,HttpSession session) {

		Integer id=Integer.parseInt(id1);
		
		int a= this.fenleiService.yanzhengAddFenlei2(id);
		if(a==0){
			Fenlei f = new Fenlei();


			f.setId(id);


			fenleiService.delete(f);

			session.setAttribute("mag", "删除成功");
			return "redirect:/fenleis/1";

		}else{
			
			session.setAttribute("mag", "该分类下有图书禁止删除");
			 
			return "redirect:/fenleis/1";

		}

	 

	}
	
	
	@RequestMapping(value = "/fenlei/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") String id1, HttpSession session) {

          Integer id=Integer.parseInt(id1);
		Fenlei fenlei = fenleiService.selectByPrimaryKey(id);

		List<Fenlei> flist = this.fenleiService.selectFenleiAll();
		session.setAttribute("flist", flist);
	 
		session.setAttribute("f", fenlei);
 
		return "updatefl";


	}
	
	@RequestMapping(value = "/fenleiupdate", method = RequestMethod.PUT)
	public String update(Fenlei fenlei) {


		fenleiService.update(fenlei);


		return "redirect:/fenleis/1";
		
	}
	
	
	@RequestMapping(value = "/fenleis/{pageNow}", method = RequestMethod.GET)
	public String list(@PathVariable(value = "pageNow") Integer pageNow, HttpServletRequest request) {




		if (pageNow == null || pageNow < 1) {


			pageNow = 1;


		}


		PageBean<Fenlei> pb = this.fenleiService.selectAllByPageHelper(pageNow);


		request.setAttribute("pb", pb);
		
		System.out.println(pb);


		return "showFenlei";
	}
	
	// 验证修改分类
		@RequestMapping(value = "/yzfenleiupdate", method = RequestMethod.GET)
		public void yzfenleiupdate( @RequestParam(value = "name") String name, @RequestParam(value = "id") Integer id ,HttpServletResponse response) throws IOException {
		
			response.setContentType("text/html;charset=UTF-8");
			Fenlei f = this.fenleiService.yanzhengAddFenlei(name);

	
			if (f == null) {
			
				
				int a= this.fenleiService.yanzhengAddFenlei2(id);
				if(a==0){
				response.getWriter().write("{\"valid\":\"true\"}");
				}else{
					response.getWriter().write("{\"valid\":\"false\"}");
				}
			  
			} else {
				

				response.getWriter().write("{\"valid\":\"false\"}");

			}
		

		}
	
	
		// 导出分类
		@RequestMapping(value = "/outPutFenLei/{ids}", method = RequestMethod.GET)
		public void
		outPutFenLei(@PathVariable(value = "ids") String ids1,HttpServletResponse response) throws IOException {
			 
			List<Fenlei> list = null;
			String key = "";
			if (ids1.equals("a")) {//传入a 表示导出全部
				
				list = this.fenleiService.outPutFenLeiAll();
				key = "全部";

			}else{ 
				//System.out.println(ids1);
				list = this.fenleiService.outPutFenleiIds(ids1);
				key = "勾选";

			}
			
			HSSFWorkbook Workbook = new HSSFWorkbook();
		
			HSSFSheet sheet = Workbook.createSheet(key + "分类信息表");
	          
			sheet.setColumnWidth(7, 15 * 256); 

			HSSFCellStyle style = Workbook.createCellStyle();
			style.setAlignment(CellStyle.ALIGN_CENTER);
			HSSFFont font = Workbook.createFont();
			font.setBold(true);
			font.setColor(HSSFColor.DARK_RED.index);
			style.setFont(font);
			String[] title = { "分类编号", "分类名"};
			HSSFRow row = sheet.createRow(0);
			for (int i = 0; i < title.length; i++) {
				HSSFCell cell = row.createCell(i);
				cell.setCellStyle(style);
				cell.setCellValue(title[i]);
			}
			HSSFCellStyle style1 = Workbook.createCellStyle();
			style1.setAlignment(CellStyle.ALIGN_CENTER);
			for (int i = 0; i < list.size(); i++) { 

				HSSFRow row1 = sheet.createRow(i + 1);
				Fenlei fenlei = list.get(i);

				HSSFCell cell1 = row1.createCell(0);
				cell1.setCellValue(fenlei.getId());

				HSSFCell cell2 = row1.createCell(1);
				cell2.setCellValue(fenlei.getName());
 
  
 
				cell1.setCellStyle(style1);
				cell2.setCellStyle(style1);
				 
			 
 
			}
			 
			 String name = key +"分类信息表.xls"; 
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment;filename="+new String(name.getBytes("UTF-8"), "iso-8859-1"));
			response.flushBuffer();
			 Workbook.write(response.getOutputStream());
			 
		}

	}
