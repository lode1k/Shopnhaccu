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

                        <section class="box-main1">
                            <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)">Giới thiệu </a> </h3>
                            <b style="font-size: 20px;color: ">Giới thiệu về cửa hàng</b    >
                            <p style="padding: 13px 0px;font-size: 15px">Với kinh nghiệm trên 20 năm phục vụ từ Nam ra Bắc, chúng tôi tự hào mang lại những giá trị lớn lao cho cộng đồng. Mỗi một sản phẩm hoặc dịch vụ đưa ra cộng đồng, chúng tôi đặt uy tín và trách nhiệm trên hết. Một sản phẩm xấu hoăc dịch vụ tồi sẽ giết chết thương hiệu chúng tôi dày công vun đắp.</p>
                            <img src="<c:url value="/public/images/gioithieu.jpg"></c:url>" />
                                <br>
                                <b style="margin: 13px 0px;font-size: 15px;color: green">Shop chúng tôi mang tới cho bạn nhiều sự lựa chọn:</b>                          
                                <p style="padding: 13px 0px;font-size: 15px">Khi bạn muốn mua Đàn Piano, Đàn Guitar, Saxophone, Organ, Âm thanh... Tân Nhạc Cụ mang  tới nhiều sự lựa chọn với rất nhiều các thương hiệu quốc tế như Essex Piano, Kawai, Yamaha, Martin, Epiphone, Ibanez, Cort, Codoba, Rode, Audix, Cordial...</p>
                                <img  style="padding-left: 100px"src="<c:url value="/public/images/gioithieu2.jpg"></c:url>" /><br>
                                <p style="padding: 13px 0px;font-size: 15px">Bạn có thể lấy đàn mới 100%, mang tới nhà mới đập hộp sau khi trải nghiệm trên những cây đàn trưng bày.

                                    Gọi ngay hotline: 03.794.88.177 để được tư vấn chi tiết nhất.</p>
                            </section>                                                   

                        </div>
                    </div>

                <jsp:include page="footer.jsp" />
            </div>      
        </div>
    </div>      
</div>

</body>

</html>

