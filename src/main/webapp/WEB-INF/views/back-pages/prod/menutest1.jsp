<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
        crossorigin="anonymous">
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet"href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
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

    <title>產品管理</title>
    
 


</head>
<style>
    #prodbody {
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
    
    #err {
        color: red;
    }
</style>
<body>

	<div class="wrapper" style="text-align : center;">
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
					<h2>產品管理</h2>
					
					<div></div>
				</div>
				
				
			</nav>
        <%-- 產品管理內容 --%>
        <div id="prodbody">
            <%-- <h2>Product Table</h2> --%>

            <form method="post" enctype="multipart/form-data" id="UploadForm" action="/chicken/pages/prod.controller1111">

                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" placeholder="產品編號" name="prodID" value="${param.prodID}">
                    <label for="floatingInput">產品編號:</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="產品名稱" name="prodName" value="${param.prodName}">
                    <label for="floatingInput">產品名稱:</label>
                </div>
                <div class="form-floating mb-3">
                 <select class="form-select" aria-label="Default select example" name="prodCategory" >
         			<option selected value="${param.prodCategory}"></option>
         			<option >雞排</option>
         			<option >飲料</option>
  				</select>
       				<label for="floatingInput">產品種類:</label>
                    
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" placeholder="產品數量" name="prodCount" value="${param.prodCount}">
                    <label for="floatingInput">產品數量:</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" placeholder="產品價格" name="prodPrice" value="${param.prodPrice}">
                    <label for="floatingInput">產品價格:</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="產品單位" name="prodUnit" value="${param.prodUnit}">
                    <label for="floatingInput">產品單位:</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="file" class="form-control form-control-sm" id="floatingInput" placeholder="產品圖片" name="prodImg" value="${param.prodImg}">
                    <label for="floatingInput">產品圖片:</label>
                </div>
                <input class="btn btn-primary" type="submit" value="新增" name="product"> 
                <input class="btn btn-primary" type="submit" value="修改" name="product">
                <input class="btn btn-primary" type="submit" value="查看" name="product">
                <input type="button" class="btn btn-secondary" value="Clear" onclick="clearForm()">

            </form>
            <div id="message">
                <p>${msg1}</p>
                <p>${msg}</p>
                <p id="err">${error}</p>
            </div>
        </div>
        <%-- 產品管理結束 --%>


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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});
		});


        function clearForm() {
            var inputs = document.getElementsByTagName("input");
            for(var i=0; i<inputs.length; i++) {
                if(inputs[i].type=="text") {
                    inputs[i].value="";
                }
                if(inputs[i].type == "number"){
                    inputs[i].value = "";
                }
            }
	    }
	</script>


    
</body>

</html>