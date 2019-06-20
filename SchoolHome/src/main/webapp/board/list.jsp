<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
          <h1 class="h3 mb-2 text-gray-800">자유게시판</h1>
          <!-- <p class="mb-4">PL/SQL(PROCEDURE,FUNCTION,TRIGGER)</p> -->

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">게시물:${count }개</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <tr>
                    <td>
                      <a href="../board/insert.do" class="btn btn-sm btn-info">새글</a>
                    </td>
                  </tr>
                </table>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th width="10%" class="text-center">번호</th>
                      <th width="45%" class="text-center">제목</th>
                      <th width="15%" class="text-center">이름</th>
                      <th width="20%" class="text-center">작성일</th>
                      <th width="10%" class="text-center">조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach var="vo" items="${list }">
                    <tr>
                      <td width="10%" class="text-center">${vo.no }</td>
                      <td width="45%">
                        <a href="../board/detail.do?no=${vo.no }">${vo.subject }</a>
                        <%--
                             ../board/detail.do?no=${vo.no } (사용자 요청)
                             => @Controller 
                                public class BoardController
                                @RequestMapping("board/detail.do")
                                method호출 : 요청 처리 <==> MyBatis
                                
                                => 결과값 JSP model.addAttribute()
                                => JSP에서 결과값 출력
                         --%>
                      </td>
                      <td width="15%" class="text-center">${vo.name }</td>
                      <td width="20%" class="text-center">
                        <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
                      </td>
                      <td width="10%" class="text-center">${vo.hit }</td>
                    </tr>
                   </c:forEach>
                   <tr>
                     <td colspan="5" class="text-center">
                       <a href="../board/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
                       ${curpage } page / ${totalpage } pages
                       <a href="../board/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">다음</a>
                     </td>
                   </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

</body>
</html>