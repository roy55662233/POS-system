<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>後台系統</title>
    
    <!--JQ ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- Bootstrap CDN -->
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
            <h3>產品表查詢結果 : 共${fn:length(select)}  筆  
                <span>
                    <a href="/chicken/pages/menu2.page"> 
                        <button class="btn btn-secondary"> 預覽前台</button> 
                    </a>
                </span> 
            </h3>
            
            <c:if test="${not empty select}">
                <table class="table table-success table-striped" id="prodtable" >
                    <thead>
                    <tr>
                        <th>產品編號</th>
                        <th>產品名稱</th>
                        <th>產品價格</th>
                        <th>產品數量</th>
                        <th>產品種類</th>
                        <th>產品單位</th>
                        
                <!-- 		<th>權限</th> -->
                    
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach var="row" items="${select}">
                        <c:url value="/pages/menutestJava.page" var="path">
                            <c:param name="prodID" value="${row.prodID}" />
                            <c:param name="prodName" value="${row.prodName}" />
                            <c:param name="prodPrice" value="${row.prodPrice}" />
                            <c:param name="prodCount" value="${row.prodCount}" />
                            <c:param name="prodCategory" value="${row.prodCategory}" />
                            <c:param name="prodUnit" value="${row.prodUnit}" />
                            
                        </c:url>
                    <tr class="table-light">
                        <td><a href="${path}">${row.prodID}</a></td>
                        <td>${row.prodName}</td>
                        <td>${row.prodPrice}</td>
                        <td>${row.prodCount}</td>
                        <td>${row.prodCategory}</td>
                        <td>${row.prodUnit}</td>
                        
                    </tr>
                    </c:forEach>
                    
                    </tbody>
                </table>
            </c:if>

            <button class="btn btn-secondary"><h3><a href="<c:url value="/pages/menutestJava.page" />">返回查詢</a></h3></button> 	
            <%-- 產品管理結束 --%>
        </div>

		</div>
	</div>

	
	
	
    
    <script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});

            $('#prodtable').DataTable({
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
                    },
                    "aria": {
                        "sortAscending": ": 升冪排列",
                        "sortDescending": ": 降冪排列"
                    }
                }
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