<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script>
        function logout() {
            var warningModal = new bootstrap.Modal(document.getElementById('logoutModal'));
            warningModal.show();
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans+KR:wght@100..900&display=swap');

        * {
            font-family: 'Montserrat', 'Pretendard', sans-serif;
            color: rgb(120, 120, 120);
        }
        body {
            background-color: #ecf2f8;
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #container {
            padding: 20px;
            background-color: white;
            border-radius: 30px;
        }
        #title {
            margin: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
        .btn_box {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
        }
        .btn {
            margin-left: 5px;
            margin-right: 5px;
            padding: 5px;
            padding-right: 10px;
            padding-left: 10px;
            font-size: 20px;
            border: 0;
            background-color: #ecf2f8;
            border-radius: 5px;
            color: rgb(120, 120, 120);
        }
        .btn:hover {
            cursor: pointer;
            background-color: rgb(200, 200, 200);
            color: white;
        }
    </style>
</head>
<body>
<div id="container">
    <h1 id="title">
        안녕하세요, ${name}님!
    </h1>
    <div class="btn_box">
        <button type="button" class="btn" onclick="logout()">Logout</button>
        <a href="chk_pwd" class="btn" style="text-decoration: none">Profile</a>
        <a href="chk_pwd_delete" class="btn" style="text-decoration: none">Delete Account</a>
    </div>
</div>
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="warningModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="warningModalLabel">Logout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>See ya!</p>
            </div>
            <div class="modal-footer">
                <a href="logout" class="btn">Close</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
