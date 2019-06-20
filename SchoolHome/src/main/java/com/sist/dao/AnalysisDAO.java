package com.sist.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.Analysismapper;
import com.sist.mapper.Officemapper;
import com.sist.vo.OfficetelVO;
@Repository
public class AnalysisDAO {
	
	@Autowired
	private Analysismapper annmapper;
	
	public List<OfficetelVO> aptAnalysisSubjectData(String addr, String addr2, String addr3)
	{
		List<OfficetelVO> list = new ArrayList<OfficetelVO>();
		Map map=new HashMap();
		map.put("addr", addr);
		map.put("number_main", addr2);
		map.put("number_sub", addr3);
		
		if(annmapper.aptAnalysisCount(map)==0)
		{
			list=annmapper.officeAnalysisSubjectData(map);
		}
		else
		{
			list=annmapper.aptAnalysisSubjectData(map);
		}
		return list;
	}
	
	public List<OfficetelVO> aptAnalysisChartData(int area, String addr, String addr2, String addr3)
	{
		List<OfficetelVO> list = new ArrayList<OfficetelVO>();
		Map map=new HashMap();
		map.put("area", area);
		map.put("addr", addr);
		map.put("number_main", addr2);
		map.put("number_sub", addr3);
		
		if(annmapper.aptAnalysisCount(map)==0)
		{
			list=annmapper.officeChartData(map);
		}
		else
		{
			list=annmapper.apartChartData(map);
		}
		return list;
	}
}
