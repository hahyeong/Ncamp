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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery-3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
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
    <c:if test="${fail == true}">
        <div class="alert alert-danger">
            <h2>Wrong Password</h2>
            <p style="margin: 0">Check your Password</p>
        </div>
    </c:if>
    <form:form action="${root}chk_pwd_proc" method="post" modelAttribute="chkPwdProcBean">
        <div class="li">
            <label for="password">비밀번호 </label>
            <form:password path="password" id="password"/>
        </div>
        <div class="btn_box">
            <form:button type="submit" class="btn">Check</form:button>
            <a href="main" class="btn" style="text-decoration: none">Back</a>
        </div>
    </form:form>
</div>
</body>
</html>