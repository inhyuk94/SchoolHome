package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * ADDR             VARCHAR2(1000) 
NUMBER1          VARCHAR2(100)  
NUMBER_MAIN      VARCHAR2(100)  
NUMBER_SUB       VARCHAR2(100)  
BUILDING_NAME    VARCHAR2(1000) 
CONTRACT_DATE    VARCHAR2(100)  
FOUND_YEAR       VARCHAR2(100)  
ROAD_NAME        VARCHAR2(1000) 
BUILD_NO         NUMBER         
AREA             NUMBER         
PRICE            NUMBER         
CONTRACT_YM      NUMBER         
FLOOR            NUMBEr
 */

@Getter
@Setter
public class RecommandVO {
	private String addr;             
	private String number1;        
	private String number_main;
	private String number_sub; 
	private String building_name;
	private int area;
	private int contract_ym; 
	private String contract_date;
	private String price, price_temp;  
	private int floor; 
	private String found_year; 
	private String road_name;
	private int build_no;
	
		
}
