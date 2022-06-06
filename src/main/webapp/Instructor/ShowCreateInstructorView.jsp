<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <title>소공 체육센터</title>
</head>

<body>
<style>
    *{
        list-style: none;
        /* 밑줄나오지 않게 하는 것 */
        text-decoration: none;
        border-collapse: collapse;
        margin: 0;
        padding: 0;
        color: black;
    }
    .header{
        display: flex;
        width: 1280px;
        margin: auto;
        height:90px;
        border: 2px solid;
    }
    .logo{
        margin: 0 auto;
        font-size: 24px;
        width: 200px;
        line-height: 90px;
    }
    .logo h1{
        line-height: 90px;
        text-align: center;
    }
    .nav{
        display: flex;
        line-height: 90px;
        width: 1000px;
    }
    .nav li{
        margin-left: 80px;
    }
    .form{
        display: inline-flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        min-height: 100vh;
    }
    .box {
        border: 1px solid;
        width: 360px;
        height: 700px;
        margin: 50px auto;
        background-color: white;
        border-radius: 3px;
    }
    h1 {
        text-align: center;
        padding-top: 15px;
    }
    form {
        width: 300px;
        margin-left: 20px;
    }
    form label {
        display: flex;
        margin-top: 20px;
        font-size: 18px;
    }
    form input {
        width: 100%;
        padding: 7px;
        border: none;
        border: 1px solid gray;
        border-radius: 6px;
        outline: none;
    }
    button {
        width: 320px;
        height: 35px;
        margin-top: 20px;
        border: none;
        background-color: #49c1a2;
        color: white;
        font-size: 18px;
    }
</style>

<div class="wrap">
    <div class="intro">
        <div class="header">
            <div class="logo">
                <a href="/"> 소공 체육센터 </a>
            </div>
            <ul class="nav">
                <li> <a href="/Member/MemberScreen.jsp">회원관리</a>  </li>
                <li> <a href="/Instructor/InstructorScreen.jsp">강사관리</a> </li>
                <li> <a href="/Lesson/LessonScreen.jsp">강습관리</a> </li>
                <li> <a href="/Notice/NoticeScreen.jsp">공지관리</a> </li>
                <li> <a href="/Locker/InsertLockerScreen.jsp">사물함관리</a> </li>
                <li> <a href="/Sale/SalesManagement.jsp">매출관리</a> </li>
            </ul>
        </div>
    </div>
</div>

<div class="box">
    <h1>강사 등록</h1>
    <form action="/Instructor/RequestCreateInstructor.jsp" method="post">
        <label>아이디</label>
        <input type="text" name="id"/>
        <label>비밀번호</label>
        <input type="text" name="pw"/>
        <label>비밀번호 확인</label>
        <input type="text" name="pw2"/>
        <label>이름</label>
        <input type="text" name="name"/>
        <label>전화번호</label>
        <input type="text" name="phone"/>
        <label>주민등록번호</label>
        <input type="text" name="ssn"/>
        <label>주소</label>
        <input type="text" name="address"/>

        <button type="submit">확인</button>
    </form>
</div>



</body>
</html>