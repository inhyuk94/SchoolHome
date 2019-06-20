<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.chart-content{
	width: 450px;
}
.sidebar #custom_sidebarToggle {
    width: 2.5rem;
    height: 2.5rem;
    text-align: center;
    margin-bottom: 1rem;
    cursor: pointer;
}
.sidebar #custom_sidebarToggle::after {
    font-weight: 900;
    content: '\f105';
    font-family: 'Font Awesome 5 Free';
    margin-right: .1rem;
}
#custom_sidebarToggle.changed::after {
    font-weight: 900;
    content: '\f104';
    font-family: 'Font Awesome 5 Free';
    margin-right: .1rem;
}
#custom_sidebarToggle.changed2::after {
    font-weight: 900;
    content: '\f105';
    font-family: 'Font Awesome 5 Free';
    margin-right: .1rem;
}
.sidebar-dark #custom_sidebarToggle {
    background-color: rgba(255,255,255,.2);
}
.sidebar-dark #custom_sidebarToggle::after {
    color: rgba(255,255,255,.5);
}
.mb-4{
	margin-top: 18px;
}
.card{
  margin-bottom: 15px;
}
#rec_header {
	padding-top: 18px;
}
#slider{
	width: 350px;
	margin-top: 15px;
}
.btn-container{
	text-align: center;
}
.btn-gray{
	background-color: #f8f9fc;
	border-color: #f8f9fc;
	color: #404040;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript">
var index=0;
var display=0; //스위치 변수
var i=0;
var a=0;
var b=0;
var c=0;
var d=0;
var e=0;
$(function(){
	
	$('#custom_sidebarToggle').click(function(){
		if(index == 0)
		{
			$('#custom_sidebarToggle').toggleClass('changed');
			$.ajax({
				type:'post',
				url:'recommand.do',
				success:function(res)
				{
					$('#print').html(res);
				}
			});
			index=1;
		}
		
		else
		{
			$('#print').hide();
			$('#custom_sidebarToggle').toggleClass('changed2');
			index=0;
		}
	});
	
	$('.recommand_panel').click(function() {
		if (display == 0) {
			$('.panel').hide();
			$.ajax({
				type:'post',
				url:'recommand.do',
				success:function(res)
				{
					$('#print_recommand').html(res);
				}
			});
			display = 1;
		}
		else {
			$('#print_recommand').html("");
			display = 0;
		}
	});
	
	$('.seouluniv_panel').click(function() {
		
		if (i == 0) {
			$('.panel').hide();
			$.ajax({
				type:'post',
				url:'seouluniv.do',
				success:function(res)
				{
					
					$('#print_seouluniv').html(res);
					
				}
			});
			i = 1;
		}
		else {
			$('#print_seouluniv').html("");
			i = 0;
		}
	});
	


	$('.schoolrate_panel').click(function() {

		if (a == 0) {
			$('.panel').hide();
			$.ajax({
				type:'post',
				url:'schoolrate.do',
				success:function(res)
				{
					$('#print_schoolrate').html(res);
				}
			});
			a = 1;
		}
		else {
			$('#print_schoolrate').html("");
			a = 0;
		}
	});

	$('.bu_detail_panel').click(function() {

		if (b == 0) {
			$('.panel').hide();
			$.ajax({
				type:'post',
				url:'bu_detail.do',
				success:function(res)
				{
					
					$('#print_bu_detail').html(res);
					google.charts.load('current', {'packages':['corechart']});
				    google.charts.setOnLoadCallback(drawVisualization);
				    drawVisualization();
				}   
			});
			b = 1;
		}
		else {
			$('#print_bu_detail').html("");
			b = 0;
		}
	});

	
	$('.news_panel').click(function() {		
		if (c == 0) {
			$('.panel').hide();
			$.ajax({
				type:'post',
				url:'news.do',
				success:function(res)
				{
					$('#print_news').html(res);
				}   
			});
			c = 1;
		}

		else {
			$('#print_news').html("");
			c = 0;
		}
	});
	
	$('.schoolinfo_panel').click(function() {
		if (d == 0) {
			$('.panel').hide();
			$.ajax({
				type:'post',
				url:'schoolinfo.do',
				success:function(res)
				{
					$('#print_schoolinfo').html(res);
				}
			});
			d = 1;
		}

		else {
			$('#print_schoolinfo').html("");
			d = 0;
		}
   });
	
   $('.chat_panel').click(function() {
		if (e == 0) {
			$('.panel').hide();
			$.ajax({
				type:'post',
				url:'../main/chat.do',
				success:function(res)
				{
					$('#print_chat').html(res);
				}
			});
			e = 1;
		}
		else {
			$('#print_chat').html("");
			e = 0;
		}
	});
	
});
	
function drawVisualization() {
    // Some raw data (not necessarily accurate)
    var data = google.visualization.arrayToDataTable([
      ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
      ['2004/05',  165,      938,         522,             998,           450,      614.6],
      ['2005/06',  135,      1120,        599,             1268,          288,      682],
      ['2006/07',  157,      1167,        587,             807,           397,      623],
      ['2007/08',  139,      1110,        615,             968,           215,      609.4],
      ['2008/09',  136,      691,         629,             1026,          366,      569.6]
    ]);

    var options = {
      title : 'Monthly Coffee Production by Country',
      vAxis: {title: 'Cups'},
      hAxis: {title: 'Month'},
      seriesType: 'bars',
      series: {5: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
    }

	
</script>
</head>
<body>
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../main/main.do">
        <div class="sidebar-brand-icon rotate-n-15">
          <!-- <i class="fas fa-laugh-wink"></i> -->
        </div>
        <div class="sidebar-brand-text mx-3">School∩Homes</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      
      <!-- Heading -->
      <!-- <div class="sidebar-heading">
        Addons
      </div> -->

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-school"></i>
          <span>학교랭킹</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item seouluniv_panel">서울대 입결</a>
            <a class="collapse-item schoolrate_panel">진학률</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
<!--       <li class="nav-item">
        <a class="nav-link bu_detail_panel">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>분석</span></a>
      </li> -->
      
      <li class="nav-item">
        <a class="nav-link recommand_panel">
          <i class="fas fa-thumbs-up"></i>
          <span>추천</span></a>	
      </li>
		<!-- News Table -->
	  <li class="nav-item">
        <a class="nav-link news_panel" href="../main/news.do">
          <i class="far fa-newspaper"></i>
          <span>뉴스</span></a>
      </li>
		
      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="../main/list.do">
          <i class="fas fa-fw fa-table"></i>
          <span>게시판</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link chat_panel">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>채팅</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <!-- <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="custom_sidebarToggle"></button>
      </div> -->
    </ul>
    

    <!-- 부동산 추천 -->
    <div id="print_recommand"></div>
    
    <!-- 서울대 진학순위 -->
    <div id="print_seouluniv"></div>
    
    <!-- 진학률 순위 -->
    <div id="print_schoolrate"></div>
    
    <!-- 부동산 디테일 -->
    <div id="bu_detail_print"></div>
    
    <!-- 부동산 차트 -->
    <div id="bu_detail_chart_print"></div>

    <!-- 학교정보 디테일 -->
    <div id="schoolinfo_print"></div>
    
    <!-- 뉴스 -->
    <div id="print_news"></div>
    
    <!-- 학교 검색 -->
	<div id="print_schoolsearch"></div>
	
	 <!-- 채팅 -->
    <div id ="print_chat"></div>
    
    <!-- 아파트 추천 리스트 -->
    <div id="print_recommand_list"></div>
    
    <!-- End of Sidebar -->
</body>
</html>
