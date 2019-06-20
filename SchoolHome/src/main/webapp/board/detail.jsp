<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container-fluid">

          <!-- Page Heading -->
          <br>
          <br>
          <h1 class="h3 mb-2 text-gray-800">자유게시판</h1>
          <!--  <p class="mb-4">PL/SQL(PROCEDURE,FUNCTION,TRIGGER)</p> -->

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">상세보기</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <tr>
                    <th class="success text-center" width=20%>번호</th>
                    <td class="text-center" width=30%>${vo.no }</td>
                    <th class="success text-center" width=20%>작성일</th>
                    <td class="text-center" width=30%>
                    	<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
                    </td>
                  </tr>
                  <tr>
                    <th class="success text-center" width=20%>이름</th>
                    <td class="text-center" width=30%>${vo.name }</td>
                    <th class="success text-center" width=20%>조회수</th>
                    <td class="text-center" width=30%>${vo.hit }</td>
                  </tr>
                  <tr>
                    <th class="success text-center" width=20%>제목</th>
                    <td class="text-left" colspan="3">${vo.subject }</td>
                  </tr>
                  <tr>
                    <td class="text-left" valign="top" height=200 colspan="4">
                     ${vo.content }
                    </td>
                  </tr>
                  <tr>
                    <td class="text-right" colspan="4">
                      <a href="../board/update.do?no=${vo.no }" class="btn btn-xs btn-success">수정</a>
                      <a href="../board/delete.do?no=${vo.no }" class="btn btn-xs btn-info">삭제</a>
                      <a href="../board/list.do" class="btn btn-xs btn-danger">목록</a>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
</body>
</html>





