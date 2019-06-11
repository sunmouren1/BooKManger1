package com.oracle.web.mapper;

import java.util.List;

import com.oracle.web.bean.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    Admin selectByPrimaryKey(Integer id);

    List<Admin> selectAll();

    int updateByPrimaryKey(Admin record);

	Admin selectone(Admin admin);
}