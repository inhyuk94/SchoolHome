<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script type="text/javascript">
var bu_detail = $.parseJSON('<%=request.getAttribute("json")%>');
/* var options = {
          title : '2018년 실거래가 변동 내역',
          vAxis: {title: ''},
          hAxis: {title: '월별'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };
 */
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

	display: flex;

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

		<table>
			<tr>
				<th>거래년월</th>
				<th>거래가격</th>
				<th>층</th>
			</tr>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.contract_ym }</td>	
				<td>${vo.price}</td>	
				<td>${vo.floor}</td>
			</tr>
			</c:forEach>

		</table>

	</div>

</body>

</html>