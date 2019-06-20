package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;
import java.util.*;
//SELECT * FROM HIGHINFO_BASIC,HIGHINFO_GRADUATE WHERE HIGHINFO_BASIC.SCHOOLNO='S010000447' AND HIGHINFO_BASIC.SCHOOLNO=HIGHINFO_GRADUATE.SCHOOLNO
public interface Schoolmapper {
   @Select("SELECT * FROM HIGHINFO_GRADUATE WHERE schoolno=#{schoolno}")
   public highSchool_GraduateVO schoolDetailData(String schoolno);
   
   @Select("SELECT * FROM HIGHINFO_SEOULUNIV WHERE schoolno=#{schoolno}")
   public highSchool_SeoulVO seoulDetailData(String schoolno);
   
   
}