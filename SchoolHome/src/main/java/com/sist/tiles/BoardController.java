package com.sist.tiles;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.BoardVO;
@Controller
public class BoardController {
   @Autowired
   private BoardDAO dao;
   @RequestMapping("main/list.do")
   public String board_list(String page,Model model)
   {
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   
	   List<BoardVO> list=dao.boardAllData(curpage);
	   
	   model.addAttribute("list", list);
	   
	  
	   int totalpage=dao.boardTotalPage();
	   
	   int count=dao.boardRowCount();
	   
	  
	   model.addAttribute("curpage", curpage);
	   model.addAttribute("totalpage", totalpage);
	   model.addAttribute("count", count);
	   return "board/list";
   }
   @RequestMapping("board/insert.do")
   public String board_insert()
   {
	   return "board/insert";
   }
   @RequestMapping("board/insert_ok.do")
   public String board_insert_ok(BoardVO vo)
   {
	   dao.boardInsert(vo);
	   return "redirect:../board/list.do";
   }
   @RequestMapping("board/detail.do")
   public String board_detail(int no,Model model)
   {
	  
	   BoardVO vo=dao.boardDetailData(no);
	   
	   model.addAttribute("vo", vo);
	   return "board/detail";
   }
   
   @RequestMapping("board/update.do")
   public String board_update(int no,Model model)
   {
	   // 
	   BoardVO vo=dao.boardUpdateData(no);
	   model.addAttribute("vo", vo);
	   return "board/update";// 
   }
   
   @RequestMapping("board/update_ok.do")
   public String board_update_ok(BoardVO vo,Model model)
   {
	   // 
	   boolean bCheck=dao.boardUpdateOk(vo);
	   System.out.println("bCheck:"+bCheck);
	   model.addAttribute("bCheck", bCheck);
	   model.addAttribute("no", vo.getNo());
	   return "board/update_ok";
   }
   
   @RequestMapping("board/delete.do")
   public String board_delete(int no,Model model)
   {
	   model.addAttribute("no", no);
	   return "board/delete";
   }
   
   @RequestMapping("board/delete_ok.do")
   public String board_delete_ok(int no,String pwd,Model model)
   {
	   // MyBatis
	   boolean bCheck=dao.boardDelete(no, pwd);
	   model.addAttribute("bCheck", bCheck);
	   return "board/delete_ok";
   }
}








