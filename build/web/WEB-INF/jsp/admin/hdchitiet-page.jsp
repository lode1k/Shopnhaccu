<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Danh mục hóa đơn chi tiết</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Bảng hóa đơn chi tiết</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id hóa đơn</th>
                            <th>Id sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>                                                                               
                           
                        </tr>
                    </thead>                   
                    <tbody>                   
                        <c:forEach items="${list}" var="bd">
                            <tr>
                                <th>${bd.idhd}</th>
                                <th>${bd.idsp}</th>                                
                                <th>${bd.soluong}</th>
                                <th><b class="price"><fmt:formatNumber value="${bd.dongia}" type="number"/>  đ</b></th>                                                            
                                
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


