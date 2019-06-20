<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

/* $(function(){
	var d=0;
	var areaval;
	var addr;
	var number_main;
	var number_sub;
	
	addr=$('#addr').val();
	number_main=$('#addr_main').val();
	number_sub=$('#addr_sub').val();

	
	$('#selectID').change(function() {
		areaval=$(this).val();
		
		if (d == 0) {		
			 $.ajax({
				type:'post',
				url:'bu_detail_chart.do',
				data : 
                {
              	  "ADDR": addr, 
              	  "NUMBER_MAIN" : number_main, 
              	  "NUMBER_SUB" : number_sub ,
              	  "AREA": areaval
                },
				success:function(res)
				{
					$('.panel').hide();
					$('#bu_detail_chart_print').html(res);
				}
			}); 
			d = 1;
		}

		else {
			$('#bu_detail_chart_print').html("");
			d = 0;
		}
	});
}); */


</script>
<style type="text/css">	

select{

    -webkit-appearance: none;  /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    background: url(이미지 경로) no-repeat 95% 50%;  /* 화살표 모양의 이미지 */
}

/* IE 10, 11의 네이티브 화살표 숨기기 */
select::-ms-expand {
    display: none;
}

.avg_container{
	display: flex;
	justify-content: space-evenly;
} 
.deal_avg{
 	margin: 18px 0px;
}
.avg{
	margin-top: 0px;
	margin-bottom: 12px;
}
.det_header{
	background-color: #fff;
	border-bottom-width: 4px;
	display: flex;
	justify-content: space-between;
}
.dong_container{
	display: block;
}
.dong{
	margin: 0px;
}
.dong_sub{
	font-size: 10px;
}
</style>
</head>
<body>
  <!-- recommend -->
	<div class="chart-content panel" id="print_bu_detail">
		<div class="card-header">부동산 종합정보</div>
		<div class="card-header det_header">
		  <div class="dong_container">
		    <div class="dong_row">
		      <p class="dong"> &nbsp; &nbsp; &nbsp; ${list[0].ADDR }</p>
		      <span class="dong_sub"></span>
		    </div>
		    <div>
		      <h6 class="dong"><b>${list[0].building_NAME }</b></h6>
		    </div>
		  </div>
		  <div class="year_container">
				<div>
					<%-- <select id="selectID">
					 <option selected>평형 선택</option>
						<c:forEach var="vo" items="${list }" varStatus="i">
							<option value="${vo.AREA}">${vo.AREA }</option>
						</c:forEach>
						<input type="hidden" id="addr" value="${list[0].ADDR }">
					 	<input type="hidden" id="addr_main" value= ${list[0].NUMBER_MAIN }>
					 	<input type="hidden" id="addr_sub" value= ${list[0].NUMBER_SUB }>
					</select> --%>
					<%-- <span class="dong_sub">${list[0].AREA}</span> --%>
				</div>
			</div> 
		</div>
		<div class="container-fluid ">
		  <div class="avg_container">
		    <div class="table">
		      <table>
		        <tr>
		          <th>계약연월</th>
		          <th>가격</th>
		          <th>평형</th>
		          <th>층</th>
		        </tr>
		        <c:forEach var="cvo" items="${list }">
		          <tr>
		            <td>${cvo.CONTRACT_YM }</td>
		            <td>${cvo.PRICE }</td>
		            <td>${cvo.AREA }</td>
		            <td>${cvo.FLOOR }</td>
		          </tr>
		        </c:forEach>
		      </table>
		    </div>
		  
		    <!-- <div class="deal_avg">			
	          <p class="avg">3달 전 실거래 평균</p>
		      <h1 class="h3 mb-0 text-gray-800">3억 4,600</h1>
		    </div>
		    <div class="deal_avg">			
	          <p class="avg">최근 1개월 매물 평균</p>
		      <h1 class="h3 mb-0 text-gray-800">3억 4,933</h1>
		    </div> -->
		  </div>
			<!-- <div class="card -mb4">
				<div class="card-body">
					<div class="h5 mb-0 font-weight-bold text-gray-800">2018 실거래가 비교</div>
					<div id="chart_div" style="width: 400px; height: 200px;"></div>
				</div>				
			</div>		 -->
		</div>
		<hr style="border-width: 4px;">
	</div>
</body>
</html>
