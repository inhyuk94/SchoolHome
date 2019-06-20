package com.sist.tiles;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;

import com.sist.dao.OfficeDAO;
import com.sist.dao.RecommandDAO;
import com.sist.vo.BasicVO;
import com.sist.vo.OfficetelVO;
import com.sist.vo.RecommandVO;

@Controller
public class RecommandController {
	@Autowired
	private RecommandDAO rdao;
	@Autowired
	private OfficeDAO offdao;
	
	@RequestMapping("main/recommand.do")
	public String main_recommand(Model model){
		

		ArrayList<String> dongList = rdao.getDongList();	
		
		// jsonArray로 변환
		JSONArray arr=new JSONArray();
		for(String dong:dongList)
		{
			arr.add(dong);
			/*System.out.println(dong);*/
		}
			
		model.addAttribute("list", arr.toJSONString());
	/*	model.addAttribute("rList", rList);*/
		return "main/recommand";
	}
	
	@RequestMapping("main/recommand_list.do")
	public String main_recommand_list(RecommandVO vo, Model model) {
	
		RecommandVO rvo = new RecommandVO();
		rvo.setAddr(vo.getAddr());
		rvo.setArea(vo.getArea());
		rvo.setPrice(vo.getPrice());
		rvo.setPrice_temp(vo.getPrice_temp());
		rvo.setBuild_no(vo.getBuild_no());
			
		List<RecommandVO> list = rdao.RecommandList(rvo);	
		
	    JSONArray arr = new JSONArray();
	    for (RecommandVO avo :list) {
	    	JSONObject obj = new JSONObject();
	    	obj.put("build_no", avo.getBuild_no());
	    	
	    	arr.add(obj);
	     }
	    
	    model.addAttribute("aptjson", arr.toJSONString());
		model.addAttribute("list", list);
		
		return "main/recommand_list";
	}
	
	@RequestMapping("main/aptSelect.do")
	public String aptSelect(int build_no, Model model){
		RecommandVO vo = rdao.getRecommandDetail(build_no);
		String s = "";
		try{
			// 주소 
			String temp = "";
			if (!vo.getNumber_sub().equals("0")) {
				temp = vo.getNumber_sub() + " ";
			}
			 s = vo.getAddr() + " " + vo.getNumber_main() + " " + temp;
			
			String off_name="";
			if(vo.getBuilding_name().contains("\"") || vo.getBuilding_name().contains("(")) // 이름에 "(ㅁㅁㅁ)" 형식일때
				{
					off_name=vo.getBuilding_name().replace("\"", "").trim();
		
				}
				
			else
			{
				off_name= vo.getBuilding_name(); 
			
			}
			
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
		
        vo.setNumber1(s);
		model.addAttribute("vo", vo);
		System.out.println(vo.getBuilding_name());
		System.out.println(vo.getRoad_name());
		System.out.println(s);
		// jsonArray로 변환off
		JSONArray arr=new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("rec_name", vo.getBuilding_name());
		obj.put("rec_addr", vo.getAddr());
		obj.put("rec_numbermain", vo.getNumber_main());
		obj.put("rec_numbersub", vo.getNumber_sub());
		obj.put("rec_roadname", vo.getRoad_name());
		obj.put("rec_fullAddr",vo.getNumber1());
		arr.add(obj);
		
		model.addAttribute("rec_list", arr.toJSONString());
		model.addAttribute("building_name", vo.getBuilding_name());

		return "main/body";
	}
	
}
