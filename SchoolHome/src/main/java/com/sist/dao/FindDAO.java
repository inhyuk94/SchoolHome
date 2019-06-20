package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FindMapper;
import com.sist.vo.BasicVO;

@Repository
public class FindDAO {
	@Autowired
	private FindMapper mapper;
	
	public List<BasicVO> highSchool_find(String key) {
		return mapper.highSchool_find(key);
	}
	
	public int highSchool_count(String key){
		return mapper.highSchool_count(key);
	}
}
