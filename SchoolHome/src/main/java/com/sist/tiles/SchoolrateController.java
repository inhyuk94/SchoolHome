package com.sist.tiles;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.SchoolrateDAO;
import com.sist.vo.BasicVO;
import com.sist.vo.SchoolrateVO;

@Controller
public class SchoolrateController {
	@Autowired
	private SchoolrateDAO srdao;
	
	@RequestMapping("main/schoolrate.do")
	public String main_schoolrate(Model model){
		List<SchoolrateVO> list=srdao.SchoolrateAllData();
		List<BasicVO> blist=new ArrayList<BasicVO>();
		
		for(int i=0; i<100; i++){
			BasicVO vo=srdao.schoolbasic_info(list.get(i).getSchoolno());
			blist.add(vo);
		}
		
		model.addAttribute("blist", blist);
		model.addAttribute("list", list);
		
		JSONArray arr = new JSONArray();
	      for (BasicVO vo :blist) {
	         JSONObject obj = new JSONObject();
	         obj.put("school_no", vo.getSchoolno());
	         obj.put("school_name", vo.getSchoolname());
	         obj.put("addr_road", vo.getAddr_road().replace("\"", "").trim());
	         obj.put("llocal", vo.getLlocal());

	   
	         arr.add(obj);
	      }

	      //System.out.println(off_list.size());
	      model.addAttribute("highjson", arr.toJSONString()); 

		return "main/schoolrate";
	}
}
