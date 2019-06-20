package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import com.sist.vo.OfficetelVO;

public interface Officemapper {

	
	// 오피스텔
	@Select("SELECT DISTINCT addr, number_main, number_sub, building_name FROM officetel where addr like '%' || #{addr} || '%'")
	public List<OfficetelVO> officetestData(String addr);

	@Select("SELECT count(*) from officetel where building_name = #{building_name} AND addr like '%' || #{addr} || '%'")
	public int officedetailCountData(Map map);
	
	@Select("SELECT ROUND(AVG(found_year)) as found_year, ROUND(AVG(price)) as price, ROUND(AVG(area),1) as area from officetel where building_name = #{building_name} AND addr like '%' || #{addr} || '%'")
	public OfficetelVO officedetailData(Map map);

	@Select("SELECT count(*) from officetel where building_name like '%' || #{building_name} || '%' AND addr like '%' || #{addr} || '%'")
	public int officedetailCountData2(Map map);

	@Select("SELECT ROUND(AVG(found_year)) as found_year, ROUND(AVG(price)) as price, ROUND(AVG(area),1) as area from officetel where building_name like '%' || #{building_name} || '%' AND addr like '%' || #{addr} || '%'")
	public OfficetelVO officedetailData2(Map map);

	// 아파트
	@Select("SELECT DISTINCT addr, number_main, number_sub, building_name FROM apartment_search where addr like '%' || #{addr} || '%'")
	public List<OfficetelVO> apttestData(String addr);

	@Select("SELECT count(*) from apartment_search where building_name = #{building_name} AND addr like '%' || #{addr} || '%'")
	public int aptdetailCountData(Map map);

	@Select("SELECT ROUND(AVG(found_year)) as found_year, ROUND(AVG(price)) as price, ROUND(AVG(area),1) as area from apartment_search where building_name = #{building_name} AND addr like '%' || #{addr} || '%'")
	public OfficetelVO aptdetailData(Map map);

	@Select("SELECT count(*) from apartment_search where building_name like '%' || #{building_name} || '%' AND addr like '%' || #{addr} || '%'")
	public int aptdetailCountData2(Map map);

	@Select("SELECT ROUND(AVG(found_year)) as found_year, ROUND(AVG(price)) as price, ROUND(AVG(area),1) as area from apartment_search where building_name like '%' || #{building_name} || '%' AND addr like '%' || #{addr} || '%'")
	public OfficetelVO aptdetailData2(Map map);
}
