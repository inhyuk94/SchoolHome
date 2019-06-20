package com.sist.tiles;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import com.sist.news.*;

@Controller
public class NewsController {
	@Autowired
	private NewsManager mgr;

	@RequestMapping("main/news.do")
	public String newsAllData(String data, Model model) {
		if (data == null)
			data = "부동산";
		List<Item> list = mgr.newsAllData(data);

		for (Item i : list) {
			i.setRegdate(new Date(i.getPubDate()));
		}
	
		model.addAttribute("list", list);
		model.addAttribute("title", data);
		return "news/list";
	}
}
