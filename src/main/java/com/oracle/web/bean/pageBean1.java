package com.oracle.web.bean;


import java.io.Serializable;
import java.util.List;

public class pageBean1<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int pageNow1;
	
	private int counts1;
	
	private int pages1;
	
	private int pageSize1;
	
	private List<T> beanList1;

	private String url1;

	public pageBean1(int pageNow1, int counts1, int pages1, int pageSize1, List<T> beanList1, String url1) {
		super();
		this.pageNow1 = pageNow1;
		this.counts1 = counts1;
		this.pages1 = pages1;
		this.pageSize1 = pageSize1;
		this.beanList1 = beanList1;
		this.url1 = url1;
	}

	public pageBean1() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPageNow1() {
		return pageNow1;
	}

	public void setPageNow1(int pageNow1) {
		this.pageNow1 = pageNow1;
	}

	public int getCounts1() {
		return counts1;
	}

	public void setCounts1(int counts1) {
		this.counts1 = counts1;
	}

	public int getPages1() {
		
		int pages1=this.counts1/this.pageSize1;
		
		return (this.counts1%this.pageSize1==0)?pages1:pages1+1;
	}

	public void setPages1(int pages1) {
		this.pages1 = pages1;
	}

	public int getPageSize1() {
		return pageSize1;
	}

	public void setPageSize1(int pageSize1) {
		this.pageSize1 = pageSize1;
	}

	public List<T> getBeanList1() {
		return beanList1;
	}

	public void setBeanList1(List<T> beanList1) {
		this.beanList1 = beanList1;
	}

	public String getUrl1() {
		return url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	@Override
	public String toString() {
		return "pageBean1 [pageNow1=" + pageNow1 + ", counts1=" + counts1 + ", pages1=" + pages1 + ", pageSize1="
				+ pageSize1 + ", beanList1=" + beanList1 + "]";
	}


	
	
}
