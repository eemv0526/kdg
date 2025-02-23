<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>도서 상세조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #6c5ce7;
            --accent-color: #a29bfe;
            --bg-color: #f8f9fa;
            --text-color: #2d3436;
            --border-color: #e9ecef;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
        }

        .container {
            max-width: 900px;
            padding: 2rem;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background: white;
        }

        .card-img-top {
            max-width: 30%; /* 이미지 가로 폭을 100%로 설정 */
            height: auto; /* 자동으로 높이를 비율에 맞게 설정 */
            border-bottom: 1px solid var(--border-color);
        }

        .card-body {
            padding: 2.5rem;
        }

        .card-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 1rem;
        }

        .card-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 80px;
            height: 4px;
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .card-text {
            font-size: 1.1rem;
            color: var(--text-color);
            line-height: 1.8;
            margin-bottom: 2rem;
            white-space: pre-line;
        }

        .btn-custom {
            background-color: var(--primary-color);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 30px;
            font-weight: 600;
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(108, 92, 231, 0.3);
        }

        .btn-custom:hover {
            background-color: var(--accent-color);
            transform: translateY(-2px);
            color: white;
            box-shadow: 0 6px 20px rgba(108, 92, 231, 0.4);
        }

        .text-center {
            padding: 3rem;
            font-size: 1.2rem;
            color: #666;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .card-body {
                padding: 1.5rem;
            }

            .card-title {
                font-size: 1.5rem;
            }

            .card-text {
                font-size: 1rem;
            }
        }
        
        
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />
    <div class="container mt-5">
        <c:if test="${not empty FreeVO}">
            <div class="card">
                <img src="<c:out value="${FreeVO.freeUrl}" />" class="card-img-top" alt="도서 이미지">
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${FreeVO.freeTitle}" /></h5>
                    <p class="card-text"><c:out value="${FreeVO.freeContent}" /></p>
                    <p class="card-text"><c:out value="${FreeVO.freeCreatedDate}" /></p>
                    <div class="d-flex justify-content-between">
                        <a href="javascript:history.back()" class="btn btn-custom">
                            <i class="fas fa-arrow-left me-2"></i>뒤로가기
                        </a>
                        <div>
                         
                            <!-- 관리 버튼 추가 -->
                            
     <c:if test="${not empty infoVO.name and not empty FreeVO.freeAuthor 
    and (fn:trim(fn:toLowerCase(FreeVO.freeAuthor)) == fn:trim(fn:toLowerCase(infoVO.name)) 
    or infoVO.codeName == '관리자')}">
    <a href="${pageContext.request.contextPath}/free/update?uuid=${FreeVO.uuid}" class="btn btn-warning ms-2">
        <i class="fas fa-cogs me-2"></i>수정/삭제
    </a>
</c:if>

                        </div>
                    </div>
                </div>
            </div>

        </c:if>
        <c:if test="${empty FreeVO}">
            <p class="text-center">해당 도서 정보를 찾을 수 없습니다.</p>
        </c:if>
    </div>
    <jsp:include page="/common/footer.jsp" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
