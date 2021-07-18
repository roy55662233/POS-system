<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>銷售報表</title>
	
    <!--JQ ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- Bootstrap 4 CDN -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="../css/style5.css">

    <!-- datatbale -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.10.25/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.10.25/datatables.min.js"></script>


</head>

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

		<!-- 右邊內容 -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<button type="button" id="sidebarCollapse" class="navbar-btn">
						<span> </span> <span></span> <span></span>
					</button>
					<h2>銷售報表</h2>
					<div ></div>
				</div>
			</nav>

			<%-- 訂單紀錄內容 --%>
			<div style="text-align : center;" >
				<label>查詢月份</label> &ensp;<input type="date"  id="orderdate" value=""><span>&ensp; 到&ensp; <span><input type="date"  id="orderdate1" value=""> &ensp; 
				<button class="btn btn-success" id="a" >搜尋</button> 
			</div>
			<div id="piechart" style="text-align : center;"></div>
		</div>
	</div>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		console.log("我在這");
		$(document).ready(function() {
			
			// a();
			// 右側導覽按鈕
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});
			
			//google start
            
			
			
			
			

			$('#a').on('click',function(){
			
			var date1=$('#orderdate').val();	
			var date2=$('#orderdate1').val();
			
			// console.log(date1)
			// console.log(date2)
			$.ajax({
				url :`/chicken/public/api/date/${'${date1}'}/${'${date2}'}`, 
				dataType:"json",
				async:false,
				success: function(result){
					
					google.charts.load('current',{
						'packages':['corechart']
					});
					google.charts.setOnLoadCallback(function(){
						drawPieChart(result);
					});
				}
			});
			})

			



			//
			$.ajax({
				url :'/chicken/public/api/oderdetail', 
				dataType:"json",
				async:false,
				success: function(result){
					
					google.charts.load('current',{
						'packages':['corechart']
					});
					google.charts.setOnLoadCallback(function(){
						drawPieChart(result);
					});
				}
			});

      
            function drawPieChart(result) {
				
				var data = new google.visualization.DataTable();
				
				data.addColumn('number', '訂單單號');
				data.addColumn('number', '訂單金額');
				
				var dataArray=[];
				$.each(result , function(i,obj){
					data.addRows([
						[obj.orderId, obj.orderPrice]
					]);
				});

				// (dataArray);
				console.log(result)
				var options = {
					animation: {  //載入動畫
			            startup: true,
			            duration: 1000,
			            easing: 'out',
			        },
					title: '訂單銷售',
					width:900,
					height:600,
				};

				var chart = new google.visualization.ColumnChart(document.getElementById('piechart'));


				chart.draw(data, options);
        	}
            //google end

            
			


			
		});

		
			
		


	</script>

</body>

</html>