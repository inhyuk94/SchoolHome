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
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="../news/list.do" method="post">
						<div class="input-group">
							<input type="text" name="data" class="form-control bg-light border-0 small" placeholder="News Search.." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary">검색</button>
							</div>
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




