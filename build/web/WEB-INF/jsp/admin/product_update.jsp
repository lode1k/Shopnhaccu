<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Thêm mới admin</h1>
    <h1 class="h3 mb-4 text-gray-800">${msg}</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        
        <div class="card-body">
            <div class="table-responsive">
                <form:form action="product-update.htm" method="POST" modelAttribute="p" enctype="multipart/form-data">
            <table border="1">
                <form:input path="id" hidden="hidden" />
                <tr><th>Tên</th>
                    <td>
                        <form:input path="ten" />
                        <form:errors path="ten" class="error" />
                    </td>
                </tr>
                <tr>
                    <th>Ảnh</th>
                    <td>
                        <img width="100px" src="<c:url value="/public/images/${p.image}" />"/> 
                        <input name="imagelinkold" value="${p.image}" hidden="hidden" />
                        <form:input type="file" path="image" />
                        <form:errors path="image" class="error" />
                    </td>
                </tr>
                <tr><th>Mô tả</th>
                    <td>
                        <form:input path="mota" />
                        <form:errors path="mota" class="error" />
                    </td>
                </tr>
                <tr>
                    <th>Loại</th>
                    <td>
                        <form:select path="idloai">
                            <c:forEach items="${list}" var="c">
                                <form:option value="${c.id}">${c.tieude}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                </tr>
                <tr><th>Nhà cung cấp</th>
                    <td>
                        <form:input path="nhacc" />
                        <form:errors path="nhacc" class="error" />
                    </td>
                </tr>
                <tr>
                    <th>Tình trạng</th>
                    <td>
                        <form:radiobutton path="home" value="0" />
                        <form:label path="home">Cũ</form:label>
                        <form:radiobutton path="home" value="1" />
                        <form:label path="home">Mới</form:label>                                                
                        <form:errors path="home" class="error" /></td>            
                <tr>
                <tr><th>Số lượng</th>
                    <td>
                        <form:input step = "1" value="1" type="number" path="soluong" />
                        <form:errors path="soluong" class="error" />
                    </td>
                </tr>
                <tr><th>Giá tiền</th>
                    <td>
                        <form:input path="giatien"  step = "1000" value="1000" type="number"/>
                        <form:errors path="giatien" class="error" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Cập nhật" />                        
                    </td>
                </tr>
                <tr>
                    <td><a href="quanlysanpham.htm">Go back</a></td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </form:form>
            </div>
        </div>
    </div>    
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<jsp:include page="footer.jsp" />


