<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
   src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
var aptdetail_arr = $.parseJSON('<%=request.getAttribute("aptjson")%>');

function apt_click(n) {
   var build_no=aptdetail_arr[n].build_no;
   
   $.ajax({		 
       type:'post',
       url:'aptSelect.do',
       data:{
    	   "build_no" : build_no
       },
       success:function(res)
       {   
          $('.panel').hide();
          $('#map').show();
          $('#map').html(res);
       }
    });
}

function a_click(btn)
{
	apt_click(btn.name);
}

</script>
<style type="text/css">
.rank-container {
   display: inline-block;
}

.rec_list {
   text-align: center;
   vertical-align: middle;
   display: flex;
   align-items: center;
   width: 100%;
}
.b_name{
	display: flex;
}
.building_name{
 margin-left: 10px
}
#rec_btn{
   border: 0;
   outline: 0;
   background-color: #f8f9fc;
}
</style>
</head>
<body>
   <!-- recommand_list-->
   <div class="chart-content panel" id="print_recommand">
      <div class="card-header">아파트 추천</div>
      <div class="container-fluid">
         <div class="content" id="rec_header">
            <h1 class="h3 mb-0 text-gray-800">나에게 딱 맞는 아파트는?</h1>
            <p class="mb-4">선택하신 조건으로 구매할 수 있는 아파트 목록입니다.</p>
         </div>
<!--          <hr style="border-width: 2px; border-color: #909090"> -->

         <!-- 스크롤 설정 -->
         <div class="table-responsive" style="overflow: auto; width: 400px; height: 700px;">
         <c:forEach var="vo" items="${list }" varStatus="i">       
            <div class="card -mb4">
            <div class="card-header py-3">
              <div class="b_name">
                <i class="far fa-building"></i>
                <h6 class="m-0 font-weight-bold text-primary building_name">
                  <%-- <input type="button" id="rec_btn" value="${vo.building_name }"> --%>               
                  <input type="button" id="rec_btn" name="${i.index }" value="${vo.building_name }" onclick=a_click(this);>
                </h6>
              </div>              
              <span class="addr">${vo.addr }&nbsp;${vo.road_name }</span>
            </div> 
                     
            <div class="card-body">           
            <table>
                  <tr>
                     
                     <td>${Math.round(vo.area/3.3) }평 &nbsp; ${vo.price_temp }</td>

                     <%-- <td>${vo.price_temp }</td> --%>
                  <tr>
                     <td>${vo.found_year }년 입주</td>
                  </tr>
                  <%-- <tr>
                     <td >${vo.addr }&nbsp;${vo.road_name }</td>
                  </tr> --%>
               </table>
            </div>
             <input type="hidden" name="build_no" id="build_no" value="${vo.build_no }">

            </div>
          </c:forEach> 
         </div>
         <div class="btn-container">
            <div class="btn btn-primary" id="before_rec_list">이전</div>
         </div>
		</div>
      </div>
</body>
</html>