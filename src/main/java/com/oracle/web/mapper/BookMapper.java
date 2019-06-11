package com.oracle.web.mapper;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    Book selectByPrimaryKey(Integer id);

    List<Book> selectAll();

    int updateByPrimaryKey(Book record);

	List<SubBook> selectAllWithOneSQL();

	List<SubBook> showByPageHelper();
}