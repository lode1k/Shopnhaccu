<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Danh mục admin</h1>
    <a href="init-admin-insert.htm" class="btn btn-success" style="color: white">Thêm mới</a><br>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Bảng tài khoản</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Họ và Tên</th>
                            <th>Username</th>
                            <th>Password</th>                              
                            <th>Cập nhật</th>
                            <th>Xóa</th>

                        </tr>
                    </thead>                   
                    <tbody>                   
                        <c:forEach items="${list}" var="a">
                            <tr>
                                <th>${a.id}</th>
                                <th>${a.hovaten}</th>
                                
                                <th>${a.username}</th>
                                <th>${a.password}</th>                                                                      
                                <th><a href="init-admin-update.htm?id=${a.id}"><img src="<c:url value="/public/images/ic_update.png"></c:url>"/></a></th>
                                <th><a href="admin-delete.htm?id=${a.id}" onclick="return confirm('Bạn muốn xóa sản phẩm ${a.username} không?')"><img src="<c:url value="/public/images/ic_delete.png"></c:url>"/></a></th>
                                </tr>
                        </c:forEach>                
                    </tbody>
                </table>
                
            </div>
        </div>
    </div>    
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<jsp:include page="footer.jsp" />


