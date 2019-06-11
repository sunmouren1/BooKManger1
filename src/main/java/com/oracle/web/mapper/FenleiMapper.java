package com.oracle.web.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.FenleiExample;

public interface FenleiMapper {
    long countByExample(com.oracle.web.bean.FenleiExample example);

    int deleteByExample(FenleiExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(com.oracle.web.bean.Fenlei record);

    int insertSelective(Fenlei record);

    List<Fenlei> selectByExample(FenleiExample example);

    Fenlei selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Fenlei record, @Param("example") FenleiExample example);

    int updateByExample(@Param("record") Fenlei record, @Param("example") FenleiExample example);

    int updateByPrimaryKeySelective(Fenlei record);

    int updateByPrimaryKey(Fenlei record);

	List<Fenlei> list();

	int save(Fenlei fenlei);

	List<Fenlei> selectAllByPageHelper();

	int counts();

	int yanzhengAddFenlei2(Integer id);

	List<Fenlei> selectOutPutIds(List<Integer> list);

	 

	
}