package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.Schoolmapper;
import com.sist.vo.*;

@Repository
public class SchoolDAO {
   @Autowired
   private Schoolmapper schoolmapper;
   
   public highSchool_GraduateVO schoolDetailData(String schoolno)
   {
      return schoolmapper.schoolDetailData(schoolno);
   }
   
   public highSchool_SeoulVO seoulDetailData(String schoolno)
   {
      return schoolmapper.seoulDetailData(schoolno);
   }
}