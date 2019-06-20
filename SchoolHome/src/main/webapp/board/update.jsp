<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <p class="mb-4">PL/SQL(PROCEDURE,FUNCTION,TRIGGER)</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">수정하기</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
               <form method="post" action="update_ok.do">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <tr>
                    <th width=10% class="success text-center">이름</th>
                    <td>
                      <input type=text name=name size=15 value="${vo.name }">
                      <input type=hidden name=no value="${vo.no }">
                    </td> 
                  </tr>
                  <tr>
                    <th width=10% class="success text-center">이메일</th>
                    <td>
                      <input type=text name=email size=40 value="${vo.email }">
                    </td> 
                  </tr>
                  <tr>
                    <th width=10% class="success text-center">제목</th>
                    <td>
                      <input type=text name=subject size=40 value="${vo.subject }">
                    </td> 
                  </tr>
                  <tr>
                    <th width=10% class="success text-center">내용</th>
                    <td>
                      <textarea rows="8" cols="45" name=content>${vo.content }</textarea>
                    </td> 
                  </tr>
                  <tr>
                    <th width=10% class="success text-center">비밀번호</th>
                    <td>
                      <input type="password" size=15 name=pwd>
                    </td> 
                  </tr>
                  <tr>
                    <td colspan="2" class="text-center">
                      <input type=submit value="수정하기">
                      <input type=button value="취소"
                        onclick="javascript:history.back()">
                    </td>
                  </tr>
                </table>
                </form>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
   
</body>
</html>