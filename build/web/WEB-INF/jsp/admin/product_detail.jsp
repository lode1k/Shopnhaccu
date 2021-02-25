<%-- 
    Document   : employee_detail
    Created on : Sep 1, 2020, 7:35:32 PM
    Author     : HocVien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Chi tiết sản phẩm</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <td>${p.id}</td>
            </tr>
            <tr><th>Tên</th>
                <td>${p.ten}</td>
            </tr>
            <tr>
                <th>Ảnh</th>
                <td><img src="<c:url value="/public/images/${p.image}"></c:url>" /></td>
            </tr>
            <tr>
                <th>Mô tả</th>
                <td>${p.mota}</td>
            </tr>
            <tr>
                <th>Id loại</th>
                <td>${p.idloai}</td>
            </tr>
            <tr>
                <th>Nhà cung cấp</th>
                <td>${p.nhacc}</td>
            </tr>
            <tr>
                <th>Số lượng</th>
                <td>${p.soluong}</td>
            </tr>
            <tr>
                <th>Giá tiền </th>
                <td>${p.giatien}</td>
            </tr>
            
        
        </table>
        <a href="quanlysanpham.htm">Go back</a>
    </body>
</html>
