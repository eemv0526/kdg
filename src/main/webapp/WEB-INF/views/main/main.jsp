<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html> 
<html> 
<head> 
    <meta charset="UTF-8"> 
    <!-- 부트스트랩 CSS --> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"> <!-- CSS 파일 경로 -->
   <style>
        .main-carousel {
            margin-top: 2rem;
            margin-bottom: 3rem;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .carousel-item {
            height: 400px;
            background-position: center;
            background-size: cover;
        }
        .carousel-caption {
            background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
            bottom: 0;
            left: 0;
            right: 0;
            padding: 2rem;
            text-align: left;
        }
        .carousel-caption h3 {
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 700;
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }
        .carousel-caption p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        .carousel-indicators {
            margin-bottom: 1.5rem;
        }
        .carousel-control-prev, .carousel-control-next {
            width: 5%;
            opacity: 0.7;
        }
        .carousel-control-prev:hover, .carousel-control-next:hover {
            opacity: 1;
        }
        
   .card-title {
    font-size: 1.0rem; /* 타이틀 크기 키움 */
    font-weight: 600; /* 두께를 더 강조 */
    color: #34495e !important; /* 세련된 다크블루 색상 */
    margin-bottom: 20px !important; /* card-title과 card-subtitle 사이에 간격을 추가 */
    text-align: center;
}

.card-subtitle {
    font-size: 0.9rem; /* 서브타이틀 크기 */
    font-weight: 300; /* 서브타이틀은 조금 얇게 */
    color: #7f8c8d !important; /* 부드러운 회색 */
    margin-top: 5px !important; /* card-subtitle의 상단에 간격을 추가 */
    text-align: center;
}

  


    </style>
   
</head> 
<body> 
    <!-- 헤더 포함 --> 
    <jsp:include page="/common/header.jsp" /> 
    
    <!-- 전체 컨테이너 --> 
    <div class="container">
    
    
      <div id="mainCarousel" class="carousel slide main-carousel" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
        </div>
        
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="${pageContext.request.contextPath}/list">
            <img src="${pageContext.request.contextPath}/resources/images/spotlight.png" class="d-block w-100" alt="애니메이션 이미지">
        </a>
                <div class="carousel-caption">
                    <h3>베스트셀러 소개</h3>
                    <p>이번 분기 베스트셀러를 소개합니다</p>
                </div>
            </div>
            
            <div class="carousel-item">
                 <a href="${pageContext.request.contextPath}/comic">
            <img src="${pageContext.request.contextPath}/resources/images/comic.jpg" class="d-block w-100" alt="애니메이션 이미지">
        </a>
                <div class="carousel-caption">
                    <h3>인기 만화 순위</h3>
                    <p>이번 주 독자들이 선택한 인기 만화</p>
                </div>
            </div>
            
            <div class="carousel-item">
                   <a href="${pageContext.request.contextPath}/lnv">
            <img src="${pageContext.request.contextPath}/resources/images/lnv.png" class="d-block w-100" alt="애니메이션 이미지">
        </a>
                <div class="carousel-caption">
                    <h3>라이트노벨</h3>
                    <p>라이트노벨을 소개합니다</p>
                </div>
            </div>
        </div>
        
        <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    
    
    
        
        <!-- 도서 리스트 섹션 - 베스트 셀러 -->
        <div class="book-section">
            <!-- 섹션 헤더 추가 -->
            <div class="section-header">
                <h2 class="section-title">베스트 셀러</h2>
                <a href="${pageContext.request.contextPath}/list" class="more-link"style="font-size: 1.2rem; font-weight: 600;">더보기</a>
            </div>

            <!-- 캐러셀 추가 -->
            <div id="bookCarousel" class="carousel slide book-carousel" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <!-- 4개씩 그룹화 -->
                    <c:forEach var="data" items="${lists}" varStatus="status">
                        <c:if test="${status.index % 4 == 0}">
                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="row">
                        </c:if>

                      <div class="col-lg-3 col-md-6 col-sm-12" style="margin-top: 130px; padding-left: 55px;">
    <div class="card-wrapper" onclick="location.href='${pageContext.request.contextPath}/list/detail?uuid=${data.uuid}'">
        <div class="card-img-container">
            <img src="<c:out value="${data.listUrl}" />" class="card-img-top" alt="도서 이미지">
        </div>
        <div class="card-content">
            <h5 class="card-title"><c:out value="${data.listTitle}" /></h5>
            <h6 class="card-subtitle"><c:out value="${data.listGenre}" /></h6> <!-- 장르 출력 -->
        </div>
    </div>
</div>

                        <c:if test="${(status.index + 1) % 4 == 0 || status.last}">
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                
                <!-- 캐러셀 컨트롤 -->
                <button class="carousel-control-prev" type="button" data-bs-target="#bookCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">이전</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#bookCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">다음</span>
                </button>
            
        </div>
        
        <!-- 도서 리스트 섹션 - 신간 도서 -->
        <div class="book-section">
            <!-- 섹션 헤더 추가 -->
            <div class="section-header">
                <h2 class="section-title">라이트 노벨</h2>
                <a href="${pageContext.request.contextPath}/lnv" class="more-link"style="font-size: 1.2rem; font-weight: 600;">더보기</a>
            </div>

            <!-- 캐러셀 추가 -->
            <div id="newBooksCarousel" class="carousel slide book-carousel" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <!-- 4개씩 그룹화 -->
                    <c:forEach var="data" items="${lnvs}" varStatus="status">
                        <c:if test="${status.index % 4 == 0}">
                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="row">
                        </c:if>

                       <div class="col-lg-3 col-md-6 col-sm-12" style="margin-top: 130px; padding-left: 55px;">
                            <div class="card-wrapper" onclick="location.href='${pageContext.request.contextPath}/lnv/detail?uuid=${data.uuid}'">
                                <div class="card-img-container">
                                    <img src="<c:out value="${data.lnvUrl}" />" class="card-img-top" alt="도서 이미지">
                                </div>
                                <div class="card-content">
                                    <h5 class="card-title"><c:out value="${data.lnvTitle}" /></h5>
                                    <h6 class="card-subtitle"><c:out value="${data.lnvGenre}" /></h6> <!-- 장르 출력 -->
                                </div>
                            </div>
                        </div>

                        <c:if test="${(status.index + 1) % 4 == 0 || status.last}">
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                
                <!-- 캐러셀 컨트롤 -->
                <button class="carousel-control-prev" type="button" data-bs-target="#newBooksCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">이전</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#newBooksCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">다음</span>
                </button>
            </div>
            
            
               <!-- 도서 리스트 섹션 - 신간 도서 -->
        <div class="book-section">
            <!-- 섹션 헤더 추가 -->
            <div class="section-header">
                <h2 class="section-title">만화</h2>
                <a href="${pageContext.request.contextPath}/comic" class="more-link"style="font-size: 1.2rem; font-weight: 600;">더보기</a>
            </div>

            <!-- 캐러셀 추가 -->
            <div id="newBooks2Carousel" class="carousel slide book-carousel" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <!-- 4개씩 그룹화 -->
                    <c:forEach var="data" items="${comics}" varStatus="status">
                        <c:if test="${status.index % 4 == 0}">
                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="row">
                        </c:if>

                       <div class="col-lg-3 col-md-6 col-sm-12" style="margin-top: 130px; padding-left: 55px;">
                            <div class="card-wrapper" onclick="location.href='${pageContext.request.contextPath}/comic/detail?uuid=${data.uuid}'">
                                <div class="card-img-container">
                                    <img src="<c:out value="${data.comicUrl}" />" class="card-img-top" alt="도서 이미지">
                                </div>
                                <div class="card-content">
                                    <h5 class="card-title"><c:out value="${data.comicTitle}" /></h5>
                                    <h6 class="card-subtitle"><c:out value="${data.comicGenre}" /></h6> <!-- 장르 출력 -->
                                </div>
                            </div>
                        </div>

                        <c:if test="${(status.index + 1) % 4 == 0 || status.last}">
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                
                <!-- 캐러셀 컨트롤 -->
                <button class="carousel-control-prev" type="button" data-bs-target="#newBooks2Carousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">이전</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#newBooks2Carousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">다음</span>
                </button>
            
            
            </div>
            </div>
            
            
            
            
            
        </div>
    </div> 
    </div>
    <!-- 푸터 포함 --> 
    <jsp:include page="/common/footer.jsp" /> 
    
    <!-- 부트스트랩 JS --> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
            crossorigin="anonymous"></script> 
</body> 
</html>