<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Blank</title>

  <!-- Custom fonts for this template-->
  <link href="../main/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../main/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Header START -->
    <tiles:insertAttribute name="header"/>
    <!-- Header END -->

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Menu START -->
	<tiles:insertAttribute name="menu"/>
    <!-- Menu END -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

<%--         <!-- Header START -->
       	<tiles:insertAttribute name="header"/>
        <!-- Header END --> --%>

        <!-- Body START -->
      	<tiles:insertAttribute name="body"/>
      	
        <!-- Body END -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer START-->
      <tiles:insertAttribute name="footer"/>
      <!-- Footer END-->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->


  <!-- Bootstrap core JavaScript-->
  <script src="../main/vendor/jquery/jquery.min.js"></script>
  <script src="../main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../main/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../main/js/sb-admin-2.min.js"></script>

</body>

</html>
