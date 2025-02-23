<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #FF6B6B;
            --secondary-color: #4ECDC4;
            --background-color: #F7F7F7;
            --card-background: rgba(255, 255, 255, 0.9);
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #FFE5E5, #E4F1F1);
            font-family: 'Segoe UI', Arial, sans-serif;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('/api/placeholder/1920/1080') center/cover no-repeat;
            opacity: 0.1;
            z-index: -1;
        }

        .register-container {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background: var(--card-background);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 700px;
            position: relative;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .form-control {
            border: 2px solid #eee;
            border-radius: 25px;
            padding: 15px 25px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
            margin-bottom: 1rem;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 10px rgba(255, 107, 107, 0.2);
            outline: none;
        }

        .btn-register {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 25px;
            padding: 15px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            width: 100%;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }

        hr {
            border: none;
            height: 1px;
            background: linear-gradient(90deg, transparent, #ddd, transparent);
            margin: 2rem 0;
        }

        .login-link {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .login-link:hover {
            color: var(--secondary-color);
        }

        .login-link::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 1px;
            background: currentColor;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .login-link:hover::after {
            transform: scaleX(1);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card {
            animation: fadeIn 0.8s ease-out;
        }

        .h4 {
            color: #333;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />
    
    <div class="container register-container">
        <div class="card">
            <div class="card-body p-5">
                <div class="text-center mb-4">
                    <h1 class="h4">권도균 개인 프로젝트 jsp 가입을 환영합니다!</h1>
                </div>
                <form class="user" action="${pageContext.request.contextPath}/register/addition" method="post">
                    <div class="mb-3">
                        <input type="email" class="form-control"
                            id="email" name="email" placeholder="이메일을 입력해주세요" />
                    </div>
                    <div class="row">
                        <div class="col-sm-6 mb-3">
                            <input type="password" class="form-control"
                                id="password" name="password" placeholder="비밀번호를 입력해주세요" />
                        </div>
                        <div class="col-sm-6 mb-3">
                            <input type="password" class="form-control"
                                placeholder="비밀번호를 다시 입력해주세요" />
                        </div>
                    </div>
                    <div class="mb-4">
                        <input type="text" class="form-control"
                            id="name" name="name" placeholder="이름을 입력해주세요" />
                    </div>
                    <button type="submit" class="btn btn-register mb-3">
                        회원가입 완료
                    </button>
                </form>
                <hr />
                <div class="text-center">
                    <a class="login-link" href="${pageContext.request.contextPath}/login">이미 계정이 있으신가요? 로그인하기</a>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>