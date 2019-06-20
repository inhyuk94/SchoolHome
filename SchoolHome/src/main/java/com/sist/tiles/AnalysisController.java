package com.sist.tiles;

import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mongodb.util.JSON;
import com.sist.dao.AnalysisDAO;
import com.sist.dao.OfficeDAO;
import com.sist.vo.OfficetelVO;

@Controller
public class AnalysisController {

	@Autowired
	private AnalysisDAO anndao;

	@RequestMapping("main/bu_detail.do")
	public String main_bu_detail(OfficetelVO vo, Model model){
	
	
	List<OfficetelVO> list=anndao.aptAnalysisSubjectData(vo.getADDR(), vo.getNUMBER_MAIN(), vo.getNUMBER_SUB());
	System.out.println("list.size:"+list.size());
	System.out.println(vo.getADDR()+"//"+vo.getNUMBER_MAIN()+"//"+vo.getNUMBER_SUB());
	System.out.println("테스트:"+list.get(0).getBuild_No());
	System.out.println("테스트:"+list.get(0).getBuilding_NAME());
	
	model.addAttribute("list", list);
	
	return "main/bu_detail";
	}
	
	@RequestMapping("main/bu_detail_chart.do")
	public String main_chart(int AREA, String ADDR, String NUMBER_MAIN, String NUMBER_SUB, Model model )
	{
		List<OfficetelVO> list=anndao.aptAnalysisChartData(AREA, ADDR, NUMBER_MAIN, NUMBER_SUB);
		
		System.out.println(AREA);
		System.out.println(ADDR);
		System.out.println(NUMBER_MAIN);
		System.out.println(NUMBER_SUB);
		List<OfficetelVO> chart_list=new ArrayList<OfficetelVO>();
		
		for(OfficetelVO vo: list)
		{
			try{
				String temp="";
				int area=0;
				
				OfficetelVO chartvo=new OfficetelVO();

				temp=vo.getADDR()+""+vo.getNUMBER_MAIN()+""+vo.getNUMBER_SUB();
				area=vo.getAREA();
			
				chartvo.setAREA(vo.getAREA());
				chartvo.setPRICE(vo.getPRICE());
				chartvo.setNUMBER1(temp);
				chartvo.setBuilding_NAME(vo.getBuilding_NAME());
				chartvo.setCONTRACT_YM(vo.getCONTRACT_YM());
				chartvo.setFLOOR(vo.getFLOOR());
				chartvo.setFOUND_YEAR(vo.getFOUND_YEAR());

				chart_list.add(chartvo);
				
				}catch(Exception ex){
					ex.printStackTrace();
				}

		}
		
		JSONArray arr=new JSONArray();
		for(OfficetelVO vo:chart_list)
		{
			JSONObject obj=new JSONObject();
			obj.put("AREA", vo.getAREA());
			obj.put("FULL_AREA", vo.getNUMBER1());
			obj.put("FOUND_YEAR", vo.getFOUND_YEAR());
			obj.put("PRICE", vo.getPRICE());
			obj.put("Building_NAME", vo.getBuilding_NAME());
			obj.put("CONTRACT_YM", vo.getCONTRACT_YM());
			obj.put("FLOOR", vo.getFLOOR());
			
			System.out.println(vo.getAREA());
			System.out.println(vo.getNUMBER1());
			System.out.println(vo.getFOUND_YEAR());
			System.out.println(vo.getPRICE());
			System.out.println(vo.getBuilding_NAME());
			System.out.println(vo.getCONTRACT_YM());
			System.out.println(vo.getFLOOR());
			
			arr.add(obj);
			
		}
		
		System.out.println("dd:"+list.size());
		model.addAttribute("list", list);
		model.addAttribute("json", arr.toJSONString());		

		return "main/bu_detail_chart";
	}

}