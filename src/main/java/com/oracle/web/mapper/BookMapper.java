package com.oracle.web.mapper;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean1;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    Book selectByPrimaryKey(Integer id);

    List<Book> selectAll();

    int updateByPrimaryKey(Book record);

	List<SubBook> selectAllWithOneSQL();

	List<SubBook> showByPageHelper();

	

	Book validateName(String name);

	List<Book> list2();

	List<Book> queryBooks(String[] arr);

	List<SubBook> findName(String name);

	void deleteByIds(String[] arr);

	pageBean1<SubBook> showByWhere(Integer pageNow1,Book book);


	List<SubBook> showWhere2(@Param("where")Book where);
}