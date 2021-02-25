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
                        <section id="slide" class="text-center" >
                            <img width="100%" src="<c:url value="public/images/banner.jpg"></c:url>" class="img-thumbnail">
                            </section>                
                            <section class="box-main1">
                                <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)">Sản phẩm </a> </h3>
                            <c:forEach items="${list}" var="p">                                
                                <div class="showitem" style="margin-top: 10px;margin-bottom: 10px">
                                    <div class="col-md-3 item-product bor">
                                        <a href="chitietsanpham.htm?id=${p.id}">
                                            <img  src="<c:url value="public/images/${p.image}"></c:url>" class="" width="100%" height="180">
                                            </a>
                                            <div class="info-item">
                                                <a href="chitietsanpham.htm?id=${p.id}">${p.ten}</a>
                                            <p><b class="price"><fmt:formatNumber value="${p.giatien}" type="number"/>  đ</b></p>
                                        </div>
                                        <div class="hidenitem">
                                            <p><a href=""><i class="fa fa-search"></i></a></p>
                                            <p><a href=""><i class="fa fa-heart"></i></a></p>
                                            <p><a onclick="return confirm('Bạn muốn thêm ${p.ten} ')" href="add-cart.htm?idp=${p.id}"><i class="fa fa-shopping-basket"></i></a></p>
                                        </div>
                                    </div>
                                </div>                               
                            </c:forEach>  
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach items="${lstPages}" var="p">
                                        <li class="page-item"><a class="page-link" href="?page=${p}">${p+1}</a></li>  
                                        </c:forEach>

                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </section>                                                   

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