<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

/* 파이차트 */
#chartdiv {
   width      : 100%;
   height      : 400px;
   font-size   : 12px;
}

/* =============== */
/*html, body {height: 100%;}*/

.container {
  display: grid;
  grid-gap: 5px;
  
  grid-template-columns: 20% 30% 30% 20%;
  grid-template-rows: 50px 400px 180px 180px 20px 20px ; 
}

.item {
  border: 0.5px solid grey;/*transparent; grey; */
  /* font-size: 17px; */
  text-align: center;
}
.item-aa{
  grid-column-start: 2.5;
  grid-column-end: 3.5;
  grid-row-start: 1;
  grid-row-end: 1.5;
}
.item-f{
  grid-column-start: 1;
  grid-column-end: 5;
  grid-row-start: 1;
  grid-row-end: 1.5;
}
.item-c {
  grid-column-start: 1;
  grid-column-end: 5; /*5 */
  grid-row-start: 1.5;
  grid-row-end: 2.0;  /*2.5*/
}

.item-d {
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 1.0;
  grid-row-end: 2.0;
}

.item-e {
  grid-column-start: 3;
  grid-column-end: 5;
  grid-row-start: 1.0;
  grid-row-end: 2.0;
}
.item-z {
  grid-column-start: 3;
  grid-column-end: 5;
  grid-row-start: 2.0;
  grid-row-end: 3.0;
}
.item-i {
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 2.0;
  grid-row-end: 3.0;
}
/* .item-zz {
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 5;
  grid-row-end: 6.5;
} */

/*소제목*/
#sub{
font-weight: 600;
font-size: 17px;
}

/*소내용*/
#con{
font-weight: 500;
font-size: 15px;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
var chart = AmCharts.makeChart( "chartdiv", {
     "type": "pie",
     "theme": "light",
     "dataProvider": [{"total":${schoolvo.COLLEGE_TOTAL},"cate":"대학 진학자 수"},{"total":${schoolvo.HIRED_TOTAL},"cate":"취업자 수"},{"total":${schoolvo.OTHER_TOTAL},"cate":"기타"}],
     "valueField": "total",
     "titleField": "cate",
      "balloon":{
      "fixedPosition":true
     },
     "export": {
       "enabled": true
     }
   } );
</script>
</head>
<body>
  <!-- school rate  -->
  <div class="chart-content panel" id="print_schoolinfo">
    <div class="card-header">학교정보</div><br>
     <div class="card -mb4"> 
     <div class="container">      
        <div class="item item-f" style="font-weight:500;color:#5a5c69;font-size: 30px;">${seoulvo.SCHOOL_RANK }위&nbsp;&nbsp;&nbsp;${schoolvo.SCHOOLNAME }</div>
        <div class="item item-c">
                    총 졸업생 ${schoolvo.GRADUATE_TOTAL }명 (남 ${schoolvo.GRADUATE_MALE } 여 ${schoolvo.GRADUATE_FEMALE })<br>
          <div id="chartdiv">         
            <!-- 차트 출력 부분 -->
           </div>
        </div>
        
       <div class="item item-d" >
       <font color="#5a5c69" id="sub">서울대 입학생 수</font><br>
         <font id="con">수시:${seoulvo.ADMISSION_EARLY }명</font><br>
         <font id="con">정시:${seoulvo.ADMISSION_REGULAR }명</font><br>
          <font id="con">총:${seoulvo.ADMISSION_TOTAL }명</font><br>
       </div>
       
       <div class="item item-e">
       <font color="#5a5c69" id="sub">대학교 진학 학생 수</font><br>
         <font id="con">남자 ${schoolvo.COLLEGE_MALE }명</font><br>
         <font id="con">여자 ${schoolvo.COLLEGE_FEMALE }명</font><br>
          <font id="con">총   ${schoolvo.COLLEGE_TOTAL }명</font><br>
         <font id="con">대학교 진학률:${schoolvo   .COLLEGE_TOTAL_RATIO }%</font>
       </div>
       
       <div class="item item-i">
       <font color="#5a5c69" id="sub">취업자 현황</font><br>
        <font id="con">남자:${schoolvo.HIRED_MALE }명</font><br>
        <font id="con">여자:${schoolvo.HIRED_FEMALE }명</font><br>
        <font id="con">총 취업자:${schoolvo.HIRED_TOTAL }명</font><br>
        <font id="con">총 취업률:${schoolvo.HIRED_TOTAL_RATIO }%</font>
       </div>
       
        <div class="item item-z">
        <font color="#5a5c69" id="sub">기타</font><br>
        <font id="con">남자:${schoolvo.OTHER_MALE }명</font><br>
        <font id="con">여자:${schoolvo.OTHER_FEMALE }명</font><br>
        <font id="con">총:${schoolvo.OTHER_TOTAL }명</font><br>
        <font id="con">기타 비율:${schoolvo.OTHER_TOTAL_RATIO }%</font>
        </div>   
        
         <!-- <div class="item item-zz">
         <font color="#5a5c69" id="sub"></font><br>
        <font id="con"></font><br>
        <font id="con"></font><br>
        <font id="con"></font><br>
        </div> -->
      </div>
      </div>
     
  </div>
</body>
</html>