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
#header_search {
	width: 20%;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
var a=0
$(function(){
	$('#search').click(function() {
		if (a == 0) {
			var k=$('#key').val();
			$.ajax({
				type:'post',
				data:{"key":k},
				url:'search.do',
				success:function(res)
				{
					$('.panel').hide();
					$('#print_schoolsearch').html(res);
				}
			});
			a = 1;
		}
		else {
			$('#print_schoolsearch').html("");
			a = 0;
		}
	});
});
</script>
</head>
<body>
	<nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">
          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <!-- <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="search.do" method="post"> -->
            <div class="input-group" id="header_search">
              <input type="text" id	="key" class="form-control bg-light border-0 small" 
              placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <input type="button" class="btn btn-primary" id="search" value="검색">
            </div>
          <!-- </form> -->
          
          
          
          <div class="container" style="margin-bottom: 10px; margin-left: 625px;">
          	<img src="../main/img/logo.png" width="30%" height="30%">
          </div>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>
          </ul>
	</nav>
   
</body>
</html>