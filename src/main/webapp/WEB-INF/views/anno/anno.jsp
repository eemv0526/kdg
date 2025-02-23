<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html>
<head>
    <title>공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" defer="defer">
        function fn_add_list() {
            window.location.href = "${pageContext.request.contextPath}/annoadd";
        }
    </script>
    <style>
        .best-seller-title {
            font-size: 36px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2), 0 0 10px rgba(0, 150, 255, 0.6);
            background: none;
            border-radius: 10px;
        }

        /* 공지사항 버튼 스타일 */
        .btn-add {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            width: 100%;
        }

        .btn-add:hover {
            background-color: #218838;
        }

        /* 테이블 스타일 */
        table.table th, table.table td {
            vertical-align: middle;
            text-align: center;
        }

        .table thead {
            background-color: #f8f9fa;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table td {
            padding: 15px;
        }

        .table th {
            font-weight: 600;
            color: #495057;
        }

        /* 관리 버튼 */
        .btn-manage {
            background-color: #ffcc00;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            font-size: 14px;
        }

        .btn-manage:hover {
            background-color: #e0a800;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .table th, .table td {
                padding: 10px;
            }

            .btn-add {
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<div class="container my-5">
    <div class="best-seller-title">
        공지사항
    </div>

    <form id="listForm" name="listForm" method="get">
        <input type="hidden" name="eno">

        <!-- 공지사항 추가 버튼 -->
        <div class="d-flex justify-content-end mb-4">
        <c:if test="${infoVO.codeName == '관리자'}">
            <button class="btn btn-add" type="button" onclick="fn_add_list();">
                <i class="fas fa-plus-circle"></i> 공지사항 추가
            </button>
            </c:if>
        </div>

        <!-- 테이블 -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <c:if test="${infoVO.codeName == '관리자'}">
                        <th scope="col">관리</th>
                    </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="data" items="${annos}">
                    <tr>
                        <td>
                            <c:out value="${data.ano}" />
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/anno/detail?ano=${data.ano}" style="text-decoration: none; color: #495057;">
                                <c:out value="${data.title}" />
                            </a>
                        </td>
                        <c:if test="${infoVO.codeName == '관리자'}">
                            <td>
                                <a href="${pageContext.request.contextPath}/anno/update?ano=${data.ano}" class="btn btn-manage">관리</a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </form>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
