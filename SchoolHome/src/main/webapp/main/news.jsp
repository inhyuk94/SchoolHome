<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.news-title{
  margin-top: 18px;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
var q=0
$(function(){
	$('#news_search').click(function() {
		if (q == 0) {
			var n=$('#key').val();
			$.ajax({
				type:'post',
				data:{"news_key":n},
				url:'news.do',
				success:function(res)
				{
					$('#print_newssearch').html(res);
				}
			});
			q = 1;
		}
		else {
			$('#print_newssearch').html("");
			q = 0;
		}
	});
});
</script>
</head>
<body>
  <div class="container-fluid">
          <!-- Page Heading -->
          <div class="news-title">
            <h1 class="h3 mb-2 text-gray-800">NEWS</h1>
		  </div>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">            
              	<div class="news-header">
              	    <h6 class="m-0 font-weight-bold text-black">검색 결과 : ${title }</h6>
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="news.do" method="post">
						<div style="padding-left: 100px">
							<input type="text" id="news_key" class="form-control bg-light border-0 small" 
             				 placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
							<input type="button" class="btn btn-primary" id="news_search" value="검색">
						</div>
					</form>
				</div>
			</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                 <c:forEach var="vo" items="${list }">
                  <thead class="table-dark">
                  <tr>
                    <th class="text-left">
                    		<a href="${vo.link }" target="_blank"style="color: white">${vo.title }(${vo.author })</a>
                    </th>
                    <th class="text-right">
                    <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></th>
                    
                  </tr>
                  </thead>
                  <tr>
                    <td colspan="2">
                     ${vo.description }</td>
                  </tr>
                 </c:forEach>
                </table>
               </div>
            </div>
          </div>
      </div>
</body>
</html>




