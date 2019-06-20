<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rank-container {
   display: inline-block;
}

.rank{
	text-align:center;
	vertical-align:middle; 
	display:flex; 
	align-items:center;
	width:100%;
}

#school_name {
	margin: 0;
	font-family: inherit;
	font-size: 10px;
	line-height: inherit
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
var schooldetail_arr = $.parseJSON('<%=request.getAttribute("highjson")%>');

function school_click(n) {
   var school_no = schooldetail_arr[n].school_no;
   var school_name = schooldetail_arr[n].school_name;
   var addr_road = schooldetail_arr[n].addr_road;
   var llocal = schooldetail_arr[n].llocal;

   $.ajax({
      type : 'post',
      url : 'select.do',
      data : {
         "schoolno" : school_no,
         "schoolname" : school_name,
         "addr_road" : addr_road,
         "llocal" :llocal
      },
      success : function(res) {
         $('.panel').hide();

         $('#map').show();
         $('#map').html(res);
      }
   });
}

function s_click(btn)
{
   school_click(btn.name);
}


</script>
</head>
<body>
   <!-- seouluniv -->
   <div class="chart-content panel" id="print_seouluniv">
      <div class="card-header">서울대 입결 순위</div>
      <div class="container-fluid" id="main">
         <div class="content" id="rec_header">
            <p class="mb-4" style="font-size: 14px">2018년도 서울대에 입학한 학생 수를 기준으로 한 순위입니다.</p>
         </div>
         <hr style="border-width: 2px; border-color: #909090">
         
         <!-- 스크롤 설정 -->
         <div class="table-responsive" style="overflow:auto; width:400px; height:700px;">
            <table class="table" id="dataTable">
               <c:forEach var="svo" items="${list }" varStatus="i">
                  <c:if test="${i.index<100 }">
                     <tr>
                        <td class="h2 mb-0 text-gray-800 text-center" rowspan="3" width="25%" id="rank" align="center" valign="middle" 
                           style="padding-top: 20px; font-size: 30px">
                           ${i.count }
                        </td>
                        <td class="mb-0 text-gray-800 text-center" rowspan="2" width="50%" width="25%" height="75%"  align="center" valign="middle" 
                        style="font-size:13px; padding-top: 10px; padding-bottom: 5px; font-weight: bold">
                           <!-- 학교 상세정보로 이동 &addr_road=${blist[i.index].addr_road }&schoolname=${svo.schoolname } -->
                           <%-- <a href="../main/select.do?addr=${fn:replace(blist[i.index].llocal,'\"','')}&addr_road=${fn:replace(blist[i.index].addr_road,'\"','')}&schoolname=${svo.schoolname }&schoolno=${blist[i.index].schoolno}">${svo.schoolname }</a> --%>                                                
                        <%--    <input type="button" id="school_name"  value="${svo.schoolname }" onclick=school_click(); >
                           <input type="hidden" id="addr_road" value=${fn:replace(blist[i.index].addr_road,'\"','')}>
                           <input type="hidden" id="school_no" value="${svo.schoolno }">
                           <input type="hidden" id="llocal" value="${blist[i.index].llocal }"> --%>                           
                           ${svo.schoolname }                                              
                        </td>
                        <td class="mb-0 text-gray-800 text-center" rowspan="3" width="25%" 
                        style="font-size:20px; padding-top: 20px" >
                           ${svo.admission_total }명
                            <input type="button" class="btn btn-xs btn-primary" id="school_name" name="${i.index }" value="상세보기" onclick=s_click(this);>
                        </td>
                     </tr>
      
                     <tr>
                        <!-- 표 설정을 위한 tr -->
                     </tr>
                     
                     <tr>                  
                        <td class="mb-0 text-gray-800 text-center" style="font-size:10px">
                           <!-- 학교 주소로 이동(지도) -->
                           ${fn:replace(blist[i.index].addr_road,'\"','')}<br>                          
                        </td>               
                     </tr>
                  </c:if>
               </c:forEach>                                       
            </table>
         </div>
      </div>
      
      <div class="container-fluid" id="schoolinfo_div">
      
      </div>
   </div>

</body>
</html>