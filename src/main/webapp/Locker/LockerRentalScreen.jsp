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

    .box {
        border: 1px solid;
        width: 360px;
        height: 620px;
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
        border-radius: 6px;
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
    <h1>사물함 신청</h1>
    <form action="/Locker/LockerRental.jsp" method="post">
        <label>회원 ID</label>
        <input type="text" name="id" placeholder="" required="required"/>
        <label>사물함 ID</label>
        <input type="text" name="lockerId" placeholder="" required="required" />
        <label>대여날짜</label>
        <input type="date" name="rentalPeriod" placeholder="" required="required" />

        <button type="submit">신청</button>

<%--        <button type="submit" onclick="alert('사물함 신청 완료')">신청</button>--%>
    </form>
</div>




</body>
</html>