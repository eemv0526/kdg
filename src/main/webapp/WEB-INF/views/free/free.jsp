<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html>
<head>
    <title>공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #6c5ce7;
            --accent-color: #a29bfe;
            --bg-color: #f8f9fa;
            --text-color: #2d3436;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .best-seller-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 1rem;
        }

        .best-seller-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .table {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        .table thead {
            background-color: var(--primary-color);
            color: white;
        }

        .table th {
            font-weight: 600;
            padding: 1.2rem 1rem;
        }

        .table td {
            padding: 1rem;
            vertical-align: middle;
            cursor: pointer;  /* 전체 문단 클릭 가능하도록 설정 */
        }

        .table tbody tr:hover {
            background-color: #f0f0f0;
            transform: translateY(-2px);
            transition: all 0.3s ease;
        }

        /* 링크 밑줄 없애기 */
        a {
            color: var(--text-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: var(--primary-color);
        }

        .input-group {
            max-width: 600px;
            margin: 0 auto 2rem;
        }

        .form-control {
            border-radius: 20px 0 0 20px;
            padding: 0.7rem 1.5rem;
            border: 2px solid var(--primary-color);
        }

        .input-group .btn {
            border-radius: 0 20px 20px 0;
            padding: 0.7rem 1.5rem;
            background-color: var(--primary-color);
            border: none;
        }

 .btn-add {
    
    bottom: 2rem;
    right: 2rem;
    background-color: var(--primary-color);
    color: white;
    padding: 1rem 2rem;
    border-radius: 30px;
    box-shadow: 0 4px 15px rgba(108, 92, 231, 0.3);
    transition: all 0.3s ease;
}

        .btn-add:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(108, 92, 231, 0.4);
            background-color: var(--accent-color);
            color: white;
        }

        #paging {
            margin-top: 2rem;
            margin-bottom: 5rem;
        }

        #paging img {
            margin: 0 5px;
            transition: transform 0.3s ease;
        }

        #paging img:hover {
            transform: scale(1.2);
        }

        /* 가로폭 줄이기 */
        .container {
            max-width: 800px !important;
            margin: 0 auto;
       
        }

    </style>
    <script type="text/javascript" defer="defer">
        function fn_add_list() {
            window.location.href = "${pageContext.request.contextPath}/freeadd";
        }
        
        function fn_egov_link_page(pageNo) {
            document.listForm.pageIndex.value = pageNo;
            document.listForm.action = "${pageContext.request.contextPath}/free";
            document.listForm.submit();
        }
        
        function fn_egov_selectList() {
            document.listForm.pageIndex.value = 1;
            document.listForm.action = "${pageContext.request.contextPath}/free";
            document.listForm.submit();
        }
    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp"></jsp:include>
    <div class="container my-5">
        <div class="best-seller-title">
            자유게시판
        </div>
        <form id="listForm" name="listForm" method="get">
            <input type="hidden" name="uuid">
            <div class="input-group mb-3 mt-3">
                <input type="text" class="form-control" id="searchKeyword"
                    name="searchKeyword" placeholder="제목을 입력해주세요"
                    onkeypress="fn_egov_selectList()">
                <button class="btn" type="button"
                    onclick="fn_egov_selectList()">검색</button>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성시간</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="data" items="${frees}">
                        <tr onclick="location.href='${pageContext.request.contextPath}/free/detail?uuid=${data.uuid}'">
                            <td>
                                <c:out value="${data.freeId}" />
                            </td>
                            <td>
                                <c:out value="${data.freeTitle}" />
                            </td>
                            <td>
                                <c:out value="${data.freeAuthor}" />
                            </td>
                             <td>
                                <c:out value="${data.freeCreatedDate}" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <button class="btn btn-add" type="button" onclick="fn_add_list();">
                <i class="fas fa-plus"></i> 글쓰기
            </button>
            
            <div id="paging" class="text-center">
                <ui:pagination paginationInfo="${paginationInfo}" type="image"
                    jsFunction="fn_egov_link_page" />
                <input type="hidden" id="pageIndex" name="pageIndex" />
            </div>
        </form>
    </div>
    <jsp:include page="/common/footer.jsp"></jsp:include>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
