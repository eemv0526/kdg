<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html>
<head>
    <title>도서 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
          body {
            background-color: #f8f9fa;
        }

        .best-seller-title {
            font-size: 36px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin: 40px 0;
            padding: 20px;
            letter-spacing: 2px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .genre-btn {
            margin: 10px 5px;
            border-radius: 20px;
            padding: 8px 20px;
            transition: all 0.3s ease;
            border: none;
        }

        .search-container {
            max-width: 600px;
            margin: 30px auto;
            position: relative;
        }

        .search-container .input-group {
            background: white;
            border-radius: 50px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            padding: 5px;
        }

        .search-container input {
            border: none;
            padding: 15px 25px;
            font-size: 16px;
            background: transparent;
        }

        .search-container input:focus {
            box-shadow: none;
        }

        .search-container .btn {
            border-radius: 50px;
            padding: 10px 30px;
            margin: 0 5px;
        }

        .card {
            border-radius: 12px;
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            overflow: hidden;
            cursor: pointer;
            margin-bottom: 25px;
            background: white;
            height: 400px; /* 카드 높이 고정 */
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }

        .card-img-top {
            height: 250px; /* 이미지 높이 조정 */
            object-fit: cover;
            transition: all 0.3s ease;
        }

        .card:hover .card-img-top {
            transform: scale(1.05);
        }

        .card-body {
            padding: 15px;
            position: relative;
        }

        .card-title {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 8px;
            color: #333;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .card-text {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 8px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            height: 42px;
        }

        .card-genre {
        
        
            color: #ff6b81;
            font-size: 0.8rem;
            font-weight: 500;
            border-radius: 12px;
            padding: 3px 12px;
            background: rgba(255, 107, 129, 0.1);
            letter-spacing: 0.5px;
        }

        .btn-primary {
            background: #6c5ce7;
            border: none;
        }

        .btn-success {
            background: #00b894;
            border: none;
        }

        .btn-warning {
            background: #fdcb6e;
            border: none;
            padding: 5px 12px;
            font-size: 0.9rem;
            border-radius: 8px;
        }

        #paging {
            margin: 40px 0;
        }

        .col-3 {
            padding: 10px; /* 카드 간격 조정 */
        }

        @media (max-width: 768px) {
            .col-3 {
                width: 50%;
            }
        }
        
        
         .card-body {
 
    text-align: center; /* 내용 중앙 정렬 */
}

.card-genre, .card-title, .card-text {
    
    margin: 5px; /* 간격 조정 */
}
        
        
        
        
    </style>
    <script type="text/javascript" defer="defer">
        // 장르 필터링 함수
        function filterGenre(genre) {
            var cards = document.querySelectorAll('.card');
            cards.forEach(function(card) {
                var cardGenre = card.querySelector('.card-genre').textContent.trim();
                if (cardGenre.includes(genre) || genre === "all") {
                    card.style.display = "block"; // 필터링된 카드는 보이도록
                } else {
                    card.style.display = "none"; // 일치하지 않는 카드는 숨기기
                }
            });

            // 버튼 스타일 변경
            var buttons = document.querySelectorAll('.genre-btn');
            buttons.forEach(function(button) {
                button.classList.remove('active-genre');
            });

            var activeButton = document.querySelector('#' + genre + '-btn');
            if (activeButton) {
                activeButton.classList.add('active-genre');
            }
        }
        
        // 기존 JavaScript 함수들은 그대로 유지
        function fn_egov_selectList() {
            document.listForm.pageIndex.value = 1;
            document.listForm.action = "${pageContext.request.contextPath}/lnv";
            document.listForm.submit();
        }

        function fn_egov_link_page(pageNo) {
            document.listForm.pageIndex.value = pageNo;
            document.listForm.action = "${pageContext.request.contextPath}/lnv";
            document.listForm.submit();
        }


        function fn_add_list() {
            window.location.href = "${pageContext.request.contextPath}/lnvadd";
        }
        
        
        
        
        
        
        
        
        
    </script>
</head>
<body>
      <jsp:include page="/common/header.jsp" />

    <div class="container">
        <div class="best-seller-title">
            라이트 노벨
        </div>

        <!-- 장르 버튼 -->
        <div class="text-center">
            <button id="all-btn" class="btn genre-btn btn-secondary" onclick="filterGenre('all')">전체</button>
            <button id="fantasy-btn" class="btn genre-btn btn-info" onclick="filterGenre('판타지')">판타지</button>
            <button id="action-btn" class="btn genre-btn btn-danger" onclick="filterGenre('액션')">액션</button>
            <button id="mystery-btn" class="btn genre-btn btn-warning" onclick="filterGenre('미스테리')">미스테리</button>
            <button id="thriller-btn" class="btn genre-btn btn-dark" onclick="filterGenre('스릴러')">스릴러</button>
            <button id="romance-btn" class="btn genre-btn" style="background-color: #ff69b4; color: white;" onclick="filterGenre('로맨스')">로맨스</button>
        </div>

        <form id="listForm" name="listForm" method="get">
            <input type="hidden" name="uuid">
            
            <div class="search-container">
                <div class="input-group">
                    <input type="text" class="form-control"
                        id="searchKeyword"
                        name="searchKeyword"
                        placeholder="작품 제목을 입력해주세요">
                    <button class="btn btn-primary" type="button" onclick="fn_egov_selectList();">
                        <i class="fas fa-search"></i> 검색
                    </button>
                    <c:if test="${infoVO.codeName == '관리자'}">
                        <button class="btn btn-success" type="button" onclick="fn_add_list();">
                            <i class="fas fa-plus"></i> 도서 추가
                        </button>
                    </c:if>
                </div>
            </div>

            <div class="row">
                <c:forEach var="data" items="${lnvs}">
                    <div class="col-3">
                        <div class="card" onclick="location.href='${pageContext.request.contextPath}/lnv/detail?uuid=${data.uuid}'">
                            <img src="<c:out value="${data.lnvUrl}" />" class="card-img-top" alt="도서 이미지">
                            <div class="card-body">
                                <span class="card-genre"><c:out value="${data.lnvGenre}" /></span>
                                <h5 class="card-title"><c:out value="${data.lnvTitle}" /></h5>
                                <p class="card-text"><c:out value="${data.lnvContent}" /></p>
                                <c:if test="${infoVO.codeName == '관리자'}">
                                    <a href="${pageContext.request.contextPath}/lnv/update?uuid=${data.uuid}" class="btn btn-warning">관리</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div id="paging" class="text-center">
                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
                <input type="hidden" id="pageIndex" name="pageIndex" />
            </div>
        </form>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
