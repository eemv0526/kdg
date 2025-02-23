<%@page import="com.simplecoding.repositoryexam.vo.info.InfoVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
    
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #ffffff;
        }
        .navbar {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
            padding: 1rem 0;
        }
        .navbar-brand {
            font-weight: 700;
            color: #333333 !important;
            font-size: 1.4rem;
            padding: 0.5rem 1rem;
        }
        .navbar-nav .nav-link {
            color: #555555 !important;
            font-size: 0.95rem;
            font-weight: 500;
            padding: 0.5rem 1rem;
            transition: all 0.2s ease;
            position: relative;
        }
        .navbar-nav .nav-link:hover {
            color: #2c5282 !important;
        }
        .navbar-nav .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 1rem;
            right: 1rem;
            height: 2px;
            background-color: #2c5282;
            transform: scaleX(0);
            transition: transform 0.2s ease;
        }
        .navbar-nav .nav-link:hover::after {
            transform: scaleX(1);
        }
        .welcome-text {
            color: #555555;
            font-weight: 500;
        }
        .user-grade {
            color: #2c5282;
            font-weight: 600;
        }
        .auth-link {
            margin: 0 0.5rem;
        }
        .navbar-toggler {
            border: none;
            padding: 0.5rem;
        }
        .navbar-toggler:focus {
            box-shadow: none;
        }
        .divider {
            color: #dddddd;
            margin: 0 0.5rem;
        }
        @media (max-width: 991px) {
            .navbar-nav {
                padding: 1rem 0;
            }
            .nav-link {
                padding: 0.5rem 0;
            }
            .divider {
                display: none;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="/kwon/main">
                권도균 JSP 개인
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link" href="/kwon/main">Home</a>
                    </li>
                    <span class="divider">|</span>
                    
                     <li class="nav-item">
                        <a class="nav-link" href="/kwon/list">베스트셀러</a>
                    </li>
                    <span class="divider">|</span>
                    
                      <li class="nav-item">
                        <a class="nav-link" href="/kwon/lnv">라이트노벨</a>
                    </li>
                    <span class="divider">|</span>
                    
                      <li class="nav-item">
                        <a class="nav-link" href="/kwon/comic">만화</a>
                    </li>
                    <span class="divider">|</span>
                    
                       <li class="nav-item">
                        <a class="nav-link" href="/kwon/free">자유게시판</a>
                    </li>
                    <span class="divider">|</span>
                    
                      <li class="nav-item">
                        <a class="nav-link" href="/kwon/anno">공지사항</a>
                    </li>
                    <span class="divider">|</span>
                    
                    <% if (session.getAttribute("infoVO") == null) { %>
                        <!-- 비로그인 상태 -->
                        <li class="nav-item">
                            <a class="nav-link auth-link" href="${pageContext.request.contextPath}/register">회원가입</a>
                        </li>
                        <span class="divider">|</span>
                        <li class="nav-item">
                            <a class="nav-link auth-link" href="${pageContext.request.contextPath}/login">로그인</a>
                        </li>
                    <% } else { %>
                        <!-- 로그인 상태 -->
                        <li class="nav-item">
                            <a class="nav-link auth-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
                        </li>
                        <span class="divider">|</span>
                      <li class="nav-item">
    <span class="nav-link welcome-text" style="font-family: 'Arial', sans-serif; font-size: 18px; color: #ff6347; animation: bounce 1s infinite;">
        반갑습니다, 
        <span class="user-name" style="font-weight: bold; color: #4682b4;">
            <%= ((InfoVO) session.getAttribute("infoVO")).getName() %>
        </span> 님! 
        <span class="user-grade" style="font-style: italic; color: #32cd32;">
            회원님은(<%= ((InfoVO) session.getAttribute("infoVO")).getCodeName() %>) 입니다
        </span>
    </span>
</li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>