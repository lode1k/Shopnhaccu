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
                table tr td input{

                    width: 250px;
                }
                table{
                    height: 240px;
                    margin-top: 3em;
                    width: 780px; margin-left: auto; margin-right: auto;
                }
                .input {
                    padding: .7rem .7rem;
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
                            <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)">Liên hệ </a> </h3>
                            <iframe he class="aa" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.195550833414!2d105.79664331525137!3d20.984796994652843!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acc6bdc7f95f%3A0x58ffc66343a45247!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2jhu4cgR2lhbyB0aMO0bmcgVuG6rW4gdOG6o2k!5e0!3m2!1svi!2s!4v1600346258500!5m2!1svi!2s" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                            <form>
                                <table align="center" >
                                    <tr>
                                        <th>Họ Và Tên</th>
                                        <td>
                                            <input type="text"  placeholder="Nhập Họ Và Tên"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Điện Thoại</th>
                                        <td>
                                            <input type="text" placeholder="Nhập Số Điện Thoại"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td>
                                            <input type="text" placeholder="Nhập Địa Chỉ Email"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Nội Dung Liên Hệ</th>
                                        <td>
                                            <input type="text"  placeholder="Nhập Nội Dung"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="submit" value="Gửi Liên Hệ" />
                                        </td>
                                    </tr>

                                </table>


                            </form>
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

