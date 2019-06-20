<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:10px;}
.map_wrap {position:relative;width:100%;height:900px;}
#category {position:absolute;bottom:10px;right:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
.wrap {position: absolute;left: 0;bottom: 45px;width: 165px;height: 70px;margin-left: -83px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 165px;height: 60px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding-right: 10px; padding-bottom: 20px; height: 20px;background: #eee;border-bottom: 1px solid #ddd;font-size: 12px;font-weight: bold;}
.info .close {position: absolute;top: 5px;right: 10px;color: #888;width: 10px;height: 10px;background: url('../main/img/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 2px 0 0 45px;height: 50px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 30px;height: 30px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
</style>
</head>
<body>
	<!-- <div class="container-fluid"> -->
		<!-- Page Heading -->
		<!-- <h1 class="h3 mb-4 text-gray-800">Blank Page</h1> -->
		<!-- **** Welcome Maps Area Start **** -->


<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
  
</div>

<script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38d1dc86015eedb6d87d13cbc38c372a&libraries=services"></script>
<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
/* var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다 */
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
/* var ps = new daum.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent(); */

//----------지도 컨트롤 우측상단 -----
// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
var mapTypeControl = new daum.maps.MapTypeControl();
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.TOTRIGHT);
//-------------------------------------------------------------------------------
////////////////////////////// test START ///////////////////////////
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
var schooladdress= '${school_addr}';
	if(schooladdress !='') {
		var myAddress = $.parseJSON('<%=request.getAttribute("json")%>');

	      var overlay  = new Array();;
	      
	      function myMarker(number, address) {
	         // 주소로 좌표를 검색합니다
	         geocoder.addressSearch(
	                     //'충북 청주시 흥덕구 진재로 30 연정빌딩',
	                     address,
	                     function(result, status) {
	                        // 정상적으로 검색이 완료됐으면 
	                        if (status === daum.maps.services.Status.OK) {

	                           var coords = new daum.maps.LatLng(
	                                 result[0].y, result[0].x);

	                           // 결과값으로 받은 위치를 마커로 표시합니다
	                           
	                           var marker = new daum.maps.Marker({
	                              map : map,
	                              position : coords
	                           });      

	                           // 인포윈도우로 장소에 대한 설명을 표시합니다

	                           var content;
	                           if(number > 0)
	                           {
	                                    
	                              
	                             content = '<div class="wrap">' + 
	                                 '    <div class="info">' + 
	                                 '        <div class="title">' + 
	                                 '            '+myAddress[number-1].off_name+  
	                                 '            <div class="close" onclick="closeOverlay('+number+')" title="닫기"></div>' + 
	                                 '        </div>' + 
	                                 '        <div class="body">' + 
	                                // '             <div class="img">' +
	                                // '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
	                                // '           </div>' +  
	                                // '            <div class="desc">' + 
	                                 '                <div class="ellipsis">&nbsp;&nbsp;'+address+'</div>' + 
	                                // '                <div class="jibun ellipsis">&nbsp;&nbsp;건축년도: '+myAddress[number-1].off_found_year+'년도</div>' + 
	                                // '                <div class="jibun ellipsis">&nbsp;&nbsp;가격:'+myAddress[number-1].off_price+'만원</div>' + 
	                                // '                <div class="jibun ellipsis">&nbsp;&nbsp;면적:'+myAddress[number-1].off_area+'평</div>' + 
 									   '				   <div>&nbsp;&nbsp;가격:'+myAddress[number-1].off_price+'만원 <input type="button" id="bu_detail_panel" name="'+number+'" value="상세보기" onclick=bu_detail(this); >' + 
                                 	//   '                <input type="hidden" id="addr" value=${myAddress.addr[number-1]} >' + 
                                    //   '                <input type="hidden" id="addr_main" value=${myAddress.addr_main[number-1]} >' + 
                                    //   '                <input type="hidden" id="addr_sub" value=${myAddress.addr_sub[number-1]} ></div>' + 
	                                //'            </div>' + 
	                                 '        </div>' + 
	                                 '    </div>' +    
	                                 '</div>';
	                           }
	                            else if(number == 0) // 학교
	                            {
	                               
	                               content = '<div class="wrap">' + 
	                                    '    <div class="info">' + 
	                                    '        <div class="title">' + 
	                                    '            ${schoolname}'+  
	                                    '            <div class="close" onclick="closeOverlay('+number+')" title="닫기"></div>' + 
	                                    '        </div>' + 
	                                    '        <div class="body">' + 
	                                    '             <div class="img">' +
	                                    '                <img src="../main/img/school_img.jpg" width="30" height="30">' +
	                                    '             </div>' +  
	                                    '            <div class="desc">' + 
	                                    '                <div class="ellipsis">'+address+'</div>' + 
	                             					// <input type="hidden" id="schoolinfo_no" value=${schoolno} >
	                                    /* '                <div><a href="#" class="schoolinfo_panel" value=${schoolno} target="_blank">상세보기</a></div>' +  */
	                                    				'<div>' +
	                                    					'<input type="button" id="schoolinfo_panel" value="상세보기" onclick =detail();>' +
	                                    					'<input type="hidden" id="schoolinfo_no" value=${schoolno}>' +
	                                    '				</div>' +
	                                    '            </div>' + 
	                                    '        </div>' +
	                                    '    </div>' +    
	                                    '</div>';
	                            }
	                           
	                           
	                           // 커스텀 오버레이가 표시될 위치입니다 
	                           var position = new daum.maps.LatLng(
	                                 result[0].y, result[0].x);

	                           // 커스텀 오버레이를 생성합니다
	                           overlay[number]  = new daum.maps.CustomOverlay(
	                                 {
	                                    map : map,
	                                    position : marker.getPosition(),
	                                    content : content
	                                    /* yAnchor : 1 */
	                                 });
	                           
	                           daum.maps.event.addListener(marker, 'click', function() {
	                               overlay[number].setMap(map);
	                           });
	                           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                           if(number==0)
	                           {
	                              map.setCenter(coords);
	                           }

	                        }
	                     });

	      }
	   

	      for (i = 0; i < myAddress.length; i++) {

	         myMarker(i + 1, myAddress[i].off_addr);
	      } 
	      myMarker(0, schooladdress);
	      
	      
	      
	      // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	      function closeOverlay(number) {
	          overlay[number].setMap(null);     
	      }
	      
	      function detail(){
	            //$('#schoolinfo_print').hide();
	         
	                  var schoolno = $('#schoolinfo_no').val();
	                   //var schoolno=$(this).attr("value");
	                     $.ajax({
	                        type:'post',
	                        url:'schoolinfo.do',
	                        data : {"schoolno": schoolno},
	                        success:function(res)
	                        {  
	                        	$('.panel').hide();
	               /*            $('#print_recommand').hide();  
	                           $('#print_seouluniv').hide();  
	                           $('#print_schoolrate').hide();  
	                           $('#print_bu_detail').hide();  
	                           $('#print_schoolinfo').hide(); */  
	                              
	                         $('#schoolinfo_print').show();
	                           $('#schoolinfo_print').html(res);
	                        }
	                     });
	               
	         }
	      
	      function bu_detail2(n){
	          //$('#schoolinfo_print').hide();
	       
	               /*  var addr=$('#addr').val();
	                var number_main=$('#addr_main').val();
	                var number_sub=$('#addr_sub').val(); */
	                 //var schoolno=$(this).attr("value");
	                var addr= myAddress[n-1].addr;
	                var number_main=myAddress[n-1].addr_main;
	                var number_sub=myAddress[n-1].addr_sub;

	                
	                   $.ajax({
	                      type:'post',
	                      url:'bu_detail.do',
	                      data : 
	                      {
	                    	  "ADDR": addr, 
	                    	  "NUMBER_MAIN" : number_main, 
	                    	  "NUMBER_SUB" : number_sub 
	                      },
	                      success:function(res)
	                      {  
	                      	$('.panel').hide();
	             /*          $('#print_recommand').hide();  
	                         $('#print_seouluniv').hide();  
	                         $('#print_schoolrate').hide();  
	                         $('#print_bu_detail').hide();  
	                         $('#print_schoolinfo').hide(); */  
	                            
	                       $('#bu_detail_print').show();
	                         $('#bu_detail_print').html(res);
	                      }
	                   });
	             
	       }

	}
	function bu_detail(btn)
	{
		bu_detail2(btn.name);
	}
	
