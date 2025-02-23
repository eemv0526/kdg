<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>도서 관리</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" defer="defer">
   
        function fn_save() {
  
            document.detailForm.action = "${pageContext.request.contextPath}/anno/update/update";
   
            document.detailForm.submit();
        }
        // 삭제 버튼 클릭시 실행함수
        function fn_delete() {
      
            document.detailForm.action = "${pageContext.request.contextPath}/anno/delete";

            document.detailForm.submit();
        }
    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container mt-5">
        <h2>도서 관리</h2>

  
        <form id="detailForm" name="detailForm" method="post">
      
            <input type="hidden" name="ano" value="${annoVO.ano}" />

            <div class="mb-3">
                <label for="title" class="form-label">도서 제목</label>
                <input type="text" class="form-control" id="title" name="title" value="${annoVO.title}" required />
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" id="content" name="content" rows="3" required>${annoVO.content}</textarea>
            </div>
          
          
           

          
            <div class="mb-3">
                <button class="btn btn-warning" onclick="fn_save()">수정</button>
                <button class="btn btn-danger" onclick="fn_delete()">삭제</button>
            </div>
        </form>

    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
