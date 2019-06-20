package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
SCHOOL_RANGE         VARCHAR2(500)  
SCHOOLNAME           VARCHAR2(1000) 
LLOCAL_SI            VARCHAR2(100)  
HIGH_TYPE            VARCHAR2(100)  
ADMISSION_EARLY      VARCHAR2(100)  
ADMISSION_REGULAR    VARCHAR2(100)  
ADMISSION_TOTAL      VARCHAR2(100)  
SCHOOL_RANK          NUMBER 
 */

@Getter
@Setter
public class SeoulunivVO {
	private String school_range;
	private String schoolname;
	private String llocal_si;
	private String high_type;
	private String admission_early;
	private String admission_regular;
	private String admission_total;
	private int school_rank;
	private String schoolno;
}
