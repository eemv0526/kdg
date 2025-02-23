<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript" defer="defer">

      function fn_save() {
    	  document.addForm.action = "${pageContext.request.contextPath}/anno/add";
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
     
            <label for="title" class="form-label">title</label>
            <input  
                  class="form-control"
                  id="title"
                  name="title"
                  placeholder="제목" />
        </div>
        <div class="mb-3">
         
            <label for="content" class="form-label">content</label>
            <input 
                   class="form-control"
                   id="content"
                   name="content"
                   placeholder="내용입력" />
        </div>
       
    
      <div class="input-group">
    
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
