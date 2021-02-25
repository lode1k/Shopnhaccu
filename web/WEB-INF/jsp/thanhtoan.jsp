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
                            <h3 class="title-main" ><a href=""> Thanh toán đơn hàng </a> </h3>
                            <form:form modelAttribute="b" action="thanhtoan.htm" method="POST" cssClass="form-horizontal formcustome" role="form" style="margin-top: 20px;">
                                <div class="form-group">
                                    <form:label path="nguoinhan" cssClass="col-md-2 col-md-offset-1">Tên thành viên</form:label>

                                        <div class="col-md-8">
                                            <input name="nguoinhan" id="nguoinhan" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <form:label path="email" cssClass="col-md-2 col-md-offset-1">Email</form:label>

                                        <div class="col-md-8">
                                        <form:input path="email" cssClass="form-control"></form:input>                                       
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <form:label path="sdt" cssClass="col-md-2 col-md-offset-1">Số điện thoại</form:label>

                                        <div class="col-md-8">
                                        <form:input path="sdt" cssClass="form-control"></form:input>                                       
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <form:label path="tongtien"  cssClass="col-md-2 col-md-offset-1">Tổng tiền</form:label>
                                        <div class="col-md-8">    
                                            <input readonly="" value="${tongtien}" name="tongtien" id="tongtien" class="form-control"/>                                                                             
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="diachinhan" cssClass="col-md-2 col-md-offset-1">Địa chỉ</form:label>
                                        <div class="col-md-8">
                                        <form:input path="diachinhan" cssClass="form-control"></form:input>                                       
                                        </div>
                                    </div>
                                <form:button type="submit" style="margin-bottom: 20px;" class="btn btn-success col-md-2 col-md-offset-5" id="btn btn-success col-md-2 col-md-offset-5" >Xác nhận</form:button>
                            </form:form>

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