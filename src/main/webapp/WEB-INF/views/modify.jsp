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
    <title>User Information</title>
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
            padding: 20px;
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
            width: 200px;
        }
        .li {
            margin-bottom: 10px;
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
        }
        .btn:hover {
            cursor: pointer;
            background-color: rgb(200, 200, 200);
            color: white;
        }
        .error_msg {
            color: red;
            margin-left: 5px;
        }
    </style>
</head>
<body>
<div id="container">
    <h1 id="title">Profile</h1>
    <form:form action="${root}modify_proc" method="post" modelAttribute="modifyProcBean">
        <div class="li">
            <label for="id">ID <span style="color: red" >*</span></label>
            <form:input path="id" type="text" id="id" readonly="true" value="${sessionScope.loginBean.id}"/>
        </div>
        <div class="li">
            <label for="password">비밀번호 <span style="color: red">*</span></label>
            <form:password path="password" id="password"/>
            <form:errors path="password" class="error_msg"/>
        </div>
        <div class="li">
            <label for="password_chk">비밀번호 확인 <span style="color: red">*</span></label>
            <form:password path="password_chk" id="password_chk"/>
            <form:errors path="password_chk" class="error_msg"/>
        </div>
        <div class="li">
            <label for="name">이름 <span style="color: red">*</span></label>
            <form:input type="text" path="name" id="name" readonly="true" value="${sessionScope.loginBean.name}"/>
        </div>
        <div class="li">
            <label for="gender">성별 <span style="color: red">*</span></label>
            <form:radiobutton path="gender" value="남성" id="gender"/>&nbsp;남&nbsp;&nbsp;
            <form:radiobutton path="gender" value="여성"/>&nbsp;여
            <form:errors path="gender" class="error_msg"/>
        </div>
        <div class="li">
            <label for="birth_date">생년월일 <span style="color: red">*</span></label>
            <form:input type="text" path="birth_date" id="birth_date" value="${sessionScope.loginBean.birth_date}"/>
            <form:errors path="birth_date" class="error_msg"/>
        </div>
        <div class="li">
            <label for="email">E-mail <span style="color: red">*</span></label>
            <form:input path="email_name" type="text" id="email" value="${sessionScope.loginBean.email_name}"/>
            <span>&nbsp;@&nbsp;</span>
            <form:input path="email_site" type="text" id="domain_text" value="${sessionScope.loginBean.email_site}"/>&nbsp;
            <select id="domain_list">
                <option value="type">직접 입력</option>
                <option value="google.com">google.com</option>
                <option value="naver.com">naver.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="nate.com">nate.com</option>
                <option value="kakao.com">kakao.com</option>
            </select>
            <form:errors path="email_name" class="error_msg"/>
        </div>
        <div class="li">
            <label for="sample6_postcode">우편번호 </label>
            <form:input type="text" path="zip_code" id="sample6_postcode" readonly="true" value="${sessionScope.loginBean.zip_code}"/>
            <input type="button" class="btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        </div>
        <div class="li">
            <label for="sample6_address">주소 </label>
            <form:input type="text" path="address1" id="sample6_address" readonly="true" value="${sessionScope.loginBean.address1}"/>&nbsp;
            <form:input type="text" path="address2" id="sample6_detailAddress" value="${sessionScope.loginBean.address2}"/>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수

                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                            } else {
                                document.getElementById("sample6_extraAddress").value = '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample6_detailAddress").focus();
                        }
                    }).open();
                }
            </script>
        </div>
        <div class="li">
            <label for="hobby">취미</label>
            <form:checkbox path="hobby" value="인터넷" id="hobby"/>&nbsp;인터넷&nbsp;&nbsp;
            <form:checkbox path="hobby" value="여행"/>&nbsp;여행&nbsp;&nbsp;
            <form:checkbox path="hobby" value="게임"/>&nbsp;게임&nbsp;&nbsp;
            <form:checkbox path="hobby" value="영화"/>&nbsp;영화&nbsp;&nbsp;
            <form:checkbox path="hobby" value="운동"/>&nbsp;운동
        </div>
        <div class="li">
            <label for="job">직업</label>
            <form:select path="job" id="job">
                <form:option value="없음"/>없음
                <form:option value="학생"/>학생
                <form:option value="직장인"/>직장인
                <form:option value="자영업"/>자영업
                <form:option value="프리랜서"/>프리랜서
                <form:option value="기타"/>기타
            </form:select>
        </div>
        <div class="btn_box">
            <form:button type="submit" class="btn" >Next</form:button>
            <a href="main" class="btn">Back</a>
        </div>
    </form:form>
</div>
</body>
<script>
    const domainList = document.querySelector
    ('#domain_list');
    const domainText = document.querySelector('#domain_text')
    domainList.addEventListener('change', (e) => {
        if(e.target.value !== "type") {
            domainText.value = e.target.value;
            domainText.readOnly = true;
        } else {
            domainText.value = "";
        }
    })
</script>
</html>
