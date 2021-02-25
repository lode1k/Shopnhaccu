<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="box-left box-menu" >
    <h3 class="box-title"><i class="fa fa-list"></i>  Danh mục</h3>
    <ul>
        <c:forEach items="${listc}" var="c">
        <li>
            <a href="category-detail.htm?id=${c.id}">${c.tieude}</a>
        </li>
        </c:forEach>
    </ul>
</div>

<div class="box-left box-menu">
    <h3 class="box-title"><i class="fa fa-warning"></i>  Sản phẩm mới </h3>
    <!--  <marquee direction="down" onmouseover="this.stop()" onmouseout="this.start()"  > -->
    <ul>
        <c:forEach items="${home}"  var="p">
        <li class="clearfix">
            <a href="chitietsanpham.htm?id=${p.id}">
                <img src="<c:url value="public/images/${p.image}"></c:url>" class="img-responsive pull-left" width="80" height="80">
                <div class="info pull-right">
                    <p class="name">${p.ten}</p >
                    <b class="price"><fmt:formatNumber value="${p.giatien}" type="number"/>   đ</b><br>                                       
                </div>
            </a>
        </li>   
        </c:forEach>
    </ul>
    <!-- </marquee> -->
</div>

<div class="box-left box-menu">
    <h3 class="box-title"><i class="fa fa-warning"></i> Sản phẩm bán chạy </h3>
    <!--  <marquee direction="down" onmouseover="this.stop()" onmouseout="this.start()"  > -->
    <ul>

        <c:forEach items="${home}"  var="p">
        <li class="clearfix">
            <a href="chitietsanpham.htm?id=${p.id}">
                <img src="<c:url value="public/images/${p.image}"></c:url>" class="img-responsive pull-left" width="80" height="80">
                <div class="info pull-right">
                    <p class="name">${p.ten}</p >
                    <b class="price"><fmt:formatNumber value="${p.giatien}" type="number"/>   đ</b><br>                                       
                </div>
            </a>
        </li>   
        </c:forEach>

        

    </ul>
    <!-- </marquee> -->
</div>