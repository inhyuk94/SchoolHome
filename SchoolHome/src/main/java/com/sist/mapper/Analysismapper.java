package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.OfficetelVO;

public interface Analysismapper {
	
	//SELECT DISTINCT addr, building_name, road_name, area FROM APARTMENT where addr like '%' || #{addr} || '%' AND addr like '%' || #{road_name} '%' AND '%' || #{number_main} || '%'"
	//		+ "AND '%' || #{number_sub} || '%'

	@Select("SELECT DISTINCT addr, building_name, road_name, area, number_main, number_sub, road_name, price, floor, contract_ym FROM APARTMENT where addr like '%' || #{addr} || '%'"
			+ " AND number_main=#{number_main}"
			+ " AND number_sub=#{number_sub}")
	public List<OfficetelVO> aptAnalysisSubjectData(Map map);
	
	@Select("SELECT COUNT(*) FROM APARTMENT where addr like '%' || #{addr} || '%'"
			+ " AND number_main=#{number_main}"
			+ " AND number_sub=#{number_sub}")
	public int aptAnalysisCount(Map map);
	
	@Select("SELECT DISTINCT addr, building_name, road_name, area, number_main, number_sub, road_name, price, floor, contract_ym FROM officetel where addr like '%' || #{addr} || '%'"
			+ " AND number_main=#{number_main}"
			+ " AND number_sub=#{number_sub}")
	public List<OfficetelVO> officeAnalysisSubjectData(Map map);
	
	@Select("SELECT COUNT(*) FROM officetel where addr like '%' || #{addr} || '%'"
			+ " AND number_main=#{number_main}"
			+ " AND number_sub=#{number_sub}")
	public int officeAnalysisCount(Map map);
	
	@Select("SELECT DISTINCT * FROM officetel where area=#{area} AND addr=#{addr} AND number_main=#{number_main} AND number_sub=#{number_sub}")
	public List<OfficetelVO> officeChartData(Map map);
	
	@Select("SELECT DISTINCT * FROM apartment_year where area=#{area} AND addr=#{addr} AND number_main=#{number_main} AND number_sub=#{number_sub}")
	public List<OfficetelVO> apartChartData(Map map);
	
	
		
}