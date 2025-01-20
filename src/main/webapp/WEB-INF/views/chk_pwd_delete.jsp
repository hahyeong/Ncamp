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
    <title>Check Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
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
            padding: 30px;
            background-color: white;
            border-radius: 30px;
        }

        #title {
            margin: 5px;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: inline-block;
            width: 120px;
        }

        .li {
            padding-bottom: 20px;
            padding-top: 20px;
        }

        .li * {
            font-size: 20px;
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
            border: 0;
            background-color: #ecf2f8;
            border-radius: 5px;
            color: rgb(120, 120, 120);
            font-size: 16px;
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
    <h1 id="title">Identification</h1>
    <form:form action="${root}chk_pwd_delete_proc" method="post" modelAttribute="chkPwdDeleteProcBean"> <!-- 이름 너무 조잡해 하형아 이게 뭐니 -->
        <div class="li">
            <label for="password">비밀번호 </label>
            <form:password path="password" id="password"/>
        </div>
        <div class="btn_box">
            <form:button type="submit" class="btn">Delete</form:button>
            <a href="main" class="btn" style="text-decoration: none">Back</a>
        </div>
    </form:form>
</div>

<!-- Modal -->
<div class="modal fade" id="warningModal" tabindex="-1" aria-labelledby="warningModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="warningModalLabel">Error</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Wrong Password. Please check your input.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<c:if test="${fail == true}">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var warningModal = new bootstrap.Modal(document.getElementById('warningModal'));
            warningModal.show();
        });
    </script>
</c:if>
</body>
</html>