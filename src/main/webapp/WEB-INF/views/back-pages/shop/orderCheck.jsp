<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>訂單紀錄</title>
	
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
	<div  class="wrapper" style="text-align : center;">
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
					<h2>訂單紀錄</h2>
					<div ></div>
				</div>
			</nav>

			<%-- 訂單紀錄內容 --%>
			<div style="text-align : center;">
			
			

			<table id="orderT" class="table table-striped" style="margin-top: 25px;"  >
				<thead style="border:2px solid black">
					<tr  >
						<%-- <th scope="col">#</th> --%>
						<th>訂單編號</th>
						<th>訂單日期</th>
						<th>訂單備註</th>
						<th>商品明細</th>
						<%-- <th>商品總價</th> --%>
						<%-- <th>訂單明細</th> --%>
					</tr>
				</thead>

				<tbody id="orderTbody">
					<%-- append的內容 --%>
						
				</tbody>
			</table>

			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});
			
			
			$.get('/chicken/public/api/oderdetail',function(req,res){
				var table =$('#orderT').DataTable({
					"language": {
				        "processing": "處理中...",
				        "loadingRecords": "載入中...",
				        "lengthMenu": "顯示 _MENU_ 項結果",
				        "zeroRecords": "沒有符合的結果",
				        "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
				        "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
				        "infoFiltered": "(從 _MAX_ 項結果中過濾)",
				        "infoPostFix": "",
				        "search": "搜尋:",
				        "paginate": {
				            "first": "第一頁",
				            "previous": "上一頁",
				            "next": "下一頁",
				            "last": "最後一頁"
				        }
				    },
				    order: [[ 0, 'desc' ]],
					ajax:{
							url:'/chicken/public/api/oderds',
							dataSrc:''
    					},
						columns:[
        							{ "data": "orderId" }, //第一欄使用data中的name
        							{ "data": "orderDate" }, //第二欄使用data中的age
        							{ "data": "orderMark" }, //第二欄使用data中的age
									{ data: 'orderId',orderable: false, // 禁用排序
									render: function (data, type, row, meta) { 	
										return '<a href="/chicken/oderdetail/'+ data+  ' " > <button class="btn btn-info btn-sm" data-id=' + data + '><i class="fa fa-pencil"></i>查詢</button> </a>'
													// + '<button class="btn btn-danger btn-sm" data-id=' + data + '><i class="fa fa-trash-o"></i>刪除</button>'
										}
									}
    							]
				});
					
			})
		});

	</script>

</body>

</html>