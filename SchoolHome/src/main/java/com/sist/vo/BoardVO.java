package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
   private int no;
   private String name;
   private String email; 
   private String subject;
   private String content;
   private String pwd;
   private Date regdate;
   private int hit;
}
