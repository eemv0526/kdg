<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .footer {
            background-color: #ffffff;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.08);
            padding: 3rem 0 2rem 0;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .footer h5 {
            color: #333333;
            font-weight: 700;
            margin-bottom: 1.2rem;
            font-size: 1.1rem;
        }
        .footer p {
            color: #555555;
            line-height: 1.6;
            font-size: 0.95rem;
        }
        .footer ul li {
            margin-bottom: 0.5rem;
        }
        .footer ul li a {
            color: #555555;
            text-decoration: none;
            transition: color 0.2s ease;
            font-size: 0.95rem;
        }
        .footer ul li a:hover {
            color: #2c5282;
        }
        .social-links a {
            color: #555555;
            margin-right: 1.5rem;
            transition: color 0.2s ease;
        }
        .social-links a:hover {
            color: #2c5282;
        }
        .footer hr {
            margin: 2rem 0;
            border-color: #eeeeee;
        }
        .copyright {
            color: #777777;
            font-size: 0.9rem;
        }
        @media (max-width: 768px) {
            .footer .col-md-4 {
                margin-bottom: 2rem;
            }
        }
    </style>
</head>
<body>
    <footer class="footer mt-5">
        <div class="container">
            <div class="row">
                <!-- About Section -->
                <div class="col-md-4">
                    <h5>소개</h5>
                    <p>권도균 개인 JSP 사이트입니다. 만화와 라이트노벨에 관한 다양한 정보를 공유하고 소통하는 공간입니다.</p>
                </div>
                
                <!-- Quick Links -->
                <div class="col-md-4">
                    <h5>바로가기</h5>
                    <ul class="list-unstyled">
                        <li><a href="/kwon/main">홈</a></li>
                        <li><a href="#">만화 리뷰</a></li>
                        <li><a href="#">라노벨 리뷰</a></li>
                        <li><a href="#">커뮤니티</a></li>
                    </ul>
                </div>
                
                <!-- Social Links -->
                <div class="col-md-4">
                    <h5>팔로우</h5>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-twitter fa-lg"></i></a>
                        <a href="#"><i class="fab fa-instagram fa-lg"></i></a>
                        <a href="#"><i class="fab fa-youtube fa-lg"></i></a>
                        <a href="#"><i class="fab fa-discord fa-lg"></i></a>
                    </div>
                </div>
            </div>
            <hr>
            <!-- Copyright -->
            <div class="row">
                <div class="col text-center">
                    <p class="copyright">&copy; <script>document.write(new Date().getFullYear());</script> 권도균 JSP. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>