package com.sist.tiles;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.SchoolDAO;
import com.sist.vo.highSchool_GraduateVO;
import com.sist.vo.highSchool_SeoulVO;

@Controller
public class SchoolinfoController {
   @Autowired
   private SchoolDAO sidao;
   
   @RequestMapping("main/schoolinfo.do")
   public String main_schoolinfo(String schoolno,Model model){
      
      highSchool_GraduateVO schoolvo=sidao.schoolDetailData(schoolno);
      model.addAttribute("schoolvo", schoolvo);
      
      highSchool_SeoulVO seoulvo=sidao.seoulDetailData(schoolno);
      model.addAttribute("seoulvo",seoulvo);
      
      
//      JSONArray arr=new JSONArray();
//      for(highSchool_GraduateVO vo:schlist)
//      {
//         JSONObject obj=new JSONObject();
//         obj.put("total", vo.getHIRED_TOTAL());
//         
//         arr.add(obj);
//      }
//      model.addAttribute("graduatedata", arr.toJSONString());
      
      return "main/schoolinfo";
   }
}