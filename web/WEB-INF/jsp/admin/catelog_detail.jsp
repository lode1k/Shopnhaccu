<%-- 
    Document   : employee_detail
    Created on : Sep 1, 2020, 7:35:32 PM
    Author     : HocVien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Chi tiết danh muc</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <td>${c.id}</td>
            </tr>
            <tr><th>Tiêu đề</th>
                <td>${c.tieude}</td>
            </tr>
            <tr>
                <th>Mô tả</th>
                <td>${c.mota}</td>
            </tr>
            <tr>
                <th>Trạng thái</th>
                <td>${c.trangthai==1?"Còn hàng":"Hết hàng"}</td>
            </tr>
        
        </table>
        <a href="danhmucsanpham.htm">Go back</a>
    </body>
</html>
