package com.sist.tiles;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.SeoulunivDAO;
import com.sist.vo.BasicVO;
import com.sist.vo.SeoulunivVO;

@Controller
public class SeoulunivController {
   @Autowired
   private SeoulunivDAO sudao;
   
   @RequestMapping("main/seouluniv.do")
   public String main_seouluniv(Model model){
      List<SeoulunivVO> list=sudao.SeoulunivAllData();
      List<BasicVO> blist=new ArrayList<BasicVO>();
      int count=0;
      
      for(int i=0; i<100; i++){
         BasicVO vo=sudao.schoolbasic_info(list.get(i).getSchoolno());
         count=sudao.schoolbasic_count(list.get(i).getSchoolno());
         
         if(count!=0){
            blist.add(vo);
         }
      
      }
      
      model.addAttribute("blist", blist);
      model.addAttribute("list", list);
      
/*
 * 
 * var school_no = $('#school_no').val(); basic
   var school_name = $('#school_name').val(); basic
   var addr_road = $('#addr_road').val(); 
   var llocal = $('#llocal').val(); basic
 */
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
      
      
      return "main/seouluniv";
   }
}