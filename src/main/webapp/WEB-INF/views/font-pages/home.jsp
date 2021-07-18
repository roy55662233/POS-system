<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首頁</title>
</head>
<style>
.box {
	display: inline-block;
}

#navbarNav {
	position: relative;
	margin: 0 150px 0 -150px;
}

body {
	background-image: url(../img/menu3.jpg);
	background-size: cover;
}

#index_position {
	text-align: center;
}

.card {
	position: absolute;
	top: 10%;
	size: 5px;
}
</style>


<body>


	<div id="index_intro">
		<div id="index_position">
			<div class="box border-color">
				<div class="warpper">
					<p>【春季優惠 外送消費滿 $800 即贈香香炸雞中份乙份】</p>
					<p>
						◎ 結帳時請勾選優惠，折扣不累加，不可併用。<br>雙北及桃園區預配合Lalamove外送
					</p>
				</div>
			</div>

			<div class="box border-color">
				<div class="warpper">
					<p>【外送服務】</p>
					<p>
						◎ 運費49元起，實際金額請依系統判定為準。<br>雙北及桃園區預配合Lalamove外送，其他門市目前僅提供自取服務。
					</p>
				</div>
			</div>

			<div class="box border-color">
				<div class="warpper">
					<p>【自取】自取訂單達$500，即享單次50元折扣。</p>
					<p>
						◎ 結帳時請勾選優惠，優惠不累計，不併用。<br>取餐處請見「店面資訊」，並於訂購時選擇分店
					</p>
				</div>
			</div>
		</div>


		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel" style="margin: auto; width: 1200px;">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../img/home.jpg" style="height: 500px"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../img/home1.jpg" style="height: 500px"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../img/home2.jpg" style="height: 500px"
						class="d-block w-100" alt="...">
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>

			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<div class="card text-dark bg-light mb-3 border-dark"
			style="width: 200px;"></div>

		<br>

	</div>
	
	<script type="text/javascript">
	
$.get('https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWB-5497E4A6-E23E-4174-B879-FB99E1314164&limit=5&format=JSON&locationName=臺中市', function(req, res) {

    console.log("三十六小時天氣預報: " + req.records.datasetDescription) //三十六小時天氣預報
    var data = req.records;
    var location = data.location[0].locationName; //地點
    var noon = data.location[0].weatherElement[0].time[0];
    var night = data.location[0].weatherElement[0].time[1];
    var morning = data.location[0].weatherElement[0].time[2];
    var Weatherpattern = data.location[0].weatherElement[0].elementName;
    var lowtemp = data.location[0].weatherElement[2];
    var toptemp = data.location[0].weatherElement[4];


    var nowtime = new Date();
    

	


    $('.card').append(`
            <img src="../img/day/${'${noon.parameter.parameterName}'}.svg" class="card-img-top" style="width: 85%;" alt="...">
            <div class="card-body">
                <h5 class="card-title">${'${location}'}</h5>
                <p class="card-text">現在時段為 :</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">目前天氣 : ${'${noon.parameter.parameterName}'}</li>
                <li class="list-group-item">最高溫度 : ${'${toptemp.time[0].parameter.parameterName}'} ℃</li>
                <li class="list-group-item">最低溫度 : ${'${lowtemp.time[0].parameter.parameterName}'} ℃</li>
            </ul>
           
    `);
	    var d = new Date();
	    var ye = new Intl.DateTimeFormat('zh', {
	        year: 'numeric'
	    }).format(d);
	    var mo = new Intl.DateTimeFormat('zh', {
	        month: 'short'
	    }).format(d);
	    var da = new Intl.DateTimeFormat('zh', {
	        day: '2-digit'
	    }).format(d);
    
    

    
        $('.card-text').text(`${'${ye}${mo}${da}'}`);
    
})
</script>



</body>

</html>