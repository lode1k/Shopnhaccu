<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shop bán nhạc cụ</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="public/css/font-awesome.min.css"></c:url>">
        <link rel="stylesheet" type="text/css" href="<c:url value="public/css/bootstrap.min.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></c:url>">
        <script  src="<c:url value="public/js/jquery-3.2.1.min.js"></c:url>"></script>
        <script  src="<c:url value="public/js/bootstrap.min.js"></c:url>"></script>
            <!---->
            <link rel="stylesheet" type="text/css" href="<c:url value="public/css/slick.css"></c:url>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="public/css/slick-theme.css"></c:url>"/>
            <!--slide-->
            <link rel="stylesheet" type="text/css" href="<c:url value="public/css/style.css"></c:url>">

        </head>
        <body>
            <div id="wrapper">
                <!---->
                <!--HEADER-->
                <div id="header">
                <jsp:include page="header.jsp" />               
            </div>
            <!--END HEADER-->
            <!--MENUNAV-->
            <div id="menunav">
                <jsp:include page="nav.jsp" />
            </div>
            <!--ENDMENUNAV-->

            <div id="maincontent">
                <div class="container">
                    <div class="col-md-3  fixside" >
                        <jsp:include page="nav-left.jsp" />
                    </div>
                    <div class="col-md-9 bor">
                        <section class="box-main1" >
                            <div class="col-md-6 text-center">

                                <img src="<c:url value="/public/images/${p.image}"></c:url>" class="img-responsive bor" id="imgmain" width="100%" height="370" data-zoom-image="images/16-270x270.png">

                                </div>
                                <div class="col-md-6 bor" style="margin-top: 20px;padding: 30px;">
                                    <ul id="right">
                                        <li><h3>${p.ten} </h3></li>

                                    <li><p> <b class="price"><fmt:formatNumber value="${p.giatien}" type="number"/>  đ</b></li>
                                    <li><a onclick="return confirm('Bạn muốn thêm ${p.ten} ')" href="add-cart.htm?idp=${p.id}" class="btn btn-default"> <i class="fa fa-shopping-basket"></i>Add TO Cart</a></li>
                                </ul>
                            </div>

                        </section>
                        <div class="col-md-12" id="tabdetail">
                            <div class="row">

                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#home">Mô tả sản phẩm </a></li>
                                    <li><a data-toggle="tab" href="#menu1">Thông tin khác </a></li>
                                    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
                                    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="home" class="tab-pane fade in active">
                                        <h3>Nội dung</h3>
                                        <p>${p.mota}</p>
                                    </div>
                                    <div id="menu1" class="tab-pane fade">
                                        <h3> Thông tin khác </h3>
                                        <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    </div>
                                    <div id="menu2" class="tab-pane fade">
                                        <h3>Menu 2</h3>
                                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                                    </div>
                                    <div id="menu3" class="tab-pane fade">
                                        <h3>Menu 3</h3>
                                        <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-md-12">
                            <h3>Sản phẩm mới</h3>
                            <div class="showitem clearfix" style="margin-top: 10px; margin-bottom: 10px;">
                                <c:forEach  items="${home}" var="a">
                                    <div  style="width: 30%" class="col-md-3 item-product bor">
                                    <a href="chi-tiet-san-pham.php?id=<?php echo $item['id']?>">
                                        <img src="<c:url value="/public/images/${a.image}"></c:url>" class="" width="100%" height="180">
                                    </a>
                                    <div class="info-item">
                                        <a href="chi-tiet-san-pham.php?id=<?php echo $item['id']?>">${a.ten}</a>
                                        <p><b class="price"><fmt:formatNumber value="${a.giatien}" type="number"/>  đ</b></p>
                                    </div>
                                    <div class="hidenitem">
                                        <p><a href="chi-tiet-san-pham.php?id=<?php echo $item['id']?>"><i class="fa fa-search"></i></a></p>
                                        <p><a href=""><i class="fa fa-heart"></i></a></p>
                                        <p><a href=""><i class="fa fa-shopping-basket"></i></a></p>
                                    </div>
                                </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>                           
            <jsp:include page="footer.jsp" />
        </div>      
    </div>
</div>      
</div>
<script  src="js/slick.min.js"></script>

</body>

</html>

<script type="text/javascript">
                                        $(function () {
                                            $hidenitem = $(".hidenitem");
                                            $itemproduct = $(".item-product");
                                            $itemproduct.hover(function () {
                                                $(this).children(".hidenitem").show(100);
                                            }, function () {
                                                $hidenitem.hide(500);
                                            })
                                        })
</script>