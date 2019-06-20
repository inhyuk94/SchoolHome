package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * SIDOEDU                VARCHAR2(500)  
LOCALEDU               VARCHAR2(500)  
LLOCAL                 VARCHAR2(2000) 
SCHOOLNO               VARCHAR2(100)  
SCHOOLNAME             VARCHAR2(1000) 
SCHOOLCODE             VARCHAR2(100)  
SCHOOLTYPE             VARCHAR2(100)  
DAYANDNIGHT            VARCHAR2(100)  
GRADUATE_MALE          VARCHAR2(100)  
GRADUATE_FEMALE        VARCHAR2(100)  
COLLEGE_MALE           VARCHAR2(100)  
COLLEGE_FEMALE         VARCHAR2(100)  
COLLEGE_TOTAL          VARCHAR2(100)  
COLLEGE_TOTAL_RATIO    VARCHAR2(100)  
HIRED_MALE             VARCHAR2(100)  
HIRED_FEMALE           VARCHAR2(100)  
HIRED_TOTAL            VARCHAR2(100)  
HIRED_TOTAL_RATIO      VARCHAR2(100)  
OTHER_MALE             VARCHAR2(100)  
OTHER_FEMALE           VARCHAR2(100)  
OTHER_TOTAL            VARCHAR2(100)  
OTHER_TOTAL_RATIO      VARCHAR2(100)  
GRADUATE_TOTAL         NUMBER  
 */
@Getter
@Setter
public class SchoolrateVO {
	
private String schoolno;
private String schoolname;
private String graduate_total;

}
