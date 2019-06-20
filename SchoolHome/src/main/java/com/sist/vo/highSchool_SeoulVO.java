package com.sist.vo;

import lombok.Getter;
import lombok.Setter;
/*
 * SCHOOL_RANGE
SCHOOLNAME
SCHOOL_RANK
LLOCAL_SI
HIGH_TYPE
ADMISSION_EARLY
ADMISSION_REGULAR
ADMISSION_TOTAL
 */
@Getter
@Setter
public class highSchool_SeoulVO {

	private String SCHOOL_RANGE;
	private String SCHOOLNAME;
	private int SCHOOL_RANK;
	private String LLOCAL_SI;
	private String HIGH_TYPE;
	private String ADMISSION_EARLY;
	private String ADMISSION_REGULAR;
	private String ADMISSION_TOTAL;
}
