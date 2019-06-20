package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface SeoulunivMapper {
	// 서울대 입결 순위
	@Select("SELECT * FROM highinfo_seouluniv ORDER BY school_rank")
	public List<SeoulunivVO> SeoulunivAllData();
	
	// 널 값 처리
	@Select("SELECT count(*) FROM highinfo_basic WHERE schoolno=#{schoolno}")
	public int schoolbasic_count(String schoolno);
	
	// 학교 주소 가져오기
	@Select("SELECT * FROM highinfo_basic WHERE schoolno=#{schoolno}")
	public BasicVO schoolbasic_info(String schoolno);
}
