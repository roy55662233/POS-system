//蓋倉庫 總數
// var test =JSON.parse( localStorage.getItem('items'));
// $('#a').text(`
//     商品:${test[0].pname} 小計:${test[0].totalprice}
//     `);
//     $('#b').text(`
//     商品:${test[1].pname} 小計:${test[1].totalprice}
//     `);
//     $('#c').text(`
//     商品:${test[2].pname} 小計:${test[2].totalprice}
//     `);
function readyFn(jQuery) {

	var total_a, total_b, total_c

	//localstorge
	var goods = [
		{
			pname: '起司雞排',
			totalprice: 0,
			pnum: 0
		},
		{
			pname: '麻辣雞排',
			totalprice: 0,
			pnum: 0
		},
		{
			pname: '天使雞排',
			totalprice: 0,
			pnum: 0
		}]
		;

	//取得+按鈕的ID
	inc1 = document.getElementById('menu_click_inc1')

	//按鈕設定監聽
	inc1.addEventListener('click', function() {
		//取得數量文字
		x = document.getElementById('menu_inputid1').innerText

		//取得價錢文字
		p = document.getElementById('price1').innerText

		//取價格的數字   Before:NT100 → After:100
		price = p.slice(2, 5)

		//增加的function "return回num"
		num = menu_click_inc(x)

		//再輸出  "return回num" 的 值  
		document.getElementById('menu_inputid1').innerText = num
		goods[0].pnum = num
		// 單價*數量的function
		total_a = sum(num, price)
		goods[0].totalprice = total_a


		//最後的加總
		totalsum();

		//add to the shop cart
		addShopcart1();


	});


	dec1 = document.getElementById('menu_click_dec1')
	dec1.addEventListener('click', function() {
		x = document.getElementById('menu_inputid1').innerText
		num = menu_click_dec(x)
		if (num >= 0) {
			document.getElementById('menu_inputid1').innerText = num
			goods[0].pnum = num
			total_a = sum(num, price)
			goods[0].totalprice = total_a
			totalsum()
		} else {
			alert('NO')
		}

		subshopcart();

	});

	inc2 = document.getElementById('menu_click_inc2')
	inc2.addEventListener('click', function() {
		x = document.getElementById('menu_inputid2').innerText
		p = document.getElementById('price2').innerText
		price = p.slice(2, 5)
		num = menu_click_inc(x)
		goods[1].pnum = num
		document.getElementById('menu_inputid2').innerText = num
		total_b = sum(num, price)
		goods[1].totalprice = total_b
		totalsum();
		addShopcart2();
	});

	dec2 = document.getElementById('menu_click_dec2')
	dec2.addEventListener('click', function() {
		x = document.getElementById('menu_inputid2').innerText
		num = menu_click_dec(x)
		if (num >= 0) {
			document.getElementById('menu_inputid2').innerText = num
			goods[1].pnum = num
			total_b = sum(num, price)
			goods[1].totalprice = total_b
			totalsum()
		} else {
			alert('NO')
		}
		subshopcart2();
	});

	dec3 = document.getElementById('menu_click_inc3')
	dec3.addEventListener('click', function() {
		x = document.getElementById('menu_inputid3').innerText
		z = document.getElementById('price3').innerText
		p = z.slice(2, 5)

		y = menu_click_inc(x)
		document.getElementById('menu_inputid3').innerText = y
		goods[2].pnum = y

		total_c = sum(y, p)
		goods[2].totalprice = total_c
		totalsum();
		addShopcart3();
	});

	dec3 = document.getElementById('menu_click_dec3')
	dec3.addEventListener('click', function() {
		x = document.getElementById('menu_inputid3').innerText
		y = menu_click_dec(x)
		if (y >= 0) {
			document.getElementById('menu_inputid3').innerText = y
			goods[2].pnum = y
			total_c = sum(y, p)
			goods[2].totalprice = total_c
			totalsum()
		} else {
			alert('NO')
		}
		subshopcart3();

	});

	function totalsum() {
		sum1 = total_a, sum2 = total_b, sum3 = total_c;
		if (sum1 == undefined) {
			sum1 = 0;
		}
		if (sum2 == undefined) {
			sum2 = 0;
		}
		if (sum3 == undefined) {
			sum3 = 0;
		}
		document.getElementById('total').innerHTML = ("<span>Total:</span>" + (sum1 + sum2 + sum3))
	}




	function addShopcart1() {
		// console.log(`${goods[0].pname}`);

		$('#a').text(`
    商品:${goods[0].pname} 小計:${total_a}
    `);

	}
	function addShopcart2() {
		// console.log(`${goods[0].pname}`);


		$('#b').text(`
    商品:${goods[1].pname} 小計:${total_b}
    `)





	}
	function addShopcart3() {
		$('#c').text(`
    商品:${goods[2].pname} 小計:${total_c}
    `)
	}

	function subshopcart() {
		if (`${total_a}` == 0) {
			$('#a').text("")
		} else {
			$('#a').text(`
    商品:${goods[0].pname} 小計:${total_a}
    `);
		}

	}


	function subshopcart2() {
		console.log(total_b);
		if (`${total_b}` == 0) {
			$('#b').text("")
		} else {
			$('#b').text(`
    商品:${goods[1].pname} 小計:${total_b}
    `);
		}

	}
	function subshopcart3() {
		console.log(total_c);
		if (`${total_c}` == 0) {
			$('#c').text("")
		} else {
			$('#c').text(`
    商品:${goods[2].pname} 小計:${total_c}
    `);
		}
	}





	console.log(goods)
	jQuery('#gotocart').click(function() {
		console.log("ok");
		localStorage.setItem('items', JSON.stringify(goods));

		console.log(JSON.parse(localStorage.getItem('items')));


	})

}