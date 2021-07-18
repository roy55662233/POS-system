<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../include.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>訂單明細</title>

<style>
	th, td {
		text-align: center;
	}
	.myfinal1 {
		text-align: center;
		font-family: "fantasy";
		font-size: 200%;
	}
	.myfinal2 {
		text-align: center;
		font-size: 250%;
	}

	.myfinal3 {
		text-align: center;
		font-size: 150%;
	}

	 .myfinal4 {
	  width: 80px;
	  height: 40px;
	  border-radius: 100px;
	  background-color: #FFFAFA;
	  margin-top: 50px;
	 }

	 .product{
		 width:50%;
		 margin: 0 auto;
	 }

	 .product>.productinfo {
        margin: 0 auto;
    }
    
	.mylabel {
        display: inline-block;
        font-weight:bold;
		font-size:1.2rem;
        width: 150px;
        text-align: right;
        margin: 20PX 10px 0 50PX;
    }
    
	.productinfo>span{
		font-weight:bold;
		font-size:1.2rem;
	}
</style>
</head>

<body>

	<div class="product">

		<!-- img照片 -->
		<div style="text-align:center">
			<img class="myfinal" src="../img/f0.jpg">
		</div>
		<!-- 訂單訊息 -->
		<!-- 收到訂單文字 -->
		<div class="myfinal1">
			<span>已經收到您的訂單</span>
		</div>

		<!-- 訂單編號  -->
		<div class='productinfo'>
			<label for="" class="mylabel">訂單編號 ： </label>
				<!-- 這邊塞資料庫的資料 -->
				<span>${test.orderId}</span><br>
			<label for="" class="mylabel">商品名稱 ： </label>
				<c:forEach items="${test2}" var="a">
					<span>${a.prodfk.prodName}</span>
				</c:forEach><br>

			<label for="" class="mylabel">商品總量 ： </label>
				<span>${test5}</span><br>
			<label for="" class="mylabel">商品總價 ： </label>
				<span>${test4}</span><br>
		</div>

		
		
		<div style="position:relative; top:-30px">
			<!-- 按下後指向填寫表單 -->
			<a href="<c:url value="/pages/feedback.page" />">
			<button class="myfinal4">填寫表單</button>
			</a>
	
			<!-- 按下後指向回首頁 -->
			<a href="<c:url value="/pages/home.page" />"><button
					class="myfinal4">返回首頁</button></a>
		</div>
	</div>

<script type="text/javascript">
localStorage.clear()

</script>

</body>
</html>