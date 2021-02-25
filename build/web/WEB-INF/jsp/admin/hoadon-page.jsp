<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Danh mục hóa đơn</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Bảng hóa đơn</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Ngày tạo</th>
                            <th>Tổng tiền</th>
                            <th>Người nhận</th>                              
                            <th>Địa chỉ nhận</th>
                            <th>Số điện thoại</th>
                            <th>Email</th>
                           
              
                        </tr>
                    </thead>                   
                    <tbody>                   
                        <c:forEach items="${list}" var="b">
                            <tr>
                                <th>${b.id}</th>
                                <th>${b.ngaytao}</th>
                                <th><b class="price"><fmt:formatNumber value="${b.tongtien}" type="number"/>  đ</b></th>
                                <th>${b.nguoinhan}</th>
                                <th>${b.sdt}</th>
                                <th>${b.diachinhan}</th> 
                                <th>${b.email}</th> 
                                
                                
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


