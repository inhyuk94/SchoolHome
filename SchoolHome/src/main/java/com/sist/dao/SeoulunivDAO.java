package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SeoulunivMapper;
import com.sist.vo.BasicVO;
import com.sist.vo.SeoulunivVO;

@Repository
public class SeoulunivDAO {
	@Autowired
	private SeoulunivMapper mapper;
		
	public List<SeoulunivVO> SeoulunivAllData() {
		return mapper.SeoulunivAllData();
	}
	
	public BasicVO schoolbasic_info(String schoolno) {
		return mapper.schoolbasic_info(schoolno);
	}
	
	public int schoolbasic_count(String schoolno) {
		return mapper.schoolbasic_count(schoolno);
	}
}
