package com.sist.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.Officemapper;
import com.sist.vo.*;

@Repository
public class OfficeDAO {

	@Autowired
	private Officemapper officemapper;

	public List<OfficetelVO> OfficetestData(String addr_name) {

		List<OfficetelVO> list = new ArrayList<OfficetelVO>();

		List<OfficetelVO> offlist = officemapper.officetestData(addr_name);
		List<OfficetelVO> aptlist = officemapper.apttestData(addr_name);
	
		list.addAll(offlist);
		list.addAll(aptlist);
		

		return list;
	}

	public OfficetelVO officedetailData(String name,String addr,int index) {
		
		OfficetelVO vo = new OfficetelVO();
		Map map = new HashMap();
		map.put("building_name", name);
		map.put("addr",addr);
		
		if (index == 0) 
		{
			if(officemapper.officedetailCountData2(map) !=0)
			{
				vo = officemapper.officedetailData2(map);
			}
			else if(officemapper.aptdetailCountData2(map)!=0)
			{
				vo = officemapper.aptdetailData2(map);
			}
		
				
		}
	    else
	    {
	    	if(officemapper.officedetailCountData(map) !=0)
			{
				vo = officemapper.officedetailData(map);
			}
	    	else if(officemapper.aptdetailCountData(map)!=0)
			{
				vo = officemapper.aptdetailData(map);
			}
			
				
	    }
		
		return vo;
	}
}
