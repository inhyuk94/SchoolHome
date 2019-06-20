package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.RecommandMapper;
import com.sist.vo.RecommandVO;

@Repository
public class RecommandDAO {
	@Autowired
	private RecommandMapper mapper;
	
	public ArrayList<String> getDongList(){
		return mapper.getDongList();
	}
	
	public List<RecommandVO> RecommandList(RecommandVO vo){
		return mapper.RecommandList(vo);
	}
	
	public RecommandVO getRecommandDetail(int build_no) {
		return mapper.getRecommandDetail(build_no);
	}

}
