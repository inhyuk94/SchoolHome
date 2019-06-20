package com.sist.tiles;

import java.util.ArrayList;
import java.util.List;
import com.sist.vo.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.dao.*;

@Controller
public class MainController {
	@Autowired
	private OfficeDAO offdao;
	@Autowired
	private FindDAO fdao;
	@Autowired
	private SchoolDAO schdao;
	
	@RequestMapping("main/main.do")
	public String main_main() {
		return "main";
	}
	
	
	@RequestMapping("main/menu.do")
	public String main_menu(){
		return "main";
	}
	
	
	@RequestMapping("main/search.do")
	public String main_search(String key, Model model){
		List<BasicVO> flist=fdao.highSchool_find(key);
		int fcount=fdao.highSchool_count(key);
		
		model.addAttribute("fcount", fcount);
		model.addAttribute("flist", flist);
		
		return "main/search";
	}

	@RequestMapping("main/chat.do")
	public String main_chat(){
		return "main/chat";
	}
}
