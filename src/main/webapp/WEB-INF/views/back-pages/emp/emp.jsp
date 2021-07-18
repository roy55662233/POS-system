<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>後台系統</title>
<!-- Bootstrap 5 CSS CDN -->
<link
 href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
 rel="stylesheet"
 integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
 crossorigin="anonymous">
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
 integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
 crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="../css/style5.css">

<!-- Font Awesome JS -->
<script defer
 src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
 integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
 crossorigin="anonymous"></script>
<script defer
 src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
 integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
 crossorigin="anonymous"></script>


<title>Employee</title>
<script type="text/javascript">
 function clearForm() {
  var inputs = document.getElementsByTagName("input");
  for (var i = 0; i < inputs.length; i++) {
   if (inputs[i].type == "text") {
    inputs[i].value = "";
   }
   if (inputs[i].type == "number") {
    inputs[i].value = "";
   }
  }
 }
</script>


</head>
<style>
#empbody {
 text-align: center;
 margin-top: 2%;
}

#UploadForm {
 position: relative;
 margin: auto;
 text-align: left;
 /* border: 2px black solid; */
 width: 500px;
}

#message {
 position: relative;
 left: 500px;
 bottom: 500px;
}

.error {
 color: red;
}
</style>

<body>

 <div class="wrapper" style="text-align: center;">
  <!-- Sidebar Holder -->

  <nav id="sidebar">
			<div class="sidebar-header">
				<a href="<c:url value="/back-pages/bakeIndex.page" />"><h3>後台系統</h3></a>
			</div>

			<ul class="list-unstyled components">
				<p>系統管理及設定</p>

				<li>
					<a href="<c:url value="/pages/emp.page" />">員工管理</a>
				</li>
				
				<li>
					<a href="<c:url value="/pages/menutestJava.page" />">產品管理</a>
				</li>
				
				<li>
					<a href="<c:url value="/shop/orderCheck.page" />">訂單紀錄</a>
				</li>
				
				<li>
					<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">報表管理</a>
					
					<ul class="collapse list-unstyled" id="pageSubmenu">
						<li><a href="<c:url value="/report/reportSale.page" />">產品排行</a></li>
						<li><a href="<c:url value="/report/reportSale2.page" />">訂單銷售</a></li>
						<%-- <li><a href="#">考勤GDP</a></li> --%>
					</ul>
				
				</li>
				<%-- <li><a href="#">意見反饋</a></li> --%>
			</ul>

			<ul class="list-unstyled CTAs">
				<li><a href="<c:url value='/back-pages/logout.controller' />" class="download">登出</a></li>
			</ul>
		</nav>

  <!-- Page Content Holder -->
  <div id="content">

   <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">

     <button type="button" id="sidebarCollapse" class="navbar-btn">
      <span> </span> <span></span> <span></span>
     </button>
     <h2>員工管理</h2>
     
     

     <div ></div>


    </div>


   </nav>
   <%-- 員工管理內容 --%>
   <div id="empbody">
    <form method="get" id="UploadForm"
     action="/chicken/pages/empmanage.controller">
     <table>
      <tr>
       <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput"
         placeholder="員工編號" name="empID" value="${param.empID}">
        <label for="floatingInput">員工編號:</label>
       </div>

       <td><span class="error">${errors.empID}</span></td>
      </tr>
      <tr>
       <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput"
         placeholder="員工姓名" name="empName" value="${param.empName}">
        <label for="floatingInput">員工姓名:</label>
       </div>

      </tr>

      <tr>
       <div class="form-floating mb-3">
        <select class="form-select" aria-label="Default select example"
         name="empPostion">
         <option selected  value="${param.empPostion}">職位</option>
         <option>經理</option>
         <option>員工</option>

        </select> <label for="floatingInput">職位:</label>
       </div>

      </tr>
      <tr>
       <div class="form-floating mb-3">
        <input type="number" class="form-control" id="floatingInput"
         placeholder="上班時數" name="empHrs" value="${param.empHrs}">
        <label for="floatingInput">上班時數:</label>
       </div>

      </tr>


      <tr>
       <td><input class="btn btn-primary" type="submit"
        name="empcontroller" value="新增"> <input
        class="btn btn-primary" type="submit" name="empcontroller"
        value="更新"></td>
       <td><input class="btn btn-primary" type="submit"
        name="empcontroller" value="顯示全部"> <input
        class="btn btn-primary" type="submit" name="empcontroller"
        value="員工查詢"> <input class="btn btn-secondary"
        type="button" value="Clear" onclick="clearForm()"></td>
      </tr>
     </table>

    </form>
   </div>

   <h3>
    <span class="error">${errors.action}</span>
   </h3>

   

   <c:if test="${not empty insert}">
    <h3>新增成功</h3>
    <table border="1">
     <tr>
      <td>員工編號</td>
      <td>${insert.empID}</td>
     </tr>
     <tr>
      <td>員工姓名</td>
      <td>${insert.empName}</td>
     </tr>
     <tr>
      <td>職位</td>
      <td>${insert.empPostion}</td>
     </tr>
     <tr>
      <td>上班時數</td>
      <td>${insert.empHrs}</td>
     </tr>
     <%--  <tr><td>Expire</td><td>${insert.expire}</td></tr> --%>
    </table>
    <script type="text/javascript">
     clearForm();
    </script>
   </c:if>

   <c:if test="${not empty update}">
    <h3>更改成功</h3>
    <table border="1">
     <tr>
      <td>員工編號</td>
      <td>${update.empID}</td>
     </tr>
     <tr>
      <td>員工姓名</td>
      <td>${update.empName}</td>
     </tr>
     <%--  <tr><td>員工姓名</td><td>${update.empPassword}</td></tr> --%>
     <tr>
      <td>職位</td>
      <td>${update.empPostion}</td>
     </tr>
     <tr>
      <td>上班時數</td>
      <td>${update.empHrs}</td>
     </tr>
     <%--  <tr><td>Expire</td><td>${update.expire}</td></tr> --%>
    </table>
    <script type="text/javascript">
     clearForm();
    </script>
   </c:if>
   <%-- 員工管理結束 --%>


  </div>
 </div>

 <!-- jQuery CDN - Slim version (=without AJAX) -->
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
  crossorigin="anonymous"></script>
 <!-- Popper.JS -->
 <script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
  integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
  crossorigin="anonymous"></script>
 <!-- Bootstrap JS -->
 <script
  src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
  integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
  crossorigin="anonymous">
  
 </script>

 <script type="text/javascript">
  $(document).ready(function() {
   $('#sidebarCollapse').on('click', function() {
    $('#sidebar').toggleClass('active');
    $(this).toggleClass('active');
   });
  });
 </script>



</body>

</html>