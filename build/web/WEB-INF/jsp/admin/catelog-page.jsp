<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Danh mục loại sản phẩm</h1>
    <a href="init-catelog-insert.htm" class="btn btn-success" style="color: white">Thêm mới</a><br>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Bảng danh mục</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Tiêu đề</th>
                            <th>Mô tả</th>
                            <th>Trạng thái</th>     
                            <th>Chi tiết</th>
                            <th>Cập nhật</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>                   
                    <tbody>                   
                        <c:forEach items="${list}" var="c">
                            <tr>
                                <th>${c.id}</th>
                                <th>${c.tieude    }</th>                    
                                <th>${c.mota}</th>
                                <th>${c.trangthai==1?"Còn hàng":"Hết hàng"}</th>                    
                                <th><a href="catelog-detail.htm?id=${c.id}"><img src="<c:url value="/public/images/ic_detail.png"></c:url>"/></a></th>
                                <th><a href="init-catelog-update.htm?id=${c.id}"><img src="<c:url value="/public/images/ic_update.png"></c:url>"/></a></th>
                                <th><a href="catelog-delete.htm?id=${c.id}" onclick="return confirm('Bạn muốn xóa loại ${c.tieude} không?')"><img src="<c:url value="/public/images/ic_delete.png"></c:url>"/></a></th>
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