////////////////////////추천 리스트 눌렀을 때 좌표 찍

	var building_name= '${building_name}';
		if(building_name !='') {
			var myAddress = $.parseJSON('<%=request.getAttribute("rec_list")%>');

		      var overlay  = new Array();
		      
		      function myMarker(number, address) {
		         // 주소로 좌표를 검색합니다
		         geocoder.addressSearch(
		                     //'충북 청주시 흥덕구 진재로 30 연정빌딩',
		                     address,
		                     function(result, status) {
		                        // 정상적으로 검색이 완료됐으면 
		                        if (status === daum.maps.services.Status.OK) {

		                           var coords = new daum.maps.LatLng(
		                                 result[0].y, result[0].x);

		                           // 결과값으로 받은 위치를 마커로 표시합니다
		                           
		                           var marker = new daum.maps.Marker({
		                              map : map,
		                              position : coords
		                           });      

		                           // 인포윈도우로 장소에 대한 설명을 표시합니다

		                           var content;
		                           if(number == 0)
		                           {
		                                    
		                              
		                             content = '<div class="wrap">' + 
		                                 '    <div class="info">' + 
		                                 '        <div class="title">' + 
		                                 '            '+myAddress[0].rec_name+  
		                                 '            <div class="close" onclick="closeOverlay('+number+')" title="닫기"></div>' + 
		                                 '        </div>' + 
		                                 
		                                 '        <div class="body">' + 
		                                 '          <div class="ellipsis">&nbsp;&nbsp;'+address+
		                                 '          </div>' + 
		                                 '        <div>' +
		                                 '          <input type="button" id="bu_detail_panel" name="'+number+'" value="상세보기" onclick=rec_bu_detail(this); >' + 
			                             '        </div>' + 
		                                 '        </div>' + 
		                                 '    </div>'+
		                                 ' </div>';
		                           }
		                           
		                           
		                           
		                           // 커스텀 오버레이가 표시될 위치입니다 
		                           var position = new daum.maps.LatLng(
		                                 result[0].y, result[0].x);

		                           // 커스텀 오버레이를 생성합니다
		                           overlay[number]  = new daum.maps.CustomOverlay(
		                                 {
		                                    map : map,
		                                    position : marker.getPosition(),
		                                    content : content
		                                    /* yAnchor : 1 */
		                                 });
		                           
		                           daum.maps.event.addListener(marker, 'click', function() {
		                               overlay[number].setMap(map);
		                           });
		                           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                          
		                              map.setCenter(coords);
		                           
		                        }
		                     });

		      }
		      myMarker(0, myAddress[0].rec_fullAddr);
		      
		      
		      function rec_bu_detail2(){
		          //$('#schoolinfo_print').hide();
		       
		               /*  var addr=$('#addr').val();
		                var number_main=$('#addr_main').val();
		                var number_sub=$('#addr_sub').val(); */
		                 //var schoolno=$(this).attr("value");
		                var addr= myAddress[0].rec_addr;
		                var number_main=myAddress[0].rec_numbermain;
		                var number_sub=myAddress[0].rec_numbersub;

		                
		                   $.ajax({
		                      type:'post',
		                      url:'bu_detail.do',
		                      data : 
		                      {
		                    	  "ADDR": addr, 
		                    	  "NUMBER_MAIN" : number_main, 
		                    	  "NUMBER_SUB" : number_sub 
		                      },
		                      success:function(res)
		                      {  
		                      	$('.panel').hide(); 
		                            
		                       $('#bu_detail_print').show();
		                         $('#bu_detail_print').html(res);
		                      }
		                   });
		             
		       }

		}
		function rec_bu_detail(btn)
		{
			rec_bu_detail2();
		}
      
</script>
	<!-- **** Welcome Maps Area End **** -->

	<!-- </div> -->
</body>
</html>