<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Thêm mới loại sản phẩm</h1>
    <h1 class="h3 mb-4 text-gray-800">${msg}</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        
        <div class="card-body">
            <div class="table-responsive">
               <form:form action="catelog-insert.htm" method="POST" modelAttribute="c">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <tr><th>Tiêu đề</th>
                    <td>
                        <form:input path="tieude" />
                        <form:errors path="tieude" class="error" />
                    </td>
                </tr>
                <tr>
                    <th>Mô tả</th>
                    <td><form:input path="mota" />
                        <form:errors path="mota" class="error" />
                    </td>
                </tr>
                <tr>
                    <th>Trạng thái</th>
                    <td>
                        <form:radiobutton path="trangthai" value="0" />
                        <form:label path="trangthai">Hết hàng</form:label>
                        <form:radiobutton path="trangthai" value="1" />
                        <form:label path="trangthai">Còn hàng</form:label>                                                
                        <form:errors path="trangthai" class="error" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Thêm mới" />
                        <input type="reset" value="Làm lại" />
                    </td>
                </tr>
                <tr>
                    <td><a href="danhmucsanpham.htm">Go back</a></td>
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


