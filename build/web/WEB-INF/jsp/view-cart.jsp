<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                        <section class="box-main1">
                            <h3 class="title-main" ><a href=""> Giỏ hàng của bạn </a> </h3>

                           
                            
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Giá</th>
                                            <th>Tổng tiền</th>
                                            <th>Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach  items="${list}" var="p">
                                            <tr>
                                                <td><img width="80px" src="public/images/${p.image}" alt=""></td>
                                                <td>${p.ten}</td>
                                                <td>${p.soluong}</td>
                                                <td><b class="price"><fmt:formatNumber value="${p.giatien}" type="number"/>  đ</b></td>
                                                <td><b class="price"><fmt:formatNumber value="${p.giatien*p.soluong}" type="number"/>  đ</b></td>
                                                <td>
                                                    <a href="card-delete.htm?idp=${p.id}" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> Xóa</a
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>

                                </table>
                                
                                <div class="col-md-5 pull-right">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <h3>Thông tin đơn hàng</h3>
                                        </li>

                                        <li class="list-group-item">
                                            <span class="badge"></span>
                                             Số tiền :
                                            <b class="price"><fmt:formatNumber value="${tongtien}" type="number"/>  đ</b>
                                        </li>



                                        <li class="list-group-item">
                                            <span class="badge"></span>
                                            Tổng số tiền thanh toán
                                        </li>

                                        <li class="list-group-item">
                                            <a href="index.htm" class="btn btn-success">Tiếp tục mua hàng</a>
                                            <a href="thanhtoan.htm" class="btn btn-success">Thanh toán</a>
                                        </li>

                                    </ul>

                                </div>
                            </section>
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

<script type="text/javascript">
    function Tinhtong()
    {
        alert(Tinh);
    }
</script>