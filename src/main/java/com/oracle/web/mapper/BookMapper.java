package com.oracle.web.mapper;

import com.oralce.web.bean.Book;
import com.oralce.web.bean.SubBook;

import java.util.List;

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
}