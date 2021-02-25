<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Danh mục sản phẩm</h1>
    <a href="init-product-insert.htm" class="btn btn-success" style="color: white">Thêm mới</a><br>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Bảng sản phẩm</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Tên</th>
                            <th>Ảnh sản phẩm</th>
                            <th>Loại</th>
                            <th>Nhà cung cấp</th>     
                            <th>Tình trạng</th>
                            <th>Số lượng</th>
                            <th>Giá tiền</th>
                            <th>Chi tiết</th>     
                            <th>Cập nhật</th>
                            <th>Xóa</th>

                        </tr>
                    </thead>                   
                    <tbody>                   
                        <c:forEach items="${list}" var="p">
                            <tr>
                                <th>${p.id}</th>
                                <th>${p.ten}</th>
                                <th><img width="50%" src="<c:url value="/public/images/${p.image}"></c:url>"/></th> 
                                <th>${p.catelog.tieude}</th>
                                <th>${p.nhacc}</th>  
                                <th>${p.home==1?"Sản phẩm mới":"Sản phẩm cũ"}</th>
                                <th>${p.soluong}</th> 
                                <th><fmt:formatNumber value="${p.giatien}" type="number"/></th>                      
                                <th><a href="product-detail.htm?id=${p.id}"><img src="<c:url value="/public/images/ic_detail.png"></c:url>"/></a></th>
                                <th><a href="init-product-update.htm?id=${p.id}"><img src="<c:url value="/public/images/ic_update.png"></c:url>"/></a></th>
                                <th><a href="product-delete.htm?id=${p.id}" onclick="return confirm('Bạn muốn xóa sản phẩm ${p.ten} không?')"><img src="<c:url value="/public/images/ic_delete.png"></c:url>"/></a></th>
                                </tr>
                        </c:forEach>                
                    </tbody>
                </table>
                <div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                                <c:forEach items="${lstPages}" var="p">
                                <li class="page-item"><a class="page-link" href="?page=${p}">${p+1}</a></li>  
                                </c:forEach>

                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>    
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<jsp:include page="footer.jsp" />


