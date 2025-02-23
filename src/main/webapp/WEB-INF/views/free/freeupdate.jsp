<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>도서 관리</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" defer="defer">
        // 수정 버튼 클릭시 실행함수
        function fn_save() {
   
            document.detailForm.action = "${pageContext.request.contextPath}/free/update/update";
            // 2) submit() 실행
            document.detailForm.submit();
        }
        // 삭제 버튼 클릭시 실행함수
        function fn_delete() {
      
            document.detailForm.action = "${pageContext.request.contextPath}/free/delete";
            // 2) submit() 실행
            document.detailForm.submit();
        }
    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container mt-5">
        <h2>도서 관리</h2>

        <!-- 수정 폼 -->
        <form id="detailForm" name="detailForm" method="post" enctype="multipart/form-data">
            <!-- 숨겨진 UUID 필드: 이 값은 수정 및 삭제에 사용됩니다 -->
            <input type="hidden" name="uuid" value="${freeVO.uuid}" />

            <div class="mb-3">
                <label for="freeTitle" class="form-label">도서 제목</label>
                <input type="text" class="form-control" id="freeTitle" name="freeTitle" value="${freeVO.freeTitle}" required />
            </div>
            <div class="mb-3">
                <label for="freeContent" class="form-label">내용</label>
                <textarea class="form-control" id="freeContent" name="freeContent" rows="3" required>${freeVO.freeContent}</textarea>
            </div>
          
        

            <!-- 도서 이미지 파일 선택 -->
            <div class="mb-3">
                <label for="freeUrl" class="form-label">도서 이미지 선택</label>
                
                <!-- 기존 이미지 표시 -->
                <div>
                    <label>현재 이미지:</label><br />
                   <img src="${freeVO.freeUrl}" alt="도서 이미지" style="max-width: 200px; max-height: 200px;" />
                </div>
                

                <!-- 파일 선택 입력 -->
                <input type="file" class="form-control" id="image" name="image" />
            </div>

            <!-- 수정 버튼 -->
            <div class="mb-3">
                <button class="btn btn-warning" onclick="fn_save()">수정</button>
                <button class="btn btn-danger" onclick="fn_delete()">삭제</button>
            </div>
        </form>

    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
