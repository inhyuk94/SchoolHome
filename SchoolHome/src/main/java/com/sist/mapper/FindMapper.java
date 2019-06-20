package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.BasicVO;

import java.util.*;

public interface FindMapper {
	
	@Select("SELECT * FROM highinfo_basic WHERE schoolname LIKE '%'||#{key}||'%'")
	public List<BasicVO> highSchool_find(String key);
	
	@Select("SELECT COUNT(*) FROM highinfo_basic WHERE schoolname LIKE '%'||#{key}||'%'")
	public int highSchool_count(String key);
}	
