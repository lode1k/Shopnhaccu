<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Danh mục bài viết</h1>
    <a href="init-news-insert.htm" class="btn btn-success" style="color: white">Thêm mới</a><br>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Bảng bài viết</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Ảnh</th>
                            <th>Tiêu đề</th>
                            <th>Tin tức</th>                           
                            <th>Cập nhật</th>
                            <th>Xóa</th>

                        </tr>
                    </thead>                   
                    <tbody>                   
                        <c:forEach items="${list}" var="n">
                            <tr>
                                <th>${n.id}</th>                               
                                <th><img width="50%" src="<c:url value="/public/images/${n.image}"></c:url>"/></th> 
                                <th style="font-size: 20px">${n.tieude}</th>
                                <th style="font-size: 20px">${n.tintuc}</th>                         
                                <th><a href="init-news-update.htm?id=${n.id}"><img src="<c:url value="/public/images/ic_update.png"></c:url>"/></a></th>
                                <th><a href="news-delete.htm?id=${n.id}" onclick="return confirm('Bạn muốn xóa bài viết này không?')"><img src="<c:url value="/public/images/ic_delete.png"></c:url>"/></a></th>
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


