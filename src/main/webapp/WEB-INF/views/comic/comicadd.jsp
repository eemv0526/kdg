<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript" defer="defer">
//        저장 버튼 클릭시 실행할 함수
      function fn_save() {
    	  document.addForm.action = "${pageContext.request.contextPath}/comic/add";
            document.addForm.submit();
      }
    </script>
</head>
<body>
<%--    머리말--%>
<jsp:include page="/common/header.jsp"/>

<div class="container">
   <form id="addForm" 
         name="addForm" 
         method="post"
         enctype="multipart/form-data"
         >
        <div class="mb-3">
            <%--            제목 입력양식 --%>
            <label for="comicTitle" class="form-label">comicTitle</label>
            <input  
                  class="form-control"
                  id="comicTitle"
                  name="comicTitle"
                  placeholder="제목" />
        </div>
        <div class="mb-3">
            <%--            내용 입력양식 --%>
            <label for="comicContent" class="form-label">comicContent</label>
            <input 
                   class="form-control"
                   id="comicContent"
                   name="comicContent"
                   placeholder="내용입력" />
        </div>
            <div class="mb-3">
            <%--            줄거리 입력양식 --%>
            <label for="comicDescription" class="form-label">comicDescription</label>
            <input 
                   class="form-control"
                   id="comicDescription"
                   name="comicDescription"
                   placeholder="내용입력" />
        </div>
         <div class="mb-3">
            <%--            장르 입력양식 --%>
            <label for="comicGenre" class="form-label">comicGenre</label>
            <input 
                   class="form-control"
                   id="comicGenre"
                   name="comicGenre"
                   placeholder="내용입력" />
        </div>
      <div class="input-group">
        <input type="file" 
               class="form-control" 
               id="image"
               name="image"
               >
        <button class="btn btn-primary" 
                type="button"
                onclick="fn_save()"
                >저장</button>
      </div>
    </form>
</div>
<%--    꼬리말--%>
<jsp:include page="/common/footer.jsp"/>
</body>
</html>
