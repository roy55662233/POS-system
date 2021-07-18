////蓋倉庫 總數
//var total_a, total_b, total_c
//
////取得+按鈕的ID
//inc1 = document.getElementById('cart_inc1')
//
////按鈕設定監聽
//inc1.addEventListener('click', function() {
//	//取得數量文字
//	x = document.getElementById('cart_num1').innerText
//
//	//取得價錢文字
//	price = document.getElementById('cart_price1').innerText
//
//	//取價格的數字   Before:NT100 → After:100
//	//price = p.slice(2, 5)
//
//	//增加的function "return回num"
//	num = cart_click_inc(x)
//
//	//再輸出  "return回num" 的 值  
//	document.getElementById('cart_num1').innerText = num
//
//	// 單價*數量的function
//	total_a = sum(num, price);
//	document.getElementById('cart_resultp1').innerText=total_a;
//	console.log(total_a)
//	//最後的加總
//	totalsum();
//	//
//	//document.getElementById('cart_resultp1').innerText="$"+total_a
//
//
//});
//
//dec1 = document.getElementById('cart_dec1')
//dec1.addEventListener('click', function() {
//	x = document.getElementById('cart_num1').innerText
//	num = cart_click_dec(x)
//	if (num >= 0) {
//		document.getElementById('cart_num1').innerText = num
//		total_a = sum(num, price)
//		document.getElementById('cart_resultp1').innerText=total_a
//		totalsum()
//		//document.getElementById('cart_resultp1').innerText="$"+total_a
//	} else {
//		alert('NO');
//	}
//
//	//subshopcart();
//
//});
//
//function totalsum() {
//	sum1 = total_a, sum2 = total_b, sum3 = total_c;
//	if (sum1 == undefined) {
//		sum1 = 0;
//	}
//	if (sum2 == undefined) {
//		sum2 = 0;
//	}
//	if (sum3 == undefined) {
//		sum3 = 0;
//	}
//	document.getElementById('cart_total').innerHTML = ("<span>Total:</span>" + (sum1 + sum2 + sum3))
//}
