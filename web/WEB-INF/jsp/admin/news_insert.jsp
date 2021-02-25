<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp" />
<!-- Nội dung -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Thêm mới sản phẩm</h1>
    <h1 class="h3 mb-4 text-gray-800">${msg}</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">

        <div class="card-body">
            <div class="table-responsive">
                <form:form action="news-insert.htm" method="POST" modelAttribute="n" enctype="multipart/form-data">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <tr>
                            <th>Ảnh đại diện</th>
                            <td><form:input type="file" path="image" />
                            </td>
                        </tr>
                        <tr>
                            <th>Tiêu đề</th>
                            <td><form:input path="tieude" />                               
                            </td>
                        </tr>
                        <tr>
                            <th>Tin tức</th>
                            <td><form:input path="tintuc" />                               
                            </td>
                        </tr>
                        
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="Thêm mới" />
                                <input type="reset" value="Làm lại" />
                            </td>
                        </tr>
                        <tr>
                            <td><a href="quanlybaiviet.htm">Go back</a></td>
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


