<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript" defer="defer">
//        저장 버튼 클릭시 실행할 함수
      function fn_save() {
    	  document.addForm.action = "${pageContext.request.contextPath}/list/add";
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
            <label for="listTitle" class="form-label">listTitle</label>
            <input  
                  class="form-control"
                  id="listTitle"
                  name="listTitle"
                  placeholder="제목" />
        </div>
        <div class="mb-3">
            <%--            내용 입력양식 --%>
            <label for="listContent" class="form-label">listContent</label>
            <input 
                   class="form-control"
                   id="listContent"
                   name="listContent"
                   placeholder="내용입력" />
        </div>
            <div class="mb-3">
            <%--            줄거리 입력양식 --%>
            <label for="listDescription" class="form-label">listDescription</label>
            <input 
                   class="form-control"
                   id="listDescription"
                   name="listDescription"
                   placeholder="내용입력" />
        </div>
         <div class="mb-3">
            <%--            장르 입력양식 --%>
            <label for="listGenre" class="form-label">listGenre</label>
            <input 
                   class="form-control"
                   id="listGenre"
                   name="listGenre"
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
