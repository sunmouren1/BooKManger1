package com.oracle.web.mapper;

import com.oralce.web.bean.Fenlei;
import com.oralce.web.bean.FenleiExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FenleiMapper {
    long countByExample(com.oralce.web.bean.FenleiExample example);

    int deleteByExample(FenleiExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(com.oralce.web.bean.Fenlei record);

    int insertSelective(Fenlei record);

    List<Fenlei> selectByExample(FenleiExample example);

    Fenlei selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") Fenlei record, @Param("example") FenleiExample example);

    int updateByExample(@Param("record") Fenlei record, @Param("example") FenleiExample example);

    int updateByPrimaryKeySelective(Fenlei record);

    int updateByPrimaryKey(Fenlei record);

	List<Fenlei> list();

	int save(Fenlei fenlei);

	List<Fenlei> selectAllByPageHelper();

	int counts();

	int yanzhengAddFenlei2(Integer fid);

	List<Fenlei> selectOutPutIds(List<Integer> list);

	 

	
}