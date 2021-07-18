<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Menu</title>
				<!-- CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
            <!-- JavaScript Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
				 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
				 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <style>
                    body {
                        background-image: url(../img/menu3.jpg);
                        background-size: cover;
                    }

                    .menu_m1 {
                        margin: 0 auto;
                        width: 1500px;
                        height: 100%;
                    }

                    .menu_m2 {
                        text-align: center;
                    }

                    .menu_m3 {
                        text-align: center;
                    }

                    .menu_m2>div {
                        height: 100%;
                    }

                    .menu_m3>div {
                        height: 100%;
                    }

                    .menu_m2>div>img {
                        height: 300px;
                        border-radius: 30px;
                    }

                    .menu_m3>div>img {
                        width: 300px;
                        height: 200px;
                        border-radius: 30px;
                    }

                    .menu_m2 div {
                        width: 300px;
                        display: inline-block;
                        margin: 100px 50px;
                    }

                    .menu_m3 div {
                        width: 300px;
                        display: inline-block;
                        margin: 100px 50px;
                    }

                    .menu_m1 img {
                        width: 100%;
                    }

                    .menu_m2 hr {
                        width: 50%;
                        margin: auto;
                        border: 2px black solid;
                    }

                    .menu_m2 h5,
                    h1 {
                        font-weight: bold;
                    }

                    .menu_m3 hr {
                        width: 50%;
                        margin: auto;
                        border: 2px black solid;
                    }

                    .menu_m3 h5,
                    h1 {
                        font-weight: bold;
                    }

                    #menu_clickid1 {
                        width: 30px;
                        height: 30px;
                        border-radius: 7px;
                        background-color: antiquewhite;
                    }

                    #dropdown-a {
                        margin: auto 200px;
                    }

                    .j-checkbox {
                        width: 20px;
                        height: 20px;
                    }
                </style>
            </head>

            <body>
            		<a href="<c:url value="/pages/display.page" />">
                        <button class="btn btn-secondary"> 返回</button> 
                    </a>
				
                <div id="menu_body">
                    <div class="menu_m1">
                        <div class="menu_m2"></div>
                        <hr>
                        <div class="menu_m3"></div>

                    </div>


                </div>
                <input id="g8length" type="hidden" value="">
            </body>


            <script>
                var fullprice = 0;
                var i = 0;
                $(document).ready(function () {

                    $.ajax({
                        url: "/chicken/public/api/prod",
                        type: "get",
                        success: doSuccess
                    });

                    function doSuccess(goods) {
                        // console.log(goods)
                        //用for each拆解 物件goods的key,value


                        $.each(goods, function (index, obj) {

                            if (obj.prodCategory == "雞排") {
                                i++;

                                $('.menu_m2').append(`            
		        	<div>
		        		<input id="pid${'${obj.prodID}'}" class="pdID" type="hidden" name="prodId" value="${'${obj.prodID}'}">
		                <img src="../img/${'${obj.prodName}'}.jpg" alt="">
		                <h5 id="prodname${'${obj.prodID}'}" class="pdName">${'${obj.prodName}'}</h5>
		                <hr>
		                <h5 id="price${'${obj.prodID}'}" class="pdPrice">NT${'${obj.prodPrice}'}</h5>
		                <button class="click_inc btn btn-primary" id="menu_click_inc${'${obj.prodID}'}">＋</button>
		                <span id="menu_inputid${'${obj.prodID}'}" class="menu_input">0</span>
	                	<button class="click_dec btn btn-primary" id="menu_click_dec${'${obj.prodID}'}">－</button>
		                
		                <br>
		            </div>`

                                )
                            } else {
                                $('.menu_m3').append(`            
					<div>
		        		<input id="pid${'${obj.prodID}'}" class="pdID1" type="hidden" name="prodId" value="${'${obj.prodID}'}">
		                <img src="../img/${'${obj.prodName}'}.jpg" alt="">
		                <h5 id="prodname${'${obj.prodID}'}" class="pdName1">${'${obj.prodName}'}</h5>
		                <hr>
		                <h5 id="price${'${obj.prodID}'}" class="pdPrice1">NT${'${obj.prodPrice}'}</h5>
		                <button class="click_inc btn btn-primary" id="menu_click_inc${'${obj.prodID}'}">＋</button>
		                <span id="menu_inputid${'${obj.prodID}'}" class="menu_input1">0</span>
	                	<button class="click_dec btn btn-primary" id="menu_click_dec${'${obj.prodID}'}">－</button>
		                
		                <br>
		            </div>`

                                )

                            }
                            $('#gotocartable').append(`<tr id=prodcarname${'${obj.prodID}'} class="prodcar"></tr>`);

                        })

                        plus();
                        plus1();
                        minus();
                        minus1();
                    }

                })



                function menu_click_dec(b) {
                    if (b > 0) {
                        return b = parseInt(b) - 1;
                    }
                }

                function menu_click_inc(a) {
                    return a = parseInt(a) + 1;
                }

                function sum(c, d) {
                    return e = parseInt(c) * d
                }

                //雞排區
                var c = document.getElementsByClassName('menu_input');
                var d = document.getElementsByClassName('pdPrice');
                var e = document.getElementsByClassName('pdName');
                var f = document.getElementsByClassName('pdID');
                
                //飲料區
                var c1 = document.getElementsByClassName('menu_input1');
                var d1 = document.getElementsByClassName('pdPrice1');
                var e1 = document.getElementsByClassName('pdName1');
                var f1 = document.getElementsByClassName('pdID1');

                console.log(f1);
                //  先給localStorage.setItem空陣列
                var ans = [];

                //  加加功能	
                function plus() {
                    //按雞排加加
                    $('.menu_m2 >div>.click_inc').click(function (event) {

                        //選到div
                        var a = $(event.target).closest('div').index();

                        console.log(c[a].id) //menu_input
                        // console.log(d[a].id) //pdnamePrice
                        // console.log(e[a]) //pdName
                        // console.log(f[a].id) //pdID

                        // !!!這邊應該不用選到 menu_inputid
                        var x = document.getElementById(c[a].id).innerText;
                        // console.log(x)

                        //     		選到 price
                        var p = document.getElementById(d[a].id).innerText;
                        price = p.slice(2, 5);

                        // 			按+按鈕
                        num = menu_click_inc(x);

                        //      	回傳金額
                        document.getElementById(c[a].id).innerText = num;
                        var pnidid = '#' + f[a].id;
                        var pnid = $(pnidid).val();

                        //     		創造要抓取的質到右上角購物車
                        // 			抓 名字
                        var nameid = '#' + document.getElementsByClassName('pdName')[a].id;


                        var name = $(nameid).text();
                        console.log(a + 1)
                        // 			抓 單品每項數量
                        var numid = '#' + c[a].id;
                        var num = $(numid).text();

                        // 			抓 總金額
                        var priceid = '#' + d[a].id;
                        var price = $(priceid).text().replace("NT", "");

                        // 			抓 上面小車車的id                 放入      "名字"      "單品每項金額"      "總金額"		
                        $(`${'#prodcarname${a+1}'}`).html(`<td><input type="checkbox" class="j-checkbox"></td> <td>${'${name}'}</td> <td>${'${price}'}NT</td> <td>共:${'${num}'}</td> <td><button class="del" onclick="del()">刪除</button></td>`);

                        // //     		將抓到商品放入陣列
                        ans[a] = {
                            pid: `${'${pnid}'}`,
                            pname: `${'${name}'}`,
                            price: `${'${price}'}`,
                            pnum: `${'${num}'}`,
                            ptatol: `${'${num*price}'}`
                        };

                        console.log(ans)

                        // 所有商品的總金額

                        //     		存到 localStorage
                        localStorage.setItem("items", JSON.stringify(ans));
                        var name = document.getElementsByClassName('del');
                        console.log(name)
                    })
                }

                //雞排按下刪除功能
                function del() {
                    var name = document.getElementsByClassName('prodcar');
                    var a = $(event.target).closest('tr').index();
                    var prodname = '#' + name[a - 1].id;


                    //刪除當前商品
                    $(".j-checkbox:checked").parents(prodname).empty();
                    var pnidid = '#' + f[a - 1].id;
                    var pnid = $(pnidid).val();

                    //     		創造要抓取的質到右上角購物車
                    // 			抓 名字
                    var nameid = '#' + document.getElementsByClassName('pdName')[a - 1].id;


                    var name = $(nameid).text();

                    // 			抓 單品每項數量
                    var numid = '#' + c[a - 1].id;
                    var num = $(numid).text();


                    // 			抓 總金額
                    var priceid = '#' + d[a - 1].id;
                    var price = $(priceid).text().replace("NT", "");
                    console.log(pnid)
                    console.log(name)
                    console.log(num)
                    console.log(price)
                    ans[a - 1] = {
                        pid: `${'${pnid}'}`,
                        pname: `${'${name}'}`,
                        price: `${'${price}'}`,
                        pnum: `0`,
                        ptatol: `${'${num*price}'}`
                    };
                    localStorage.setItem("items", JSON.stringify(ans));

                }

                //飲料按下刪除功能
                function del1() {
                    var name = document.getElementsByClassName('prodcar');
                    var a = $(event.target).closest('tr').index();
                    var prodname = '#' + name[a - 1].id;
                    //刪除當前商品
                    $(".j-checkbox:checked").parents(prodname).empty();
console.log(a);

                   
                    //
                    var g8length = $('#g8length').val();
                    // console.log(g8length)	
                    var pnidid = '#' + document.getElementsByClassName('pdID1')[a - 7].id;
                     console.log(pnidid );
                    var pnid = $(pnidid).val();

                    //     		創造要抓取的質到右上角購物車
                    // 			抓 名字
                    var nameid = '#' + document.getElementsByClassName('pdName1')[a-7].id;


                    var name = $(nameid).text();

                    // 			抓 單品每項數量
                    var numid = '#' + c1[a-7].id;
                    var num = $(numid).text();


                    // 			抓 總金額
                    var priceid = '#' + d1[a-7].id;
                    var price = $(priceid).text().replace("NT", "");
                    console.log(pnid)
                    console.log(name)
                    console.log(num)
                    console.log(priceid)
                    
                    ans[a-1] = {
                        pid: `${'${pnid}'}`,
                        pname: `${'${name}'}`,
                        price: `${'${price}'}`,
                        pnum: `0`,
                        ptatol: `${'${num*price}'}`
                    };
                    localStorage.setItem("items", JSON.stringify(ans));

                }


                var a = 0;

                //抓雞排區的長度
                $.get('/chicken/public/api/prod', function (req, res) {
                    for (var i = 0; i < req.length; i++) {
                        if (req[i].prodCategory == "雞排") {
                            a++;
                            // console.log(a);
                        }
                    }
                    $('#g8length').val(a);
                })


                function plus1() {
                    //按飲料加加
                    $('.menu_m3 >div>.click_inc').click(function (event) {

                        //選到div
                        var a = $(event.target).closest("div").index();
                        // console.log(a);
                        // console.log(c1[a].id) //menu_input
                        // console.log(d1[a].id) //pdnamePrice
                        // console.log(e1[a].id) //pdName
                        // console.log(f1[a].id) //pdID

                        //     		!!!這邊應該不用選到 menu_inputid
                        var x = document.getElementById(c1[a].id).innerText;
                        console.log(x);
                        //     		選到 price
                        var p = document.getElementById(d1[a].id).innerText;
                        price = p.slice(2, 5);
                        // 			按+按鈕
                        num = menu_click_inc(x);
                        //     		回傳金額
                        document.getElementById(c1[a].id).innerText = num;
                        //     		!!!這邊不用處裡會刪除
                        // total = sum(num, price);
                        //     		!!!這邊不用處裡會刪除


                        var pnidid = '#' + f1[a].id;
                        var pnid = $(pnidid).val();
                        console.log(pnid);
                        //     		創造要抓取的質到右上角購物車
                        // 			抓 名字
                        var nameid = '#' + e1[a].id;
                        var name = $(nameid).text();
                        // 			抓 單品每項金額	
                        var numid = '#' + c1[a].id;
                        var num = $(numid).text();
                        // 			抓 總金額
                        var priceid = '#' + d1[a].id;
                        var price = $(priceid).text().replace("NT", "");
                        // 			抓 上面小車車的id                 放入      "名字"      "單品每項金額"      "總金額"	
                        //     		將抓到商品放入陣列
                        var g8length = $('#g8length').val();
                        // console.log(g8length)	
                        $(`${'#prodcarname${a+1+parseInt(g8length)}'}`).html(`<td><input type="checkbox" class="j-checkbox"></td> <td>${'${name}'}</td> <td>${'${price}'}NT</td> <td>共:${'${num}'}</td> <td><button class="del" onclick="del1()">刪除</button></td>`);
                        
                        ans[a + parseInt(g8length)] = {
                            pid: `${'${pnid}'}`,
                            pname: `${'${name}'}`,
                            price: `${'${price}'}`,
                            pnum: `${'${num}'}`,
                            ptatol: `${'${num*price}'}`
                        };
                        // console.log(ans)


                        //所有商品的總金額
                        //  

                        //     		存到 localStorage
                        localStorage.setItem("items", JSON.stringify(ans));

                    })


                }


                //金額加總
                function crazy2() {
                    var a = 0;
                    var money = JSON.parse(localStorage.getItem("items"));
                    console.log("OK")
                    $.each(money, function (index, obj) {
                        if (obj.ptatol != null) {
                            var price = obj.ptatol;

                            a = parseInt(price) + a;

                            // console.log(a);
                            localStorage.setItem('total', a);
                        }
                    })
                }


                //雞排按減減
                function minus() {
                    $('.menu_m2 >div>.click_dec').click(function (e) {
                        var a = $(e.target).closest("div").index();
                        console.log(a);
                        console.log(c[a]) //menu_input
                        console.log(d[a].id) //pdnamePrice
                        console.log(document.getElementsByClassName('pdName')[a].id) //pdName
                        console.log(f[a].id) //pdID
                        var x = document.getElementById(c[a].id).innerText
                        console.log(x);
                        num = menu_click_dec(x)
                        if (num >= 0) {
                            document.getElementById(c[a].id).innerText = num;
                            total = sum(num, price);
                            var pnidid = '#' + f[a].id;
                            var pnid = $(pnidid).val();
                            var nameid = '#' + document.getElementsByClassName('pdName')[a].id;
                            var name = $(nameid).text();
                            var numid = '#' + c[a].id;
                            var num = $(numid).text();
                            var priceid = '#' + d[a].id;
                            var price = $(priceid).text().replace("NT", "");
                            $(`${'#prodcarname${a+1}'}`).html(`<td><input type="checkbox" class="j-checkbox"></td> <td>${'${name}'}</td> <td>${'${price}'}NT</td> <td>共:${'${num}'}</td> <td><button class="del" onclick="del()">刪除</button></td>`);
                            ans[a] = {
                                pid: `${'${pnid}'}`,
                                pname: `${'${name}'}`,
                                price: `${'${price}'}`,
                                pnum: `${'${num}'}`,
                                ptatol: `${'${num*price}'}`
                            };
                            localStorage.setItem("items", JSON.stringify(ans));
                        } else {




                            var lolst = JSON.parse(localStorage.getItem('items'));

                            //刪除物件  可GOOGLE : delete object js
                            delete lolst[a]



                            localStorage.setItem('items', JSON.stringify(lolst))
                            //  remove empty detech
                            $('#gotocartable>tr').empty();

                            console.log(lolst)
                            $.each(lolst, function (index, obj) {
                                console.log(index)
                                console.log(obj)
                            })

                            alert('NO')

                        }

                    });


                }

                //飲料按減減
                function minus1() {
                    $('.menu_m3 >div>.click_dec').click(function (e) {
                        var a = $(e.target).closest("div").index();
                        console.log(a);
                        console.log(c1[a].id) //menu_input
                        console.log(d1[a].id) //pdnamePrice
                        console.log(e1[a].id) //pdName
                        console.log(f1[a].id) //pdID

                        // var x = document.getElementById(c1[a]).innerText;
                        var xid = '#' + c1[a].id;
                        console.log(xid)
                        var x = $(xid).text();

                        num = menu_click_dec(x)
                        if (num >= 0) {
                            // document.getElementById(c1[a]).innerText = num;
                            $(xid).text(num);
                            total = sum(num, price);
                            var pnidid = '#' + f1[a].id;
                            var pnid = $(pnidid).val();
                            var nameid = '#' + document.getElementsByClassName('pdName1')[a].id;
                            var name = $(nameid).text();
                            var numid = '#' + c1[a].id;
                            var num = $(numid).text();
                            var priceid = '#' + d1[a].id;
                            var price = $(priceid).text().replace("NT", "");
                            var g8length = $('#g8length').val();
                            $(`${'#prodcarname${a+1+parseInt(g8length)}'}`).html(`<td><input type="checkbox" class="j-checkbox"></td> <td>${'${name}'}</td> <td>${'${price}'}NT</td> <td>共:${'${num}'}</td> <td><button class="del1" onclick="del()">刪除</button></td>`);
                            
                            ans[a + parseInt(g8length)] = {
                                pid: `${'${pnid}'}`,
                                pname: `${'${name}'}`,
                                price: `${'${price}'}`,
                                pnum: `${'${num}'}`,
                                ptatol: `${'${num*price}'}`
                            };
                            localStorage.setItem("items", JSON.stringify(ans));
                        } else {
                            localStorage.removeItem('items')

                            alert('NO')
                            $('#gotocartable>tr').empty();
                        }

                    });


                }




                //過濾沒有金額的
                function myFunction() {
                    // console.log("OK");
                    //localStorage的null 全部過濾
                    var hi = localStorage.getItem('items')
                    // console.log(hi);
                    var test = JSON.parse(hi);
                    // console.log(test);
                    //過濾 null
                    var result = test.filter(inner => inner != null && inner.pnum != 0);
                    console.log(result);
                    localStorage.setItem('items', JSON.stringify(result))
                    // JSON.parse(localStorage.getItem('items')).filter(inner => inner!= null);
                    crazy2();
                }
            </script>



            </html>