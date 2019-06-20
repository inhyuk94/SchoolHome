package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.OfficetelVO;
import com.sist.vo.RecommandVO;
import java.util.*;

public interface RecommandMapper {
	@Select("SELECT DISTINCT addr FROM apartment WHERE addr LIKE '%'||'동'||'%'")
	public ArrayList<String> getDongList();

	@Select("SELECT addr, building_name, area, contract_ym, contract_date, floor, found_year, "
			+ "road_name, build_no, price, REPLACE(TO_CHAR(price, '999,9999'),',','억 ')||'만원' as price_temp FROM apartment WHERE addr LIKE '%' || #{addr} || '%' "
			+ "AND price <= #{price} AND area >= #{area} ORDER BY area ASC" )
	public List<RecommandVO> RecommandList(RecommandVO vo);
	
	@Select("SELECT * FROM apartment "
			+ "WHERE build_no = #{build_no}")
	public RecommandVO getRecommandDetail(int build_no);
}
