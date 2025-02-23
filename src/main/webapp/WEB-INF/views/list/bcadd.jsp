<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 작성</title>

    <!-- 부트스트랩 CSS 링크 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <!-- 사용자 정의 스타일 -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
            margin-top: 50px;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary {
            width: 100%;
        }
    </style>

    <script type="text/javascript" defer="defer">
        // 저장 버튼 클릭시 실행할 함수
        function fn_save() {
            document.addForm.action = "${pageContext.request.contextPath}/bc/add/" + '${param.uuid}'; // uuid 값으로 action 설정
            document.addForm.submit(); // 폼 제출
        }
    </script>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
    <div class="container">
        <div class="card">
            <h2 class="card-title text-center mb-4">리뷰 작성</h2>

            <form name="addForm" action="${pageContext.request.contextPath}/cc/add" method="post">
                <input type="hidden" name="email" value="${sessionScope.infoVO.email}" />
                <input type="hidden" name="comicId" value="${param.uuid}"> <!-- 만화 UUID 전달 -->

                <div class="form-group">
                    <label for="rating">별점:</label>
                    <select name="rating" id="rating" class="form-control">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="comment">댓글:</label>
                    <textarea name="comicComment" id="comment" rows="4" class="form-control" required></textarea>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary" type="button" onclick="fn_save()">저장</button>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="/common/footer.jsp"></jsp:include>
    <!-- 부트스트랩 JS와 jQuery 링크 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
