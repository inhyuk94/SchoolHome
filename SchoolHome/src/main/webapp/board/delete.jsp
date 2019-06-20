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
              <h6 class="m-0 font-weight-bold text-primary">삭제하기</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
               <form method="post" action="delete_ok.do">
                <table class="table table-bordered" id="dataTable" width="30%" cellspacing="0">
                  <tr>
                    <td class="text-center">비밀번호</td>
                    <td class="text-left">
                      <input type="password" name=pwd size=15>
                      <input type=hidden name=no value="${no }">
                    </td>
                  </tr>
                  <tr>
                   <td colspan="2" class="text-center">
                      <input type=submit value="삭제하기">
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
</body>
</html>