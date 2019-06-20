package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.SchoolrateMapper;
import com.sist.vo.BasicVO;
import com.sist.vo.SchoolrateVO;
@Repository
public class SchoolrateDAO {

	@Autowired
	private SchoolrateMapper mapper;
	
	public List<SchoolrateVO> SchoolrateAllData()
	{
		return mapper.SchoolrateAllData();
	}
	
	public BasicVO schoolbasic_info(String schoolno) {
		return mapper.schoolbasic_info(schoolno);
	}
}
