<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>도서 상세조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <style>
        .review-create-btn .btn {
        background-color: #66b3ff; /* 연한 파란색 */
        border-color: #66b3ff;
    }

    .review-create-btn .btn:hover {
        background-color: #3399ff; /* 조금 더 진한 파란색 */
        border-color: #3399ff;
    }
        body {
            background: linear-gradient(135deg, #fefcea, #f1daff);
            font-family: 'Noto Sans KR', sans-serif;
        }
        .container {
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }
        .card {
            width: 50%;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin-bottom: 20px;
        }
        .card-img-top {
            max-width: 60%;
            height: auto;
            border-radius: 10px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
            display: block;
            margin: 0 auto;
        }
        .card-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: #6a0dad;
            text-shadow: 2px 2px 5px rgba(106, 13, 173, 0.3);
            text-align: center;
            border-bottom: 2px solid #6a0dad;
            padding-bottom: 10px;
        }
        .card-text {
            font-size: 1rem;
            color: #333;
            padding: 10px;
            border-radius: 10px;
        }
        .summary {
            background: rgba(250, 230, 250, 0.8);
        }
        .genre {
            background: rgba(230, 250, 250, 0.8);
        }
        .btn-custom {
            background-color: #ff89e9;
            color: white;
            border: none;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #ff65c0;
        }

        .rating-star {
            color: gold;
        }

        .review-container {
            width: 50%;
        }

        .review-card {
            background: rgba(255, 255, 255, 0.9);
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .review-header {
            font-weight: bold;
        }

        .review-content {
            margin-top: 10px;
        }

        .review-rating {
            margin-top: 5px;
        }

        .review-form {
            margin-top: 30px;
            width: 100%;
        }
        
        
        .review-container {
    width: 70%;
    max-width: 800px;
    margin: 40px auto;
}

.review-title {
    font-size: 24px;
    color: #6a0dad;
    text-align: center;
    margin-bottom: 30px;
    font-weight: 700;
    text-shadow: 1px 1px 2px rgba(106, 13, 173, 0.2);
}

.review-box {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease;
}

.review-box:hover {
    transform: translateY(-3px);
}

.review-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 1px solid rgba(106, 13, 173, 0.2);
}

.reviewer-info {
    display: flex;
    align-items: center;
    gap: 10px;
}

.reviewer-email {
    font-weight: 600;
    color: #6a0dad;
}

.review-id {
    color: #888;
    font-size: 0.9em;
}

.review-stars {
    display: flex;
    align-items: center;
    gap: 5px;
}

.star {
    color: #ddd;
    font-size: 18px;
}

.star.filled {
    color: #ffd700;
}

.rating-number {
    margin-left: 5px;
    color: #666;
    font-weight: 600;
}

.review-comment {
    color: #333;
    line-height: 1.6;
    font-size: 15px;
    white-space: pre-line;
}

@media (max-width: 768px) {
    .review-container {
        width: 90%;
    }
    
    .review-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }
    
    .review-stars {
        margin-top: 5px;
    }
}
        
   
        
        
        
        
    </style>
    
       <script type="text/javascript" defer="defer">
    
        // 삭제 버튼 클릭시 실행함수
        function fn_delete() {
            // 1) action 속성 : "/list/delete"
            document.detailForm.action = "${pageContext.request.contextPath}/bc/delete";
            // 2) submit() 실행
            document.detailForm.submit();
        }
    </script>   
</head>
<body>
    <jsp:include page="/common/header.jsp" />
    <div class="container mt-5">
        <c:if test="${not empty ListVO}">
            <div class="card">
                <img src="<c:out value="${ListVO.listUrl}" />" class="card-img-top" alt="도서 이미지">
                
                
                <div class="average-rating" style="text-align: center; margin-top: 20px;">
<h4>⭐ : ${formattedRating} 점</h4>
</div>     
                
                
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${ListVO.listTitle}" /></h5>
                    <p class="card-text summary"><strong>줄거리:</strong> <c:out value="${ListVO.listDescription}" /></p>
                    <p class="card-text genre"><strong>장르:</strong> <c:out value="${ListVO.listGenre}" /></p>
                    <p class="card-text"><c:out value="${ListVO.listContent}" /></p>
                    <a href="javascript:history.back()" class="btn btn-custom">뒤로가기</a>
                </div>
            </div>
        </c:if>
        <c:if test="${empty ListVO}">
            <p class="text-center">해당 도서 정보를 찾을 수 없습니다.</p>
        </c:if>
        
        
          <div class="review-container">
      <form id="detailForm" name="detailForm" method="post">
    <h3 class="review-title">리뷰 & 별점</h3>
    
    <c:forEach var="data" items="${ccs}">
        <div class="review-box">
            <div class="review-header">
                <div class="reviewer-info">
                    <span class="reviewer-email">
                    <span class="review-id">No.${data.comicId}</span>
    <c:set var="email" value="${data.email}" />
    <c:set var="maskedEmail" value="${fn:substring(email, 0, 2)}" />
    <c:forEach begin="2" end="${fn:length(email) - 1}">
        <c:set var="maskedEmail" value="${maskedEmail}*" />
    </c:forEach>
    ${maskedEmail}${fn:substring(email, fn:length(email) - 1, fn:length(email))}
</span>
 <span class="review-id">#${data.createTime}</span>
                   
                </div>
                <div class="review-stars">
                    <c:forEach begin="1" end="${data.rating}" var="i">
                        <span class="star filled">★</span>
                    </c:forEach>
                    <c:forEach begin="${data.rating + 1}" end="5" var="i">
                        <span class="star">★</span>
                    </c:forEach>
                    <span class="rating-number">${data.rating}.0</span>
                </div>
            </div>
 
    <!-- 다른 폼 요소들 -->
  <div class="review-comment" style="position: relative;">
    ${data.comicComment}

    <!-- 🔥 관리 버튼 (작성자와 로그인 유저가 같을 때만 보이게) -->
  <c:if test="${not empty infoVO.email and not empty data.email 
                and fn:trim(fn:toLowerCase(data.email)) eq fn:trim(fn:toLowerCase(infoVO.email)) 
                or infoVO.codeName == '관리자'}">
    
    <input type="hidden" name="comicId" value="${data.comicId}" />
    
    <!-- 삭제 버튼을 오른쪽 상단에 배치 -->
    <button type="button" class="btn btn-danger" onclick="fn_delete()" style="position: absolute; top: 10px; right: 10px;">삭제</button>
</c:if>

</div>

        </div>
       
    </c:forEach>
     </form>
    
<!-- 글쓰기 버튼 -->
<div class="review-create-btn text-center">
    <a href="${pageContext.request.contextPath}/bcadd?uuid=${ListVO.uuid}" class="btn">별점 및 리뷰 쓰기</a>
</div>
</div>
        
    
        
        
        
        
    </div>
    <jsp:include page="/common/footer.jsp" />
</body>
</html>
