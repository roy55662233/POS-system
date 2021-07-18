<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>購物車</title>
	
	<!-- CSS only -->
	<!-- JavaScript Bundle with Popper -->
	<!-- jQuery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/collect.js/4.28.7/collect.js"></script>
	<style>
		th, td {
			text-align: center;
		}
	</style>
</head>

<body>
	<br>
	<br>
	<div id="show">
		<form action="<c:url value="/secure/shopcar.controller" />"
			method="get">
			<table id="shopcarT" class="table table-sm table-dark" style="margin-top: 100px;">
				<thead>
					<tr>
						<th scope="col">項</th>
						<th>商品名稱</th>
						<th>商品價格</th>
						<th>商品數量</th>
						<th>商品總價</th>
					</tr>
				</thead>

				<tbody id="tbodylist">
				</tbody>
					<tr>
						<th></th>
						<td></td>
						<td></td>
						<td></td>
						<td>
						Total:
						 <span id="totalPrice"></span>	
						<button class="btn btn-primary" type="submit" name="orderInsert" value="Insert">確認訂單</button>
						</td>
					</tr>
			</table>
			<br><br>
			<div style="position:relative; left:1100px;">
				<span>請輸入Email:<input type="email" name="mailname" value=""> </span>
			</div>
		</form>
		
	</div>

	<script>
	$(document).ready(function(){
        $("#timeline").width("80%").css("margin", "auto");
        $("#shopcarT").width("80%").css("margin", "auto");
        $("#cartbottom").width("80%").css("margin", "auto").css('margin-top', '20px');

        var test = JSON.parse(localStorage.getItem('items'));
		var collection = collect(test);  
  
		var find_sum = collection.sum('ptatol');  

	

        var temp = 0;
        $.each(test, function(index, obj){
			 var total= JSON.parse( localStorage.getItem('total'))
        	 $("#tbodylist").append(
                     `   <tr>
					 	<input id="inpid${'${index + 1}'}" name="prodID" class="inpid" value="${'${obj.pid}'}" type="hidden">
					 	<input id="inpnum${'${index + 1}'}" name="prodCount" class="inpnum" value="${'${obj.pnum}'}" type="hidden">
					 	<input id="inpname${'${index + 1}'}" name="prodName" class="inpname" value="${'${obj.pname}'}" type="hidden">
                         <th scope="row">${'${index + 1}'}</th>
                         
                         <td id="prodname${'${index + 1}'}" class="prodname">${'${obj.pname}'}</td> 
                         <td id="cartprice${'${index + 1}'}" class="cartprice">${'${obj.price}'}</td>
                         <td>
                             <button type="button" class="btn btn-dark incClass" id="cart_inc${'${index + 1}'}">+</button>
                             <span id="cart_num${'${index + 1}'}">${'${obj.pnum}'}</span>
                             <button type="button" class="btn btn-dark decClass" id="cart_dec${'${index + 1}'}">-</button>
                         </td>
                         <td id="cart_resultp${'${index + 1}'}" class="cart_result">${'${obj.ptatol}'}</td>
                     </tr>

					 `
					 );
				 $("#totalPrice").text(`${'${total}'}`);

        })
        
        var ans1=[];
		var tt = 0;
		//加加
		var all = 0;
		
        $('.incClass').click(function(e) {
			
			
			// console.log(total1)
			// $("#totalPrice").text(`${'${total1}'}`);
			//選到tr 	
        	var a = $(e.target).closest("tr").index(); //index
    		var x = $(`#cart_num${'${a+1}'}`).text();  //取得數量
    		var i =$(`#cartprice${'${a+1}'}`).text();  //
    		
    		num = menu_click_inc(x);
    		$(`#cart_num${'${a+1}'}`).text(num);  
    		$(`#inpnum${'${a+1}'}`).val(`${'${num}'}`);
    		total = sum(num,i);

    		$(`#cart_resultp${'${a+1}'}`).text(total);
    		
			//抓取每樣商品總數
			var c = document.getElementsByClassName('cart_result');
			// console.log(c[a].id)
			var pcrkid = '#'+c[a].id;
			var pcr = $(pcrkid).text();
			
			
    		
    		
			crazy();

			var test = JSON.parse(localStorage.getItem('items'))

			var collection = collect(test);  
  
			var find_sum = collection.sum('ptatol');  

			 $("#totalPrice").text(`${'${find_sum}'}`);
			console.log(find_sum);
			
			
    	});

		//減減
        $('.decClass').click(function(e) {
       
        	var a = $(e.target).closest("tr").index();
        	
    		var x = $(`#cart_num${'${a+1}'}`).text();

    		var i =$(`#cartprice${'${a+1}'}`).text();
    		
    		num = menu_click_dec(x);
    		if (num >= 0) {
    		$(`#cart_num${'${a+1}'}`).text(num);  
    		
    		total = sum(num,i);
    		$(`#cart_resultp${'${a+1}'}`).text(total);
    		}else{
    			alert('NO');
    			localStorage.removeItem('items');
    			$('#tbodylist>tr').empty(); 
    		}
    	});
		
		function crazy2() {
                    var a = 0;
                    var money = JSON.parse(localStorage.getItem("items"));


                    console.log("OK")
                    $.each(money, function(index, obj) {
                        if (obj.ptatol != null) {
                            var price = obj.ptatol;

                            a = parseInt(price) + a;

                            // console.log(a);
                            localStorage.setItem('total', a);
                        }
                    })
                }
			var temp=[];
  		function crazy(){
			  var c = document.getElementsByClassName('cart_result');
		
			$.each(test,function(index,obj){
					console.log(c[index].id)
					var pid = $(`${'#inpid${index+1}'}`).val();
					var name = $(`${'#prodname${index+1}'}`).text();
					var num =$(`${'#cart_num${index+1}'}`).text();
					var price = $(`${'#cartprice${index+1}'}`).text()
					temp[index]={
					pid:`${'${pid}'}`, 
					pname:`${'${name}'}`,
					price:`${'${price}'}`,
					pnum:`${'${num}'}`,
					ptatol:`${'${price*num}'}`
					}
					localStorage.setItem('items', JSON.stringify(temp));
				})
		}

        function menu_click_inc(a) {return a = parseInt(a) + 1;}
        function sum(c, d) {return e = parseInt(c) * d}
        function menu_click_dec(b) {if (b > 0) {return b = parseInt(b) - 1;}}

    })

	</script>
	
</body>


</html>