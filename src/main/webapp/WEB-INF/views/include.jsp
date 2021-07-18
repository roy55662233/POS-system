<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">


            <!-- CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
            <!-- JavaScript Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
            <!-- jQuery -->
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            

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
                background-size: 100%;
                background-attachment: fixed;
            }
            
            #index_position {
                text-align: center;
            }
            
            #footer {
                position: fixed;
                bottom: 0;
                background-color: #212529;
                width: 100%;
            }
            
            .home_footer {
                position: relative;
                bottom: 0;
                background-color: #212529;
                width: 85%;
                text-align: center;
                color: white;
                font-size: larger;
            }
            
            .dropdown-menu {
                position: absolute;
                width: 300px;
                left: -180px;
                background-color: #212529;
            }
            
            #shopcar {
                position: relative;
                left: -100px;
            }
            
            #rightbar>li {
                margin: 0 10px;
            }
            
            #gotocart {
                position: relative;
                left: 180px;
            }
            /* table,
            tbody,
            tr {
                border: 2px black solid;
            } */
            
            .shopcarbyself {
                border: 2px red solid;
                width: 500px;
                position: absolute;
                right: 0;
            }
        </style>

        <body>

            <nav class="navbar sticky-top navbar-expand-md navbar-dark bg-dark">
                <!-- 	<nav class="navbar sticky-top navbar-expand-md navbar-dark bg-dark" -->
                style="width: 80%; margin: auto;">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <a class="navbar-brand" href="/chicken/pages/home.page ">
                        <img src="../img/Logo.jpg" alt="logo" width="50px" style="border-radius: 30px">雞排點餐系統
                    </a>

                    <ul class="navbar-nav ">
                        <li class="nav-item active">
                            <a class="nav-link" href="/chicken/pages/menu.page"> <span class="sr-only">餐點菜單</span>
                            </a>
                        </li>

                    </ul>
                </div>

                <ul class="navbar-nav ms-auto" id="rightbar">
<!--                     <li class="nav-item"><a class="nav-link" href="">後台登入</a></li> -->

                    <li class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">購物車</button>

                        <div class="dropdown-menu">
                            <table id="gotocartable" class="table table-dark table-striped">
                                <tbody>
                                    <th></th>
                                    <th>品名</th>
                                    <th>價錢</th>
                                    <th>數量</th>
                                    <th>刪除</th>
                                </tbody>

                            </table>

                            <a href="/chicken/pages/shopcar.page ">
                            <button class="btn btn-secondary" id="gotocart" onclick="myFunction()">前往結帳</button> </a>
                        </div>

                    </li>
                </ul>

            </nav>




            <!-- 	 </nav> -->





            <br>

             <div id="footer">

                <div class="home_footer">
                    <img style="width:300px;height:50px" src="../img/footer.jpg" alt=""> &emsp;&emsp;&emsp;加盟專線：0952-123456
                    &emsp;&emsp;&emsp;LINE：@694nmohn  &emsp;&emsp;&emsp;信箱：
                    <a href="" style="text-decoration-line: none; color:white">chickenshop@gmail.com</a>
                   	<a  href="<c:url value="/pages/login.page"/>" style="text-decoration-line: none; color:white; position: fixed; bottom:10px;right: 80px;">後台登入</a>
                   	<a href="#top" class="scroll"><img style="position: fixed; right: 0px;" src="../img/Bu_GoTop.png" alt=""></a>
                </div>

            </div>
            <script type="text/javascript">
                function crazy1() {
                    console.log("OK")
                    var awp = JSON.parse(localStorage.getItem("items"));
                    var success = awp.filter(inner => inner != null);
                    localStorage.setItem("items", JSON.stringify(success));
                }
            </script>


        </body>

        </html>