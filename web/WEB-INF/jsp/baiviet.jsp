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

            <style>
                #tintuc{
                    margin-top: 50px;
                }
                #tintuc ul li{
                    list-style: none;
                    clear: left;
                    border-bottom: 2px solid #ccc;
                    float: left;
                    margin-bottom: 20px;
                }
                #tintuc ul li img{
                    float: left;
                    margin-right: 10px;
                    margin-bottom: 20px;
                }
                #tintuc ul li h2{
                    font-size: 16px;
                    font-family: "OpenSans-Bold";
                }
                #tintuc ul li p{
                    font-size: 15px;
                }
            </style>
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
                            <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)">Tin tức </a> </h3>

                            <div id="tintuc">
                                <ul>
                                    <c:forEach items="${listn}" var="n">
                                        <li>
                                            <img style="width: 34%;height: 190px" src="<c:url value="/public/images/${n.image}"></c:url>"alt=""/>
                                                <b style="font-size: 23px">${n.tieude}</b><br>
                                                <i style="padding: 12px 0px;font-size: 18px" class="fa fa-clock-o" aria-hidden="true">26/06/2019</i><br>
                                                <p>${n.tintuc}
                                                </p>
                                            </li>
                                    </c:forEach>
                                </ul>

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

