package com.oracle.web.mapper;

import com.oralce.web.bean.Fenlei;
import java.util.List;

public interface FenleiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Fenlei record);

    Fenlei selectByPrimaryKey(Integer id);

    List<Fenlei> selectAll();

    int updateByPrimaryKey(Fenlei record);
}