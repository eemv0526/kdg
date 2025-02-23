<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<html>
<head>
    <title>도서 상세조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container mt-5">
    
        <c:if test="${not empty annoVO}">
            <div class="card">
             
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${annoVO.title}" /></h5>
                    <p class="card-text"><c:out value="${annoVO.content}" /></p>
                    
                    <a href="javascript:history.back()" class="btn btn-secondary">뒤로가기</a>
                </div>
            </div>
        </c:if>

  
        <c:if test="${empty annoVO}">
            <p>공지사항 게시글이 없습니다</p>
        </c:if>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
