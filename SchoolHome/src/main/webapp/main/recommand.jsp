<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var next=0;
$(function(){
	
	    // addr 값
 	    var addrValue;
	    
	    $('#keyword').keyup(function(){
	    	addrValue = $('#keyword').val();
	    })
  
    $('#recommand_list').click(function() {
    	
        if (next == 0) {
           $.ajax({
              type:'post',
              data : {
                  "price" : priceValue,
                  "addr" : addrValue,
                  "area" : areaValue
               },
              url:'recommand_list.do',
              success:function(res)
              {   
                 $('.panel').hide();
                 $('#print_recommand_list').html(res);
              }
           });
           next = 1;
        }
        else {
           $('#print_recommand_list').html("");
           next = 0;
        }
     }); 


});

 
function ShowSliderValue(sVal)
{
   var obValueView = document.getElementById("slider_value_view");
   if(sVal>1000000000){
      var temp1=sVal;
      var temp2=sVal;
      temp1=sVal.substr(0,2)+"억";
      temp2=sVal.substr(2,4)+"만원";
      
      sVal=temp1+temp2;
      
      obValueView.innerHTML = sVal
   }
   else if(sVal>100000000){
      var temp1=sVal;
      var temp2=sVal;
      temp1=sVal.substr(0,1)+"억";
      temp2=sVal.substr(1,4)+"만원";
      
      sVal=temp1+temp2;
      
      obValueView.innerHTML = sVal
   }
   else {
      var temp1=sVal;
      temp1=sVal.substr(0,4)+"만원";
      
      sVal=temp1;
      
      obValueView.innerHTML = sVal
      
   }
   
   return sVal;
   
}
//price
var priceValue;
var price_tempValue;
 
var RangeSlider = function(){
   var range = $('.slider_range');
    
   range.on('input', function(){   
      var temp = this.value;
	   ShowSliderValue(this.value);
       priceValue = temp.substr(0,temp.length - 4);
       price_tempValue=ShowSliderValue(this.value);
   });
};

RangeSlider();
 
var areaValue;

function doOpenCheck(chk){
    var obj = document.getElementsByName("area_check");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;          
        }
    }
    areaValue = chk.value;
}



</script>
<style type="text/css">
.sizebtn-container{
   margin-top: 18px;
   display: flex;
   justify-content: space-evenly;
}
</style>
</head>
<body>
  <!-- recommend -->
	<div class="chart-content panel" id="print_recommand">
		<div class="card-header">아파트 추천</div>
		<form method="post" action="main/recommand.do">
		<div class="container-fluid">
			<div class="content" id="rec_header">
				<h1 class="h3 mb-0 text-gray-800">나에게 딱 맞는 아파트는?</h1>
				<p class="mb-4">지금 내 상황에 적합한 아파트들을 추천해 드립니다. 추천받은 아파트를 중심으로 아파트를
					탐색해보세요.</p>
			</div>
			<div class="card -mb4">
				<div class="card-body">
					<div class="h5 mb-0 font-weight-bold text-gray-800">최대 예산</div>
					<input class="slider_range" id="slider" value="0" type="range" min="50000000" max="2000000000" step="1000000">
					<font size=2 id="slider_value_view">0</font>
					<input type="hidden" id="price" name="price" value="">
					<input type="hidden" id="price_temp" name="price_temp" value="">
				</div>
				
			</div>
			<div class="card -mb4">
				<div class="card-body">
					<div class="h5 mb-0 font-weight-bold text-gray-800">지역</div>
					<p class="mb-4">선택한 지역을 기준으로 추천해 드립니다</p>
					<div class="input-group">
		              <input type="text" id="keyword" class="form-control bg-light border-0 small" placeholder="동을 입력하세요">
		              <input type="hidden" id="addr" name="addr" value="">		              
		              <div class="input-group-append">
		                <button class="btn btn-gray" type="button">
		                  <i class="fas fa-search fa-sm"></i>
		                </button>
		              </div>
		            </div>
				</div>
			</div>
			<div class="card -mb4">
				<div class="card-body">				
					<div class="h5 mb-0 font-weight-bold text-gray-800">최소 평형</div>				 
					<div class="sizebtn-container">
					  <input type='checkbox' name='area_check' id="area_check" value='33' onclick="doOpenCheck(this);"/>10평
					  <input type='checkbox' name='area_check' id="area_check" value='66' onclick="doOpenCheck(this);"/>20평
                      <input type='checkbox' name='area_check' id="area_check" value='100' onclick="doOpenCheck(this);"/>30평
                      <input type='checkbox' name='area_check' id="area_check" value='132' onclick="doOpenCheck(this);"/>40평
                      <input type='checkbox' name='area_check' id="area_check" value='165' onclick="doOpenCheck(this);"/>50평
	                </div>
				</div>				
			</div>
			<div class="btn-container">
			  <input type="hidden" id="area" name="area" value="">
			  <div class="btn-container">			  
			  <input type="button" class="btn btn-primary" id="recommand_list" value="다음"> 
         </div>
			</div>
		</div>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>