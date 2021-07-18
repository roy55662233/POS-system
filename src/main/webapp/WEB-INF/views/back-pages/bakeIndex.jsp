<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:include page="/chicken/back-pages/includeBack.jsp"></jsp:include> --%>


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>後台系統</title>

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
    

    <%-- google api --%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
  .chart-area {
    position: relative;
    height: 10rem;
    width: 100%;
  }
</style>
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
					</ul>
				
				</li>
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
					<h2 　>歡迎進入後台系統 <span style="color:blue; font-weight:bold;">${emp.empName}</span></h2>
					

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						
					</div>
				</div>
			</nav>
			<%-- 內容開始 --%>
			<!-- Content Row -->
          
          <div class="row">
          
            <!-- Earnings (Monthly) Card Example -->

            
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">總收入(當前月份)</div>
                      <div id="monthprice" class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">收益（年度）</div>
                      <div id="yearprice" class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">總時數(最大負載5000小時)</div>
                      <div  class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div id="totaltime" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div id="progressbar" class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">顧客回饋(待處理的請求)</div>
                      <div id="feedback" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
         
          <div class="row">
            <!-- Area Chart -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">收益概述</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" style="height:100%; width:100px;" >
                  <div class="chart-area" style="height:100%; width:100px;">
                    <div id="myLineChart" style="height:100%; width:100px;"></div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-6 col-lg-5">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">滿意報告</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body" style="height:100%; width:100%;">
                     <div id="myPieChart" style="height:100%; width:100%;"></div> 
                  </div>
                </div>
              </div>
            </div>

          <!-- Content Row -->
			<%-- 內容結束 --%>
      </div>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});

    
    $.get("/chicken/public/api/monthprice",function(req,res){
      var i =0;
      $.each(req,function(index,data){
        i=i+data.totalprice;
        $("#yearprice").text("$"+i);

        if(data.month==new Date().getMonth()+1){
          $("#monthprice").text("$"+data.totalprice);
        }
      })
    })

    $.get("/chicken/public/api/totaltime",function(req,res){
      $.each(req,function(index,time){
        $("#totaltime").text((time.hour/5000)*100+"%")
        console.log();
        $("#progressbar").css('width',`${'${(time.hour/5000)*100}'}%`);
      })
    })

    $.get("https://sheetdb.io/api/v1/c6cm3fsepjke2",function(req,res){

      $("#feedback").text( req.length)
    })

    
    $.ajax({
      url :'/chicken/public/api/monthprice', 
      dataType:"json",
      async:false,
      success: function(result){
        google.charts.load('current',{
          'packages':['line']
        });
        google.charts.setOnLoadCallback(function(){
          drawLineChart(result);
        });
      }
    });

   //google LineChart
   function drawLineChart(result) {
				var data = new google.visualization.DataTable();
				var m=['一月','二月','三月','四月','五月','六月','七月'];
				data.addColumn('string', '月份');
				data.addColumn('number', '營業額');
				
				var dataArray=[];
				$.each(result , function(i,obj){
					data.addRows([
						[m[i], obj.totalprice]
					]);
				});

				console.log(result)
				var options = {
			        vAxis: {minValue:0, maxValue:100},
					animation: {  //載入動畫
			            startup: true,
			            duration: 1000,
			            easing: 'out',
			        },
					title: '訂單銷售',
					width:600,
					height:400,
				};
        var chart = new google.visualization.LineChart(document.getElementById('myLineChart'))


				chart.draw(data, options);
        }


   //google piechart
   $.ajax({
				url :'https://sheetdb.io/api/v1/c6cm3fsepjke2', 
				dataType:"json",
				async:false,
				success: function(result){
					google.charts.load("current", {packages:["corechart"]});
					google.charts.setOnLoadCallback(function(){
						drawPieChart(result);
					});
				}
			});
   
   function drawPieChart(result) {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '滿意度');
		data.addColumn('number', '號碼');
		
		var dataArray=[];
		var datasai=[];
		var a=b=c=0;
		
		$.each(result , function(i,obj){
			
			if(obj.滿意度==1){
				a++;
				datasai[0]=a;
			
			}else if(obj.滿意度==2){
				b++;
				datasai[1]=b;
			
			}
			else{
				c++;
				datasai[2]=c;
			}
			
			
			
		});
		data.addRows([
			["滿意",datasai[0]],
			["不滿意",datasai[1]],
			["無意見",datasai[2]]
		]);

		var options = {
			animation: {  //載入動畫
	            startup: true,
	            duration: 5000,
	            easing: 'out',
	        },
			title: '滿意度',
			pieHole: 0.4,
			width:600,
			height:400,
			
			
			
		};
    var percent = 0;
      // start the animation loop
      var handler = setInterval(function(){
          // values increment
          percent += 1;
          // apply new values
          data.setValue(0, 1, percent);
          data.setValue(1, 1, 100 - percent);
          // update the pie
          chart.draw(data, options);
          // check if we have reached the desired value
          if (percent > 74)
              // stop the loop
              clearInterval(handler);
      }, 15);


		var chart = new google.visualization.PieChart(document.getElementById('myPieChart'));
				chart.draw(data, options);
			}
		});
		
		


	</script>
</body>

</html>