<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Control.LockerControl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<style>
    table, th, td {
        border: 1px solid #bcbcbc;
    }
    table {
        margin: 0 auto;
        width: 1200px;
    }

    /*===============================================*/
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

    .nav li{
        margin-left: 80px;
    }

    div.searchArea {
        margin-top: 40px;
        margin-left: 120px;
        width: 50%;
    }

    div.searchArea input {
        padding: 5px;
        width: 80px;
        font-size: 14px;
        height: 44px;
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
<head>
    <title>Title</title>
</head>
<body>

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
                <li> <a href="">공지관리</a> </li>
                <li> <a href="/Locker/InsertLockerScreen.jsp">사물함관리</a> </li>
                <li> <a href="">매출관리</a> </li>
            </ul>
        </div>
    </div>
</div>

<div class="box">
    <h1>사물함 생성</h1>
    <form action="/Locker/InsertLocker.jsp" method="post">
        <label>사물함 ID</label>
        <input type="text" name="lockerId" placeholder="" required="required"/>
        <label>사물함 위치</label>
        <input type="text" name="lockerLocation" placeholder="" required="required" />
        <label>대여비용</label>
        <input type="text" name="rentalAmount" placeholder="" required="required" />
        <label>센터 이름</label>
        <input type="text" name="centerName" placeholder="" required="required" />

        <button type="submit" onclick="alert('사물함 생성 완료')">생성</button>


        <div class="searchArea">
            <form action="">
                <input id="lockerRentalBtn" type="button" value="사물함 신청" onclick="location.href='/Locker/LockerRentalScreen.jsp'"/>
            </form>
        </div>

    </form>
</div>

</body>
</html>
